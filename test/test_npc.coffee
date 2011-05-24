{NPC} = require '..'

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
    # FIXME FIXME FIXME
    console.log "IMPLEMENT ME PLEASE"
    test.done()

  "ac should not depend on dexterity when heavy armor is worn": (test) ->
    # FIXME FIXME FIXME
    console.log "IMPLEMENT ME PLEASE"
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

  "#generate should assign pending feats": (test) ->
    npc = (new NPC).generate()
    test.equal npc.pendingFeats.length, 0
    test.ok npc.feats.length > 0
    test.done()
