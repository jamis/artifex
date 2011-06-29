{NPC, Races} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Races.Eladrin.source, "phb"
    test.done()

  "should set name": (test) ->
    race = new Races.Eladrin(new NPC)
    test.equal race.name, "eladrin"
    test.done()

  "should only match eladrin": (test) ->
    race = new Races.Eladrin(new NPC)
    test.ok race.is("eladrin")
    test.ok !race.is("human")
    test.ok !race.is("elf")
    test.done()
    
  "should apply racial ability bonuses": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok npc.abilities.dex.has(2, "racial"), "+2 dex adjustment missing"
    test.ok npc.abilities.int.has(2, "racial"), "+2 int adjustment missing"
    test.done()

  "should have low-light vision": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.equal "low-light", npc.vision
    test.done()

  "should apply racial skill bonuses": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok npc.skills.arcana.has(2, "racial"), "+2 arcana adjustment missing"
    test.ok npc.skills.history.has(2, "racial"), "+2 history adjustment missing"
    test.done()

  "should set size": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.equal npc.size, "medium"
    test.done()

  "should set base speed": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.equal npc.speed.baseValue, 6
    test.done()

  "should add racial features": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok npc.hasFeature("racial", "Eladrin Education"), "missing Eladrin Education feature"
    test.ok npc.hasFeature("racial", "Eladrin Weapon Proficiency"), "missing Eladrin Weapon Proficiency feature"
    test.ok npc.hasFeature("racial", "Eladrin Will"), "missing Eladrin Will feature"
    test.ok npc.hasFeature("racial", "Fey Origin"), "missing Fey Origin feature"
    test.ok npc.hasFeature("racial", "Trance"), "missing Trance feature"
    test.ok npc.hasFeature("racial", "Fey Step"), "missing Fey Step feature"
    test.done()

  "should get an extra skill (via Eladrin Education)": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.deepEqual npc.pendingSkills, [count: 1]
    test.done()

  "should have longsword proficiency (via Eladrin Weapon Proficiency)": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok "longsword" in npc.proficiencies.weapons, "expected longsword proficiency"
    test.done()

  "should have a +1 to Will (via Eladrin Will)": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok npc.defenses.will.has(1, "racial"), "expected +1 racial bonus to Will"
    test.done()

  "should have racial bonus to saves vs charm (via Eladrin Will)": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok npc.defenses.save.has(5, "racial", "vs charm"), "expected racial bonus to saves vs. charm"
    test.done()
    
  "should add fey descriptor to npc (via Fey Origin)": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok "fey" in npc.descriptors, "expected fey to be added to descriptors"
    test.done()

  "should have fey step encounter power (via Fey Step)": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok npc.powers.find("encounter", "FeyStep")
    test.done()
    
  "should add common and elven as languages": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok "common" in npc.languages, "expected to know common"
    test.ok "elven" in npc.languages, "expected to know elven"
    test.done()

  "should set npc height": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok npc.height > 0
    test.done()

  "should set npc weight": (test) ->
    new Races.Eladrin(npc = new NPC)
    test.ok npc.weight > 0
    test.done()

  "should choose male name if male": (test) ->
    npc = new NPC
    npc.gender = "male"
    dborn = new Races.Eladrin(npc)
    test.ok npc.name in Races.Eladrin.names.male
    test.done()

  "should choose female name if female": (test) ->
    npc = new NPC
    npc.gender = "female"
    dborn = new Races.Eladrin(npc)
    test.ok npc.name in Races.Eladrin.names.female
    test.done()
