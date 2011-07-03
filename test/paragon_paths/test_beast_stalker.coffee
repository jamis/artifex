{Classes, ParagonPaths, NPC} = require '../..'

BeastStalker = ParagonPaths.BeastStalker

newRanger = (style) ->
  npc = new NPC ranger: { style: style }
  npc.class = new Classes.Ranger npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal BeastStalker.id, "beastStalker"
    path = new BeastStalker(new NPC)
    test.equal path.id, "beastStalker"
    test.done()
    
  "should have name": (test) ->
    test.equal BeastStalker.simpleName, "beast stalker"
    path = new BeastStalker(new NPC)
    test.equal path.name, "beast stalker"
    test.done()

  "should require Archer-style ranger class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not BeastStalker.accepts(npc)
    test.ok not BeastStalker.accepts(newRanger("Two-Blade"))
    test.ok BeastStalker.accepts(newRanger("Archer"))
    test.done()

  "constructor should set initial path features": (test) ->
    new BeastStalker(npc = newRanger("Archer"))
    test.ok npc.hasFeature("class", "Beast Stalker's Action"), "expected Beast Stalker's Action"
    test.ok npc.hasFeature("class", /^Chosen Prey \(.*\)$/), "expected Chosen Pray"
    test.ok not npc.hasFeature("class", "Action Shift")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "PinpointingArrow" in BeastStalker.powers.encounter[11]
    test.ok "HuntersGrace" in BeastStalker.powers.utility[12]
    test.ok "BeastStalkersTarget" in BeastStalker.powers.daily[20]

    klass = new BeastStalker(new NPC)
    test.equal BeastStalker.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new BeastStalker(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new BeastStalker(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Action Shift")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Action Shift")
    test.done()
