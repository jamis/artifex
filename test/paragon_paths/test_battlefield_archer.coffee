{Classes, ParagonPaths, NPC} = require '../..'

BattlefieldArcher = ParagonPaths.BattlefieldArcher

newRanger = (style) ->
  npc = new NPC ranger: { style: style }
  npc.class = new Classes.Ranger npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal BattlefieldArcher.id, "battlefieldArcher"
    path = new BattlefieldArcher(new NPC)
    test.equal path.id, "battlefieldArcher"
    test.done()
    
  "should have name": (test) ->
    test.equal BattlefieldArcher.simpleName, "battlefield archer"
    path = new BattlefieldArcher(new NPC)
    test.equal path.name, "battlefield archer"
    test.done()

  "should require Archer-style ranger class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not BattlefieldArcher.accepts(npc)
    test.ok not BattlefieldArcher.accepts(newRanger("Two-Blade"))
    test.ok BattlefieldArcher.accepts(newRanger("Archer"))
    test.done()

  "constructor should set initial path features": (test) ->
    new BattlefieldArcher(npc = newRanger("Archer"))
    test.ok npc.hasFeature("class", "Archer's Action"), "expected Archer's Action"
    test.ok npc.hasFeature("class", "Battlefield Experience"), "expected Battlefield Experience"
    test.ok not npc.hasFeature("class", "Battle Surge")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "CombinedFire" in BattlefieldArcher.powers.encounter[11]
    test.ok "ArchersGlory" in BattlefieldArcher.powers.utility[12]
    test.ok "QuarrysBane" in BattlefieldArcher.powers.daily[20]

    klass = new BattlefieldArcher(new NPC)
    test.equal BattlefieldArcher.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new BattlefieldArcher(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new BattlefieldArcher(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Battle Surge")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Battle Surge")
    test.done()
