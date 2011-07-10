{Classes, ParagonPaths, NPC} = require '../..'

BloodMage = ParagonPaths.BloodMage

newWizard = ->
  npc = new NPC
  npc.class = new Classes.Wizard npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal BloodMage.id, "bloodMage"
    path = new BloodMage(newWizard())
    test.equal path.id, "bloodMage"
    test.done()
    
  "should have name": (test) ->
    test.equal BloodMage.simpleName, "blood mage"
    path = new BloodMage(newWizard())
    test.equal path.name, "blood mage"
    test.done()

  "should require wizard": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not BloodMage.accepts(npc)
    test.ok BloodMage.accepts(newWizard())
    test.done()

  "constructor should set initial path features": (test) ->
    new BloodMage(npc = newWizard())
    test.ok npc.hasFeature("class", "Blood Action"), "expected Blood Action"
    test.ok npc.hasFeature("class", "Bolstering Blood"), "expected Bolstering Blood"
    test.ok not npc.hasFeature("class", "Burning Blood")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "BloodPulse" in BloodMage.powers.encounter[11]
    test.ok "SoulBurn" in BloodMage.powers.utility[12]
    test.ok "DestructiveSalutation" in BloodMage.powers.daily[20]

    klass = new BloodMage(newWizard())
    test.equal BloodMage.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new BloodMage(npc = newWizard())
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new BloodMage(npc = newWizard())
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Burning Blood")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Burning Blood")
    test.done()
