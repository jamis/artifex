{Classes, ParagonPaths, NPC} = require '../..'

Doomsayer = ParagonPaths.Doomsayer

newWarlock = (pact) ->
  npc = new NPC warlock: { pact: pact ? "Star"}
  npc.class = new Classes.Warlock npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Doomsayer.id, "doomsayer"
    path = new Doomsayer(newWarlock())
    test.equal path.id, "doomsayer"
    test.done()
    
  "should have name": (test) ->
    test.equal Doomsayer.simpleName, "doomsayer"
    path = new Doomsayer(newWarlock())
    test.equal path.name, "doomsayer"
    test.done()

  "should require warlock class with star pact": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not Doomsayer.accepts(npc)
    test.ok not Doomsayer.accepts(newWarlock "Fey")
    test.ok Doomsayer.accepts(newWarlock "Star")
    test.done()

  "constructor should set initial path features": (test) ->
    new Doomsayer(npc = newWarlock())
    test.ok npc.hasFeature("class", "Doomsayer's Action"), "expected Doomsayer's Action"
    test.ok npc.hasFeature("class", "Doomsayer's Proclamation"), "expected Doomsayer's Proclamation"
    test.ok not npc.hasFeature("class", "Doomsayer's Oath")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "FatesEntwined" in Doomsayer.powers.encounter[11]
    test.ok "AccursedShroud" in Doomsayer.powers.utility[12]
    test.ok "LongFallIntoDarkness" in Doomsayer.powers.daily[20]

    klass = new Doomsayer(newWarlock())
    test.equal Doomsayer.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Doomsayer(npc = newWarlock())
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Doomsayer(npc = newWarlock())
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Doomsayer's Oath")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Doomsayer's Oath")
    test.done()
