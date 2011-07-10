{Classes, ParagonPaths, NPC} = require '../..'

SpellstormMage = ParagonPaths.SpellstormMage

newWizard = ->
  npc = new NPC
  npc.class = new Classes.Wizard npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal SpellstormMage.id, "spellstormMage"
    path = new SpellstormMage(newWizard())
    test.equal path.id, "spellstormMage"
    test.done()
    
  "should have name": (test) ->
    test.equal SpellstormMage.simpleName, "spellstorm mage"
    path = new SpellstormMage(newWizard())
    test.equal path.name, "spellstorm mage"
    test.done()

  "should require wizard": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not SpellstormMage.accepts(npc)
    test.ok SpellstormMage.accepts(newWizard())
    test.done()

  "constructor should set initial path features": (test) ->
    new SpellstormMage(npc = newWizard())
    test.ok npc.hasFeature("class", "Extra Damage Action"), "expected Extra Damage Action"
    test.ok npc.hasFeature("class", "Storm Spell"), "expected Storm Spell"
    test.ok not npc.hasFeature("class", "Storm Fury")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "StormCage" in SpellstormMage.powers.encounter[11]
    test.ok "SuddenStorm" in SpellstormMage.powers.utility[12]
    test.ok "MaelstromOfChaos" in SpellstormMage.powers.daily[20]

    klass = new SpellstormMage(newWizard())
    test.equal SpellstormMage.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new SpellstormMage(npc = newWizard())
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new SpellstormMage(npc = newWizard())
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Storm Fury")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Storm Fury")
    test.done()
