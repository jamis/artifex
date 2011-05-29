{NPC, Powers, Races} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Races.Human.source, "phb"
    test.done()

  "should set name": (test) ->
    race = new Races.Human(new NPC)
    test.equal race.name, "human"
    test.done()

  "should only match human": (test) ->
    race = new Races.Human(new NPC)
    test.ok race.is("human")
    test.ok !race.is("halfling")
    test.ok !race.is("dwarf")
    test.ok !race.is("half-elf")
    test.done()
    
  "should apply racial ability bonuses": (test) ->
    new Races.Human(npc = new NPC)
    test.expect 1
    for ability in [ "str", "con", "dex", "int", "wis", "cha" ]
      test.ok true if npc.abilities[ability].has(2, "racial")
    test.done()

  "should have normal vision": (test) ->
    new Races.Human(npc = new NPC)
    test.equal "normal", npc.vision
    test.done()

  "should set size": (test) ->
    new Races.Human(npc = new NPC)
    test.equal npc.size, "medium"
    test.done()

  "should set base speed": (test) ->
    new Races.Human(npc = new NPC)
    test.equal npc.speed.baseValue, 6
    test.done()

  "should add racial features": (test) ->
    new Races.Human(npc = new NPC)
    test.ok npc.hasFeature("racial", "Bonus At-Will Power"), "missing Bonus At-Will Power feature"
    test.ok npc.hasFeature("racial", "Bonus Feat"), "missing Bonus Feat feature"
    test.ok npc.hasFeature("racial", "Bonus Skill"), "missing Bonus Skill feature"
    test.ok npc.hasFeature("racial", "Human Defense Bonuses"), "missing Human Defense Bonuses feature"
    test.done()

  "should have bonus at-will power (via Bonus At-Will Power)": (test) ->
    new Races.Human(npc = new NPC)
    test.equal npc.pendingPowers.length, 1
    test.equal npc.pendingPowers[0].count, 1
    test.equal npc.pendingPowers[0].category, "atWill"

    npc.class = name: "cleric", powers: { atWill: { 1: [ "hi" ] } }
    potentialPowers = npc.pendingPowers[0].list(npc)
    test.deepEqual potentialPowers, [ "hi" ]
    test.done()

  "should have bonus feat (via Bonus Feat)": (test) ->
    new Races.Human(npc = new NPC)
    test.equal npc.pendingFeats.length, 2
    test.equal npc.pendingFeats[1].count, 1
    test.done()
    
  "should have bonus skill (via Bonus Skill)": (test) ->
    new Races.Human(npc = new NPC)
    test.equal npc.pendingSkills.length, 1
    test.equal npc.pendingSkills[0].count, 1

    npc.class = name: "cleric", skills: [ "hi", "there" ]
    potentialSkills = npc.pendingSkills[0].list(npc)
    test.deepEqual potentialSkills, [ "hi", "there" ]

    test.done()
    
  "should have defense bonuses (via Human Defense Bonuses)": (test) ->
    new Races.Human(npc = new NPC)
    test.ok npc.defenses.fort.has(1, "racial"), "expected +1 to fortitude defense"
    test.ok npc.defenses.ref.has(1, "racial"), "expected +1 to reflex defense"
    test.ok npc.defenses.will.has(1, "racial"), "expected +1 to will defense"
    test.done()
    
  "should add common and one other as languages": (test) ->
    new Races.Human(npc = new NPC)
    test.equal npc.languages.length, 2
    test.ok "common" in npc.languages, "expected to know common"
    test.done()

  "should set npc height": (test) ->
    new Races.Human(npc = new NPC)
    test.ok npc.height > 0
    test.done()

  "should set npc weight": (test) ->
    new Races.Human(npc = new NPC)
    test.ok npc.weight > 0
    test.done()

  "should choose male name if male": (test) ->
    npc = new NPC
    npc.gender = "male"
    dborn = new Races.Human(npc)
    test.ok npc.name in Races.Human.names.male
    test.done()

  "should choose female name if female": (test) ->
    npc = new NPC
    npc.gender = "female"
    dborn = new Races.Human(npc)
    test.ok npc.name in Races.Human.names.female
    test.done()
