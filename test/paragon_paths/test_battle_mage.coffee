{Classes, ParagonPaths, NPC} = require '../..'

BattleMage = ParagonPaths.BattleMage

newWizard = ->
  npc = new NPC
  npc.class = new Classes.Wizard npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal BattleMage.id, "battleMage"
    path = new BattleMage(newWizard())
    test.equal path.id, "battleMage"
    test.done()
    
  "should have name": (test) ->
    test.equal BattleMage.simpleName, "battle mage"
    path = new BattleMage(newWizard())
    test.equal path.name, "battle mage"
    test.done()

  "should require wizard": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not BattleMage.accepts(npc)
    test.ok BattleMage.accepts(newWizard())
    test.done()

  "constructor should set initial path features": (test) ->
    new BattleMage(npc = newWizard())
    test.ok npc.hasFeature("class", "Arcane Riposte"), "expected Arcane Riposte"
    test.ok npc.hasFeature("class", "Battle Mage Action"), "expected Battle Mage Action"
    test.ok not npc.hasFeature("class", "Battle Edge")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "ForcefulRetort" in BattleMage.powers.encounter[11]
    test.ok "ArcaneRejuvenation" in BattleMage.powers.utility[12]
    test.ok "ClosingSpell" in BattleMage.powers.daily[20]

    klass = new BattleMage(newWizard())
    test.equal BattleMage.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new BattleMage(npc = newWizard())
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new BattleMage(npc = newWizard())
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Battle Edge")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Battle Edge")
    test.done()
