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
