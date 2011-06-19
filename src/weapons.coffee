module.exports = Weapons =
  proficient: (npc, weapon) ->
    data = Weapons.all[weapon]

    return false unless data?
    return false if npc.size == "small" && data.hands > 1

    return true if weapon in npc.proficiencies.weapons
    return true if data.category in npc.proficiencies.weapons

    false

  category: (weapon, category) ->
    Weapons.all[weapon].category.indexOf(category) >= 0

  group: (weapon, group) ->
    Weapons.all[weapon].groups.indexOf(group) >= 0

  all:
    club:
      name       : "club"
      proficiency: +2
      damageCount:  1
      damageDie  :  6
      hands      :  1
      groups     : ["mace"]
      category   : "simple melee"
      properties : []

    dagger:
      name       : "dagger"
      proficiency: +3
      damageCount:  1
      damageDie  :  4
      hands      :  1
      range      : [5, 10]
      groups     : ["light blade"]
      category   : "simple melee"
      properties : ["off-hand", "light thrown"]

    javelin:
      name       : "javelin"
      proficiency: +2
      damageCount:  1
      damageDie  :  6
      hands      :  1
      range      : [10, 20]
      groups     : ["spear"]
      category   : "simple melee"
      properties : ["heavy thrown"]

    mace:
      name       : "mace"
      proficiency: +2
      damageCount:  1
      damageDie  :  8
      hands      :  1
      groups     : ["mace"]
      category   : "simple melee"
      properties : ["versatile"]

    sickle:
      name       : "sickle"
      proficiency: +2
      damageCount:  1
      damageDie  :  6
      hands      :  1
      groups     : ["light blade"]
      category   : "simple melee"
      properties : ["off-hand"]

    spear:
      name       : "spear"
      proficiency: +2
      damageCount:  1
      damageDie  :  8
      hands      :  1
      groups     : ["spear"]
      category   : "simple melee"
      properties : ["versatile"]

    greatclub:
      name       : "greatclub"
      proficiency: +2
      damageCount:  2
      damageDie  :  4
      hands      :  2
      groups     : ["mace"]
      category   : "simple melee"
      properties : []

    morningstar:
      name       : "morningstar"
      proficiency: +2
      damageCount:  1
      damageDie  :  10
      hands      :  2
      groups     : ["mace"]
      category   : "simple melee"
      properties : []

    quarterstaff:
      name       : "quarterstaff"
      proficiency: +2
      damageCount:  1
      damageDie  :  8
      hands      :  2
      groups     : ["staff"]
      category   : "simple melee"
      properties : []

    scythe:
      name       : "scythe"
      proficiency: +2
      damageCount:  2
      damageDie  :  4
      hands      :  2
      groups     : ["heavy blade"]
      category   : "simple melee"
      properties : []

    battleaxe:
      name       : "battleaxe"
      proficiency: +2
      damageCount:  1
      damageDie  :  10
      hands      :  1
      groups     : ["axe"]
      category   : "military melee"
      properties : ["versatile"]

    flail:
      name       : "flail"
      proficiency: +2
      damageCount:  1
      damageDie  :  10
      hands      :  1
      groups     : ["flail"]
      category   : "military melee"
      properties : ["versatile"]

    handaxe:
      name       : "handaxe"
      proficiency: +2
      damageCount:  1
      damageDie  :  6
      hands      :  1
      groups     : ["axe"]
      category   : "military melee"
      range      : [5, 10]
      properties : ["off-hand", "heavy thrown"]

    longsword:
      name       : "longsword"
      proficiency: +3
      damageCount:  1
      damageDie  :  8
      hands      :  1
      groups     : ["heavy blade"]
      category   : "military melee"
      properties : ["versatile"]

    scimitar:
      name       : "scimitar"
      proficiency: +2
      damageCount:  1
      damageDie  :  8
      hands      :  1
      groups     : ["heavy blade"]
      category   : "military melee"
      properties : ["high crit"]

    shortSword:
      name       : "short sword"
      proficiency: +3
      damageCount:  1
      damageDie  :  6
      hands      :  1
      groups     : ["light blade"]
      category   : "military melee"
      properties : ["off-hand"]

    throwingHammer:
      name       : "throwing hammer"
      proficiency: +2
      damageCount:  1
      damageDie  :  6
      hands      :  1
      groups     : ["hammer"]
      category   : "military melee"
      range      : [5, 10]
      properties : ["off-hand", "heavy thrown"]

    warhammer:
      name       : "warhammer"
      proficiency: +2
      damageCount:  1
      damageDie  :  10
      hands      :  1
      groups     : ["hammer"]
      category   : "military melee"
      properties : ["versatile"]

    warPick:
      name       : "war pick"
      proficiency: +2
      damageCount:  1
      damageDie  :  8
      hands      :  1
      groups     : ["pick"]
      category   : "military melee"
      properties : ["high crit", "versatile"]

    falchion:
      name       : "falchion"
      proficiency: +3
      damageCount:  2
      damageDie  :  4
      hands      :  2
      groups     : ["heavy blade"]
      category   : "military melee"
      properties : ["high crit"]

    glaive:
      name       : "glaive"
      proficiency: +2
      damageCount:  2
      damageDie  :  4
      hands      :  2
      groups     : ["heavy blade", "polearm"]
      category   : "military melee"
      properties : ["reach"]

    greataxe:
      name       : "greataxe"
      proficiency: +2
      damageCount:  1
      damageDie  :  12
      hands      :  2
      groups     : ["axe"]
      category   : "military melee"
      properties : ["high crit"]

    greatsword:
      name       : "greatsword"
      proficiency: +3
      damageCount:  1
      damageDie  :  10
      hands      :  2
      groups     : ["heavy blade"]
      category   : "military melee"
      properties : []

    halberd:
      name       : "halberd"
      proficiency: +2
      damageCount:  1
      damageDie  :  10
      hands      :  2
      groups     : ["axe", "polearm"]
      category   : "military melee"
      properties : ["reach"]

    heavyFlail:
      name       : "heavy flail"
      proficiency: +2
      damageCount:  2
      damageDie  :  6
      hands      :  2
      groups     : ["flail"]
      category   : "military melee"
      properties : []

    longspear:
      name       : "longspear"
      proficiency: +2
      damageCount:  1
      damageDie  :  10
      hands      :  2
      groups     : ["polearm", "spear"]
      category   : "military melee"
      properties : ["reach"]

    maul:
      name       : "maul"
      proficiency: +2
      damageCount:  2
      damageDie  :  6
      hands      :  2
      groups     : ["hammer"]
      category   : "military melee"
      properties : []

    bastardSword:
      name       : "bastard sword"
      proficiency: +3
      damageCount:  1
      damageDie  :  10
      hands      :  1
      groups     : ["heavy blade"]
      category   : "superior melee"
      properties : ["versatile"]

    katar:
      name       : "katar"
      proficiency: +3
      damageCount:  1
      damageDie  :  6
      hands      :  1
      groups     : ["light blade"]
      category   : "superior melee"
      properties : ["off-hand", "high crit"]

    rapier:
      name       : "rapier"
      proficiency: +3
      damageCount:  1
      damageDie  :  8
      hands      :  1
      groups     : ["light blade"]
      category   : "superior melee"
      properties : []

    spikedChain:
      name       : "spiked chain"
      proficiency: +3
      damageCount:  2
      damageDie  :  4
      hands      :  2
      groups     : ["flail"]
      category   : "superior melee"
      properties : ["reach"]

    handCrossbow:
      name       : "hand crossbow"
      proficiency: +2
      damageCount:  1
      damageDie  :  6
      hands      :  1
      range      : [10, 20]
      groups     : ["crossbow"]
      category   : "simple ranged"
      properties : ["load free"]

    sling:
      name       : "sling"
      proficiency: +2
      damageCount:  1
      damageDie  :  6
      hands      :  1
      range      : [10, 20]
      groups     : ["sling"]
      category   : "simple ranged"
      properties : ["load free"]

    crossbow:
      name       : "crossbow"
      proficiency: +2
      damageCount:  1
      damageDie  :  8
      hands      :  2
      range      : [15, 30]
      groups     : ["crossbow"]
      category   : "simple ranged"
      properties : ["load minor"]

    longbow:
      name       : "longbow"
      proficiency: +2
      damageCount:  1
      damageDie  :  10
      hands      :  2
      range      : [20, 40]
      groups     : ["bow"]
      category   : "military ranged"
      properties : ["load free"]

    shortbow:
      name       : "shortbow"
      proficiency: +2
      damageCount:  1
      damageDie  :  8
      hands      :  2
      range      : [15, 30]
      groups     : ["bow"]
      category   : "military ranged"
      properties : ["load free", "small"]

    shuriken:
      name       : "shuriken"
      proficiency: +3
      damageCount:  1
      damageDie  :  4
      hands      :  1
      range      : [6, 12]
      groups     : ["light blade"]
      category   : "superior ranged"
      properties : ["light thrown"]
