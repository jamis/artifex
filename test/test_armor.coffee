{Armor, NPC} = require '..'

module.exports =
  "donning armor should apply adjustments": (test) ->
    npc = new NPC
    Armor.applyTo npc, "plate"

    test.equal npc.armor, "plate"

    for label, skill of npc.skills
      if skill.ability in [npc.abilities.str, npc.abilities.con, npc.abilities.dex]
        test.ok skill.has(-2, "armor")

    test.ok npc.speed.has(-1, "armor")
    test.ok npc.defenses.ac.has(+8, "armor")
    test.done()

  "#allows should return true if the npc may use the armor": (test) ->
    npc = new NPC
    npc.proficiencies.armor = ["light"]
    test.ok Armor.allows(npc, "cloth")
    test.ok !Armor.allows(npc, "scale")

    npc.proficiencies.armor = ["heavy"]
    test.ok !Armor.allows(npc, "leather")
    test.ok Armor.allows(npc, "plate")

    npc.proficiencies.armor = ["hide"]
    test.ok Armor.allows(npc, "hide")
    test.ok !Armor.allows(npc, "chainmail")

    npc.proficiencies.armor = ["hide", "leather"]
    test.ok Armor.allows(npc, "hide")
    test.ok Armor.allows(npc, "leather")
    test.ok !Armor.allows(npc, "chainmail")

    npc.proficiencies.armor = ["hide", "heavy"]
    test.ok Armor.allows(npc, "hide")
    test.ok !Armor.allows(npc, "leather")
    test.ok Armor.allows(npc, "chainmail")
    test.done()

  "cloth armor should be defined": (test) ->
    test.equal Armor.cloth.bonus, 0
    test.equal Armor.cloth.check, 0
    test.equal Armor.cloth.speed, 0
    test.equal Armor.cloth.category, "light"
    test.done()

  "leather armor should be defined": (test) ->
    test.equal Armor.leather.bonus, 2
    test.equal Armor.leather.check, 0
    test.equal Armor.leather.speed, 0
    test.equal Armor.leather.category, "light"
    test.done()

  "hide armor should be defined": (test) ->
    test.equal Armor.hide.bonus, +3
    test.equal Armor.hide.check, -1
    test.equal Armor.hide.speed,  0
    test.equal Armor.hide.category, "light"
    test.done()

  "chainmail armor should be defined": (test) ->
    test.equal Armor.chainmail.bonus, +6
    test.equal Armor.chainmail.check, -1
    test.equal Armor.chainmail.speed, -1
    test.equal Armor.chainmail.category, "heavy"
    test.done()

  "scale armor should be defined": (test) ->
    test.equal Armor.scale.bonus, +7
    test.equal Armor.scale.check,  0
    test.equal Armor.scale.speed, -1
    test.equal Armor.scale.category, "heavy"
    test.done()

  "plate armor should be defined": (test) ->
    test.equal Armor.plate.bonus, +8
    test.equal Armor.plate.check, -2
    test.equal Armor.plate.speed, -1
    test.equal Armor.plate.category, "heavy"
    test.done()

  "light shield should be defined": (test) ->
    test.equal Armor["light shield"].bonus, +1
    test.equal Armor["light shield"].check,  0
    test.equal Armor["light shield"].speed,  0
    test.equal Armor["light shield"].category, "shield"
    test.done()

  "heavy shield should be defined": (test) ->
    test.equal Armor["heavy shield"].bonus, +2
    test.equal Armor["heavy shield"].check, -2
    test.equal Armor["heavy shield"].speed,  0
    test.equal Armor["heavy shield"].category, "shield"
    test.done()
