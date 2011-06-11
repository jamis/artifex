{Classes, NPC, Powers, Rituals} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Wizard.source, "phb"
    test.done()

  "should have arcane power source": (test) ->
    test.equal Classes.Wizard.powerSource, "arcane"
    wizard = new Classes.Wizard new NPC
    test.equal wizard.powerSource, "arcane"
    test.done()

  "should set name": (test) ->
    test.equal Classes.Wizard.simpleName, "wizard"
    wizard = new Classes.Wizard new NPC
    test.equal wizard.name, "wizard"
    test.done()

  "should set key attribute list": (test) ->
    wizard = new Classes.Wizard new NPC
    test.deepEqual wizard.keyAttributes, ["int", "wis", "dex"]
    test.done()

  "should set armor proficiencies": (test) ->
    npc = new NPC
    wizard = new Classes.Wizard npc
    for armor in [ "cloth" ]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    npc = new NPC
    wizard = new Classes.Wizard npc
    for weapon in [ "dagger", "quarterstaff" ]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should add orb, staff and wand as implements": (test) ->
    npc = new NPC
    wizard = new Classes.Wizard npc
    test.ok "orb" in npc.supportedImplements
    test.ok "staff" in npc.supportedImplements
    test.ok "wand" in npc.supportedImplements
    test.done()

  "should have +2 bonus to will": (test) ->
    npc = new NPC
    wizard = new Classes.Wizard npc
    test.ok npc.defenses.will.has(2, "class"), "missing +2 class bonus to will"
    test.done()

  "should have a +10 class bonus to HP": (test) ->
    npc = new NPC
    wizard = new Classes.Wizard npc
    test.ok npc.hitPoints.has(10, "class"), "missing +10 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 4": (test) ->
    npc = new NPC
    wizard = new Classes.Wizard npc
    test.equal npc.hitPointsPerLevel, 4
    test.done()

  "should have +6 bonus to healingSurge.count": (test) ->
    npc = new NPC
    wizard = new Classes.Wizard npc
    test.ok npc.healingSurge.count.has(6, "class"), "missing +6 class bonus to healingSurge.count"
    test.done()

  "should include appropriate skills as class skills": (test) ->
    test.ok "arcana" in Classes.Wizard.skills
    test.ok "diplomacy" in Classes.Wizard.skills
    test.ok "dungeoneering" in Classes.Wizard.skills
    test.ok "history" in Classes.Wizard.skills
    test.ok "insight" in Classes.Wizard.skills
    test.ok "nature" in Classes.Wizard.skills
    test.ok "religion" in Classes.Wizard.skills
    test.done()

  "should always be trained in arcana": (test) ->
    new Classes.Wizard(npc = new NPC)
    test.ok npc.skills.arcana.trained
    test.done()

  "should add 3 pending skills": (test) ->
    new Classes.Wizard(npc = new NPC)
    test.equal npc.pendingSkills[0].count, 3
    test.deepEqual npc.pendingSkills[0].list, Classes.Wizard.skills
    test.done()

  "should add class features": (test) ->
    new Classes.Wizard(npc = new NPC)

    implementMastery = npc.hasFeature("class", "Orb of Imposition") or
      npc.hasFeature("class", "Staff of Defense") or
      npc.hasFeature("class", "Wand of Accuracy")
    test.ok implementMastery, "missing Arcane Implement Mastery feature"

    test.ok npc.hasFeature("class", "Cantrips"), "missing Cantrips feature"
    test.ok npc.hasFeature("class", "Ritual Casting"), "missing Ritual Casting feature"
    test.ok npc.hasFeature("class", "Spellbook"), "missing Spellbook feature"
    test.done()

  "should be able to select mastery via wizard: mastery option": (test) ->
    new Classes.Wizard(npc = new NPC wizard: { mastery: "Orb" })
    test.ok npc.hasFeature("class", "Orb of Imposition"), "missing Orb of Imposition feature"

    new Classes.Wizard(npc = new NPC wizard: { mastery: "Staff" })
    test.ok npc.hasFeature("class", "Staff of Defense"), "missing Staff of Defense feature"

    new Classes.Wizard(npc = new NPC wizard: { mastery: "Wand" })
    test.ok npc.hasFeature("class", "Wand of Accuracy"), "missing Wand of Accuracy feature"
    test.done()

  "mastery should determine which implement is added to equipment": (test) ->
    new Classes.Wizard(npc = new NPC wizard: { mastery: "Orb" })
    test.ok "orb" in npc.equipment

    new Classes.Wizard(npc = new NPC wizard: { mastery: "Staff" })
    test.ok "quarterstaff" in npc.equipment

    new Classes.Wizard(npc = new NPC wizard: { mastery: "Wand" })
    test.ok "wand" in npc.equipment
    test.done()

  "should have atWill cantrip powers (via Cantrips)": (test) ->
    new Classes.Wizard(npc = new NPC)
    test.ok npc.powers.find("atWill", "GhostSound"), "missing Ghost Hand cantrip"
    test.ok npc.powers.find("atWill", "Light"), "missing Light cantrip"
    test.ok npc.powers.find("atWill", "MageHand"), "missing Mage Hand cantrip"
    test.ok npc.powers.find("atWill", "Prestidigitation"), "missing Prestitidigitation cantrip"
    test.done()

  "should have Ritual Caster feat (via Ritual Casting)": (test) ->
    new Classes.Wizard(npc = new NPC)
    test.ok "Ritual Caster" in npc.feats, "missing Ritual Caster feat"
    test.done()

  "should have three L1 rituals (via Spellbook)": (test) ->
    new Classes.Wizard(npc = new NPC)
    test.equal npc.rituals[1].length, 3
    test.done()

  "should select two daily powers (via Spellbook)": (test) ->
    new Classes.Wizard(npc = new NPC)
    test.equal npc.powersToSelect.daily.count, 2
    test.done()

  "wizard powers are called spells": (test) ->
    wizard = new Classes.Wizard(new NPC)
    test.equal wizard.powerName, "spell"
    test.done()

  "level-1 spells are accounted for": (test) ->
    for power in [ "CloudOfDaggers", "MagicMissile", "RayOfFrost", "ScorchingBurst", "Thunderwave" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Wizard.powers.atWill[1]

    for power in [ "BurningHands", "ChillStrike", "ForceOrb", "IcyTerrain", "RayOfEnfeeblement" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Wizard.powers.encounter[1]

    for power in [ "AcidArrow", "FlamingSphere", "FreezingCloud", "Sleep" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Wizard.powers.daily[1]

    klass = new Classes.Wizard(new NPC)
    test.equal Classes.Wizard.powers, klass.powers
    test.done()
