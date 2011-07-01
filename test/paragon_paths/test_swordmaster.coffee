{Classes, ParagonPaths, NPC} = require '../..'

Swordmaster = ParagonPaths.Swordmaster

newFighter = ->
  npc = new NPC
  npc.class = new Classes.Fighter npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Swordmaster.id, "swordmaster"
    path = new Swordmaster(new NPC)
    test.equal path.id, "swordmaster"
    test.done()
    
  "should have name": (test) ->
    test.equal Swordmaster.simpleName, "swordmaster"
    path = new Swordmaster(new NPC)
    test.equal path.name, "swordmaster"
    test.done()

  "should require fighter class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    npc.equipment.push = "longsword"
    test.ok not Swordmaster.accepts(npc)

    npc = newFighter()
    npc.equipment.push "crossbow"
    test.ok not Swordmaster.accepts(npc)
    npc.equipment.push "glaive"
    test.ok not Swordmaster.accepts(npc)
    npc.equipment.push "longsword"
    test.ok Swordmaster.accepts(npc)
    npc.equipment[2] = "shortSword"
    test.ok Swordmaster.accepts(npc)
    test.done()

  "constructor should set initial path features": (test) ->
    new Swordmaster(npc = newFighter())
    test.ok npc.hasFeature("class", "Steel Defense Action"), "Steel Defense Action"
    test.ok npc.hasFeature("class", "Steel Grace"), "expected Steel Grace"
    test.ok not npc.hasFeature("class", "Steel Blitz")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "PrecisionCut" in Swordmaster.powers.encounter[11]
    test.ok "FantasticFlourish" in Swordmaster.powers.utility[12]
    test.ok "CrescendoSword" in Swordmaster.powers.daily[20]

    klass = new Swordmaster(new NPC)
    test.equal Swordmaster.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Swordmaster(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Swordmaster(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Steel Blitz")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Steel Blitz")
    test.done()
