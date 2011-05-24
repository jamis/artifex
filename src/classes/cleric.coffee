Deities = require '../deities'
Feats   = require '../feats'
Powers  = require '../powers'
Rituals = require '../rituals'

module.exports = class Cleric
  constructor: (npc) ->
    @name = "cleric"
    @powerSource = Cleric.powerSource
    @powerName = "prayer"
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
    for ritual in npc.random.shuffle(Rituals.all(1))
      unless ritual in npc.rituals[1]
        npc.learnRitual 1, ritual
        break

    if npc.alignment == "unaligned"
      alignment = npc.random.pick "lawful good", "good", "unaligned", "evil", "chaotic evil"
      collection = Deities[alignment]
    else
      collection = Deities[npc.alignment].concat(Deities["unaligned"])

    npc.deity = npc.random.pick collection...

    for power in npc.random.shuffle(Cleric.powers.atWill[1]...).slice(0, 2)
      power = Powers.get power, npc: npc
      npc.powers.atWill.push power

    power = npc.random.pick(Cleric.powers.encounter[1]...)
    npc.powers.encounter.push(Powers.get power, npc: npc)

    power = npc.random.pick(Cleric.powers.daily[1]...)
    npc.powers.daily.push(Powers.get power, npc: npc)

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
