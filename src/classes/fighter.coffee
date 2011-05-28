module.exports = class Fighter
  constructor: (npc) ->
    @name = Fighter.simpleName
    @powerSource = Fighter.powerSource
    @powerName = "exploit"
    @powers = Fighter.powers
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

    npc.preferredWeaponHandCount = npc.random.pick 1, 2
    npc.feature "class", "Fighter Weapon Talent", "prefer #{npc.preferredWeaponHandCount}-handed weapons"

Fighter.simpleName = "fighter"
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
