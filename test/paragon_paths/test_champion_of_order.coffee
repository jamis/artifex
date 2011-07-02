{Classes, ParagonPaths, NPC} = require '../..'

ChampionOfOrder = ParagonPaths.ChampionOfOrder

newPaladin = ->
  npc = new NPC
  npc.class = new Classes.Paladin npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal ChampionOfOrder.id, "championOfOrder"
    path = new ChampionOfOrder(new NPC)
    test.equal path.id, "championOfOrder"
    test.done()
    
  "should have name": (test) ->
    test.equal ChampionOfOrder.simpleName, "champion of order"
    path = new ChampionOfOrder(new NPC)
    test.equal path.name, "champion of order"
    test.done()

  "should require paladin class and not chaotic": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not ChampionOfOrder.accepts(npc)

    npc = newPaladin()
    npc.alignment = "chaotic evil"
    test.ok not ChampionOfOrder.accepts(npc)

    for alignment in ["good", "lawful good", "unaligned", "evil"]
      npc.alignment = alignment
      test.ok ChampionOfOrder.accepts(npc)

    test.done()

  "constructor should set initial path features": (test) ->
    new ChampionOfOrder(npc = newPaladin())
    test.ok npc.hasFeature("class", "Champion's Action"), "expected Champion's Action"
    test.ok npc.hasFeature("class", "In Defense of Order"), "expected In Defense of Order"
    test.ok not npc.hasFeature("class", "Champion's Hammer")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "CertainJustice" in ChampionOfOrder.powers.encounter[11]
    test.ok "NoneShallPass" in ChampionOfOrder.powers.utility[12]
    test.ok "RuleOfOrder" in ChampionOfOrder.powers.daily[20]

    klass = new ChampionOfOrder(new NPC)
    test.equal ChampionOfOrder.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new ChampionOfOrder(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new ChampionOfOrder(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Champion's Hammer")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Champion's Hammer")
    test.done()
