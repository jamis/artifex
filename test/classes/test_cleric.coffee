{Classes, Deities, NPC, Powers, Rituals} = require '../..'

hasClassFeature = (npc, name) ->
  for feature in npc.features.class
    return true if name is feature[0]
  false
  
module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Cleric.source, "phb"
    test.done()

  "should have divine power source": (test) ->
    test.equal Classes.Cleric.powerSource, "divine"
    cleric = new Classes.Cleric new NPC
    test.equal cleric.powerSource, "divine"
    test.done()

  "should set name": (test) ->
    cleric = new Classes.Cleric new NPC
    test.equal cleric.name, "cleric"
    test.done()

  "should set key attribute list": (test) ->
    cleric = new Classes.Cleric new NPC
    test.deepEqual cleric.keyAttributes, ["wis", "str", "cha"]
    test.done()

  "should set armor proficiencies": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    for armor in ["cloth", "leather", "hide", "chainmail"]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    for weapon in ["simple melee", "simple ranged"]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should add holy symbol as an implement": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok "holy symbol" in npc.supportedImplements
    test.done()

  "should have +2 bonus to will": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok npc.defenses.will.has(2, "class"), "missing +2 class bonus to will"
    test.done()

  "should have a +12 class bonus to HP": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok npc.hitPoints.has(12, "class"), "missing +12 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 5": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.equal npc.hitPointsPerLevel, 5
    test.done()

  "should have +7 bonus to healingSurge.count": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok npc.healingSurge.count.has(7, "class"), "missing +5 class bonus to healingSurge.count"
    test.done()

  "should choose religion as a trained skill": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok npc.skills.religion.trained
    test.done()

  "should include appropriate skills as class skills": (test) ->
    test.ok "arcana" in Classes.Cleric.skills
    test.ok "diplomacy" in Classes.Cleric.skills
    test.ok "heal" in Classes.Cleric.skills
    test.ok "history" in Classes.Cleric.skills
    test.ok "insight" in Classes.Cleric.skills
    test.ok "religion" in Classes.Cleric.skills
    test.done()

  "should add 3 pending skills": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.equal npc.pendingSkills[0].count, 3
    test.deepEqual npc.pendingSkills[0].list, Classes.Cleric.skills
    test.done()

  "should add class features": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.ok npc.hasFeature("class", "Channel Divinity"), "missing Channel Divinity feature"
    test.ok npc.hasFeature("class", "Healer's Lore"), "missing Healer's Lore feature"
    test.ok npc.hasFeature("class", "Healing Word"), "missing Healing Word feature"
    test.ok npc.hasFeature("class", "Ritual Casting"), "missing Ritual Casting feature"
    test.done()

  "should have Channel Divinity: Divine Fortune encounter power": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.ok npc.powers.find("encounter", "Channel Divinity: Divine Fortune")
    test.done()

  "should have Channel Divinity: Turn Undead encounter power": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.ok npc.powers.find("encounter", "Channel Divinity: Turn Undead")
    test.done()

  "should have Healing Word encounter power": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.ok npc.powers.find("encounter", "Healing Word")
    test.done()

  "should have Ritual Caster feat": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.ok "Ritual Caster" in npc.feats, "missing Ritual Caster feat"
    test.done()

  "should have two L1 rituals including Gentle Repose": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.ok npc.rituals[1]?
    test.ok "Gentle Repose" in npc.rituals[1]
    test.equal npc.rituals[1].length, 2

    all = Rituals.all(1)
    for ritual in npc.rituals[1]
      test.ok ritual in all, "expected `#{ritual}' to be a first level ritual"

    test.done()

  "unaligned clerics may choose a deity at random from the entire list": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.ok npc.deity?
    test.done()

  "clerics of other alignments must have a compatible deity": (test) ->
    for n in [1..10]
      npc = new NPC
      npc.alignment = "lawful good"
      new Classes.Cleric npc
      test.ok npc.deity in Deities["lawful good"] or npc.deity in Deities["unaligned"]

      npc = new NPC
      npc.alignment = "good"
      new Classes.Cleric npc
      test.ok npc.deity in Deities["good"] or npc.deity in Deities["unaligned"]

      npc = new NPC
      npc.alignment = "evil"
      new Classes.Cleric npc
      test.ok npc.deity in Deities["evil"] or npc.deity in Deities["unaligned"]

      npc = new NPC
      npc.alignment = "chaotic evil"
      new Classes.Cleric npc
      test.ok npc.deity in Deities["chaotic evil"] or npc.deity in Deities["unaligned"]
    test.done()

  "cleric powers are called prayers": (test) ->
    cleric = new Classes.Cleric(new NPC)
    test.equal cleric.powerName, "prayer"
    test.done()

  "level-1 prayers are accounted for": (test) ->
    for power in [ "LanceOfFaith", "PriestsShield", "RighteousBrand", "SacredFlame" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Cleric.powers.atWill[1]

    for power in [ "CauseFear", "DivineGlow", "HealingStrike", "WrathfulThunder" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Cleric.powers.encounter[1]

    for power in [ "AvengingFlame", "BeaconOfHope", "CascadeOfLight", "GuardianOfFaith" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Cleric.powers.daily[1]
    test.done()

  "should have two L1 atWill powers": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.expect 2
    for power in npc.powers.atWill
      test.ok power.id in Classes.Cleric.powers.atWill[1]
    test.done()

  "should have one L1 encounter power": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.expect 1
    for power in npc.powers.encounter
      test.ok true if power.id in Classes.Cleric.powers.encounter[1]
    test.done()

  "should have one L1 daily power": (test) ->
    new Classes.Cleric(npc = new NPC)
    test.expect 1
    for power in npc.powers.daily
      test.ok true if power.id in Classes.Cleric.powers.daily[1]
    test.done()
