{Classes, NPC} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Cleric.source, "phb"
    test.done()

  "should have divine power source": (test) ->
    test.equal Classes.Cleric.powerSource, "divine"
    cleric = new Classes.Cleric new NPC
    test.equal cleric.powerSource, "divine"
    test.done()

  "should set name": (test) ->
    cleric = new Classes.Cleric new NPC
    test.equal cleric.name, "cleric"
    test.done()

  "should set key attribute list": (test) ->
    cleric = new Classes.Cleric new NPC
    test.deepEqual cleric.keyAttributes, ["wis", "str", "cha"]
    test.done()

  "should set armor proficiencies": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    for armor in ["cloth", "leather", "hide", "chainmail"]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    for weapon in ["simple melee", "simple ranged"]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should add holy symbol as an implement": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok "holy symbol" in npc.implements
    test.done()

  "should have +2 bonus to will": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok npc.defenses.will.has(2, "class"), "missing +2 class bonus to will"
    test.done()

  "should have a +12 class bonus to HP": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok npc.hitPoints.has(12, "class"), "missing +12 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 5": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.equal npc.hitPointsPerLevel, 5
    test.done()

  "should have +7 bonus to healingSurge.count": (test) ->
    npc = new NPC
    cleric = new Classes.Cleric npc
    test.ok npc.healingSurge.count.has(7, "class"), "missing +5 class bonus to healingSurge.count"
    test.done()
