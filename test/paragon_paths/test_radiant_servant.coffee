{Classes, ParagonPaths, NPC, Powers, Weapons} = require '../..'

RadiantServant = ParagonPaths.RadiantServant

newCleric = ->
  npc = new NPC
  npc.class = new Classes.Cleric npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal RadiantServant.id, "radiantServant"
    path = new RadiantServant(new NPC)
    test.equal path.id, "radiantServant"
    test.done()
    
  "should have name": (test) ->
    test.equal RadiantServant.simpleName, "radiant servant"
    path = new RadiantServant(new NPC)
    test.equal path.name, "radiant servant"
    test.done()

  "should require cleric class": (test) ->
    npc = new NPC
    npc.class = new Classes.Fighter npc
    test.ok not RadiantServant.accepts(npc)
    test.ok RadiantServant.accepts(newCleric())
    test.done()

  "constructor should set initial path features": (test) ->
    new RadiantServant(npc = newCleric())
    test.ok npc.hasFeature("class", "Illuminating Attacks"), "expected Illuminating Attacks"
    test.ok npc.hasFeature("class", "Radiant Action"), "expected Radiant Action"
    test.ok not npc.hasFeature("class", "Lasting Light")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "SolarWrath" in RadiantServant.powers.encounter[11]
    test.ok "HealingSun" in RadiantServant.powers.utility[12]
    test.ok "RadiantBrilliance" in RadiantServant.powers.daily[20]

    klass = new RadiantServant(new NPC)
    test.equal RadiantServant.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new RadiantServant(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new RadiantServant(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Lasting Light")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Lasting Light")
    test.done()
