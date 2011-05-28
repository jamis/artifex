{NPC, Powers, Races} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Races.Elf.source, "phb"
    test.done()

  "should set name": (test) ->
    race = new Races.Elf(new NPC)
    test.equal race.name, "elf"
    test.done()

  "should only match elf": (test) ->
    race = new Races.Elf(new NPC)
    test.ok race.is("elf")
    test.ok !race.is("human")
    test.ok !race.is("dwarf")
    test.ok !race.is("half-elf")
    test.done()
    
  "should apply racial ability bonuses": (test) ->
    new Races.Elf(npc = new NPC)
    test.ok npc.abilities.dex.has(2, "racial"), "+2 dex adjustment missing"
    test.ok npc.abilities.wis.has(2, "racial"), "+2 wis adjustment missing"
    test.done()

  "should have low-light vision": (test) ->
    new Races.Elf(npc = new NPC)
    test.equal "low-light", npc.vision
    test.done()

  "should apply racial skill bonuses": (test) ->
    new Races.Elf(npc = new NPC)
    test.ok npc.skills.nature.has(2, "racial"), "+2 nature adjustment missing"
    test.ok npc.skills.perception.has(2, "racial"), "+2 perception adjustment missing"
    test.done()

  "should set size": (test) ->
    new Races.Elf(npc = new NPC)
    test.equal npc.size, "medium"
    test.done()

  "should set base speed": (test) ->
    new Races.Elf(npc = new NPC)
    test.equal npc.speed.baseValue, 7
    test.done()

  "should add racial features": (test) ->
    new Races.Elf(npc = new NPC)
    test.ok npc.hasFeature("racial", "Elven Weapon Proficiency"), "missing Elven Weapon Proficiency feature"
    test.ok npc.hasFeature("racial", "Fey Origin"), "missing Fey Origin feature"
    test.ok npc.hasFeature("racial", "Group Awareness"), "missing Group Awareness feature"
    test.ok npc.hasFeature("racial", "Wild Step"), "missing Wild Step feature"
    test.ok npc.hasFeature("racial", "Elven Accuracy"), "missing Elven Accuracy feature"
    test.done()

  "should have bow proficiencies (via Elven Weapon Proficiency)": (test) ->
    new Races.Elf(npc = new NPC)
    test.ok "shortbow" in npc.proficiencies.weapons, "expected shortbow proficiency"
    test.ok "longbow" in npc.proficiencies.weapons, "expected longbow proficiency"
    test.done()

  "should add fey descriptor to npc (via Fey Origin)": (test) ->
    new Races.Elf(npc = new NPC)
    test.ok "fey" in npc.descriptors, "expected fey to be added to descriptors"
    test.done()

  "should have elven accuracy encounter power (via Elven Accuracy)": (test) ->
    new Races.Elf(npc = new NPC)
    test.equal npc.powers.encounter.length, 1
    test.equal npc.powers.encounter[0].name, "Elven Accuracy"
    test.done()
    
  "should add common and elven as languages": (test) ->
    new Races.Elf(npc = new NPC)
    test.ok "common" in npc.languages, "expected to know common"
    test.ok "elven" in npc.languages, "expected to know elven"
    test.done()

  "should set npc height": (test) ->
    new Races.Elf(npc = new NPC)
    test.ok npc.height > 0
    test.done()

  "should set npc weight": (test) ->
    new Races.Elf(npc = new NPC)
    test.ok npc.weight > 0
    test.done()

  "should choose male name if male": (test) ->
    npc = new NPC
    npc.gender = "male"
    dborn = new Races.Elf(npc)
    test.ok npc.name in Races.Elf.names.male
    test.done()

  "should choose female name if female": (test) ->
    npc = new NPC
    npc.gender = "female"
    dborn = new Races.Elf(npc)
    test.ok npc.name in Races.Elf.names.female
    test.done()
