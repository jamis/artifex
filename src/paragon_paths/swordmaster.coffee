Weapons = require '../weapons'

module.exports = class Swordmaster
  constructor: (npc) ->
    @id = Swordmaster.id
    @name = Swordmaster.simpleName
    @powers = Swordmaster.powers
    @npc = npc

    npc.feature "class", "Steel Defense Action"
    npc.feature "class", "Steel Grace"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Steel Blitz")
      @npc.feature "class", "Steel Blitz"

Swordmaster.id = "swordmaster"
Swordmaster.simpleName = "swordmaster"

Swordmaster.accepts = (npc) ->
  return false unless npc.class.name is "fighter"
  for weapon in npc.equipment.weapons()
    return true if not Weapons.group(weapon, "polearm") and (Weapons.group(weapon, "light blade") or Weapons.group(weapon, "heavy blade"))
  return false

Swordmaster.powers =
  encounter:
    11: [ "PrecisionCut" ]

  daily:
    20: [ "CrescendoSword" ]

  utility:
    12: [ "FantasticFlourish" ]
