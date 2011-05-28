{Weapons, NPC} = require ".."

module.exports =
  "proficient should report whether the NPC is proficient in the given weapon": (test) ->
    npc = new NPC
    npc.proficiencies.weapons.push "club"

    test.ok Weapons.proficient(npc, "club")
    test.ok !Weapons.proficient(npc, "dagger")
    test.done()

  "proficient should report whether the NPC is proficient in the given category": (test) ->
    npc = new NPC
    npc.proficiencies.weapons.push "simple melee"

    test.ok Weapons.proficient(npc, "club")
    test.ok Weapons.proficient(npc, "dagger")
    test.ok !Weapons.proficient(npc, "longsword")
    test.done()

  "proficient should return false for two-handed weapons and small creatures": (test) ->
    npc = new NPC
    npc.size = "small"
    npc.proficiencies.weapons.push "simple melee"

    test.ok Weapons.proficient(npc, "dagger")
    test.ok !Weapons.proficient(npc, "quarterstaff")
    test.done()

  "club should be defined": (test) ->
    test.equal Weapons.all.club.name,        "club"
    test.equal Weapons.all.club.proficiency, +2
    test.equal Weapons.all.club.damageCount,  1
    test.equal Weapons.all.club.damageDie,    6
    test.equal Weapons.all.club.hands,        1
    test.equal Weapons.all.club.range,        undefined
    test.equal Weapons.all.club.category,     "simple melee"
    test.deepEqual Weapons.all.club.groups,     ["mace"]
    test.deepEqual Weapons.all.club.properties, []
    test.done()

  "dagger should be defined": (test) ->
    test.equal Weapons.all.dagger.name,        "dagger"
    test.equal Weapons.all.dagger.proficiency, +3
    test.equal Weapons.all.dagger.damageCount,  1
    test.equal Weapons.all.dagger.damageDie,    4
    test.equal Weapons.all.dagger.hands,        1
    test.equal Weapons.all.dagger.category,     "simple melee"
    test.deepEqual Weapons.all.dagger.range,      [5, 10]
    test.deepEqual Weapons.all.dagger.groups,     ["light blade"]
    test.deepEqual Weapons.all.dagger.properties, ["off-hand", "light thrown"]
    test.done()

  "javelin should be defined": (test) ->
    test.equal Weapons.all.javelin.name,        "javelin"
    test.equal Weapons.all.javelin.proficiency, +2
    test.equal Weapons.all.javelin.damageCount,  1
    test.equal Weapons.all.javelin.damageDie,    6
    test.equal Weapons.all.javelin.hands,        1
    test.equal Weapons.all.javelin.category,     "simple melee"
    test.deepEqual Weapons.all.javelin.range,      [10, 20]
    test.deepEqual Weapons.all.javelin.groups,     ["spear"]
    test.deepEqual Weapons.all.javelin.properties, ["heavy thrown"]
    test.done()

  "mace should be defined": (test) ->
    test.equal Weapons.all.mace.name,        "mace"
    test.equal Weapons.all.mace.proficiency, +2
    test.equal Weapons.all.mace.damageCount,  1
    test.equal Weapons.all.mace.damageDie,    8
    test.equal Weapons.all.mace.hands,        1
    test.equal Weapons.all.mace.category,     "simple melee"
    test.equal Weapons.all.mace.range,        undefined
    test.deepEqual Weapons.all.mace.groups,     ["mace"]
    test.deepEqual Weapons.all.mace.properties, ["versatile"]
    test.done()

  "sickle should be defined": (test) ->
    test.equal Weapons.all.sickle.name,        "sickle"
    test.equal Weapons.all.sickle.proficiency, +2
    test.equal Weapons.all.sickle.damageCount,  1
    test.equal Weapons.all.sickle.damageDie,    6
    test.equal Weapons.all.sickle.hands,        1
    test.equal Weapons.all.sickle.category,     "simple melee"
    test.equal Weapons.all.sickle.range,        undefined
    test.deepEqual Weapons.all.sickle.groups,     ["light blade"]
    test.deepEqual Weapons.all.sickle.properties, ["off-hand"]
    test.done()

  "spear should be defined": (test) ->
    test.equal Weapons.all.spear.name,        "spear"
    test.equal Weapons.all.spear.proficiency, +2
    test.equal Weapons.all.spear.damageCount,  1
    test.equal Weapons.all.spear.damageDie,    8
    test.equal Weapons.all.spear.hands,        1
    test.equal Weapons.all.spear.category,     "simple melee"
    test.equal Weapons.all.spear.range,        undefined
    test.deepEqual Weapons.all.spear.groups,     ["spear"]
    test.deepEqual Weapons.all.spear.properties, ["versatile"]
    test.done()

  "greatclub should be defined": (test) ->
    test.equal Weapons.all.greatclub.name,        "greatclub"
    test.equal Weapons.all.greatclub.proficiency, +2
    test.equal Weapons.all.greatclub.damageCount,  2
    test.equal Weapons.all.greatclub.damageDie,    4
    test.equal Weapons.all.greatclub.hands,        2
    test.equal Weapons.all.greatclub.category,     "simple melee"
    test.equal Weapons.all.greatclub.range,        undefined
    test.deepEqual Weapons.all.greatclub.groups,     ["mace"]
    test.deepEqual Weapons.all.greatclub.properties, []
    test.done()

  "morningstar should be defined": (test) ->
    test.equal Weapons.all.morningstar.name,        "morningstar"
    test.equal Weapons.all.morningstar.proficiency, +2
    test.equal Weapons.all.morningstar.damageCount,  1
    test.equal Weapons.all.morningstar.damageDie,    10
    test.equal Weapons.all.morningstar.hands,        2
    test.equal Weapons.all.morningstar.category,     "simple melee"
    test.equal Weapons.all.morningstar.range,        undefined
    test.deepEqual Weapons.all.morningstar.groups,     ["mace"]
    test.deepEqual Weapons.all.morningstar.properties, []
    test.done()

  "quarterstaff should be defined": (test) ->
    test.equal Weapons.all.quarterstaff.name,        "quarterstaff"
    test.equal Weapons.all.quarterstaff.proficiency, +2
    test.equal Weapons.all.quarterstaff.damageCount,  1
    test.equal Weapons.all.quarterstaff.damageDie,    8
    test.equal Weapons.all.quarterstaff.hands,        2
    test.equal Weapons.all.quarterstaff.category,     "simple melee"
    test.equal Weapons.all.quarterstaff.range,        undefined
    test.deepEqual Weapons.all.quarterstaff.groups,     ["staff"]
    test.deepEqual Weapons.all.quarterstaff.properties, []
    test.done()

  "scythe should be defined": (test) ->
    test.equal Weapons.all.scythe.name,        "scythe"
    test.equal Weapons.all.scythe.proficiency, +2
    test.equal Weapons.all.scythe.damageCount,  2
    test.equal Weapons.all.scythe.damageDie,    4
    test.equal Weapons.all.scythe.hands,        2
    test.equal Weapons.all.scythe.category,     "simple melee"
    test.equal Weapons.all.scythe.range,        undefined
    test.deepEqual Weapons.all.scythe.groups,     ["heavy blade"]
    test.deepEqual Weapons.all.scythe.properties, []
    test.done()

  "battleaxe should be defined": (test) ->
    test.equal Weapons.all.battleaxe.name,        "battleaxe"
    test.equal Weapons.all.battleaxe.proficiency, +2
    test.equal Weapons.all.battleaxe.damageCount,  1
    test.equal Weapons.all.battleaxe.damageDie,    10
    test.equal Weapons.all.battleaxe.hands,        1
    test.equal Weapons.all.battleaxe.category,     "military melee"
    test.equal Weapons.all.battleaxe.range,        undefined
    test.deepEqual Weapons.all.battleaxe.groups,     ["axe"]
    test.deepEqual Weapons.all.battleaxe.properties, ["versatile"]
    test.done()

  "flail should be defined": (test) ->
    test.equal Weapons.all.flail.name,        "flail"
    test.equal Weapons.all.flail.proficiency, +2
    test.equal Weapons.all.flail.damageCount,  1
    test.equal Weapons.all.flail.damageDie,    10
    test.equal Weapons.all.flail.hands,        1
    test.equal Weapons.all.flail.category,     "military melee"
    test.equal Weapons.all.flail.range,        undefined
    test.deepEqual Weapons.all.flail.groups,     ["flail"]
    test.deepEqual Weapons.all.flail.properties, ["versatile"]
    test.done()

  "handaxe should be defined": (test) ->
    test.equal Weapons.all.handaxe.name,        "handaxe"
    test.equal Weapons.all.handaxe.proficiency, +2
    test.equal Weapons.all.handaxe.damageCount,  1
    test.equal Weapons.all.handaxe.damageDie,    6
    test.equal Weapons.all.handaxe.hands,        1
    test.equal Weapons.all.handaxe.category,     "military melee"
    test.deepEqual Weapons.all.handaxe.range,      [5, 10]
    test.deepEqual Weapons.all.handaxe.groups,     ["axe"]
    test.deepEqual Weapons.all.handaxe.properties, ["off-hand", "heavy thrown"]
    test.done()

  "longsword should be defined": (test) ->
    test.equal Weapons.all.longsword.name,        "longsword"
    test.equal Weapons.all.longsword.proficiency, +3
    test.equal Weapons.all.longsword.damageCount,  1
    test.equal Weapons.all.longsword.damageDie,    8
    test.equal Weapons.all.longsword.hands,        1
    test.equal Weapons.all.longsword.category,     "military melee"
    test.equal Weapons.all.longsword.range,        undefined
    test.deepEqual Weapons.all.longsword.groups,     ["heavy blade"]
    test.deepEqual Weapons.all.longsword.properties, ["versatile"]
    test.done()

  "scimitar should be defined": (test) ->
    test.equal Weapons.all.scimitar.name,        "scimitar"
    test.equal Weapons.all.scimitar.proficiency, +2
    test.equal Weapons.all.scimitar.damageCount,  1
    test.equal Weapons.all.scimitar.damageDie,    8
    test.equal Weapons.all.scimitar.hands,        1
    test.equal Weapons.all.scimitar.category,     "military melee"
    test.equal Weapons.all.scimitar.range,        undefined
    test.deepEqual Weapons.all.scimitar.groups,     ["heavy blade"]
    test.deepEqual Weapons.all.scimitar.properties, ["high crit"]
    test.done()

  "short sword should be defined": (test) ->
    test.equal Weapons.all.shortSword.name,        "short sword"
    test.equal Weapons.all.shortSword.proficiency, +3
    test.equal Weapons.all.shortSword.damageCount,  1
    test.equal Weapons.all.shortSword.damageDie,    6
    test.equal Weapons.all.shortSword.hands,        1
    test.equal Weapons.all.shortSword.category,     "military melee"
    test.equal Weapons.all.shortSword.range,        undefined
    test.deepEqual Weapons.all.shortSword.groups,     ["light blade"]
    test.deepEqual Weapons.all.shortSword.properties, ["off-hand"]
    test.done()

  "throwing hammer should be defined": (test) ->
    test.equal Weapons.all.throwingHammer.name,        "throwing hammer"
    test.equal Weapons.all.throwingHammer.proficiency, +2
    test.equal Weapons.all.throwingHammer.damageCount,  1
    test.equal Weapons.all.throwingHammer.damageDie,    6
    test.equal Weapons.all.throwingHammer.hands,        1
    test.equal Weapons.all.throwingHammer.category,     "military melee"
    test.deepEqual Weapons.all.throwingHammer.range,      [5, 10]
    test.deepEqual Weapons.all.throwingHammer.groups,     ["hammer"]
    test.deepEqual Weapons.all.throwingHammer.properties, ["off-hand", "heavy thrown"]
    test.done()

  "warhammer should be defined": (test) ->
    test.equal Weapons.all.warhammer.name,        "warhammer"
    test.equal Weapons.all.warhammer.proficiency, +2
    test.equal Weapons.all.warhammer.damageCount,  1
    test.equal Weapons.all.warhammer.damageDie,    10
    test.equal Weapons.all.warhammer.hands,        1
    test.equal Weapons.all.warhammer.category,     "military melee"
    test.equal Weapons.all.warhammer.range,        undefined
    test.deepEqual Weapons.all.warhammer.groups,     ["hammer"]
    test.deepEqual Weapons.all.warhammer.properties, ["versatile"]
    test.done()

  "war pick should be defined": (test) ->
    test.equal Weapons.all.warPick.name,        "war pick"
    test.equal Weapons.all.warPick.proficiency, +2
    test.equal Weapons.all.warPick.damageCount,  1
    test.equal Weapons.all.warPick.damageDie,    8
    test.equal Weapons.all.warPick.hands,        1
    test.equal Weapons.all.warPick.category,     "military melee"
    test.equal Weapons.all.warPick.range,        undefined
    test.deepEqual Weapons.all.warPick.groups,     ["pick"]
    test.deepEqual Weapons.all.warPick.properties, ["high crit", "versatile"]
    test.done()

  "falchion should be defined": (test) ->
    test.equal Weapons.all.falchion.name,        "falchion"
    test.equal Weapons.all.falchion.proficiency, +3
    test.equal Weapons.all.falchion.damageCount,  2
    test.equal Weapons.all.falchion.damageDie,    4
    test.equal Weapons.all.falchion.hands,        2
    test.equal Weapons.all.falchion.category,     "military melee"
    test.equal Weapons.all.falchion.range,        undefined
    test.deepEqual Weapons.all.falchion.groups,     ["heavy blade"]
    test.deepEqual Weapons.all.falchion.properties, ["high crit"]
    test.done()

  "glaive should be defined": (test) ->
    test.equal Weapons.all.glaive.name,        "glaive"
    test.equal Weapons.all.glaive.proficiency, +2
    test.equal Weapons.all.glaive.damageCount,  2
    test.equal Weapons.all.glaive.damageDie,    4
    test.equal Weapons.all.glaive.hands,        2
    test.equal Weapons.all.glaive.category,     "military melee"
    test.equal Weapons.all.glaive.range,        undefined
    test.deepEqual Weapons.all.glaive.groups,     ["heavy blade", "polearm"]
    test.deepEqual Weapons.all.glaive.properties, ["reach"]
    test.done()

  "greataxe should be defined": (test) ->
    test.equal Weapons.all.greataxe.name,        "greataxe"
    test.equal Weapons.all.greataxe.proficiency, +2
    test.equal Weapons.all.greataxe.damageCount,  1
    test.equal Weapons.all.greataxe.damageDie,    12
    test.equal Weapons.all.greataxe.hands,        2
    test.equal Weapons.all.greataxe.category,     "military melee"
    test.equal Weapons.all.greataxe.range,        undefined
    test.deepEqual Weapons.all.greataxe.groups,     ["axe"]
    test.deepEqual Weapons.all.greataxe.properties, ["high crit"]
    test.done()

  "greatsword should be defined": (test) ->
    test.equal Weapons.all.greatsword.name,        "greatsword"
    test.equal Weapons.all.greatsword.proficiency, +3
    test.equal Weapons.all.greatsword.damageCount,  1
    test.equal Weapons.all.greatsword.damageDie,    10
    test.equal Weapons.all.greatsword.hands,        2
    test.equal Weapons.all.greatsword.category,     "military melee"
    test.equal Weapons.all.greatsword.range,        undefined
    test.deepEqual Weapons.all.greatsword.groups,     ["heavy blade"]
    test.deepEqual Weapons.all.greatsword.properties, []
    test.done()

  "halberd should be defined": (test) ->
    test.equal Weapons.all.halberd.name,        "halberd"
    test.equal Weapons.all.halberd.proficiency, +2
    test.equal Weapons.all.halberd.damageCount,  1
    test.equal Weapons.all.halberd.damageDie,    10
    test.equal Weapons.all.halberd.hands,        2
    test.equal Weapons.all.halberd.category,     "military melee"
    test.equal Weapons.all.halberd.range,        undefined
    test.deepEqual Weapons.all.halberd.groups,     ["axe", "polearm"]
    test.deepEqual Weapons.all.halberd.properties, ["reach"]
    test.done()

  "heavy flail should be defined": (test) ->
    test.equal Weapons.all.heavyFlail.name,        "heavy flail"
    test.equal Weapons.all.heavyFlail.proficiency, +2
    test.equal Weapons.all.heavyFlail.damageCount,  2
    test.equal Weapons.all.heavyFlail.damageDie,    6
    test.equal Weapons.all.heavyFlail.hands,        2
    test.equal Weapons.all.heavyFlail.category,     "military melee"
    test.equal Weapons.all.heavyFlail.range,        undefined
    test.deepEqual Weapons.all.heavyFlail.groups,     ["flail"]
    test.deepEqual Weapons.all.heavyFlail.properties, []
    test.done()

  "longspear should be defined": (test) ->
    test.equal Weapons.all.longspear.name,        "longspear"
    test.equal Weapons.all.longspear.proficiency, +2
    test.equal Weapons.all.longspear.damageCount,  1
    test.equal Weapons.all.longspear.damageDie,    10
    test.equal Weapons.all.longspear.hands,        2
    test.equal Weapons.all.longspear.category,     "military melee"
    test.equal Weapons.all.longspear.range,        undefined
    test.deepEqual Weapons.all.longspear.groups,     ["polearm", "spear"]
    test.deepEqual Weapons.all.longspear.properties, ["reach"]
    test.done()

  "maul should be defined": (test) ->
    test.equal Weapons.all.maul.name,        "maul"
    test.equal Weapons.all.maul.proficiency, +2
    test.equal Weapons.all.maul.damageCount,  2
    test.equal Weapons.all.maul.damageDie,    6
    test.equal Weapons.all.maul.hands,        2
    test.equal Weapons.all.maul.category,     "military melee"
    test.equal Weapons.all.maul.range,        undefined
    test.deepEqual Weapons.all.maul.groups,     ["hammer"]
    test.deepEqual Weapons.all.maul.properties, []
    test.done()

  "bastard sword should be defined": (test) ->
    test.equal Weapons.all.bastardSword.name,        "bastard sword"
    test.equal Weapons.all.bastardSword.proficiency, +3
    test.equal Weapons.all.bastardSword.damageCount,  1
    test.equal Weapons.all.bastardSword.damageDie,    10
    test.equal Weapons.all.bastardSword.hands,        1
    test.equal Weapons.all.bastardSword.category,     "superior melee"
    test.equal Weapons.all.bastardSword.range,        undefined
    test.deepEqual Weapons.all.bastardSword.groups,     ["heavy blade"]
    test.deepEqual Weapons.all.bastardSword.properties, ["versatile"]
    test.done()

  "katar should be defined": (test) ->
    test.equal Weapons.all.katar.name,        "katar"
    test.equal Weapons.all.katar.proficiency, +3
    test.equal Weapons.all.katar.damageCount,  1
    test.equal Weapons.all.katar.damageDie,    6
    test.equal Weapons.all.katar.hands,        1
    test.equal Weapons.all.katar.category,     "superior melee"
    test.equal Weapons.all.katar.range,        undefined
    test.deepEqual Weapons.all.katar.groups,     ["light blade"]
    test.deepEqual Weapons.all.katar.properties, ["off-hand", "high crit"]
    test.done()

  "rapier should be defined": (test) ->
    test.equal Weapons.all.rapier.name,        "rapier"
    test.equal Weapons.all.rapier.proficiency, +3
    test.equal Weapons.all.rapier.damageCount,  1
    test.equal Weapons.all.rapier.damageDie,    8
    test.equal Weapons.all.rapier.hands,        1
    test.equal Weapons.all.rapier.category,     "superior melee"
    test.equal Weapons.all.rapier.range,        undefined
    test.deepEqual Weapons.all.rapier.groups,     ["light blade"]
    test.deepEqual Weapons.all.rapier.properties, []
    test.done()

  "spiked chain should be defined": (test) ->
    test.equal Weapons.all.spikedChain.name,        "spiked chain"
    test.equal Weapons.all.spikedChain.proficiency, +3
    test.equal Weapons.all.spikedChain.damageCount,  2
    test.equal Weapons.all.spikedChain.damageDie,    4
    test.equal Weapons.all.spikedChain.hands,        2
    test.equal Weapons.all.spikedChain.category,     "superior melee"
    test.equal Weapons.all.spikedChain.range,        undefined
    test.deepEqual Weapons.all.spikedChain.groups,     ["flail"]
    test.deepEqual Weapons.all.spikedChain.properties, ["reach"]
    test.done()

  "hand crossbow should be defined": (test) ->
    test.equal Weapons.all.handCrossbow.name,        "hand crossbow"
    test.equal Weapons.all.handCrossbow.proficiency, +2
    test.equal Weapons.all.handCrossbow.damageCount,  1
    test.equal Weapons.all.handCrossbow.damageDie,    6
    test.equal Weapons.all.handCrossbow.hands,        1
    test.equal Weapons.all.handCrossbow.category,     "simple ranged"
    test.deepEqual Weapons.all.handCrossbow.range,      [10, 20]
    test.deepEqual Weapons.all.handCrossbow.groups,     ["crossbow"]
    test.deepEqual Weapons.all.handCrossbow.properties, ["load free"]
    test.done()

  "sling should be defined": (test) ->
    test.equal Weapons.all.sling.name,        "sling"
    test.equal Weapons.all.sling.proficiency, +2
    test.equal Weapons.all.sling.damageCount,  1
    test.equal Weapons.all.sling.damageDie,    6
    test.equal Weapons.all.sling.hands,        1
    test.equal Weapons.all.sling.category,     "simple ranged"
    test.deepEqual Weapons.all.sling.range,      [10, 20]
    test.deepEqual Weapons.all.sling.groups,     ["sling"]
    test.deepEqual Weapons.all.sling.properties, ["load free"]
    test.done()

  "crossbow should be defined": (test) ->
    test.equal Weapons.all.crossbow.name,        "crossbow"
    test.equal Weapons.all.crossbow.proficiency, +2
    test.equal Weapons.all.crossbow.damageCount,  1
    test.equal Weapons.all.crossbow.damageDie,    8
    test.equal Weapons.all.crossbow.hands,        2
    test.equal Weapons.all.crossbow.category,     "simple ranged"
    test.deepEqual Weapons.all.crossbow.range,      [15, 30]
    test.deepEqual Weapons.all.crossbow.groups,     ["crossbow"]
    test.deepEqual Weapons.all.crossbow.properties, ["load minor"]
    test.done()

  "longbow should be defined": (test) ->
    test.equal Weapons.all.longbow.name,        "longbow"
    test.equal Weapons.all.longbow.proficiency, +2
    test.equal Weapons.all.longbow.damageCount,  1
    test.equal Weapons.all.longbow.damageDie,    10
    test.equal Weapons.all.longbow.hands,        2
    test.equal Weapons.all.longbow.category,     "military ranged"
    test.deepEqual Weapons.all.longbow.range,      [20, 40]
    test.deepEqual Weapons.all.longbow.groups,     ["bow"]
    test.deepEqual Weapons.all.longbow.properties, ["load free"]
    test.done()

  "shortbow should be defined": (test) ->
    test.equal Weapons.all.shortbow.name,        "shortbow"
    test.equal Weapons.all.shortbow.proficiency, +2
    test.equal Weapons.all.shortbow.damageCount,  1
    test.equal Weapons.all.shortbow.damageDie,    8
    test.equal Weapons.all.shortbow.hands,        2
    test.equal Weapons.all.shortbow.category,     "military ranged"
    test.deepEqual Weapons.all.shortbow.range,      [15, 30]
    test.deepEqual Weapons.all.shortbow.groups,     ["bow"]
    test.deepEqual Weapons.all.shortbow.properties, ["load free", "small"]
    test.done()

  "shuriken should be defined": (test) ->
    test.equal Weapons.all.shuriken.name,        "shuriken"
    test.equal Weapons.all.shuriken.proficiency, +3
    test.equal Weapons.all.shuriken.damageCount,  1
    test.equal Weapons.all.shuriken.damageDie,    4
    test.equal Weapons.all.shuriken.hands,        1
    test.equal Weapons.all.shuriken.category,     "superior ranged"
    test.deepEqual Weapons.all.shuriken.range,      [6, 12]
    test.deepEqual Weapons.all.shuriken.groups,     ["light blade"]
    test.deepEqual Weapons.all.shuriken.properties, ["light thrown"]
    test.done()
