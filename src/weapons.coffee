module.exports = Weapons =
  club:
    name       : "club"
    proficiency: +2
    damageCount:  1
    damageDie  :  6
    hands      :  1
    group      : "mace"
    category   : "simple melee"
    properties : []

  dagger:
    name       : "dagger"
    proficiency: +3
    damageCount:  1
    damageDie  :  4
    hands      :  1
    range      : [5, 10]
    group      : "light blade"
    category   : "simple melee"
    properties : ["off-hand", "light thrown"]

  javelin:
    name       : "javelin"
    proficiency: +2
    damageCount:  1
    damageDie  :  6
    hands      :  1
    range      : [10, 20]
    group      : "spear"
    category   : "simple melee"
    properties : ["heavy thrown"]

  mace:
    name       : "mace"
    proficiency: +2
    damageCount:  1
    damageDie  :  8
    hands      :  1
    group      : "mace"
    category   : "simple melee"
    properties : ["versatile"]

  sickle:
    name       : "sickle"
    proficiency: +2
    damageCount:  1
    damageDie  :  6
    hands      :  1
    group      : "light blade"
    category   : "simple melee"
    properties : ["off-hand"]

  spear:
    name       : "spear"
    proficiency: +2
    damageCount:  1
    damageDie  :  8
    hands      :  1
    group      : "spear"
    category   : "simple melee"
    properties : ["versatile"]

  greatclub:
    name       : "greatclub"
    proficiency: +2
    damageCount:  2
    damageDie  :  4
    hands      :  2
    group      : "mace"
    category   : "simple melee"
    properties : []

  morningstar:
    name       : "morningstar"
    proficiency: +2
    damageCount:  1
    damageDie  :  10
    hands      :  2
    group      : "mace"
    category   : "simple melee"
    properties : []

  quarterstaff:
    name       : "quarterstaff"
    proficiency: +2
    damageCount:  1
    damageDie  :  8
    hands      :  2
    group      : "staff"
    category   : "simple melee"
    properties : []

  scythe:
    name       : "scythe"
    proficiency: +2
    damageCount:  2
    damageDie  :  4
    hands      :  2
    group      : "heavy blade"
    category   : "simple melee"
    properties : []

  battleaxe:
    name       : "battleaxe"
    proficiency: +2
    damageCount:  1
    damageDie  :  10
    hands      :  1
    group      : "axe"
    category   : "military melee"
    properties : ["versatile"]

  flail:
    name       : "flail"
    proficiency: +2
    damageCount:  1
    damageDie  :  10
    hands      :  1
    group      : "flail"
    category   : "military melee"
    properties : ["versatile"]

  handaxe:
    name       : "handaxe"
    proficiency: +2
    damageCount:  1
    damageDie  :  6
    hands      :  1
    group      : "axe"
    category   : "military melee"
    range      : [5, 10]
    properties : ["off-hand", "heavy thrown"]

  longsword:
    name       : "longsword"
    proficiency: +3
    damageCount:  1
    damageDie  :  8
    hands      :  1
    group      : "heavy blade"
    category   : "military melee"
    properties : ["versatile"]

  scimitar:
    name       : "scimitar"
    proficiency: +2
    damageCount:  1
    damageDie  :  8
    hands      :  1
    group      : "heavy blade"
    category   : "military melee"
    properties : ["high crit"]

  shortSword:
    name       : "short sword"
    proficiency: +3
    damageCount:  1
    damageDie  :  6
    hands      :  1
    group      : "light blade"
    category   : "military melee"
    properties : ["off-hand"]

  throwingHammer:
    name       : "throwing hammer"
    proficiency: +2
    damageCount:  1
    damageDie  :  6
    hands      :  1
    group      : "hammer"
    category   : "military melee"
    range      : [5, 10]
    properties : ["off-hand", "heavy thrown"]

  warhammer:
    name       : "warhammer"
    proficiency: +2
    damageCount:  1
    damageDie  :  10
    hands      :  1
    group      : "hammer"
    category   : "military melee"
    properties : ["versatile"]

  warPick:
    name       : "war pick"
    proficiency: +2
    damageCount:  1
    damageDie  :  8
    hands      :  1
    group      : "pick"
    category   : "military melee"
    properties : ["high crit", "versatile"]
