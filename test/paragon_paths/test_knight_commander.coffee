{Classes, ParagonPaths, NPC} = require '../..'

KnightCommander = ParagonPaths.KnightCommander

newWarlord = ->
  npc = new NPC
  npc.class = new Classes.Warlord npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal KnightCommander.id, "knightCommander"
    path = new KnightCommander(new NPC)
    test.equal path.id, "knightCommander"
    test.done()
    
  "should have name": (test) ->
    test.equal KnightCommander.simpleName, "knight commander"
    path = new KnightCommander(new NPC)
    test.equal path.name, "knight commander"
    test.done()

  "should require warlord class with heavy armor": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not KnightCommander.accepts(npc)
    npc = newWarlord()
    npc.armor = "leather"
    test.ok not KnightCommander.accepts(npc)
    npc.armor = "chainmail"
    test.ok KnightCommander.accepts(npc)
    test.done()

  "constructor should set initial path features": (test) ->
    new KnightCommander(npc = newWarlord())
    test.ok npc.hasFeature("class", "Honor and Glory"), "expected Honor and Glory"
    test.ok npc.hasFeature("class", "Knight Commander's Action"), "expected Knight Commander's Action"
    test.ok not npc.hasFeature("class", "Press of Arms")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "SlashAndPress" in KnightCommander.powers.encounter[11]
    test.ok "BreakTheirNerve" in KnightCommander.powers.utility[12]
    test.ok "ControlTheField" in KnightCommander.powers.daily[20]

    klass = new KnightCommander(new NPC)
    test.equal KnightCommander.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new KnightCommander(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new KnightCommander(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Press of Arms")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Press of Arms")
    test.done()
