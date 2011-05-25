module.exports = Armor =
  applyTo: (npc, armorName) ->
    armor = Armor[armorName]
    npc.armor = armorName

    npc.defenses.ac.adjust "armor", armor.bonus if armor.bonus != 0
    
    if armor.check != 0
      for label, skill of npc.skills
        if skill.ability in [npc.abilities.str, npc.abilities.con, npc.abilities.dex]
          skill.adjust "armor", armor.check

    npc.speed.adjust "armor", armor.speed if armor.speed != 0

  allows: (npc, armorName) ->
    return true if armorName in npc.proficiencies.armor

    category = Armor[armorName].category
    category in npc.proficiencies.armor

  cloth         : { bonus:  0, check:  0, speed:  0, category: "light" }
  leather       : { bonus: +2, check:  0, speed:  0, category: "light" }
  hide          : { bonus: +3, check: -1, speed:  0, category: "light" }
  chainmail     : { bonus: +6, check: -1, speed: -1, category: "heavy" }
  scale         : { bonus: +7, check:  0, speed: -1, category: "heavy" }
  plate         : { bonus: +8, check: -2, speed: -1, category: "heavy" }
  "light shield": { bonus: +1, check:  0, speed:  0, category: "shield" }
  "heavy shield": { bonus: +2, check: -2, speed:  0, category: "shield" }

  Categories:
    light: ["cloth", "leather", "hide"]
    heavy: ["chainmail", "scale", "plate"]
    shield: ["light shield", "heavy shield"]

Armor.Categories.armors = Armor.Categories.light.concat(Armor.Categories.heavy)
