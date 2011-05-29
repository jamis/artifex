Deities = require '../deities'
Feats   = require '../feats'
Powers  = require '../powers'
Rituals = require '../rituals'

module.exports = class Cleric
  constructor: (npc) ->
    @name = Cleric.simpleName
    @powerSource = Cleric.powerSource
    @powerName = "prayer"
    @powers = Cleric.powers
    @skills = Cleric.skills
    @keyAttributes = [ "wis", "str", "cha" ]

    npc.proficiencies.armor.push "cloth"
    npc.proficiencies.armor.push "leather"
    npc.proficiencies.armor.push "hide"
    npc.proficiencies.armor.push "chainmail"

    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "simple ranged"

    npc.supportedImplements.push "holy symbol"

    npc.defenses.will.adjust "class", 2
    npc.hitPoints.adjust "class", 12
    npc.hitPointsPerLevel = 5
    npc.healingSurge.count.adjust "class", 7

    npc.skills.religion.trained = true
    npc.pendingSkills.push count: 3, list: Cleric.skills

    npc.feature "class", "Channel Divinity"
    npc.feature "class", "Healer's Lore", "add WIS modifier to `heal' powers"
    npc.feature "class", "Healing Word"
    npc.feature "class", "Ritual Casting"

    divineFortune = new Powers.get "DivineFortune", npc: npc
    turnUndead    = new Powers.get "TurnUndead", npc: npc
    healingWord   = new Powers.get "HealingWord", npc: npc

    npc.powers.encounter.push divineFortune
    npc.powers.encounter.push turnUndead
    npc.powers.encounter.push healingWord

    Feats.RitualCaster.applyTo npc

    npc.learnRitual 1, "Gentle Repose"

    # TODO: smarter ritual selection
    for ritual in npc.random.shuffle(Rituals.all(1)...)
      unless ritual in npc.rituals[1]
        npc.learnRitual 1, ritual
        break

    if npc.alignment == "unaligned"
      alignment = npc.random.pick "lawful good", "good", "unaligned", "evil", "chaotic evil"
      collection = Deities[alignment]
    else
      collection = Deities[npc.alignment].concat(Deities["unaligned"])

    npc.deity = npc.random.pick collection...

Cleric.simpleName = "cleric"
Cleric.source = "phb"
Cleric.powerSource = "divine"
Cleric.skills = [ "arcana", "diplomacy", "heal", "history", "insight", "religion" ]

Cleric.powers =
  atWill:
    1: [ "LanceOfFaith", "PriestsShield", "RighteousBrand", "SacredFlame" ]

  encounter:
    1: [ "CauseFear", "DivineGlow", "HealingStrike", "WrathfulThunder" ]

  daily:
    1: [ "AvengingFlame", "BeaconOfHope", "CascadeOfLight", "GuardianOfFaith" ]
