Weapons = require '../weapons'

module.exports = class WizardOfTheSpiralTower
  constructor: (npc) ->
    @id = WizardOfTheSpiralTower.id
    @name = WizardOfTheSpiralTower.simpleName
    @powers = WizardOfTheSpiralTower.powers
    @npc = npc

    npc.feature "class", "Corellon's Implement"
    npc.feature "class", "Spiral Tower Action"

    unless "longsword" in npc.equipment.weapons()
      npc.equipment.push "longsword"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Radiant Censure")
      @npc.feature "class", "Radiant Censure"

WizardOfTheSpiralTower.id = "wizardOfTheSpiralTower"
WizardOfTheSpiralTower.simpleName = "wizard of the spiral tower"
WizardOfTheSpiralTower.accepts = (npc) ->
  npc.class.name is "wizard" and Weapons.proficient(npc, "longsword")

WizardOfTheSpiralTower.powers =
  encounter:
    11: [ "TheOneSword" ]

  daily:
    20: [ "CorellonsBlade" ]

  utility:
    12: [ "ShapeTheDream" ]
