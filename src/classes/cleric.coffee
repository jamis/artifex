Generic = require '../powers/generic'

module.exports = class Cleric
  constructor: (npc) ->
    @name = "cleric"
    @powerSource = Cleric.powerSource
    @keyAttributes = [ "wis", "str", "cha" ]

    npc.proficiencies.armor.push "cloth"
    npc.proficiencies.armor.push "leather"
    npc.proficiencies.armor.push "hide"
    npc.proficiencies.armor.push "chainmail"

    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "simple ranged"

    npc.implements.push "holy symbol"

    npc.defenses.will.adjust "class", 2
    npc.hitPoints.adjust "class", 12
    npc.hitPointsPerLevel = 5
    npc.healingSurge.count.adjust "class", 7

    npc.skills.religion.trained = true

    count = 0
    for skill in npc.random.shuffle(Cleric.skills...)
      unless npc.skills[skill].trained
        npc.skills[skill].trained = true
        count += 1
        break if count >= 3

    npc.feature "class", "Channel Divinity"
    npc.feature "class", "Healer's Lore", "add WIS modifier to `heal' powers"
    npc.feature "class", "Healing Word"
    npc.feature "class", "Ritual Casting"

    healingWord = new Generic (p) ->
      p.name = "Healing Word"
      p.range = ->
        size = if npc.level < 11 then 5 else if npc.level < 21 then 10 else 15
        "Close burst #{size}"
      p.frequency = -> if npc.level < 16 then 2 else 3
      p.effect = -> "+#{Math.ceil(npc.level/5)}d6"

    npc.powers.encounter.push healingWord
    npc.feats.push "Ritual Casting"

    npc.learnRitual 1, "Gentle Repose"
    # TODO: add one other 1st level ritual

Cleric.source = "phb"
Cleric.powerSource = "divine"
Cleric.skills = [ "arcana", "diplomacy", "heal", "history", "insight", "religion" ]
