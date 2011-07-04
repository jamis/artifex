{Classes, ParagonPaths, NPC} = require '../..'

Daggermaster = ParagonPaths.Daggermaster

newRogue = ->
  npc = new NPC
  npc.class = new Classes.Rogue npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Daggermaster.id, "daggermaster"
    path = new Daggermaster(new NPC)
    test.equal path.id, "daggermaster"
    test.done()
    
  "should have name": (test) ->
    test.equal Daggermaster.simpleName, "daggermaster"
    path = new Daggermaster(new NPC)
    test.equal path.name, "daggermaster"
    test.done()

  "should require rogue class with dagger": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not Daggermaster.accepts(npc)
    npc = newRogue()
    test.ok not Daggermaster.accepts(npc)
    npc.equipment.push "dagger"
    test.ok Daggermaster.accepts(npc)
    test.done()

  "constructor should set initial path features": (test) ->
    new Daggermaster(npc = newRogue())
    test.ok npc.hasFeature("class", "Daggermaster's Action"), "expected Daggermaster's Action"
    test.ok npc.hasFeature("class", "Dagger Precision"), "expected Dagger Precision"
    test.ok not npc.hasFeature("class", "Dagger Advantage")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "CriticalOpportunity" in Daggermaster.powers.encounter[11]
    test.ok "MeditationOfTheBlade" in Daggermaster.powers.utility[12]
    test.ok "DeepDaggerWound" in Daggermaster.powers.daily[20]

    klass = new Daggermaster(new NPC)
    test.equal Daggermaster.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Daggermaster(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Daggermaster(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Dagger Advantage")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Dagger Advantage")
    test.done()
