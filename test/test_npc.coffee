{Armor, Classes, NPC, Powers, Races, Weapons} = require '..'

class TestRace extends Races.Human
  constructor: (npc) ->
    super
    @name = "test"

class TestClass extends Classes.Cleric
  constructor: (npc) ->
    super
    @name = "test"

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

  "should initialize weaponPreferences collection": (test) ->
    npc = new NPC
    test.deepEqual npc.weaponPreferences, []
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
    test.equal npc.defenses.save.adjustment(), 0
    test.done()

  "should initialize attacks": (test) ->
    npc = new NPC
    test.ok npc.attacks?
    test.ok npc.attacks.general?
    test.equal npc.attacks.general.score(), 0
    test.done()

  "should initialize damage": (test) ->
    npc = new NPC
    test.ok npc.damage?
    test.ok npc.damage.general?
    test.equal npc.damage.general.score(), 0
    test.done()

  "should initialize resistance": (test) ->
    npc = new NPC
    test.ok npc.resistance?
    test.ok npc.resistance.fire?
    test.equal npc.resistance.fire.score(), 0
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

  "constructor parameters should be stored as options": (test) ->
    npc = new NPC gender: "male"
    test.ok npc.options?
    test.equal npc.options.gender, "male"
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

  "#generate should prefer the gender set in options": (test) ->
    test.equal (new NPC gender: "ambiguous").generate().gender, "ambiguous"
    test.done()

  "#generate on level 1 npc should assign race": (test) ->
    npc = (new NPC).generate()
    test.ok npc.race?, "expected race to be set"
    test.done()

  "#generate should prefer the race set in options": (test) ->
    npc = (new NPC race: TestRace).generate()
    test.equal npc.race.name, "test"
    test.done()

  "#generate on level 1 npc should select alignment": (test) ->
    npc = new NPC
    npc.alignment = undefined
    npc.generate()
    test.ok npc.alignment?, "expected alignment to be set"
    test.done()

  "#generate should prefer the alignment set in options": (test) ->
    npc = (new NPC class: Classes.Fighter, alignment: "chaotic good").generate()
    test.equal npc.alignment, "chaotic good"
    test.done()

  "#generate on level 1 npc should assign class": (test) ->
    npc = (new NPC).generate()
    test.ok npc.class?, "expected class to be set"
    test.done()

  "#generate should prefer the class set in options": (test) ->
    npc = (new NPC class: TestClass).generate()
    test.equal npc.class.name, "test"
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

  "weapon selection should honor 'ranged' weaponPreferences": (test) ->
    npc = new NPC
    npc.weaponPreferences.push type: "ranged", count: 2
    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "military ranged"
    npc.selectWeapons()
    weapons = npc.equipment.weapons()
    test.equal 2, weapons.length
    test.equal Weapons.all[weapons[0]].category, "military ranged"
    test.equal Weapons.all[weapons[1]].category, "military ranged"
    test.done()

  "weapon selection should honor 'melee' weaponPreferences": (test) ->
    npc = new NPC
    npc.weaponPreferences.push type: "melee", count: 2
    npc.proficiencies.weapons.push "simple ranged"
    npc.proficiencies.weapons.push "military melee"
    npc.proficiencies.weapons.push "military ranged"
    npc.selectWeapons()
    weapons = npc.equipment.weapons()
    test.equal 2, weapons.length
    test.equal Weapons.all[weapons[0]].category, "military melee"
    test.equal Weapons.all[weapons[1]].category, "military melee"
    test.done()

  "weapon selection should clear weaponPreferences": (test) ->
    npc = new NPC
    npc.weaponPreferences.push count: 2
    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "simple ranged"
    npc.selectWeapons()
    test.equal npc.equipment.weapons().length, 2
    test.equal npc.weaponPreferences.length, 0
    test.done()

  "should have (at least) two L1 atWill class powers": (test) ->
    npc = (new NPC).generate()
    count = 0
    for power in npc.powers.atWill
      count += 1 if power.id in npc.class.powers.atWill[1]
    test.ok count >= 2, "expected at least 2 powers, got #{count}"
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

  "initial power selection should defer to selectInitialPowers": (test) ->
    npc = new NPC
    npc.selectInitialPowers = -> test.ok true

    test.expect 1
    npc.selectPowers()
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

  "#generate should select powers appropriate for selected weapons": (test) ->
    npc = new NPC class: Classes.Ranger, ranger: { style: "Archer" }
    npc.generate()

    count = 0
    for power in npc.powers.atWill
      types = power.get("attackTypes") ? []
      test.ok "melee weapon" not in types

    test.done()

  "scoresAssigned callbacks should be invoked after ability scores are generated": (test) ->
    test.expect 1

    npc = new NPC class: Classes.Cleric
    npc.when "scoresAssigned", => test.ok true
    npc.generate()
    test.done()

  "advancement chart should describe gains at each level": (test) ->
    test.deepEqual NPC.level[ 2], ["utility", "feat"]
    test.deepEqual NPC.level[ 3], ["encounter"]
    test.deepEqual NPC.level[ 4], ["abilities:2", "feat"]
    test.deepEqual NPC.level[ 5], ["daily"]
    test.deepEqual NPC.level[ 6], ["utility", "feat"]
    test.deepEqual NPC.level[ 7], ["encounter"]
    test.deepEqual NPC.level[ 8], ["abilities:2", "feat"]
    test.deepEqual NPC.level[ 9], ["daily"]
    test.deepEqual NPC.level[10], ["utility", "feat"]
    test.deepEqual NPC.level[11], ["abilities:all", "paragon-path", "encounter:paragon", "feat"]
    test.deepEqual NPC.level[12], ["utility:paragon", "feat"]
    test.deepEqual NPC.level[13], ["replace:encounter"]
    test.deepEqual NPC.level[14], ["abilities:2", "feat"]
    test.deepEqual NPC.level[15], ["replace:daily"]
    test.deepEqual NPC.level[16], ["paragon-path", "utility", "feat"]
    test.deepEqual NPC.level[17], ["replace:encounter"]
    test.deepEqual NPC.level[18], ["abilities:2", "feat"]
    test.deepEqual NPC.level[19], ["replace:daily"]
    test.deepEqual NPC.level[20], ["daily:paragon", "feat"]
    test.deepEqual NPC.level[21], ["abilities:all", "epic-destiny", "feat"]
    test.deepEqual NPC.level[22], ["utility", "feat"]
    test.deepEqual NPC.level[23], ["replace:encounter"]
    test.deepEqual NPC.level[24], ["abilities:2", "epic-destiny", "feat"]
    test.deepEqual NPC.level[25], ["replace:daily"]
    test.deepEqual NPC.level[26], ["utility:epic", "feat"]
    test.deepEqual NPC.level[27], ["replace:encounter"]
    test.deepEqual NPC.level[28], ["abilities:2", "feat"]
    test.deepEqual NPC.level[29], ["replace:daily"]
    test.deepEqual NPC.level[30], ["epic-destiny", "feat"]
    test.done()

  "advanceItem should delegate 'utility' to advanceItem_Utility": (test) ->
    test.expect 1

    npc = new NPC class: Classes.Cleric
    npc.generate()

    npc.advanceItem_Utility = -> test.ok true
    npc.advanceItem "utility"
    test.done()

  "advanceItem_Utility should select a new utility power of the current level": (test) ->
    npc = new NPC
    npc.class = new Classes.Fighter(npc)
    npc.level = 2
    npc.advanceItem_Utility(npc)
    test.equal npc.powers.utility.length, 1
    test.ok npc.powers.utility[0].id in npc.class.powers.utility[2]
    test.done()

  "advanceItem should delegate 'feat' to advanceItem_feat": (test) ->
    test.expect 1

    npc = new NPC class: Classes.Cleric
    npc.generate()

    npc.advanceItem_Feat = -> test.ok true
    npc.advanceItem "feat"
    test.done()

  "advanceItem_Feat should add another feat": (test) ->
    npc = new NPC
    npc.generate()
    count = npc.feats.length
    npc.advanceItem_Feat(npc)
    test.equal npc.feats.length, count+1
    test.done()

  "advanceItem should delegate 'encounter' to advanceItem_Encounter": (test) ->
    test.expect 1

    npc = new NPC class: Classes.Cleric
    npc.generate()

    npc.advanceItem_Encounter = -> test.ok true
    npc.advanceItem "encounter"
    test.done()

  "advanceItem_Encounter should add another encounter power of the current level": (test) ->
    npc = new NPC
    npc.class = new Classes.Wizard(npc)
    npc.advanceItem_Encounter(npc)
    test.equal npc.powers.encounter.length, 1
    test.ok npc.powers.encounter[0].id in npc.class.powers.encounter[1]
    test.done()

  "advance should advance character level": (test) ->
    npc = new NPC class: Classes.Cleric
    npc.generate()

    hp = npc.hitPoints.score()
    npc.advanceItem_Feat = -> @advancedFeat = true
    npc.advanceItem_Utility = -> @advancedUtility = true

    npc.advance()

    test.equal npc.level, 2
    test.equal npc.hitPoints.score(), hp + npc.hitPointsPerLevel
    test.ok npc.advancedFeat, "expected feat to advance"
    test.ok npc.advancedUtility, "expected utility to advance"

    test.done()
