{Classes, ParagonPaths, NPC, Powers, Weapons} = require '../..'

Warpriest = ParagonPaths.Warpriest

newCleric = ->
  npc = new NPC
  npc.class = new Classes.Cleric npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Warpriest.id, "warpriest"
    path = new Warpriest(new NPC)
    test.equal path.id, "warpriest"
    test.done()
    
  "should have name": (test) ->
    test.equal Warpriest.simpleName, "warpriest"
    path = new Warpriest(new NPC)
    test.equal path.name, "warpriest"
    test.done()

  "should require cleric class": (test) ->
    npc = new NPC
    npc.class = new Classes.Fighter npc
    test.ok not Warpriest.accepts(npc)
    test.ok Warpriest.accepts(newCleric())
    test.done()

  "constructor should set initial path features": (test) ->
    new Warpriest(npc = newCleric())
    test.ok npc.hasFeature("class", "Extra Damage Action"), "expected Extra Damage Action"
    test.ok npc.hasFeature("class", "Warpriest's Strategy"), "expected Warpriest's Strategy"
    test.ok npc.hasFeature("class", "Warpriest's Training"), "expected Warpriest's Training"
    test.ok not npc.hasFeature("class", "Warpriest's Challenge")
    test.done()

  "should get AC bonus in heavy armor": (test) ->
    new Warpriest(npc = newCleric())
    npc.armor = "cloth"
    base = npc.defenses.ac.score()
    npc.armor = "chainmail"
    test.equal npc.defenses.ac.score(), base+1
    test.done()

  "powers are accounted for": (test) ->
    test.ok "BattleCry" in Warpriest.powers.encounter[11]
    test.ok "BattleFavor" in Warpriest.powers.utility[12]
    test.ok "BattlePyres" in Warpriest.powers.daily[20]

    klass = new Warpriest(new NPC)
    test.equal Warpriest.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Warpriest(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Warpriest(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Warpriest's Challenge")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Warpriest's Challenge")
    test.done()
