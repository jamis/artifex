{Weapons, NPC} = require ".."

module.exports =
  "club should be defined": (test) ->
    test.equal Weapons.club.name,        "club"
    test.equal Weapons.club.proficiency, +2
    test.equal Weapons.club.damageCount,  1
    test.equal Weapons.club.damageDie,    6
    test.equal Weapons.club.hands,        1
    test.equal Weapons.club.group,        "mace"
    test.equal Weapons.club.range,        undefined
    test.equal Weapons.club.category,     "simple melee"
    test.deepEqual Weapons.club.properties, []
    test.done()

  "dagger should be defined": (test) ->
    test.equal Weapons.dagger.name,        "dagger"
    test.equal Weapons.dagger.proficiency, +3
    test.equal Weapons.dagger.damageCount,  1
    test.equal Weapons.dagger.damageDie,    4
    test.equal Weapons.dagger.hands,        1
    test.equal Weapons.dagger.group,        "light blade"
    test.equal Weapons.dagger.category,     "simple melee"
    test.deepEqual Weapons.dagger.range,      [5, 10]
    test.deepEqual Weapons.dagger.properties, ["off-hand", "light thrown"]
    test.done()

  "javelin should be defined": (test) ->
    test.equal Weapons.javelin.name,        "javelin"
    test.equal Weapons.javelin.proficiency, +2
    test.equal Weapons.javelin.damageCount,  1
    test.equal Weapons.javelin.damageDie,    6
    test.equal Weapons.javelin.hands,        1
    test.equal Weapons.javelin.group,        "spear"
    test.equal Weapons.javelin.category,     "simple melee"
    test.deepEqual Weapons.javelin.range,      [10, 20]
    test.deepEqual Weapons.javelin.properties, ["heavy thrown"]
    test.done()

  "mace should be defined": (test) ->
    test.equal Weapons.mace.name,        "mace"
    test.equal Weapons.mace.proficiency, +2
    test.equal Weapons.mace.damageCount,  1
    test.equal Weapons.mace.damageDie,    8
    test.equal Weapons.mace.hands,        1
    test.equal Weapons.mace.group,        "mace"
    test.equal Weapons.mace.category,     "simple melee"
    test.deepEqual Weapons.mace.properties, ["versatile"]
    test.done()

  "sickle should be defined": (test) ->
    test.equal Weapons.sickle.name,        "sickle"
    test.equal Weapons.sickle.proficiency, +2
    test.equal Weapons.sickle.damageCount,  1
    test.equal Weapons.sickle.damageDie,    6
    test.equal Weapons.sickle.hands,        1
    test.equal Weapons.sickle.group,        "light blade"
    test.equal Weapons.sickle.category,     "simple melee"
    test.deepEqual Weapons.sickle.properties, ["off-hand"]
    test.done()

  "spear should be defined": (test) ->
    test.equal Weapons.spear.name,        "spear"
    test.equal Weapons.spear.proficiency, +2
    test.equal Weapons.spear.damageCount,  1
    test.equal Weapons.spear.damageDie,    8
    test.equal Weapons.spear.hands,        1
    test.equal Weapons.spear.group,        "spear"
    test.equal Weapons.spear.category,     "simple melee"
    test.deepEqual Weapons.spear.properties, ["versatile"]
    test.done()
