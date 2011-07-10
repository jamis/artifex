{Classes, ParagonPaths, NPC} = require '../..'

WizardOfTheSpiralTower = ParagonPaths.WizardOfTheSpiralTower

newWizard = ->
  npc = new NPC
  npc.class = new Classes.Wizard npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal WizardOfTheSpiralTower.id, "wizardOfTheSpiralTower"
    path = new WizardOfTheSpiralTower(newWizard())
    test.equal path.id, "wizardOfTheSpiralTower"
    test.done()
    
  "should have name": (test) ->
    test.equal WizardOfTheSpiralTower.simpleName, "wizard of the spiral tower"
    path = new WizardOfTheSpiralTower(newWizard())
    test.equal path.name, "wizard of the spiral tower"
    test.done()

  "should require wizard with longsword proficiency": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not WizardOfTheSpiralTower.accepts(npc)
    npc = newWizard()
    test.ok not WizardOfTheSpiralTower.accepts(npc)
    npc.proficiencies.weapons.push "longsword"
    test.ok WizardOfTheSpiralTower.accepts(npc)
    test.done()

  "constructor should set initial path features": (test) ->
    new WizardOfTheSpiralTower(npc = newWizard())
    test.ok npc.hasFeature("class", "Corellon's Implement"), "expected Corellon's Implement"
    test.ok npc.hasFeature("class", "Spiral Tower Action"), "expected Spiral Tower Action"
    test.ok not npc.hasFeature("class", "Radiant Censure")
    test.done()

  "should add longsword to equipment if longsword is not already present": (test) ->
    npc = newWizard()
    test.ok "longsword" not in npc.equipment
    new WizardOfTheSpiralTower npc
    test.ok "longsword" in npc.equipment
    test.done()

  "should not add longsword to equipment if longsword is already present": (test) ->
    npc = newWizard()
    npc.equipment.push "longsword"
    new WizardOfTheSpiralTower npc
    count = 0
    for weapon in npc.equipment.weapons()
      count += 1 if weapon is "longsword"
    test.equal count, 1
    test.done()

  "powers are accounted for": (test) ->
    test.ok "TheOneSword" in WizardOfTheSpiralTower.powers.encounter[11]
    test.ok "ShapeTheDream" in WizardOfTheSpiralTower.powers.utility[12]
    test.ok "CorellonsBlade" in WizardOfTheSpiralTower.powers.daily[20]

    klass = new WizardOfTheSpiralTower(newWizard())
    test.equal WizardOfTheSpiralTower.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new WizardOfTheSpiralTower(npc = newWizard())
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new WizardOfTheSpiralTower(npc = newWizard())
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Radiant Censure")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Radiant Censure")
    test.done()
