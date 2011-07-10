{Classes, ParagonPaths, NPC} = require '../..'

SwordMarshal = ParagonPaths.SwordMarshal

newWarlord = ->
  npc = new NPC
  npc.class = new Classes.Warlord npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal SwordMarshal.id, "swordMarshal"
    path = new SwordMarshal(new NPC)
    test.equal path.id, "swordMarshal"
    test.done()
    
  "should have name": (test) ->
    test.equal SwordMarshal.simpleName, "sword marshal"
    path = new SwordMarshal(new NPC)
    test.equal path.name, "sword marshal"
    test.done()

  "should require warlord class with heavy blade": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not SwordMarshal.accepts(npc)
    npc = newWarlord()
    npc.equipment.push "shortSword"
    test.ok not SwordMarshal.accepts(npc)
    npc.equipment.push "longsword"
    test.ok SwordMarshal.accepts(npc)
    test.done()

  "constructor should set initial path features": (test) ->
    new SwordMarshal(npc = newWarlord())
    test.ok npc.hasFeature("class", "Disciplined Blade"), "expected Disciplined Blade"
    test.ok npc.hasFeature("class", "Sword Marshal's Action"), "expected Sword Marshal's Action"
    test.ok not npc.hasFeature("class", "Skewer the Weak")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "BladeFlurry" in SwordMarshal.powers.encounter[11]
    test.ok "SwordMarshalsBoon" in SwordMarshal.powers.utility[12]
    test.ok "DiamondBladeOfVictory" in SwordMarshal.powers.daily[20]

    klass = new SwordMarshal(new NPC)
    test.equal SwordMarshal.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new SwordMarshal(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new SwordMarshal(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Skewer the Weak")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Skewer the Weak")
    test.done()
