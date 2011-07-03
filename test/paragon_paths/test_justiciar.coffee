{Classes, ParagonPaths, NPC} = require '../..'

Justiciar = ParagonPaths.Justiciar

newPaladin = ->
  npc = new NPC
  npc.class = new Classes.Paladin npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Justiciar.id, "justiciar"
    path = new Justiciar(new NPC)
    test.equal path.id, "justiciar"
    test.done()
    
  "should have name": (test) ->
    test.equal Justiciar.simpleName, "justiciar"
    path = new Justiciar(new NPC)
    test.equal path.name, "justiciar"
    test.done()

  "should require paladin class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not Justiciar.accepts(npc)
    test.ok Justiciar.accepts(newPaladin())
    test.done()

  "constructor should set initial path features": (test) ->
    new Justiciar(npc = newPaladin())
    test.ok npc.hasFeature("class", "Just Action"), "expected Just Action"
    test.ok npc.hasFeature("class", "Just Spirit"), "expected Just Spirit"
    test.ok not npc.hasFeature("class", "Just Shelter")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "JustRadiance" in Justiciar.powers.encounter[11]
    test.ok "StrikeMeInstead" in Justiciar.powers.utility[12]
    test.ok "ChallengeTheUnjust" in Justiciar.powers.daily[20]

    klass = new Justiciar(new NPC)
    test.equal Justiciar.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Justiciar(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Justiciar(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Just Shelter")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Just Shelter")
    test.done()
