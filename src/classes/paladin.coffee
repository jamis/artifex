Deities = require '../deities'
Powers  = require '../powers'

module.exports = class Paladin
  constructor: (npc) ->
    @name = Paladin.simpleName
    @powerSource = Paladin.powerSource
    @powerName = "prayer"
    @powers = Paladin.powers
    @skills = Paladin.skills
    @keyAttributes = [ "str", "cha", "wis" ]

    npc.proficiencies.armor.push "cloth"
    npc.proficiencies.armor.push "leather"
    npc.proficiencies.armor.push "hide"
    npc.proficiencies.armor.push "chainmail"
    npc.proficiencies.armor.push "scale"
    npc.proficiencies.armor.push "plate"
    npc.proficiencies.armor.push "light shield"
    npc.proficiencies.armor.push "heavy shield"

    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "military melee"
    npc.proficiencies.weapons.push "simple ranged"

    npc.weaponPreferences.push count: 1, type: "melee"

    npc.supportedImplements.push "holy symbol"

    npc.defenses.fort.adjust "class", 1
    npc.defenses.ref.adjust "class", 1
    npc.defenses.will.adjust "class", 1

    npc.hitPoints.adjust "class", 15
    npc.hitPointsPerLevel = 6
    npc.healingSurge.count.adjust "class", 10

    npc.skills.religion.trained = true
    npc.pendingSkills.push count: 3, list: Paladin.skills

    npc.feature "class", "Channel Divinity"
    npc.powers.encounter.push Powers.get("DivineMettle", npc: npc)
    npc.powers.encounter.push Powers.get("DivineStrength", npc: npc)

    npc.feature "class", "Divine Challenge"
    npc.powers.encounter.push Powers.get("DivineChallenge", npc: npc)

    npc.feature "class", "Lay on Hands"
    npc.powers.encounter.push Powers.get("LayOnHands", npc: npc)

    npc.deity = npc.random.pick Deities[npc.alignment]...

Paladin.simpleName = "paladin"
Paladin.source = "phb"
Paladin.powerSource = "divine"
Paladin.skills = [ "diplomacy", "endurance", "heal", "history", "insight", "intimidate", "religion" ]

Paladin.powers =
  atWill:
    1: [ "BolsteringStrike", "EnfeeblingStrike", "HolyStrike", "ValiantStrike" ]

  encounter:
    1: [ "FearsomeSmite", "PiercingSmite", "RadiantSmite", "ShieldingSmite" ]
    3: [ "ArcingSmite", "InvigoratingSmite", "RighteousSmite", "StaggeringSmite" ]
    7: [ "BeckonFoe", "BenignTransposition", "DivineReverence", "ThunderSmite" ]

  daily:
    1: [ "OnPainOfDeath", "PaladinsJudgement", "RadiantDelirium" ]
    5: [ "HallowedCircle", "MartyrsRetribution", "SignOfVulnerability" ]
    9: [ "CrownOfGlory", "OneStandsAlone", "RadiantPulse" ]

  utility:
    2 : [ "AstralSpeech", "MartyrsBlessing", "SacredCircle" ]
    6 : [ "DivineBodyguard", "OneHeartOneMind", "WrathOfTheGods" ]
    10: [ "CleansingSpirit", "NobleShield", "TurnTheTide" ]
