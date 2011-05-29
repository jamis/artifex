{NPC, Powers, Races} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Races.Tiefling.source, "phb"
    test.done()

  "should set name": (test) ->
    race = new Races.Tiefling(new NPC)
    test.equal race.name, "tiefling"
    test.done()

  "should only match tiefling": (test) ->
    race = new Races.Tiefling(new NPC)
    test.ok race.is("tiefling")
    test.ok !race.is("human")
    test.ok !race.is("elf")
    test.done()
    
  "should apply racial ability bonuses": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.ok npc.abilities.int.has(2, "racial"), "+2 int adjustment missing"
    test.ok npc.abilities.cha.has(2, "racial"), "+2 cha adjustment missing"
    test.done()

  "should have low-light vision": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.equal "low-light", npc.vision
    test.done()

  "should apply racial skill bonuses": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.ok npc.skills.bluff.has(2, "racial"), "+2 bluff adjustment missing"
    test.ok npc.skills.stealth.has(2, "racial"), "+2 stealth adjustment missing"
    test.done()

  "should set size": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.equal npc.size, "medium"
    test.done()

  "should set base speed": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.equal npc.speed.baseValue, 6
    test.done()

  "should add racial features": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.ok npc.hasFeature("racial", "Bloodhunt"), "missing Bloodhunt feature"
    test.ok npc.hasFeature("racial", "Fire Resistance"), "missing Fire Resistance feature"
    test.ok npc.hasFeature("racial", "Infernal Wrath"), "missing Infernal Wrath feature"
    test.done()

  "should have fire resistance that is level dependent (via Fire Resistance)": (test) ->
    new Races.Tiefling(npc = new NPC)
    npc.level = 1
    test.equal npc.resistance.fire.score(), 5
    npc.level = 10
    test.equal npc.resistance.fire.score(), 10
    test.done()
    
  "should have infernal wrath encounter power (via Infernal Wrath)": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.equal npc.powers.encounter.length, 1
    test.equal npc.powers.encounter[0].name, "Infernal Wrath"
    npc.abilities.cha.baseValue = 10
    test.equal npc.powers.encounter[0].get("hit"), "+1 (special)" # includes racial +2 to cha
    npc.abilities.cha.baseValue = 16
    test.equal npc.powers.encounter[0].get("hit"), "+4 (special)" # includes racial +2 to cha
    test.done()
    
  "should add common and one other as languages": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.equal npc.languages.length, 2
    test.ok "common" in npc.languages, "expected to know common"
    test.done()

  "should set npc height": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.ok npc.height > 0
    test.done()

  "should set npc weight": (test) ->
    new Races.Tiefling(npc = new NPC)
    test.ok npc.weight > 0
    test.done()

  "should choose male name if male": (test) ->
    npc = new NPC
    npc.gender = "male"
    dborn = new Races.Tiefling(npc)
    test.ok npc.name in Races.Tiefling.names.male
    test.done()

  "should choose female name if female": (test) ->
    npc = new NPC
    npc.gender = "female"
    dborn = new Races.Tiefling(npc)
    test.ok npc.name in Races.Tiefling.names.female
    test.done()
