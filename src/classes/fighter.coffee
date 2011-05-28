Powers = require '../powers'

module.exports = class Fighter
  constructor: (npc) ->
    @name = "fighter"
    @powerSource = Fighter.powerSource
    @powerName = "exploit"
    @keyAttributes = [ "str", "dex", "wis", "con" ]

    npc.proficiencies.armor.push "cloth"
    npc.proficiencies.armor.push "leather"
    npc.proficiencies.armor.push "hide"
    npc.proficiencies.armor.push "chainmail"
    npc.proficiencies.armor.push "scale"
    npc.proficiencies.armor.push "light shield"
    npc.proficiencies.armor.push "heavy shield"

    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "military melee"
    npc.proficiencies.weapons.push "simple ranged"
    npc.proficiencies.weapons.push "military ranged"

    npc.defenses.fort.adjust "class", 2
    npc.hitPoints.adjust "class", 15
    npc.hitPointsPerLevel = 6
    npc.healingSurge.count.adjust "class", 9

    npc.pendingSkills.push count: 3, list: Fighter.skills

    npc.feature "class", "Combat Challenge"
    npc.feature "class", "Combat Superiority", "opportunity attacks at +wis"

    npc.feature "class", "Fighter Weapon Talent"
    npc.preferredWeaponHandCount = npc.random.pick 1, 2

    for power in npc.random.shuffle(Fighter.powers.atWill[1]...).slice(0, 2)
      power = Powers.get power, npc: npc
      npc.powers.atWill.push power

    power = npc.random.pick(Fighter.powers.encounter[1]...)
    npc.powers.encounter.push(Powers.get power, npc: npc)

    power = npc.random.pick(Fighter.powers.daily[1]...)
    npc.powers.daily.push(Powers.get power, npc: npc)

Fighter.source = "phb"
Fighter.powerSource = "martial"
Fighter.skills = [ "athletics", "endurance", "heal", "intimidate", "streetwise" ]

Fighter.powers =
  atWill:
    1: [ "Cleave", "ReapingStrike", "SureStrike", "TideOfIron" ]

  encounter:
    1: [ "CoveringAttack", "PassingAttack", "SpinningSweep", "SteelSerpentStrike" ]

  daily:
    1: [ "BruteStrike", "ComebackStrike", "VillainsMenace" ]
