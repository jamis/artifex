{Classes, ParagonPaths, NPC} = require '../..'

LifeStealer = ParagonPaths.LifeStealer

newWarlock = (pact) ->
  npc = new NPC warlock: { pact: pact ? "Fey"}
  npc.class = new Classes.Warlock npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal LifeStealer.id, "lifeStealer"
    path = new LifeStealer(newWarlock())
    test.equal path.id, "lifeStealer"
    test.done()
    
  "should have name": (test) ->
    test.equal LifeStealer.simpleName, "life-stealer"
    path = new LifeStealer(newWarlock())
    test.equal path.name, "life-stealer"
    test.done()

  "should require warlock class with infernal pact": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not LifeStealer.accepts(npc)
    test.ok not LifeStealer.accepts(newWarlock "Star")
    test.ok LifeStealer.accepts(newWarlock "Infernal")
    test.done()

  "constructor should set initial path features": (test) ->
    new LifeStealer(npc = newWarlock())
    test.ok npc.hasFeature("class", "Infernal Action"), "expected Infernal Action"
    test.ok npc.hasFeature("class", "Collect Life Spark"), "expected Collect Life Spark"
    test.ok not npc.hasFeature("class", "Sustain Life Spark")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "SoulScorch" in LifeStealer.powers.encounter[11]
    test.ok "LifeSparkSummons" in LifeStealer.powers.utility[12]
    test.ok "Soultheft" in LifeStealer.powers.daily[20]

    klass = new LifeStealer(newWarlock())
    test.equal LifeStealer.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new LifeStealer(npc = newWarlock())
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new LifeStealer(npc = newWarlock())
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Sustain Life Spark")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Sustain Life Spark")
    test.done()
