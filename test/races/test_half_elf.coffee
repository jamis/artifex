{Classes, NPC, Powers, Races} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Races.HalfElf.source, "phb"
    test.done()

  "should set name": (test) ->
    race = new Races.HalfElf(new NPC)
    test.equal race.name, "half-elf"
    test.done()

  "should apply racial ability bonuses": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.ok npc.abilities.con.has(2, "racial"), "+2 con adjustment missing"
    test.ok npc.abilities.cha.has(2, "racial"), "+2 cha adjustment missing"
    test.done()

  "should have low-light vision": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.equal "low-light", npc.vision
    test.done()

  "should apply racial skill bonuses": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.ok npc.skills.diplomacy.has(2, "racial"), "+2 diplomacy adjustment missing"
    test.ok npc.skills.insight.has(2, "racial"), "+2 insight adjustment missing"
    test.done()

  "should set size": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.equal npc.size, "medium"
    test.done()

  "should set base speed": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.equal npc.speed.baseValue, 6
    test.done()

  "should add racial features": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.ok npc.hasFeature("racial", "Dilettante"), "missing Dilettante feature"
    test.ok npc.hasFeature("racial", "Dual Heritage"), "missing Dual Heritage feature"
    test.ok npc.hasFeature("racial", "Group Diplomacy"), "missing Group Diplomacy feature"
    test.done()

  "should have extra atWill power from other class (via Dilettante)": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.equal npc.pendingPowers.length, 1
    test.equal npc.pendingPowers[0].count, 1
    test.equal npc.pendingPowers[0].category, "encounter"

    npc.class = name: "cleric"
    potentialPowers = npc.pendingPowers[0].list(npc)

    test.ok potentialPowers.length > 0, "expected at least one potential power"
    for power in potentialPowers
      test.ok power not in Classes.Cleric.powers.atWill[1]

    test.done()

  "should be considered both human and elf (via Dual Heritage)": (test) ->
    race = new Races.HalfElf(npc = new NPC)
    test.ok race.is("half-elf")
    test.ok race.is("elf")
    test.ok race.is("human")
    test.ok !race.is("dragonborn")
    test.done()

  "should add common and elven and one other as languages": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.equal npc.languages.length, 3
    test.ok "common" in npc.languages, "expected to know common"
    test.ok "elven" in npc.languages, "expected to know elven"
    test.done()

  "should set npc height": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.ok npc.height > 0
    test.done()

  "should set npc weight": (test) ->
    new Races.HalfElf(npc = new NPC)
    test.ok npc.weight > 0
    test.done()

  "should choose male name if male": (test) ->
    npc = new NPC
    npc.gender = "male"
    dborn = new Races.HalfElf(npc)
    test.ok npc.name in Races.HalfElf.names.male
    test.done()

  "should choose female name if female": (test) ->
    npc = new NPC
    npc.gender = "female"
    dborn = new Races.HalfElf(npc)
    test.ok npc.name in Races.HalfElf.names.female
    test.done()
