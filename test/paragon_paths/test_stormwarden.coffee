{Classes, ParagonPaths, NPC} = require '../..'

Stormwarden = ParagonPaths.Stormwarden

newRanger = (style) ->
  npc = new NPC ranger: { style: style }
  npc.class = new Classes.Ranger npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Stormwarden.id, "stormwarden"
    path = new Stormwarden(new NPC)
    test.equal path.id, "stormwarden"
    test.done()
    
  "should have name": (test) ->
    test.equal Stormwarden.simpleName, "stormwarden"
    path = new Stormwarden(new NPC)
    test.equal path.name, "stormwarden"
    test.done()

  "should require Two-Blade-style ranger class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not Stormwarden.accepts(npc)
    test.ok not Stormwarden.accepts(newRanger("Archer"))
    test.ok Stormwarden.accepts(newRanger("Two-Blade"))
    test.done()

  "constructor should set initial path features": (test) ->
    new Stormwarden(npc = newRanger("Two-Blade"))
    test.ok npc.hasFeature("class", "Blade Storm"), "expected Blade Storm"
    test.ok npc.hasFeature("class", "Stormstep Action"), "expected Stormstep Action"
    test.ok not npc.hasFeature("class", "Twin-Blade Storm")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "ClearingTheGround" in Stormwarden.powers.encounter[11]
    test.ok "ThrowCautionToTheWind" in Stormwarden.powers.utility[12]
    test.ok "ColdSteelHurricane" in Stormwarden.powers.daily[20]

    klass = new Stormwarden(new NPC)
    test.equal Stormwarden.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Stormwarden(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Stormwarden(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Twin-Blade Storm")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Twin-Blade Storm")
    test.done()
