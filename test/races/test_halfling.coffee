{NPC, Powers, Races} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Races.Halfling.source, "phb"
    test.done()

  "should set name": (test) ->
    race = new Races.Halfling(new NPC)
    test.equal race.name, "halfling"
    test.done()

  "should only match halfling": (test) ->
    race = new Races.Halfling(new NPC)
    test.ok race.is("halfling")
    test.ok !race.is("human")
    test.ok !race.is("dwarf")
    test.ok !race.is("half-elf")
    test.done()
    
  "should apply racial ability bonuses": (test) ->
    new Races.Halfling(npc = new NPC)
    test.ok npc.abilities.dex.has(2, "racial"), "+2 dex adjustment missing"
    test.ok npc.abilities.cha.has(2, "racial"), "+2 cha adjustment missing"
    test.done()

  "should have normal vision": (test) ->
    new Races.Halfling(npc = new NPC)
    test.equal "normal", npc.vision
    test.done()

  "should apply racial skill bonuses": (test) ->
    new Races.Halfling(npc = new NPC)
    test.ok npc.skills.acrobatics.has(2, "racial"), "+2 acrobatics adjustment missing"
    test.ok npc.skills.thievery.has(2, "racial"), "+2 thievery adjustment missing"
    test.done()

  "should set size": (test) ->
    new Races.Halfling(npc = new NPC)
    test.equal npc.size, "small"
    test.done()

  "should set base speed": (test) ->
    new Races.Halfling(npc = new NPC)
    test.equal npc.speed.baseValue, 6
    test.done()

  "should add racial features": (test) ->
    new Races.Halfling(npc = new NPC)
    test.ok npc.hasFeature("racial", "Bold"), "missing Bold feature"
    test.ok npc.hasFeature("racial", "Nimble Reaction"), "missing Nimble Reaction feature"
    test.ok npc.hasFeature("racial", "Second Chance"), "missing Second Chance feature"
    test.done()

  "should have racial bonus to saves vs fear (via Bold)": (test) ->
    new Races.Halfling(npc = new NPC)
    test.ok npc.defenses.save.has(5, "racial", "vs fear"), "expected racial bonus to saves vs. fear"
    test.done()
    
  "should have racial bonus to AC vs. opportunity attacks (via Nimble Reaction)": (test) ->
    new Races.Halfling(npc = new NPC)
    test.ok npc.defenses.ac.has(2, "racial", "vs opportunity attack"), "expected racial bonus to AC vs. opportunity attack"
    test.done()

  "should have second chance encounter power (via Second Chance)": (test) ->
    new Races.Halfling(npc = new NPC)
    test.equal npc.powers.encounter.length, 1
    test.equal npc.powers.encounter[0].name, "Second Chance"
    test.done()
    
  "should add common and one other as languages": (test) ->
    new Races.Halfling(npc = new NPC)
    test.equal npc.languages.length, 2
    test.ok "common" in npc.languages, "expected to know common"
    test.done()

  "should set npc height": (test) ->
    new Races.Halfling(npc = new NPC)
    test.ok npc.height > 0
    test.done()

  "should set npc weight": (test) ->
    new Races.Halfling(npc = new NPC)
    test.ok npc.weight > 0
    test.done()

  "should choose male name if male": (test) ->
    npc = new NPC
    npc.gender = "male"
    dborn = new Races.Halfling(npc)
    test.ok npc.name in Races.Halfling.names.male
    test.done()

  "should choose female name if female": (test) ->
    npc = new NPC
    npc.gender = "female"
    dborn = new Races.Halfling(npc)
    test.ok npc.name in Races.Halfling.names.female
    test.done()
