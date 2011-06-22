{Classes, Deities, NPC, Powers} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Paladin.source, "phb"
    test.done()

  "should have divine power source": (test) ->
    test.equal Classes.Paladin.powerSource, "divine"
    paladin = new Classes.Paladin new NPC
    test.equal paladin.powerSource, "divine"
    test.done()

  "should set name": (test) ->
    test.equal Classes.Paladin.simpleName, "paladin"
    paladin = new Classes.Paladin new NPC
    test.equal paladin.name, "paladin"
    test.done()

  "should set key attribute list": (test) ->
    paladin = new Classes.Paladin new NPC
    test.deepEqual paladin.keyAttributes, ["str", "cha", "wis"]
    test.done()

  "should set armor proficiencies": (test) ->
    paladin = new Classes.Paladin(npc = new NPC)
    for armor in ["cloth", "leather", "hide", "chainmail", "scale", "plate", "light shield", "heavy shield"]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    paladin = new Classes.Paladin(npc = new NPC)
    for weapon in ["simple melee", "military melee", "simple ranged"]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should prefer melee weapons": (test) ->
    new Classes.Paladin(npc = new NPC)
    test.equal npc.preferredWeaponStyle, "melee"
    test.done()

  "should add holy symbol as an implement": (test) ->
    paladin = new Classes.Paladin(npc = new NPC)
    test.ok "holy symbol" in npc.supportedImplements
    test.done()

  "should have defense bonuses": (test) ->
    paladin = new Classes.Paladin(npc = new NPC)
    test.ok npc.defenses.fort.has(1, "class"), "missing +1 class bonus to fortitude"
    test.ok npc.defenses.ref.has(1, "class"), "missing +1 class bonus to reflex"
    test.ok npc.defenses.will.has(1, "class"), "missing +1 class bonus to will"
    test.done()

  "should have a +15 class bonus to HP": (test) ->
    paladin = new Classes.Paladin(npc = new NPC)
    test.ok npc.hitPoints.has(15, "class"), "missing +15 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 6": (test) ->
    paladin = new Classes.Paladin(npc = new NPC)
    test.equal npc.hitPointsPerLevel, 6
    test.done()

  "should have +10 bonus to healingSurge.count": (test) ->
    paladin = new Classes.Paladin(npc = new NPC)
    test.ok npc.healingSurge.count.has(10, "class"), "missing +10 class bonus to healingSurge.count"
    test.done()

  "should choose religion as a trained skill": (test) ->
    paladin = new Classes.Paladin(npc = new NPC)
    test.ok npc.skills.religion.trained
    test.done()

  "should include appropriate skills as class skills": (test) ->
    test.ok "diplomacy" in Classes.Paladin.skills
    test.ok "endurance" in Classes.Paladin.skills
    test.ok "heal" in Classes.Paladin.skills
    test.ok "history" in Classes.Paladin.skills
    test.ok "insight" in Classes.Paladin.skills
    test.ok "intimidate" in Classes.Paladin.skills
    test.ok "religion" in Classes.Paladin.skills
    test.done()

  "should add 3 pending skills": (test) ->
    new Classes.Paladin(npc = new NPC)
    test.equal npc.pendingSkills[0].count, 3
    test.deepEqual npc.pendingSkills[0].list, Classes.Paladin.skills
    test.done()

  "should add class features": (test) ->
    new Classes.Paladin(npc = new NPC)
    test.ok npc.hasFeature("class", "Channel Divinity"), "missing Channel Divinity feature"
    test.ok npc.hasFeature("class", "Divine Challenge"), "missing Diving Challenge feature"
    test.ok npc.hasFeature("class", "Lay on Hands"), "missing Lay on Hands feature"
    test.done()

  "should have Channel Divinity: Divine Mettle encounter power (via Channel Divinity)": (test) ->
    new Classes.Paladin(npc = new NPC)
    test.ok npc.powers.find("encounter", "Channel Divinity: Divine Mettle")
    test.done()

  "should have Channel Divinity: Divine Strength encounter power (via Channel Divinity)": (test) ->
    new Classes.Paladin(npc = new NPC)
    test.ok npc.powers.find("encounter", "Channel Divinity: Divine Strength")
    test.done()

  "should have Divine Challenge encounter power (via Divine Challenge)": (test) ->
    new Classes.Paladin(npc = new NPC)
    test.ok npc.powers.find("encounter", "Divine Challenge")
    test.done()

  "should have Lay on Hands encounter power (via Lay on Hands)": (test) ->
    new Classes.Paladin(npc = new NPC)
    test.ok npc.powers.find("encounter", "Lay on Hands")
    test.done()

  "paladins must have an alignment-compatible deity": (test) ->
    for n in [1..10]
      npc = new NPC
      npc.alignment = "lawful good"
      new Classes.Paladin npc
      test.ok npc.deity in Deities["lawful good"]

      npc = new NPC
      npc.alignment = "good"
      new Classes.Paladin npc
      test.ok npc.deity in Deities["good"]

      npc = new NPC
      npc.alignment = "unaligned"
      new Classes.Paladin npc
      test.ok npc.deity in Deities["unaligned"]

      npc = new NPC
      npc.alignment = "evil"
      new Classes.Paladin npc
      test.ok npc.deity in Deities["evil"]

      npc = new NPC
      npc.alignment = "chaotic evil"
      new Classes.Paladin npc
      test.ok npc.deity in Deities["chaotic evil"]
    test.done()

  "paladin powers are called prayers": (test) ->
    paladin = new Classes.Paladin(new NPC)
    test.equal paladin.powerName, "prayer"
    test.done()

  "level-1 prayers are accounted for": (test) ->
    for power in [ "BolsteringStrike", "EnfeeblingStrike", "HolyStrike", "ValiantStrike" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.atWill[1]

    for power in [ "FearsomeSmite", "PiercingSmite", "RadiantSmite", "ShieldingSmite" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.encounter[1]

    for power in [ "OnPainOfDeath", "PaladinsJudgement", "RadiantDelirium" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.daily[1]

    klass = new Classes.Paladin(new NPC)
    test.equal Classes.Paladin.powers, klass.powers
    test.done()

  "level-2 prayers are accounted for": (test) ->
    for power in [ "AstralSpeech", "MartyrsBlessing", "SacredCircle" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.utility[2]
    test.done()

  "level-3 prayers are accounted for": (test) ->
    for power in [ "ArcingSmite", "InvigoratingSmite", "RighteousSmite", "StaggeringSmite" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.encounter[3]
    test.done()

  "level-5 prayers are accounted for": (test) ->
    for power in [ "HallowedCircle", "MartyrsRetribution", "SignOfVulnerability" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.daily[5]
    test.done()

  "level-6 prayers are accounted for": (test) ->
    for power in [ "DivineBodyguard", "OneHeartOneMind", "WrathOfTheGods" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.utility[6]
    test.done()

  "level-7 prayers are accounted for": (test) ->
    for power in [ "BeckonFoe", "BenignTransposition", "DivineReverence", "ThunderSmite" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.encounter[7]
    test.done()

  "level-9 prayers are accounted for": (test) ->
    for power in [ "CrownOfGlory", "OneStandsAlone", "RadiantPulse" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.daily[9]
    test.done()

  "level-10 prayers are accounted for": (test) ->
    for power in [ "CleansingSpirit", "NobleShield", "TurnTheTide" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Paladin.powers.utility[10]
    test.done()
