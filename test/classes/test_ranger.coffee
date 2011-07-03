{Classes, NPC, Powers} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Ranger.source, "phb"
    test.done()

  "should have martial power source": (test) ->
    test.equal Classes.Ranger.powerSource, "martial"
    klass = new Classes.Ranger new NPC
    test.equal klass.powerSource, "martial"
    test.done()

  "should set name": (test) ->
    test.equal Classes.Ranger.simpleName, "ranger"
    klass = new Classes.Ranger new NPC
    test.equal klass.name, "ranger"
    test.done()

  "should set key attribute list": (test) ->
    klass = new Classes.Ranger new NPC
    test.deepEqual klass.keyAttributes, ["str", "dex", "wis"]
    test.done()

  "should set armor proficiencies": (test) ->
    new Classes.Ranger(npc = new NPC)
    for armor in ["cloth", "leather", "hide"]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    new Classes.Ranger(npc = new NPC)
    for weapon in ["simple melee", "military melee", "simple ranged", "military ranged"]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should have +1 bonus to fortitude, +1 bonus to reflex": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.ok npc.defenses.fort.has(1, "class"), "missing +1 class bonus to fort"
    test.ok npc.defenses.ref.has(1, "class"), "missing +1 class bonus to ref"
    test.done()

  "should have a +12 class bonus to HP": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.ok npc.hitPoints.has(12, "class"), "missing +12 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 5": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.equal npc.hitPointsPerLevel, 5
    test.done()

  "should have +6 bonus to healingSurge.count": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.ok npc.healingSurge.count.has(6, "class"), "missing +6 class bonus to healingSurge.count"
    test.done()

  "should include appropriate skills as class skills": (test) ->
    test.ok "acrobatics" in Classes.Ranger.skills
    test.ok "athletics" in Classes.Ranger.skills
    test.ok "dungeoneering" in Classes.Ranger.skills
    test.ok "endurance" in Classes.Ranger.skills
    test.ok "heal" in Classes.Ranger.skills
    test.ok "nature" in Classes.Ranger.skills
    test.ok "perception" in Classes.Ranger.skills
    test.ok "stealth" in Classes.Ranger.skills
    test.done()

  "should be trained in dungeoneering or nature": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.ok npc.skills.dungeoneering.trained or npc.skills.nature.trained
    test.done()

  "should add 4 pending skills": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.equal npc.pendingSkills[0].count, 4
    test.deepEqual npc.pendingSkills[0].list, Classes.Ranger.skills
    test.done()

  "should add class features": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.ok npc.hasFeature("class", "Archer Fighting Style") or npc.hasFeature("class", "Two-Blade Fighting Style"), "missing Fighting Style feature"
    test.ok npc.hasFeature("class", "Hunter's Quarry"), "missing Hunter's Quarry feature"
    test.ok npc.hasFeature("class", "Prime Shot"), "missing Prime Shot feature"
    test.done()

  "ranger: style option should select fighting style": (test) ->
    new Classes.Ranger(npc = new NPC ranger: { style: "Archer" })
    test.ok npc.hasFeature("class", "Archer Fighting Style")
    new Classes.Ranger(npc = new NPC ranger: { style: "Two-Blade" })
    test.ok npc.hasFeature("class", "Two-Blade Fighting Style")
    test.done()
    
  "archer should prefer ranged weapons": (test) ->
    new Classes.Ranger(npc = new NPC ranger: { style: "Archer" })
    test.equal npc.preferredWeaponStyle, "ranged"
    test.done()
    
  "two-blade should prefer melee weapons": (test) ->
    new Classes.Ranger(npc = new NPC ranger: { style: "Two-Blade" })
    test.equal npc.preferredWeaponStyle, "melee"
    test.equal npc.preferredWeaponHandCount, 1
    test.equal npc.weaponPreferences.length, 1
    test.equal npc.weaponPreferences[0].count, 2
    test.equal npc.weaponPreferences[0].type, "melee"
    test.done()

  "should get Hunter's Quarry power (via Hunter's Quarry)": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.ok npc.powers.find("atWill", "Hunter's Quarry")
    test.done()

  "should set quarryDie to 6 by default (via Hunter's Quarry)": (test) ->
    new Classes.Ranger(npc = new NPC)
    test.equal npc.quarryDie, 6
    test.done()
    
  "ranger powers are called exploits": (test) ->
    klass = new Classes.Ranger(new NPC)
    test.equal klass.powerName, "exploit"
    test.done()

  "level-1 exploits are accounted for": (test) ->
    for power in [ "CarefulAttack", "HitAndRun", "NimbleStrike", "TwinStrike" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.atWill[1]

    for power in [ "DireWolverineStrike", "EvasiveStrike", "FoxsCunning", "TwoFangedStrike" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.encounter[1]

    for power in [ "HuntersBearTrap", "JawsOfTheWolf", "SplitTheTree", "SuddenStrike" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.daily[1]

    klass = new Classes.Ranger(new NPC)
    test.equal Classes.Ranger.powers, klass.powers
    test.done()

  "level-2 exploits are accounted for": (test) ->
    for power in [ "CrucialAdvice", "UnbalancingParry", "YieldGround" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.utility[2]
    test.done()

  "level-3 exploits are accounted for": (test) ->
    for power in [ "CutAndRun", "DisruptiveStrike", "ShadowWaspStrike", "ThundertuskBoarStrike" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.encounter[3]
    test.done()

  "level-5 exploits are accounted for": (test) ->
    for power in [ "ExcruciatingShot", "FrenziedSkirmish", "SplinteringShot", "TwoWolfPounce" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.daily[5]
    test.done()

  "level-6 exploits are accounted for": (test) ->
    for power in [ "EvadeAmbush", "SkilledCompanion", "WeaveThroughTheFray" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.utility[6]
    test.done()

  "level-7 exploits are accounted for": (test) ->
    for power in [ "ClawsOfTheGriffon", "HawksTalon", "SpikesOfTheManticore", "SweepingWhirlwind" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.encounter[7]
    test.done()

  "level-9 exploits are accounted for": (test) ->
    for power in [ "AttacksOnTheRun", "CloseQuartersShot", "SprayOfArrows", "SwirlingLeavesOfSteel" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.daily[9]
    test.done()

  "level-10 exploits are accounted for": (test) ->
    for power in [ "ExpeditiousStride", "OpenTheRange", "UndauntedStride" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.utility[10]
    test.done()

  "level-13 exploits are accounted for": (test) ->
    for power in [ "ArmorSplinter", "KnockdownShot", "NimbleDefense", "PinningStrike" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.encounter[13]
    test.done()

  "level-15 exploits are accounted for": (test) ->
    for power in [ "BladeCascade", "BleedingWounds", "ConfoundingArrows", "StunningSteel" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.daily[15]
    test.done()

  "level-16 exploits are accounted for": (test) ->
    for power in [ "EvadeTheBlow", "Longstrider", "MomentaryRespite" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.utility[16]
    test.done()

  "level-17 exploits are accounted for": (test) ->
    for power in [ "ArrowOfVengeance", "CheetahsRake", "TripleShot", "TwoWeaponEviscerate" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.encounter[17]
    test.done()

  "level-19 exploits are accounted for": (test) ->
    for power in [ "CruelCageOfSteel", "GreatRamArrow", "TwoInOneShot", "WoundingWhirlwind" ]
      test.ok Powers.collections.ranger[power], "`#{power}' is not defined"
      if Powers.collections.ranger[power]
        test.ok power in Classes.Ranger.powers.daily[19]
    test.done()
