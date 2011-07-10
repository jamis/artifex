{Classes, ParagonPaths, NPC} = require '../..'

BattleCaptain = ParagonPaths.BattleCaptain

newWarlord = ->
  npc = new NPC
  npc.class = new Classes.Warlord npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal BattleCaptain.id, "battleCaptain"
    path = new BattleCaptain(new NPC)
    test.equal path.id, "battleCaptain"
    test.done()
    
  "should have name": (test) ->
    test.equal BattleCaptain.simpleName, "battle captain"
    path = new BattleCaptain(new NPC)
    test.equal path.name, "battle captain"
    test.done()

  "should require warlord class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not BattleCaptain.accepts(npc)
    test.ok BattleCaptain.accepts(newWarlord())
    test.done()

  "constructor should set initial path features": (test) ->
    new BattleCaptain(npc = newWarlord())
    test.ok npc.hasFeature("class", "Battle Action"), "expected Battle Action"
    test.ok npc.hasFeature("class", "Cry Havoc"), "expected Cry Havoc"
    test.ok not npc.hasFeature("class", "Battle Inspiration")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "ForceRetreat" in BattleCaptain.powers.encounter[11]
    test.ok "BoltOfGenius" in BattleCaptain.powers.utility[12]
    test.ok "CunningFlurry" in BattleCaptain.powers.daily[20]

    klass = new BattleCaptain(new NPC)
    test.equal BattleCaptain.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new BattleCaptain(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new BattleCaptain(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Battle Inspiration")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Battle Inspiration")
    test.done()
