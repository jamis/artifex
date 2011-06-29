{Classes, NPC, Powers} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Warlord.source, "phb"
    test.done()

  "should have martial power source": (test) ->
    test.equal Classes.Warlord.powerSource, "martial"
    klass = new Classes.Warlord new NPC
    test.equal klass.powerSource, "martial"
    test.done()

  "should set name": (test) ->
    test.equal Classes.Warlord.simpleName, "warlord"
    klass = new Classes.Warlord new NPC
    test.equal klass.name, "warlord"
    test.done()

  "should set key attribute list": (test) ->
    klass = new Classes.Warlord new NPC
    test.deepEqual klass.keyAttributes, ["str", "int", "cha"]
    test.done()

  "should set armor proficiencies": (test) ->
    new Classes.Warlord(npc = new NPC)
    for armor in ["cloth", "leather", "hide", "chainmail", "light shield"]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    new Classes.Warlord(npc = new NPC)
    for weapon in ["simple melee", "military melee", "simple ranged"]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should have +1 bonus to fortitude and will": (test) ->
    new Classes.Warlord(npc = new NPC)
    test.ok npc.defenses.fort.has(1, "class"), "missing +1 class bonus to fort"
    test.ok npc.defenses.will.has(1, "class"), "missing +1 class bonus to will"
    test.done()

  "should have a +12 class bonus to HP": (test) ->
    new Classes.Warlord(npc = new NPC)
    test.ok npc.hitPoints.has(12, "class"), "missing +12 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 5": (test) ->
    new Classes.Warlord(npc = new NPC)
    test.equal npc.hitPointsPerLevel, 5
    test.done()

  "should have +7 bonus to healingSurge.count": (test) ->
    new Classes.Warlord(npc = new NPC)
    test.ok npc.healingSurge.count.has(7, "class"), "missing +7 class bonus to healingSurge.count"
    test.done()

  "should include appropriate skills as class skills": (test) ->
    test.ok "athletics" in Classes.Warlord.skills
    test.ok "diplomacy" in Classes.Warlord.skills
    test.ok "endurance" in Classes.Warlord.skills
    test.ok "heal" in Classes.Warlord.skills
    test.ok "history" in Classes.Warlord.skills
    test.ok "intimidate" in Classes.Warlord.skills
    test.done()

  "should add 4 pending skills": (test) ->
    new Classes.Warlord(npc = new NPC)
    test.equal npc.pendingSkills[0].count, 4
    test.deepEqual npc.pendingSkills[0].list, Classes.Warlord.skills
    test.done()

  "should add class features": (test) ->
    new Classes.Warlord(npc = new NPC)
    test.ok npc.hasFeature("class", "Combat Leader"), "missing Combat Leader feature"

    commandingPresence = npc.hasFeature("class", "Inspiring Presence") or
      npc.hasFeature("class", "Tactical Presence")
    test.ok commandingPresence, "missing Commanding Presence feature"

    test.ok npc.hasFeature("class", "Inspiring Word"), "missing Inspiring Word feature"
    test.done()

  "should select presence type based on warlord: presence option": (test) ->
    new Classes.Warlord(npc = new NPC warlord: { presence: "Tactical" })
    test.ok npc.hasFeature("class", "Tactical Presence"), "expected Tactical Presence"

    new Classes.Warlord(npc = new NPC warlord: { presence: "Inspiring" })
    test.ok npc.hasFeature("class", "Inspiring Presence"), "expected Inspiring Presence"

    test.done()
    
  "inspiring warlord should have Inspiring Presence ability": (test) ->
    new Classes.Warlord(npc = new NPC warlord: { presence: "Inspiring" })
    test.ok npc.powers.find("atWill", "Inspiring Presence")
    test.done()
    
  "tactical warlord should have Tactical Presence ability": (test) ->
    new Classes.Warlord(npc = new NPC warlord: { presence: "Tactical" })
    test.ok npc.powers.find("atWill", "Tactical Presence")
    test.done()
    
  "warlord should have Inspiring Word power (via Inspiring Word)": (test) ->
    new Classes.Warlord(npc = new NPC)
    test.ok npc.powers.find("encounter", "Inspiring Word")
    test.done()
    
  "should prefer melee weapons": (test) ->
    new Classes.Warlord(npc = new NPC)
    test.equal npc.preferredWeaponStyle, "melee"
    test.done()

  "warlord powers are called exploits": (test) ->
    klass = new Classes.Warlord(new NPC)
    test.equal klass.powerName, "exploit"
    test.done()

  "level-1 exploits are accounted for": (test) ->
    for power in [ "CommandersStrike", "FuriousSmash", "VipersStrike", "WolfPackTactics" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.atWill[1]

    for power in [ "GuardingAttack", "HammerAndAnvil", "LeafOnTheWind", "WarlordsFavor" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.encounter[1]

    for power in [ "BastionOfDefense", "LeadTheAttack", "PinTheFoe", "WhiteRavenOnslaught" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.daily[1]

    klass = new Classes.Warlord(new NPC)
    test.equal Classes.Warlord.powers, klass.powers
    test.done()

  "level-2 exploits are accounted for": (test) ->
    for power in [ "AidTheInjured", "CrescendoOfViolence", "KnightsMove", "ShakeItOff" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.utility[2]
    test.done()

  "level-3 exploits are accounted for": (test) ->
    for power in [ "HoldTheLine", "InspiringWarCry", "SteelMonsoon", "WarlordsStrike" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.encounter[3]
    test.done()

  "level-5 exploits are accounted for": (test) ->
    for power in [ "StandTheFallen", "TurningPoint", "VillainsNightmare" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.daily[5]
    test.done()

  "level-6 exploits are accounted for": (test) ->
    for power in [ "GuideTheCharge", "InspiringReaction", "QuickStep", "StandTough" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.utility[6]
    test.done()

  "level-7 exploits are accounted for": (test) ->
    for power in [ "LionsRoar", "SunderArmor", "SurpriseAttack", "SurroundFoe" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.encounter[7]
    test.done()

  "level-9 exploits are accounted for": (test) ->
    for power in [ "IronDragonCharge", "KnockThemDown", "WhiteRavenStrike" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.daily[9]
    test.done()

  "level-10 exploits are accounted for": (test) ->
    for power in [ "DefensiveRally", "EaseSuffering", "TacticalShift" ]
      test.ok Powers.collections.warlord[power], "`#{power}' is not defined"
      if Powers.collections.warlord[power]
        test.ok power in Classes.Warlord.powers.utility[10]
    test.done()
