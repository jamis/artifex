Weapons = require '../weapons'

module.exports = class AngelicAvenger
  constructor: (npc) ->
    @id = AngelicAvenger.id
    @name = AngelicAvenger.simpleName
    @powers = AngelicAvenger.powers

    npc.feature "class", "Angelic Action"

    npc.astralVibranceType = npc.random.pick "lightning", "radiant", "thunder"
    npc.feature "class", "Astral Vibrance (#{npc.astralVibranceType})"

    list = Weapons.inGroup "heavy blade"
    preferred = []
    for weapon in list
      preferred.push weapon unless Weapons.proficient(npc, weapon)
    preferred = list if preferred.length is 0

    weapon = npc.random.pick preferred...
    npc.feature "class", "Weapon Training (#{weapon})"
    npc.proficiencies.weapons.push(weapon)
    npc.equipment.push(weapon)

AngelicAvenger.id = "angelicAvenger"
AngelicAvenger.simpleName = "angelic avenger"
AngelicAvenger.accepts = (npc) -> npc.class.name is "cleric"

AngelicAvenger.powers =
  encounter:
    11: [ "AstralWave" ]

  daily:
    20: [ "AngelAscendant" ]

  utility:
    12: [ "AngelicPresence" ]
