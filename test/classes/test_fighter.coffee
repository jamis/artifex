{Classes, NPC, Powers} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Fighter.source, "phb"
    test.done()

  "should have martial power source": (test) ->
    test.equal Classes.Fighter.powerSource, "martial"
    klass = new Classes.Fighter new NPC
    test.equal klass.powerSource, "martial"
    test.done()

  "should set name": (test) ->
    test.equal Classes.Fighter.simpleName, "fighter"
    klass = new Classes.Fighter new NPC
    test.equal klass.name, "fighter"
    test.done()

  "should set key attribute list": (test) ->
    klass = new Classes.Fighter new NPC
    test.deepEqual klass.keyAttributes, ["str", "dex", "wis", "con"]
    test.done()

  "should set armor proficiencies": (test) ->
    new Classes.Fighter(npc = new NPC)
    for armor in ["cloth", "leather", "hide", "chainmail", "scale", "light shield", "heavy shield"]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    new Classes.Fighter(npc = new NPC)
    for weapon in ["simple melee", "military melee", "simple ranged", "military ranged"]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should have +2 bonus to fortitude": (test) ->
    new Classes.Fighter(npc = new NPC)
    test.ok npc.defenses.fort.has(2, "class"), "missing +2 class bonus to fort"
    test.done()

  "should have a +15 class bonus to HP": (test) ->
    new Classes.Fighter(npc = new NPC)
    test.ok npc.hitPoints.has(15, "class"), "missing +15 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 6": (test) ->
    new Classes.Fighter(npc = new NPC)
    test.equal npc.hitPointsPerLevel, 6
    test.done()

  "should have +9 bonus to healingSurge.count": (test) ->
    new Classes.Fighter(npc = new NPC)
    test.ok npc.healingSurge.count.has(9, "class"), "missing +9 class bonus to healingSurge.count"
    test.done()

  "should include appropriate skills as class skills": (test) ->
    test.ok "athletics" in Classes.Fighter.skills
    test.ok "endurance" in Classes.Fighter.skills
    test.ok "heal" in Classes.Fighter.skills
    test.ok "intimidate" in Classes.Fighter.skills
    test.ok "streetwise" in Classes.Fighter.skills
    test.done()

  "should add 3 pending skills": (test) ->
    new Classes.Fighter(npc = new NPC)
    test.equal npc.pendingSkills[0].count, 3
    test.deepEqual npc.pendingSkills[0].list, Classes.Fighter.skills
    test.done()

  "should add class features": (test) ->
    new Classes.Fighter(npc = new NPC)
    test.ok npc.hasFeature("class", "Combat Challenge"), "missing Combat Challenge feature"
    test.ok npc.hasFeature("class", "Combat Superiority"), "missing Combat Superiority feature"
    test.ok npc.hasFeature("class", "Fighter Weapon Talent"), "missing Fighter Weapon Talent feature"
    test.done()

  "should have a preferred weapon-hand-count": (test) ->
    new Classes.Fighter(npc = new NPC)
    test.ok npc.preferredWeaponHandCount in [1, 2]
    test.done()

  "should prefer melee weapons": (test) ->
    new Classes.Fighter(npc = new NPC)
    test.equal npc.preferredWeaponStyle, "melee"
    test.done()

  "fighter powers are called exploits": (test) ->
    klass = new Classes.Fighter(new NPC)
    test.equal klass.powerName, "exploit"
    test.done()

  "level-1 exploits are accounted for": (test) ->
    for power in [ "Cleave", "ReapingStrike", "SureStrike", "TideOfIron" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.atWill[1]

    for power in [ "CoveringAttack", "PassingAttack", "SpinningSweep", "SteelSerpentStrike" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.encounter[1]

    for power in [ "BruteStrike", "ComebackStrike", "VillainsMenace" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.daily[1]

    klass = new Classes.Fighter(new NPC)
    test.equal Classes.Fighter.powers, klass.powers
    test.done()

  "level-2 exploits are accounted for": (test) ->
    for power in [ "BoundlessEndurance", "GetOverHere", "NoOpening", "Unstoppable" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.utility[2]
    test.done()

  "level-3 exploits are accounted for": (test) ->
    for power in [ "ArmorPiercingThrust", "CrushingBlow", "DanceOfSteel", "PreciseStrike", "RainOfBlows", "SweepingBlow" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.encounter[3]
    test.done()

  "level-5 exploits are accounted for": (test) ->
    for power in [ "CrackTheShell", "DizzyingBlow", "RainOfSteel" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.daily[5]
    test.done()

  "level-6 exploits are accounted for": (test) ->
    for power in [ "BattleAwareness", "DefensiveTraining", "Unbreakable" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.utility[6]
    test.done()

  "level-7 exploits are accounted for": (test) ->
    for power in [ "ComeAndGetIt", "GriffonsWrath", "IronBulwark", "RecklessStrike", "SuddenSurge" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.encounter[7]
    test.done()

  "level-9 exploits are accounted for": (test) ->
    for power in [ "ShiftTheBattlefield", "ThicketOfBlades", "VictoriousSurge" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.daily[9]
    test.done()

  "level-10 exploits are accounted for": (test) ->
    for power in [ "IntoTheFray", "LastDitchEvasion", "StalwartGuard" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.utility[10]
    test.done()

  "level-13 exploits are accounted for": (test) ->
    for power in [ "AnvilOfDoom", "ChainsOfSorrow", "GiantsWake", "Silverstep", "StormOfBlows", "TalonOfTheRoc" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.encounter[13]
    test.done()

  "level-15 exploits are accounted for": (test) ->
    for power in [ "DragonsFangs", "SerpentDanceStrike", "UnyieldingAvalanche" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.daily[15]
    test.done()

  "level-16 exploits are accounted for": (test) ->
    for power in [ "InterposingShield", "IronWarrior", "SurpriseStep" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.utility[16]
    test.done()

  "level-17 exploits are accounted for": (test) ->
    for power in [ "ExactingStrike", "ExorcismOfSteel", "HarryingAssault", "MountainBreakingBlow", "VorpalTornado", "WarriorsChallenge" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.encounter[17]
    test.done()

  "level-19 exploits are accounted for": (test) ->
    for power in [ "DevastationsWake", "ReavingStrike", "StrikeOfTheWatchfulGuard" ]
      test.ok Powers.collections.fighter[power], "`#{power}' is not defined"
      if Powers.collections.fighter[power]
        test.ok power in Classes.Fighter.powers.daily[19]
    test.done()
