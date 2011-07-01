Weapons = require '../weapons'

module.exports = class Kensei
  constructor: (npc) ->
    @id = Kensei.id
    @name = Kensei.simpleName
    @powers = Kensei.powers
    @npc = npc

    npc.feature "class", "Kensei Control Action"

    options = []
    for weapon in npc.equipment.weapons()
      options.push(weapon) if Weapons.category(weapon, "melee")
    npc.kenseiWeapon = npc.random.pick(options...)
    npc.attacks.general.adjustWhen npc.kenseiWeapon, 1

    npc.feature "class", "Kensei Focus (#{npc.kenseiWeapon})"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Kensei Mastery")
      @npc.feature "class", "Kensei Mastery"
      @npc.damage.general.adjustWhen @npc.kenseiWeapon, 4

Kensei.id = "kensei"
Kensei.simpleName = "kensei"
Kensei.accepts = (npc) -> npc.class.name is "fighter"

Kensei.powers =
  encounter:
    11: [ "Masterstroke" ]

  daily:
    20: [ "WeaponsoulDance" ]

  utility:
    12: [ "UltimateParry" ]
