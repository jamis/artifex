{Classes, ParagonPaths, NPC} = require '../..'

Hospitaler = ParagonPaths.Hospitaler

newPaladin = ->
  npc = new NPC
  npc.class = new Classes.Paladin npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Hospitaler.id, "hospitaler"
    path = new Hospitaler(new NPC)
    test.equal path.id, "hospitaler"
    test.done()
    
  "should have name": (test) ->
    test.equal Hospitaler.simpleName, "hospitaler"
    path = new Hospitaler(new NPC)
    test.equal path.name, "hospitaler"
    test.done()

  "should require paladin class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not Hospitaler.accepts(npc)
    test.ok Hospitaler.accepts(newPaladin())
    test.done()

  "constructor should set initial path features": (test) ->
    new Hospitaler(npc = newPaladin())
    test.ok npc.hasFeature("class", "Hospitaler's Blessing"), "expected Hospitaler's Blessing"
    test.ok npc.hasFeature("class", "Hospitaler's Action"), "expected Hospitaler's Action"
    test.ok not npc.hasFeature("class", "Hospitaler's Care")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "WardingBlow" in Hospitaler.powers.encounter[11]
    test.ok "HealingFont" in Hospitaler.powers.utility[12]
    test.ok "LifeGivingSmite" in Hospitaler.powers.daily[20]

    klass = new Hospitaler(new NPC)
    test.equal Hospitaler.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Hospitaler(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Hospitaler(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Hospitaler's Care")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Hospitaler's Care")
    test.done()
