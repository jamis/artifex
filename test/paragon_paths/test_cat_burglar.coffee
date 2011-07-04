{Classes, ParagonPaths, NPC} = require '../..'

CatBurglar = ParagonPaths.CatBurglar

newRogue = ->
  npc = new NPC
  npc.class = new Classes.Rogue npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal CatBurglar.id, "catBurglar"
    path = new CatBurglar(new NPC)
    test.equal path.id, "catBurglar"
    test.done()
    
  "should have name": (test) ->
    test.equal CatBurglar.simpleName, "cat burglar"
    path = new CatBurglar(new NPC)
    test.equal path.name, "cat burglar"
    test.done()

  "should require rogue class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not CatBurglar.accepts(npc)
    test.ok CatBurglar.accepts(newRogue())
    test.done()

  "constructor should set initial path features": (test) ->
    new CatBurglar(npc = newRogue())
    test.ok npc.hasFeature("class", "Acrobatic Action"), "expected Acrobatic Action"
    test.ok npc.hasFeature("class", "Body Control"), "expected Body Control"
    test.ok not npc.hasFeature("class", "Athletic Master")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "CatBurglarsGambit" in CatBurglar.powers.encounter[11]
    test.ok "InstantEscape" in CatBurglar.powers.utility[12]
    test.ok "RedirectedDeath" in CatBurglar.powers.daily[20]

    klass = new CatBurglar(new NPC)
    test.equal CatBurglar.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new CatBurglar(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new CatBurglar(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Athletic Master")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Athletic Master")
    test.done()
