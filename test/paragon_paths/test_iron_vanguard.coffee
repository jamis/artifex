{Classes, ParagonPaths, NPC} = require '../..'

IronVanguard = ParagonPaths.IronVanguard

newFighter = ->
  npc = new NPC
  npc.class = new Classes.Fighter npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal IronVanguard.id, "ironVanguard"
    path = new IronVanguard(new NPC)
    test.equal path.id, "ironVanguard"
    test.done()
    
  "should have name": (test) ->
    test.equal IronVanguard.simpleName, "iron vanguard"
    path = new IronVanguard(new NPC)
    test.equal path.name, "iron vanguard"
    test.done()

  "should require fighter class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not IronVanguard.accepts(npc)
    test.ok IronVanguard.accepts(newFighter())
    test.done()

  "constructor should set initial path features": (test) ->
    new IronVanguard(npc = newFighter())
    test.ok npc.hasFeature("class", "Enduring Warrior"), "Enduring Warrior"
    test.ok npc.hasFeature("class", "Ferocious Reaction"), "expected Ferocious Reaction"
    test.ok not npc.hasFeature("class", "Trample the Fallen")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "FrontlineSurge" in IronVanguard.powers.encounter[11]
    test.ok "InexorableShift" in IronVanguard.powers.utility[12]
    test.ok "IndomitableStrength" in IronVanguard.powers.daily[20]

    klass = new IronVanguard(new NPC)
    test.equal IronVanguard.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new IronVanguard(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new IronVanguard(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Trample the Fallen")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Trample the Fallen")
    test.done()
