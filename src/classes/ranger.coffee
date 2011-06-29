Powers = require '../powers'

module.exports = class Ranger
  constructor: (npc) ->
    @options = npc.options.ranger ? {}
    @name = Ranger.simpleName
    @powerSource = Ranger.powerSource
    @powerName = "exploit"
    @powers = Ranger.powers
    @skills = Ranger.skills
    @keyAttributes = [ "str", "dex", "wis" ]

    npc.proficiencies.armor.push "cloth"
    npc.proficiencies.armor.push "leather"
    npc.proficiencies.armor.push "hide"

    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "military melee"
    npc.proficiencies.weapons.push "simple ranged"
    npc.proficiencies.weapons.push "military ranged"

    npc.defenses.fort.adjust "class", 1
    npc.defenses.ref.adjust "class", 1

    npc.hitPoints.adjust "class", 12
    npc.hitPointsPerLevel = 5
    npc.healingSurge.count.adjust "class", 6

    npc.skills[npc.random.pick "dungeoneering", "nature"].trained = true
    npc.pendingSkills.push count: 4, list: Ranger.skills

    style = @options.style ? npc.random.pick "Archer", "Two-Blade"
    npc.feature "class", "#{style} Fighting Style"

    if style is "Archer"
      npc.preferredWeaponStyle = "ranged"
    else
      npc.preferredWeaponStyle = "melee"
      npc.weaponPreferences.push count: 2, type: "melee"
      npc.preferredWeaponHandCount = 1

    npc.feature "class", "Hunter's Quarry"
    npc.quarryDie = 6
    npc.powers.atWill.push Powers.get("ranger", "HuntersQuarry", npc: npc)

    npc.feature "class", "Prime Shot", "+1 to ranged attack when no ally is closer to target"

Ranger.simpleName = "ranger"
Ranger.source = "phb"
Ranger.powerSource = "martial"
Ranger.skills = [ "acrobatics", "athletics", "dungeoneering", "endurance", "heal", "nature", "perception", "stealth" ]

Ranger.powers =
  atWill:
    1: [ "CarefulAttack", "HitAndRun", "NimbleStrike", "TwinStrike" ]

  encounter:
    1: [ "DireWolverineStrike", "EvasiveStrike", "FoxsCunning", "TwoFangedStrike" ]
    3: [ "CutAndRun", "DisruptiveStrike", "ShadowWaspStrike", "ThundertuskBoarStrike" ]
    7: [ "ClawsOfTheGriffon", "HawksTalon", "SpikesOfTheManticore", "SweepingWhirlwind" ]

  daily:
    1: [ "HuntersBearTrap", "JawsOfTheWolf", "SplitTheTree", "SuddenStrike" ]
    5: [ "ExcruciatingShot", "FrenziedSkirmish", "SplinteringShot", "TwoWolfPounce" ]
    9: [ "AttacksOnTheRun", "CloseQuartersShot", "SprayOfArrows", "SwirlingLeavesOfSteel" ]

  utility:
    2 : [ "CrucialAdvice", "UnbalancingParry", "YieldGround" ]
    6 : [ "EvadeAmbush", "SkilledCompanion", "WeaveThroughTheFray" ]
    10: [ "ExpeditiousStride", "OpenTheRange", "UndauntedStride" ]
