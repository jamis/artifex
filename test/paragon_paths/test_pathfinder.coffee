{Classes, ParagonPaths, NPC} = require '../..'

Pathfinder = ParagonPaths.Pathfinder

newRanger = (style) ->
  npc = new NPC ranger: { style: style }
  npc.class = new Classes.Ranger npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Pathfinder.id, "pathfinder"
    path = new Pathfinder(new NPC)
    test.equal path.id, "pathfinder"
    test.done()
    
  "should have name": (test) ->
    test.equal Pathfinder.simpleName, "pathfinder"
    path = new Pathfinder(new NPC)
    test.equal path.name, "pathfinder"
    test.done()

  "should require Two-Blade-style ranger class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not Pathfinder.accepts(npc)
    test.ok not Pathfinder.accepts(newRanger("Archer"))
    test.ok Pathfinder.accepts(newRanger("Two-Blade"))
    test.done()

  "constructor should set initial path features": (test) ->
    new Pathfinder(npc = newRanger("Two-Blade"))
    test.ok npc.hasFeature("class", "Battlehoned"), "expected Battlehoned"
    test.ok npc.hasFeature("class", "Pathfinder's Action"), "expected Pathfinder's Action"
    test.ok not npc.hasFeature("class", "Cruel Recovery")
    test.done()

  "Battlehoned should grant 2 extra healing surges": (test) ->
    npc = newRanger("Two-Blade")
    count = npc.healingSurge.count.score()
    new Pathfinder(npc)
    test.equal npc.healingSurge.count.score(), count+2, "expected 2 extra healing surges"
    test.done()

  "powers are accounted for": (test) ->
    test.ok "WrongStep" in Pathfinder.powers.encounter[11]
    test.ok "ActTogether" in Pathfinder.powers.utility[12]
    test.ok "SlashersMark" in Pathfinder.powers.daily[20]

    klass = new Pathfinder(new NPC)
    test.equal Pathfinder.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Pathfinder(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Pathfinder(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Cruel Recovery")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Cruel Recovery")
    test.done()
