{Classes, NPC, Powers} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Warlock.source, "phb"
    test.done()

  "should have arcane power source": (test) ->
    test.equal Classes.Warlock.powerSource, "arcane"
    warlock = new Classes.Warlock new NPC
    test.equal warlock.powerSource, "arcane"
    test.done()

  "should set name": (test) ->
    test.equal Classes.Warlock.simpleName, "warlock"
    warlock = new Classes.Warlock new NPC
    test.equal warlock.name, "warlock"
    test.done()

  "should set key attribute list": (test) ->
    warlock = new Classes.Warlock new NPC
    test.deepEqual warlock.keyAttributes, ["cha", "con", "int"]
    test.done()

  "should set armor proficiencies": (test) ->
    npc = new NPC
    warlock = new Classes.Warlock npc
    for armor in ["cloth", "leather"]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    npc = new NPC
    warlock = new Classes.Warlock npc
    for weapon in ["simple melee", "simple ranged"]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should have no preferred weapon style": (test) ->
    new Classes.Warlock(npc = new NPC)
    test.ok not npc.preferredWeaponStyle?
    test.done()
    
  "should add rod and wand as implements": (test) ->
    npc = new NPC
    warlock = new Classes.Warlock npc
    test.ok "rod" in npc.supportedImplements
    test.ok "wand" in npc.supportedImplements
    test.done()

  "should have +1 bonus to reflex and will": (test) ->
    npc = new NPC
    warlock = new Classes.Warlock npc
    test.ok npc.defenses.ref.has(1, "class"), "missing +1 class bonus to reflex"
    test.ok npc.defenses.will.has(1, "class"), "missing +1 class bonus to will"
    test.done()

  "should have a +12 class bonus to HP": (test) ->
    npc = new NPC
    warlock = new Classes.Warlock npc
    test.ok npc.hitPoints.has(12, "class"), "missing +12 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 5": (test) ->
    npc = new NPC
    warlock = new Classes.Warlock npc
    test.equal npc.hitPointsPerLevel, 5
    test.done()

  "should have +6 bonus to healingSurge.count": (test) ->
    npc = new NPC
    warlock = new Classes.Warlock npc
    test.ok npc.healingSurge.count.has(6, "class"), "missing +6 class bonus to healingSurge.count"
    test.done()

  "should include appropriate skills as class skills": (test) ->
    test.ok "arcana" in Classes.Warlock.skills
    test.ok "bluff" in Classes.Warlock.skills
    test.ok "history" in Classes.Warlock.skills
    test.ok "insight" in Classes.Warlock.skills
    test.ok "intimidate" in Classes.Warlock.skills
    test.ok "religion" in Classes.Warlock.skills
    test.ok "streetwise" in Classes.Warlock.skills
    test.ok "thievery" in Classes.Warlock.skills
    test.done()

  "should add 4 pending skills": (test) ->
    new Classes.Warlock(npc = new NPC)
    test.equal npc.pendingSkills[0].count, 4
    test.deepEqual npc.pendingSkills[0].list, Classes.Warlock.skills
    test.done()

  "should add class features": (test) ->
    new Classes.Warlock(npc = new NPC)
    test.ok npc.hasFeature("class", "Eldritch Blast"), "missing Eldritch Blast feature"

    pact = npc.hasFeature("class", "Fey Pact") or
           npc.hasFeature("class", "Infernal Pact") or
           npc.hasFeature("class", "Star Pact")
    test.ok pact, "missing Eldritch Pact feature"

    test.ok npc.hasFeature("class", "Prime Shot"), "missing Prime Shot feature"
    test.ok npc.hasFeature("class", "Shadow Walk"), "missing Shadow Walk feature"
    test.ok npc.hasFeature("class", "Warlock's Curse"), "missing Warlock's Curse feature"
    test.done()

  "should be able to select pact via warlock: pact option": (test) ->
    new Classes.Warlock(npc = new NPC warlock: { pact: "Infernal" })
    test.ok npc.hasFeature("class", "Infernal Pact"), "missing Infernal Pact feature"
    test.done()

  "should define custom selectInitialPowers method": (test) ->
    klass = new Classes.Warlock(npc = new NPC)
    npc.class = klass

    count = npc.powers.atWill.length
    test.ok npc.powers.find("atWill", "EldritchBlast")
    test.ok npc.powers.find("atWill", "Eyebite") or
      npc.powers.find("atWill", "HellishRebuke") or
      npc.powers.find("atWill", "DireRadiance")

    npc.selectInitialPowers()

    test.equal npc.powers.atWill.length, count
    test.equal npc.powers.encounter.length, 1
    test.equal npc.powers.daily.length, 1
    test.equal npc.powers.utility.length, 0
    test.done()

  "should add Eldritch Blast atWill power (via Eldritch Blast)": (test) ->
    new Classes.Warlock(npc = new NPC)
    test.ok npc.powers.find("atWill", "Eldritch Blast")
    test.done()

  "should not immediately define Eldritch Blast preferred ability": (test) ->
    npc = new NPC
    npc.class = new Classes.Warlock(npc)
    blast = npc.powers.find("atWill", "Eldritch Blast")
    test.ok !blast.ability?
    npc.generateAbilityScores()
    test.ok blast.ability?
    test.done()

  "Fey Pact should grant Eyebite as the other at-will spell": (test) ->
    new Classes.Warlock(npc = new NPC warlock: { pact: "Fey" })
    test.ok npc.powers.find("atWill", "Eyebite")
    test.done()

  "Fey Pact should grant Misty Step pact boon as class feature": (test) ->
    new Classes.Warlock(npc = new NPC warlock: { pact: "Fey" })
    test.ok npc.hasFeature("class", "Pact Boon: Misty Step")
    test.done()

  "Infernal Pact should grant Hellish Rebuke as the other at-will spell": (test) ->
    new Classes.Warlock(npc = new NPC warlock: { pact: "Infernal" })
    test.ok npc.powers.find("atWill", "Hellish Rebuke")
    test.done()

  "Infernal Pact should grant Dark One's Blessing pact boon as class feature": (test) ->
    new Classes.Warlock(npc = new NPC warlock: { pact: "Infernal" })
    test.ok npc.hasFeature("class", "Pact Boon: Dark One's Blessing")
    test.done()

  "Star Pact should grant Dire Radiance as the other at-will spell": (test) ->
    new Classes.Warlock(npc = new NPC warlock: { pact: "Star" })
    test.ok npc.powers.find("atWill", "Dire Radiance")
    test.done()

  "Star Pact should grant Fate of the Void pact boon as class feature": (test) ->
    new Classes.Warlock(npc = new NPC warlock: { pact: "Star" })
    test.ok npc.hasFeature("class", "Pact Boon: Fate of the Void")
    test.done()

  "should have Warlock's Curse atWill power (via Warlock's Curse)": (test) ->
    new Classes.Warlock(npc = new NPC)
    test.ok npc.powers.find("atWill", "Warlock's Curse")
    test.done()
    
  "warlock powers are called spells": (test) ->
    warlock = new Classes.Warlock(new NPC)
    test.equal warlock.powerName, "spell"
    test.done()

  "level-1 spells are accounted for": (test) ->
    for power in [ "DireRadiance", "EldritchBlast", "Eyebite", "HellishRebuke" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.atWill[1]

    for power in [ "DiabolicGrasp", "DreadfulWord", "VampiricEmbrace", "Witchfire" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.encounter[1]

    for power in [ "ArmorOfAgathys", "CurseOfTheDarkDream", "DreadStar", "FlamesOfPhlegethos" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.daily[1]

    klass = new Classes.Warlock(new NPC)
    test.equal Classes.Warlock.powers, klass.powers
    test.done()

  "level-2 spells are accounted for": (test) ->
    for power in [ "BeguilingTongue", "EtherealStride", "FiendishResilience", "ShadowVeil" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.utility[2]
    test.done()

  "level-3 spells are accounted for": (test) ->
    for power in [ "EldritchRain", "FieryBolt", "FrigidDarkness", "OtherwindStride" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.encounter[3]
    test.done()

  "level-5 spells are accounted for": (test) ->
    for power in [ "AvernianEruption", "CrownOfMadness", "CurseOfTheBloodyFangs", "HungerOfHadar" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.daily[5]
    test.done()

  "level-6 spells are accounted for": (test) ->
    for power in [ "DarkOnesOwnLuck", "FeySwitch", "ShroudOfBlackSteel", "SpiderClimb" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.utility[6]
    test.done()

  "level-7 spells are accounted for": (test) ->
    for power in [ "HowlOfDoom", "InfernalMoonCurse", "MireTheMind", "SignOfIllOmen" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.encounter[7]
    test.done()

  "level-9 spells are accounted for": (test) ->
    for power in [ "CurseOfTheBlackFrost", "IronSpikeOfDis", "SummonsOfKhirad", "ThiefOfFiveFates" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.daily[9]
    test.done()

  "level-10 spells are accounted for": (test) ->
    for power in [ "AmbassadorImp", "ShadowForm", "ShieldingShades", "WarlocksLeap" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.utility[10]
    test.done()

  "level-13 spells are accounted for": (test) ->
    for power in [ "BewitchingWhispers", "ColdfireVortex", "Harrowstorm", "SoulFlaying" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.encounter[13]
    test.done()

  "level-15 spells are accounted for": (test) ->
    for power in [ "CurseOfTheGoldenMist", "Fireswarm", "TendrilsOfThuban", "ThirstingMaw" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.daily[15]
    test.done()

  "level-16 spells are accounted for": (test) ->
    for power in [ "CloakOfShadow", "EyeOfTheWarlock", "InfuriatingElusiveness" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.utility[16]
    test.done()

  "level-17 spells are accounted for": (test) ->
    for power in [ "StrandOfFate", "ThirstingTendrils", "WarlocksBargain" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.encounter[17]
    test.done()

  "level-19 spells are accounted for": (test) ->
    for power in [ "DelusionsOfLoyalty", "MinionsOfMalbolge", "WrathOfAcamar" ]
      test.ok Powers.collections.warlock[power], "`#{power}' is not defined"
      if Powers.collections.warlock[power]
        test.ok power in Classes.Warlock.powers.daily[19]
    test.done()
