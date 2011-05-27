{Weapons, NPC} = require ".."

module.exports =
  "club should be defined": (test) ->
    test.equal Weapons.club.name,        "club"
    test.equal Weapons.club.proficiency, +2
    test.equal Weapons.club.damageCount,  1
    test.equal Weapons.club.damageDie,    6
    test.equal Weapons.club.hands,        1
    test.equal Weapons.club.range,        undefined
    test.equal Weapons.club.category,     "simple melee"
    test.deepEqual Weapons.club.groups,     ["mace"]
    test.deepEqual Weapons.club.properties, []
    test.done()

  "dagger should be defined": (test) ->
    test.equal Weapons.dagger.name,        "dagger"
    test.equal Weapons.dagger.proficiency, +3
    test.equal Weapons.dagger.damageCount,  1
    test.equal Weapons.dagger.damageDie,    4
    test.equal Weapons.dagger.hands,        1
    test.equal Weapons.dagger.category,     "simple melee"
    test.deepEqual Weapons.dagger.range,      [5, 10]
    test.deepEqual Weapons.dagger.groups,     ["light blade"]
    test.deepEqual Weapons.dagger.properties, ["off-hand", "light thrown"]
    test.done()

  "javelin should be defined": (test) ->
    test.equal Weapons.javelin.name,        "javelin"
    test.equal Weapons.javelin.proficiency, +2
    test.equal Weapons.javelin.damageCount,  1
    test.equal Weapons.javelin.damageDie,    6
    test.equal Weapons.javelin.hands,        1
    test.equal Weapons.javelin.category,     "simple melee"
    test.deepEqual Weapons.javelin.range,      [10, 20]
    test.deepEqual Weapons.javelin.groups,     ["spear"]
    test.deepEqual Weapons.javelin.properties, ["heavy thrown"]
    test.done()

  "mace should be defined": (test) ->
    test.equal Weapons.mace.name,        "mace"
    test.equal Weapons.mace.proficiency, +2
    test.equal Weapons.mace.damageCount,  1
    test.equal Weapons.mace.damageDie,    8
    test.equal Weapons.mace.hands,        1
    test.equal Weapons.mace.category,     "simple melee"
    test.equal Weapons.mace.range,        undefined
    test.deepEqual Weapons.mace.groups,     ["mace"]
    test.deepEqual Weapons.mace.properties, ["versatile"]
    test.done()

  "sickle should be defined": (test) ->
    test.equal Weapons.sickle.name,        "sickle"
    test.equal Weapons.sickle.proficiency, +2
    test.equal Weapons.sickle.damageCount,  1
    test.equal Weapons.sickle.damageDie,    6
    test.equal Weapons.sickle.hands,        1
    test.equal Weapons.sickle.category,     "simple melee"
    test.equal Weapons.sickle.range,        undefined
    test.deepEqual Weapons.sickle.groups,     ["light blade"]
    test.deepEqual Weapons.sickle.properties, ["off-hand"]
    test.done()

  "spear should be defined": (test) ->
    test.equal Weapons.spear.name,        "spear"
    test.equal Weapons.spear.proficiency, +2
    test.equal Weapons.spear.damageCount,  1
    test.equal Weapons.spear.damageDie,    8
    test.equal Weapons.spear.hands,        1
    test.equal Weapons.spear.category,     "simple melee"
    test.equal Weapons.spear.range,        undefined
    test.deepEqual Weapons.spear.groups,     ["spear"]
    test.deepEqual Weapons.spear.properties, ["versatile"]
    test.done()

  "greatclub should be defined": (test) ->
    test.equal Weapons.greatclub.name,        "greatclub"
    test.equal Weapons.greatclub.proficiency, +2
    test.equal Weapons.greatclub.damageCount,  2
    test.equal Weapons.greatclub.damageDie,    4
    test.equal Weapons.greatclub.hands,        2
    test.equal Weapons.greatclub.category,     "simple melee"
    test.equal Weapons.greatclub.range,        undefined
    test.deepEqual Weapons.greatclub.groups,     ["mace"]
    test.deepEqual Weapons.greatclub.properties, []
    test.done()

  "morningstar should be defined": (test) ->
    test.equal Weapons.morningstar.name,        "morningstar"
    test.equal Weapons.morningstar.proficiency, +2
    test.equal Weapons.morningstar.damageCount,  1
    test.equal Weapons.morningstar.damageDie,    10
    test.equal Weapons.morningstar.hands,        2
    test.equal Weapons.morningstar.category,     "simple melee"
    test.equal Weapons.morningstar.range,        undefined
    test.deepEqual Weapons.morningstar.groups,     ["mace"]
    test.deepEqual Weapons.morningstar.properties, []
    test.done()

  "quarterstaff should be defined": (test) ->
    test.equal Weapons.quarterstaff.name,        "quarterstaff"
    test.equal Weapons.quarterstaff.proficiency, +2
    test.equal Weapons.quarterstaff.damageCount,  1
    test.equal Weapons.quarterstaff.damageDie,    8
    test.equal Weapons.quarterstaff.hands,        2
    test.equal Weapons.quarterstaff.category,     "simple melee"
    test.equal Weapons.quarterstaff.range,        undefined
    test.deepEqual Weapons.quarterstaff.groups,     ["staff"]
    test.deepEqual Weapons.quarterstaff.properties, []
    test.done()

  "scythe should be defined": (test) ->
    test.equal Weapons.scythe.name,        "scythe"
    test.equal Weapons.scythe.proficiency, +2
    test.equal Weapons.scythe.damageCount,  2
    test.equal Weapons.scythe.damageDie,    4
    test.equal Weapons.scythe.hands,        2
    test.equal Weapons.scythe.category,     "simple melee"
    test.equal Weapons.scythe.range,        undefined
    test.deepEqual Weapons.scythe.groups,     ["heavy blade"]
    test.deepEqual Weapons.scythe.properties, []
    test.done()

  "battleaxe should be defined": (test) ->
    test.equal Weapons.battleaxe.name,        "battleaxe"
    test.equal Weapons.battleaxe.proficiency, +2
    test.equal Weapons.battleaxe.damageCount,  1
    test.equal Weapons.battleaxe.damageDie,    10
    test.equal Weapons.battleaxe.hands,        1
    test.equal Weapons.battleaxe.category,     "military melee"
    test.equal Weapons.battleaxe.range,        undefined
    test.deepEqual Weapons.battleaxe.groups,     ["axe"]
    test.deepEqual Weapons.battleaxe.properties, ["versatile"]
    test.done()

  "flail should be defined": (test) ->
    test.equal Weapons.flail.name,        "flail"
    test.equal Weapons.flail.proficiency, +2
    test.equal Weapons.flail.damageCount,  1
    test.equal Weapons.flail.damageDie,    10
    test.equal Weapons.flail.hands,        1
    test.equal Weapons.flail.category,     "military melee"
    test.equal Weapons.flail.range,        undefined
    test.deepEqual Weapons.flail.groups,     ["flail"]
    test.deepEqual Weapons.flail.properties, ["versatile"]
    test.done()

  "handaxe should be defined": (test) ->
    test.equal Weapons.handaxe.name,        "handaxe"
    test.equal Weapons.handaxe.proficiency, +2
    test.equal Weapons.handaxe.damageCount,  1
    test.equal Weapons.handaxe.damageDie,    6
    test.equal Weapons.handaxe.hands,        1
    test.equal Weapons.handaxe.category,     "military melee"
    test.deepEqual Weapons.handaxe.range,      [5, 10]
    test.deepEqual Weapons.handaxe.groups,     ["axe"]
    test.deepEqual Weapons.handaxe.properties, ["off-hand", "heavy thrown"]
    test.done()

  "longsword should be defined": (test) ->
    test.equal Weapons.longsword.name,        "longsword"
    test.equal Weapons.longsword.proficiency, +3
    test.equal Weapons.longsword.damageCount,  1
    test.equal Weapons.longsword.damageDie,    8
    test.equal Weapons.longsword.hands,        1
    test.equal Weapons.longsword.category,     "military melee"
    test.equal Weapons.longsword.range,        undefined
    test.deepEqual Weapons.longsword.groups,     ["heavy blade"]
    test.deepEqual Weapons.longsword.properties, ["versatile"]
    test.done()

  "scimitar should be defined": (test) ->
    test.equal Weapons.scimitar.name,        "scimitar"
    test.equal Weapons.scimitar.proficiency, +2
    test.equal Weapons.scimitar.damageCount,  1
    test.equal Weapons.scimitar.damageDie,    8
    test.equal Weapons.scimitar.hands,        1
    test.equal Weapons.scimitar.category,     "military melee"
    test.equal Weapons.scimitar.range,        undefined
    test.deepEqual Weapons.scimitar.groups,     ["heavy blade"]
    test.deepEqual Weapons.scimitar.properties, ["high crit"]
    test.done()

  "short sword should be defined": (test) ->
    test.equal Weapons.shortSword.name,        "short sword"
    test.equal Weapons.shortSword.proficiency, +3
    test.equal Weapons.shortSword.damageCount,  1
    test.equal Weapons.shortSword.damageDie,    6
    test.equal Weapons.shortSword.hands,        1
    test.equal Weapons.shortSword.category,     "military melee"
    test.equal Weapons.shortSword.range,        undefined
    test.deepEqual Weapons.shortSword.groups,     ["light blade"]
    test.deepEqual Weapons.shortSword.properties, ["off-hand"]
    test.done()

  "throwing hammer should be defined": (test) ->
    test.equal Weapons.throwingHammer.name,        "throwing hammer"
    test.equal Weapons.throwingHammer.proficiency, +2
    test.equal Weapons.throwingHammer.damageCount,  1
    test.equal Weapons.throwingHammer.damageDie,    6
    test.equal Weapons.throwingHammer.hands,        1
    test.equal Weapons.throwingHammer.category,     "military melee"
    test.deepEqual Weapons.throwingHammer.range,      [5, 10]
    test.deepEqual Weapons.throwingHammer.groups,     ["hammer"]
    test.deepEqual Weapons.throwingHammer.properties, ["off-hand", "heavy thrown"]
    test.done()

  "warhammer should be defined": (test) ->
    test.equal Weapons.warhammer.name,        "warhammer"
    test.equal Weapons.warhammer.proficiency, +2
    test.equal Weapons.warhammer.damageCount,  1
    test.equal Weapons.warhammer.damageDie,    10
    test.equal Weapons.warhammer.hands,        1
    test.equal Weapons.warhammer.category,     "military melee"
    test.equal Weapons.warhammer.range,        undefined
    test.deepEqual Weapons.warhammer.groups,     ["hammer"]
    test.deepEqual Weapons.warhammer.properties, ["versatile"]
    test.done()

  "war pick should be defined": (test) ->
    test.equal Weapons.warPick.name,        "war pick"
    test.equal Weapons.warPick.proficiency, +2
    test.equal Weapons.warPick.damageCount,  1
    test.equal Weapons.warPick.damageDie,    8
    test.equal Weapons.warPick.hands,        1
    test.equal Weapons.warPick.category,     "military melee"
    test.equal Weapons.warPick.range,        undefined
    test.deepEqual Weapons.warPick.groups,     ["pick"]
    test.deepEqual Weapons.warPick.properties, ["high crit", "versatile"]
    test.done()

  "falchion should be defined": (test) ->
    test.equal Weapons.falchion.name,        "falchion"
    test.equal Weapons.falchion.proficiency, +3
    test.equal Weapons.falchion.damageCount,  2
    test.equal Weapons.falchion.damageDie,    4
    test.equal Weapons.falchion.hands,        2
    test.equal Weapons.falchion.category,     "military melee"
    test.equal Weapons.falchion.range,        undefined
    test.deepEqual Weapons.falchion.groups,     ["heavy blade"]
    test.deepEqual Weapons.falchion.properties, ["high crit"]
    test.done()

  "glaive should be defined": (test) ->
    test.equal Weapons.glaive.name,        "glaive"
    test.equal Weapons.glaive.proficiency, +2
    test.equal Weapons.glaive.damageCount,  2
    test.equal Weapons.glaive.damageDie,    4
    test.equal Weapons.glaive.hands,        2
    test.equal Weapons.glaive.category,     "military melee"
    test.equal Weapons.glaive.range,        undefined
    test.deepEqual Weapons.glaive.groups,     ["heavy blade", "polearm"]
    test.deepEqual Weapons.glaive.properties, ["reach"]
    test.done()

  "greataxe should be defined": (test) ->
    test.equal Weapons.greataxe.name,        "greataxe"
    test.equal Weapons.greataxe.proficiency, +2
    test.equal Weapons.greataxe.damageCount,  1
    test.equal Weapons.greataxe.damageDie,    12
    test.equal Weapons.greataxe.hands,        2
    test.equal Weapons.greataxe.category,     "military melee"
    test.equal Weapons.greataxe.range,        undefined
    test.deepEqual Weapons.greataxe.groups,     ["axe"]
    test.deepEqual Weapons.greataxe.properties, ["high crit"]
    test.done()

  "greatsword should be defined": (test) ->
    test.equal Weapons.greatsword.name,        "greatsword"
    test.equal Weapons.greatsword.proficiency, +3
    test.equal Weapons.greatsword.damageCount,  1
    test.equal Weapons.greatsword.damageDie,    10
    test.equal Weapons.greatsword.hands,        2
    test.equal Weapons.greatsword.category,     "military melee"
    test.equal Weapons.greatsword.range,        undefined
    test.deepEqual Weapons.greatsword.groups,     ["heavy blade"]
    test.deepEqual Weapons.greatsword.properties, []
    test.done()

  "halberd should be defined": (test) ->
    test.equal Weapons.halberd.name,        "halberd"
    test.equal Weapons.halberd.proficiency, +2
    test.equal Weapons.halberd.damageCount,  1
    test.equal Weapons.halberd.damageDie,    10
    test.equal Weapons.halberd.hands,        2
    test.equal Weapons.halberd.category,     "military melee"
    test.equal Weapons.halberd.range,        undefined
    test.deepEqual Weapons.halberd.groups,     ["axe", "polearm"]
    test.deepEqual Weapons.halberd.properties, ["reach"]
    test.done()

  "heavy flail should be defined": (test) ->
    test.equal Weapons.heavyFlail.name,        "heavy flail"
    test.equal Weapons.heavyFlail.proficiency, +2
    test.equal Weapons.heavyFlail.damageCount,  2
    test.equal Weapons.heavyFlail.damageDie,    6
    test.equal Weapons.heavyFlail.hands,        2
    test.equal Weapons.heavyFlail.category,     "military melee"
    test.equal Weapons.heavyFlail.range,        undefined
    test.deepEqual Weapons.heavyFlail.groups,     ["flail"]
    test.deepEqual Weapons.heavyFlail.properties, []
    test.done()

  "longspear should be defined": (test) ->
    test.equal Weapons.longspear.name,        "longspear"
    test.equal Weapons.longspear.proficiency, +2
    test.equal Weapons.longspear.damageCount,  1
    test.equal Weapons.longspear.damageDie,    10
    test.equal Weapons.longspear.hands,        2
    test.equal Weapons.longspear.category,     "military melee"
    test.equal Weapons.longspear.range,        undefined
    test.deepEqual Weapons.longspear.groups,     ["polearm", "spear"]
    test.deepEqual Weapons.longspear.properties, ["reach"]
    test.done()

  "maul should be defined": (test) ->
    test.equal Weapons.maul.name,        "maul"
    test.equal Weapons.maul.proficiency, +2
    test.equal Weapons.maul.damageCount,  2
    test.equal Weapons.maul.damageDie,    6
    test.equal Weapons.maul.hands,        2
    test.equal Weapons.maul.category,     "military melee"
    test.equal Weapons.maul.range,        undefined
    test.deepEqual Weapons.maul.groups,     ["hammer"]
    test.deepEqual Weapons.maul.properties, []
    test.done()
