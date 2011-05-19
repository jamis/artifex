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

  "should initialize implements collection": (test) ->
    npc = new NPC
    test.deepEqual npc.implements, []
    test.done()

  "should initialize defenses": (test) ->
    npc = new NPC
    test.ok npc.defenses?
    test.equal npc.defenses.ac.score(), 10
    test.equal npc.defenses.fort.score(), 10
    test.equal npc.defenses.ref.score(), 10
    test.equal npc.defenses.will.score(), 10
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
    npc.abilities.int.baseValue = 16
    test.equal npc.defenses.ref.score(), 13
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
