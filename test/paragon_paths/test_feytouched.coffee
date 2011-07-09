{Classes, ParagonPaths, NPC} = require '../..'

Feytouched = ParagonPaths.Feytouched

newWarlock = (pact) ->
  npc = new NPC warlock: { pact: pact ? "Fey"}
  npc.class = new Classes.Warlock npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Feytouched.id, "feytouched"
    path = new Feytouched(newWarlock())
    test.equal path.id, "feytouched"
    test.done()
    
  "should have name": (test) ->
    test.equal Feytouched.simpleName, "feytouched"
    path = new Feytouched(newWarlock())
    test.equal path.name, "feytouched"
    test.done()

  "should require warlock class with fey pact": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not Feytouched.accepts(npc)
    test.ok not Feytouched.accepts(newWarlock "Star")
    test.ok Feytouched.accepts(newWarlock "Fey")
    test.done()

  "constructor should set initial path features": (test) ->
    new Feytouched(npc = newWarlock())
    test.ok npc.hasFeature("class", "Feytouched Action"), "expected Feytouched Action"
    test.ok npc.hasFeature("class", "Slashing Wake"), "expected Slashing Wake"
    test.ok not npc.hasFeature("class", "Patron's Favor")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "WillOfTheFeywild" in Feytouched.powers.encounter[11]
    test.ok "TwilightTeleport" in Feytouched.powers.utility[12]
    test.ok "WhispersOfTheFey" in Feytouched.powers.daily[20]

    klass = new Feytouched(newWarlock())
    test.equal Feytouched.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Feytouched(npc = newWarlock())
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Feytouched(npc = newWarlock())
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Patron's Favor")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Patron's Favor")
    test.done()
