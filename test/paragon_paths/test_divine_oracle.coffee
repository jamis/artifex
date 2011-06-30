{Classes, ParagonPaths, NPC, Powers, Weapons} = require '../..'

DivineOracle = ParagonPaths.DivineOracle

newCleric = ->
  npc = new NPC
  npc.class = new Classes.Cleric npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal DivineOracle.id, "divineOracle"
    path = new DivineOracle(new NPC)
    test.equal path.id, "divineOracle"
    test.done()
    
  "should have name": (test) ->
    test.equal DivineOracle.simpleName, "divine oracle"
    path = new DivineOracle(new NPC)
    test.equal path.name, "divine oracle"
    test.done()

  "should require cleric class": (test) ->
    npc = new NPC
    npc.class = new Classes.Fighter npc
    test.ok not DivineOracle.accepts(npc)
    test.ok DivineOracle.accepts(newCleric())
    test.done()

  "constructor should set initial path features": (test) ->
    new DivineOracle(npc = newCleric())
    test.ok npc.hasFeature("class", "Foresight"), "expected Foresight"
    test.ok npc.hasFeature("class", "Prophetic Action"), "expected Prophetic Action"
    test.ok not npc.hasFeature("class", "Terrifying Insight")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "ProphecyOfDoom" in DivineOracle.powers.encounter[11]
    test.ok "GoodOmens" in DivineOracle.powers.utility[12]
    test.ok "HammerOfFate" in DivineOracle.powers.daily[20]

    klass = new DivineOracle(new NPC)
    test.equal DivineOracle.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new DivineOracle(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new DivineOracle(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Terrifying Insight")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Terrifying Insight")
    test.done()
