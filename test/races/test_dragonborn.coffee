{NPC, Powers, Races} = require '../..'

hasRacialFeature = (npc, name) ->
  for feature in npc.features.racial
    return true if name is feature[0]
  false
  
module.exports =
  "should be from PHB": (test) ->
    test.equal Races.Dragonborn.source, "phb"
    test.done()

  "should set name": (test) ->
    dborn = new Races.Dragonborn(new NPC)
    test.equal dborn.name, "dragonborn"
    test.done()

  "should apply racial ability bonuses": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.ok npc.abilities.str.has(2, "racial"), "+2 strength adjustment missing"
    test.ok npc.abilities.cha.has(2, "racial"), "+2 charisma adjustment missing"
    test.done()

  "should have normal vision": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.equal "normal", npc.vision
    test.done()

  "should apply racial skill bonuses": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.ok npc.skills.history.has(2, "racial"), "+2 history adjustment missing"
    test.ok npc.skills.intimidate.has(2, "racial"), "+2 intimidate adjustment missing"
    test.done()

  "should set size": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.equal npc.size, "medium"
    test.done()

  "should set base speed": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.equal npc.speed.base, 6
    test.done()

  "should choose a descriptor": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.ok dborn.descriptor?
    test.done()

  "should add descriptor to npc": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.ok dborn.descriptor in npc.descriptors
    test.done()

  "should add racial features": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.ok hasRacialFeature(npc, "Dragonborn fury"), "missing Dragonborn fury feature"
    test.ok hasRacialFeature(npc, "Draconic heritage"), "missing Draconic heritage feature"
    test.ok hasRacialFeature(npc, "Dragon breath (#{dborn.descriptor})"), "missing Dragon breath (#{dborn.descriptor}) feature"
    test.done()

  "should grant CON bonus to healingSurge.value": (test) ->
    npc = new NPC
    npc.abilities.con.baseValue = 18
    test.equal npc.healingSurge.value.score(), 4
    dborn = new Races.Dragonborn(npc)
    test.equal npc.healingSurge.value.score(), 8
    test.done()

  "should grant Dragon breath power": (test) ->
    npc = new NPC
    test.equal npc.powers.encounter.length, 0
    dborn = new Races.Dragonborn(npc)
    test.equal npc.powers.encounter.length, 1
    test.equal "Dragon breath (#{dborn.descriptor})", npc.powers.encounter[0].name
    test.done()

  "should set npc breath range and ability": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.ok npc.breath?
    test.equal npc.breath.range, 3
    test.ok npc.breath.ability in ["str", "con", "dex"]
    test.done()

  "should add common and draconic as languages": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.ok "common" in npc.languages
    test.ok "draconic" in npc.languages
    test.done()

  "should set npc height": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
    test.ok npc.height > 0
    test.done()

  "should set npc weight": (test) ->
    npc = new NPC
    dborn = new Races.Dragonborn(npc)
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
