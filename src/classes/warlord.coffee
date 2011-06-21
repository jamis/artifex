Powers = require '../powers'

module.exports = class Warlord
  constructor: (npc) ->
    @options = npc.options.warlord ? {}
    @name = Warlord.simpleName
    @powerSource = Warlord.powerSource
    @powerName = "exploit"
    @powers = Warlord.powers
    @skills = Warlord.skills
    @keyAttributes = [ "str", "int", "cha" ]

    npc.proficiencies.armor.push "cloth"
    npc.proficiencies.armor.push "leather"
    npc.proficiencies.armor.push "hide"
    npc.proficiencies.armor.push "chainmail"
    npc.proficiencies.armor.push "light shield"

    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "military melee"
    npc.proficiencies.weapons.push "simple ranged"

    npc.defenses.fort.adjust "class", 1
    npc.defenses.will.adjust "class", 1
    npc.hitPoints.adjust "class", 12
    npc.hitPointsPerLevel = 5
    npc.healingSurge.count.adjust "class", 7

    npc.pendingSkills.push count: 4, list: Warlord.skills
    npc.weaponPreferences.push count: 1, type: "melee"

    npc.feature "class", "Combat Leader"

    presence = @options.presence ? npc.random.pick "Inspiring", "Tactical"
    npc.feature "class", "#{presence} Presence"

    switch presence
      when "Inspiring"
        npc.powers.atWill.push Powers.get("InspiringPresence", npc: npc)
      when "Tactical"
        npc.powers.atWill.push Powers.get("TacticalPresence", npc: npc)
      else
        throw new Error "unknown commanding presence type `#{presence}'"

    npc.feature "class", "Inspiring Word"
    npc.powers.encounter.push Powers.get("InspiringWord", npc: npc)

Warlord.simpleName = "warlord"
Warlord.source = "phb"
Warlord.powerSource = "martial"
Warlord.skills = [ "athletics", "diplomacy", "endurance", "heal", "history", "intimidate" ]

Warlord.powers =
  atWill:
    1: [ "CommandersStrike", "FuriousSmash", "VipersStrike", "WolfPackTactics" ]

  encounter:
    1: [ "GuardingAttack", "HammerAndAnvil", "LeafOnTheWind", "WarlordsFavor" ]
    3: [ "HoldTheLine", "InspiringWarCry", "SteelMonsoon", "WarlordsStrike" ]
    7: [ "LionsRoar", "SunderArmor", "SurpriseAttack", "SurroundFoe" ]

  daily:
    1: [ "BastionOfDefense", "LeadTheAttack", "PinTheFoe", "WhiteRavenOnslaught" ]
    5: [ "StandTheFallen", "TurningPoint", "VillainsNightmare" ]
    9: [ "IronDragonCharge", "KnockThemDown", "WhiteRavenStrike" ]

  utility:
    2 : [ "AidTheInjured", "CrescendoOfViolence", "KnightsMove", "ShakeItOff" ]
    6 : [ "GuideTheCharge", "InspiringReaction", "QuickStep", "StandTough" ]
    10: [ "DefensiveRally", "EaseSuffering", "TacticalShift" ]
