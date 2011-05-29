{Armor, Classes, NPC, Powers, Weapons} = require '..'

module.exports =
  "should be level 1": (test) ->
    npc = new NPC
    test.equal npc.level, 1
    test.done()

  "should provide a random number generator": (test) ->
    npc = new NPC
    test.ok npc.random?
    test.done()

  "should initialize descriptors": (test) ->
    npc = new NPC
    test.equal npc.descriptors.length, 0
    test.done()

  "should initialize features collections": (test) ->
    npc = new NPC
    test.ok npc.features?
    test.equal npc.features.racial.length, 0
    test.equal npc.features.class.length, 0
    test.done()

  "should initialize abilities": (test) ->
    npc = new NPC
    for ability in ["str", "con", "dex", "int", "wis", "cha"]
      test.ok npc.abilities[ability], "`#{ability}' was not defined"
    test.equal npc.abilities["int"], npc.abilities["int_"], "`int_' should be an alias for `int'"
    test.done()

  "should initialize powers collections": (test) ->
    npc = new NPC
    test.ok npc.powers?
    test.equal npc.powers.atWill.length, 0
    test.equal npc.powers.encounter.length, 0
    test.equal npc.powers.daily.length, 0
    test.equal npc.powers.utility.length, 0
    test.done()

  "should initialize languages collection": (test) ->
    npc = new NPC
    test.equal npc.languages.length, 0
    test.done()

  "should initialize proficiencies collections": (test) ->
    npc = new NPC
    test.ok npc.proficiencies?
    test.deepEqual npc.proficiencies.armor, []
    test.deepEqual npc.proficiencies.weapons, []
    test.done()

  "should initialize equipment collection": (test) ->
    npc = new NPC
    test.ok npc.equipment?
    test.equal npc.equipment.length, 0
    test.done()

  "equipment collection should be able to query weapons": (test) ->
    npc = new NPC
    npc.equipment.push "rope"
    npc.equipment.push "shortSword"
    npc.equipment.push "lamp"
    npc.equipment.push "spikedChain"

    test.deepEqual npc.equipment.weapons().sort(), ["shortSword", "spikedChain"]
    test.done()

  "should initialize supportedImplements collection": (test) ->
    npc = new NPC
    test.deepEqual npc.supportedImplements, []
    test.done()

  "should initialize defenses": (test) ->
    npc = new NPC
    test.ok npc.defenses?
    test.equal npc.defenses.ac.score(), 10
    test.equal npc.defenses.fort.score(), 10
    test.equal npc.defenses.ref.score(), 10
    test.equal npc.defenses.will.score(), 10
    test.done()

  "should initialize feat collection": (test) ->
    npc = new NPC
    test.ok npc.feats?
    test.equal npc.feats.length, 0
    test.done()

  "should initialize pendingFeats": (test) ->
    npc = new NPC
    test.deepEqual npc.pendingFeats, [count: 1]
    test.done()

  "should initialize pendingPowers": (test) ->
    npc = new NPC
    test.equal npc.pendingPowers.length, 0
    test.done()

  "should initialize ritual collection": (test) ->
    npc = new NPC
    test.ok npc.rituals?
    test.done()

  "should initialize alignment": (test) ->
    npc = new NPC
    test.equal npc.alignment, "unaligned"
    test.done()

  "should initialize pendingSkills": (test) ->
    npc = new NPC
    test.deepEqual npc.pendingSkills, []
    test.done()

  "defenses should depend on level": (test) ->
    npc = new NPC
    npc.level = 2
    test.equal npc.defenses.ac.score(), 11
    test.equal npc.defenses.fort.score(), 11
    test.equal npc.defenses.ref.score(), 11
    test.equal npc.defenses.will.score(), 11
    npc.level = 7
    test.equal npc.defenses.ac.score(), 13
    test.equal npc.defenses.fort.score(), 13
    test.equal npc.defenses.ref.score(), 13
    test.equal npc.defenses.will.score(), 13
    test.done()

  "ac should depend on dexterity when no armor is worn": (test) ->
    npc = new NPC
    npc.abilities.dex.baseValue = 14
    test.equal npc.defenses.ac.score(), 12
    test.done()

  "ac should depend on dexterity when light armor is worn": (test) ->
    npc = new NPC
    npc.abilities.dex.baseValue = 14
    Armor.applyTo(npc, "leather")
    test.equal npc.defenses.ac.score(), 14
    test.done()

  "ac should not depend on dexterity when heavy armor is worn": (test) ->
    npc = new NPC
    npc.abilities.dex.baseValue = 14
    Armor.applyTo(npc, "plate")
    test.equal npc.defenses.ac.score(), 18
    test.done()

  "fortitude should depend on greater of str or con": (test) ->
    npc = new NPC
    npc.abilities.str.baseValue = 14
    test.equal npc.defenses.fort.score(), 12
    npc.abilities.con.baseValue = 16
    test.equal npc.defenses.fort.score(), 13
    test.done()

  "reflex should depend on greater of dex or int": (test) ->
    npc = new NPC
    npc.abilities.dex.baseValue = 14
    test.equal npc.defenses.ref.score(), 12
    npc.abilities.int_.baseValue = 16
    test.equal npc.defenses.ref.score(), 13
    test.done()

  "will should depend on greater of wis or cha": (test) ->
    npc = new NPC
    npc.abilities.wis.baseValue = 14
    test.equal npc.defenses.will.score(), 12
    npc.abilities.cha.baseValue = 16
    test.equal npc.defenses.will.score(), 13
    test.done()

  "#feature should add item to the appropriate collection": (test) ->
    npc = new NPC
    npc.feature "racial", "Dragonborn fury", "+1 to attack when bloodied"
    test.deepEqual npc.features.racial, [ [ "Dragonborn fury", "+1 to attack when bloodied" ] ]
    test.done()

  "#hitPoints should be dependent on CON score": (test) ->
    npc = new NPC
    npc.abilities.con.baseValue = 10
    test.equal npc.hitPoints.score(), 10
    npc.abilities.con.baseValue = 16
    test.equal npc.hitPoints.score(), 16
    test.done()

  "#healingSurge.value should be dependent on hit points": (test) ->
    npc = new NPC
    test.equal npc.healingSurge.value.score(), 2
    npc.hitPoints.adjust 10
    test.equal npc.healingSurge.value.score(), 5
    test.done()

  "#healingSurge.count should be dependent on CON": (test) ->
    npc = new NPC
    test.equal npc.healingSurge.count.score(), 0
    npc.abilities.con.adjust 4
    test.equal npc.healingSurge.count.score(), 2
    test.done()

  "#learnRitual should add the given ritual to the given level": (test) ->
    npc = new NPC
    npc.learnRitual 1, "Animal Messenger"
    test.deepEqual npc.rituals[1], [ "Animal Messenger" ]
    test.done()

  "#generate should return the npc": (test) ->
    npc = new NPC
    test.equal npc.generate(), npc
    test.done()

  "#generate on level 1 npc should select gender": (test) ->
    test.ok (new NPC).generate().gender in ["male", "female"]
    test.done()

  "#generate on level 1 npc should assign race": (test) ->
    npc = (new NPC).generate()
    test.ok npc.race?, "expected race to be set"
    test.done()

  "#generate on level 1 npc should select alignment": (test) ->
    npc = new NPC
    npc.alignment = undefined
    npc.generate()
    test.ok npc.alignment?, "expected alignment to be set"
    test.done()

  "#generate on level 1 npc should assign class": (test) ->
    npc = (new NPC).generate()
    test.ok npc.class?, "expected class to be set"
    test.done()

  "#generate on level 1 npc should determine ability scores": (test) ->
    npc = new NPC
    for ability in [ "str", "con", "dex", "int", "wis", "cha" ]
      npc.abilities[ability].baseValue = 0

    npc.generate()
    for ability in [ "str", "con", "dex", "int", "wis", "cha" ]
      test.ok npc.abilities[ability].baseValue > 0

    test.done()

  "#generate should assign pending skills": (test) ->
    npc = (new NPC).generate()
    test.equal npc.pendingSkills.length, 0

    count = 0
    for name, skill of npc.skills
      count += 1 if skill.trained
    test.ok count >= 3, "expected at least 3 trained skills"

    test.done()

  "#generate should call list on pendingSkills when list is a func": (test) ->
    npc = new NPC
    npc.pendingSkills.push count: 1, list: (npc) -> npc.class.skills
    npc.generate()
    test.equal npc.pendingSkills.length, 0

    count = 0
    for name, skill of npc.skills
      count += 1 if skill.trained
    test.ok count >= 4, "expected at least 4 trained skills"

    test.done()

  "#generate should assign pending feats": (test) ->
    npc = (new NPC).generate()
    test.equal npc.pendingFeats.length, 0
    test.ok npc.feats.length > 0
    test.done()

  "#generate should select and apply an appropriate armor": (test) ->
    npc = (new NPC).generate()
    test.ok npc.armor?, "expected armor to be set"
    armor = Armor[npc.armor]
    test.ok armor?, "expected a valid armor to be selected"
    test.ok Armor.allows(npc, npc.armor), "expected selected armor to match proficiency"
    test.ok npc.defenses.ac.has(armor.bonus, "armor") if armor.bonus != 0
    test.done()

  "#generate should select an appropriate weapon": (test) ->
    npc = (new NPC).generate()
    test.ok npc.equipment.weapons().length > 0, "expected weapons to be assigned"
    for weapon in npc.equipment.weapons()
      test.ok Weapons.proficient(npc, weapon), "expected NPC to be proficient in assigned weapon `#{weapon}'"
    test.done()

  "weapon selection should honor preferredWeaponHandCount": (test) ->
    for hands in [1, 2]
      while true
        npc = new NPC
        npc.preferredWeaponHandCount = hands
        npc.generate()
        break if npc.size != "small"
      for weapon in npc.equipment.weapons()
        test.equal npc.preferredWeaponHandCount, Weapons.all[weapon].hands
    test.done()

  "weapon selection should honor preferredWeaponHandCount of 2 for small characters": (test) ->
    npc = new NPC
    npc.size = "small"
    npc.preferredWeaponHandCount = 2
    npc.proficiencies.weapons.push "simple melee"
    npc.selectWeapons()
    test.ok npc.equipment.weapons().length > 0
    for weapon in npc.equipment.weapons()
      test.equal Weapons.all[weapon].hands, 1
      test.ok "versatile" in Weapons.all[weapon].properties
    test.done()

  "should have two L1 atWill class powers": (test) ->
    npc = (new NPC).generate()
    test.expect 2
    for power in npc.powers.atWill
      test.ok true if power.id in npc.class.powers.atWill[1]
    test.done()

  "should have one L1 encounter class power": (test) ->
    npc = (new NPC).generate()
    test.expect 1
    for power in npc.powers.encounter
      test.ok true if power.id in npc.class.powers.encounter[1]
    test.done()

  "should have one L1 daily class power": (test) ->
    npc = (new NPC).generate()
    test.expect 1
    for power in npc.powers.daily
      test.ok true if power.id in npc.class.powers.daily[1]
    test.done()

  "#generate should apply additional pending powers": (test) ->
    npc = new NPC
    npc.pendingPowers.push count: 1, category: "atWill", list: Classes.Cleric.powers.daily[1]
    npc.generate()
    test.equal npc.pendingPowers.length, 0, "expected pendingPowers to be cleared"

    count = 0
    for power in npc.powers.atWill
      count += 1 if power.id in Classes.Cleric.powers.daily[1]
    test.equal count, 1, "expected exactly one atWill power from the Cleric daily list"
    test.done()

  "#generate should call the pendingPowers list attribute if it is a function": (test) ->
    npc = new NPC
    npc.pendingPowers.push count: 1, category: "atWill", list: (npc) -> Classes.Cleric.powers.daily[1]
    npc.generate()
    test.equal npc.pendingPowers.length, 0, "expected pendingPowers to be cleared"

    count = 0
    for power in npc.powers.atWill
      count += 1 if power.id in Classes.Cleric.powers.daily[1]
    test.equal count, 1, "expected exactly one atWill power from the Cleric daily list"
    test.done()
