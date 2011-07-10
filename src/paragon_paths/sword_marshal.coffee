Weapons = require '../weapons'

module.exports = class SwordMarshal
  constructor: (npc) ->
    @id = SwordMarshal.id
    @name = SwordMarshal.simpleName
    @powers = SwordMarshal.powers
    @npc = npc

    npc.feature "class", "Disciplined Blade"
    npc.feature "class", "Sword Marshal's Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Skewer the Weak")
      @npc.feature "class", "Skewer the Weak"

SwordMarshal.id = "swordMarshal"
SwordMarshal.simpleName = "sword marshal"
SwordMarshal.accepts = (npc) ->
  return false unless npc.class.name is "warlord"
  for weapon in npc.equipment.weapons()
    return true if Weapons.group(weapon, "heavy blade")
  return false

SwordMarshal.powers =
  encounter:
    11: [ "BladeFlurry" ]

  daily:
    20: [ "DiamondBladeOfVictory" ]

  utility:
    12: [ "SwordMarshalsBoon" ]
