{Armor, NPC, Races} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Races.Dwarf.source, "phb"
    test.done()

  "should set name": (test) ->
    race = new Races.Dwarf(new NPC)
    test.equal race.name, "dwarf"
    test.done()

  "should apply racial ability bonuses": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.ok npc.abilities.con.has(2, "racial"), "+2 con adjustment missing"
    test.ok npc.abilities.wis.has(2, "racial"), "+2 wis adjustment missing"
    test.done()

  "should have low-light vision": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.equal "low-light", npc.vision
    test.done()

  "should apply racial skill bonuses": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.ok npc.skills.dungeoneering.has(2, "racial"), "+2 dungeoneering adjustment missing"
    test.ok npc.skills.endurance.has(2, "racial"), "+2 endurance adjustment missing"
    test.done()

  "should set size": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.equal npc.size, "medium"
    test.done()

  "should set base speed": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.equal npc.speed.baseValue, 5
    test.done()

  "should add racial features": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.ok npc.hasFeature("racial", "Cast-Iron Stomach"), "missing Cast-Iron Stomach feature"
    test.ok npc.hasFeature("racial", "Dwarven Resilience"), "missing Dwarven Resilience feature"
    test.ok npc.hasFeature("racial", "Dwarven Weapon Proficiency"), "missing Dwarven Weapon Proficiency feature"
    test.ok npc.hasFeature("racial", "Encumbered Speed"), "missing Encumbered Speed feature"
    test.ok npc.hasFeature("racial", "Stand Your Ground"), "missing Stand Your Ground feature"
    test.done()

  "should have proficiency with warhammer and throwing hammer": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.ok "warhammer" in npc.proficiencies.weapons
    test.ok "throwingHammer" in npc.proficiencies.weapons
    test.done()
    
  "heavy armor should not affect speed": (test) ->
    new Races.Dwarf(npc = new NPC)
    speed = npc.speed.score()
    Armor.applyTo(npc, "plate")
    test.equal npc.speed.score(), speed
    test.done()

  "should add common and dwarven as languages": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.ok "common" in npc.languages, "expected common as known language"
    test.ok "dwarven" in npc.languages, "expected dwarven as known language"
    test.done()

  "should set npc height": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.ok npc.height > 0
    test.done()

  "should set npc weight": (test) ->
    new Races.Dwarf(npc = new NPC)
    test.ok npc.weight > 0
    test.done()

  "should choose male name if male": (test) ->
    npc = new NPC
    npc.gender = "male"
    dborn = new Races.Dragonborn(npc)
    test.ok npc.name in Races.Dragonborn.names.male
    test.done()

  "should choose female name if female": (test) ->
    npc = new NPC
    npc.gender = "female"
    dborn = new Races.Dragonborn(npc)
    test.ok npc.name in Races.Dragonborn.names.female
    test.done()
