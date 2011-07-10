{Classes, ParagonPaths, NPC} = require '../..'

CombatVeteran = ParagonPaths.CombatVeteran

newWarlord = ->
  npc = new NPC
  npc.class = new Classes.Warlord npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal CombatVeteran.id, "combatVeteran"
    path = new CombatVeteran(new NPC)
    test.equal path.id, "combatVeteran"
    test.done()
    
  "should have name": (test) ->
    test.equal CombatVeteran.simpleName, "combat veteran"
    path = new CombatVeteran(new NPC)
    test.equal path.name, "combat veteran"
    test.done()

  "should require warlord class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not CombatVeteran.accepts(npc)
    test.ok CombatVeteran.accepts(newWarlord())
    test.done()

  "constructor should set initial path features": (test) ->
    new CombatVeteran(npc = newWarlord())
    test.ok npc.hasFeature("class", "Combat Veteran's Action"), "expected Combat Veteran's Action"
    test.ok npc.hasFeature("class", "Tough as Nails"), "expected Tough as Nails"
    test.ok not npc.hasFeature("class", "Battle Healer")
    test.done()

  "Tough as Nails should grant extra healing surge": (test) ->
    npc = newWarlord()
    npc.abilities.con.baseValue = 16
    surgeCount = npc.healingSurge.count.score()
    surgeValue = npc.healingSurge.value.score()
    new CombatVeteran(npc)
    test.equal npc.healingSurge.count.score(), surgeCount+1
    test.equal npc.healingSurge.value.score(), surgeValue+3 # con modifier
    test.done()
    
  "powers are accounted for": (test) ->
    test.ok "SkirmishPloy" in CombatVeteran.powers.encounter[11]
    test.ok "MissMeOnce" in CombatVeteran.powers.utility[12]
    test.ok "SuperiorTactics" in CombatVeteran.powers.daily[20]

    klass = new CombatVeteran(new NPC)
    test.equal CombatVeteran.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new CombatVeteran(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new CombatVeteran(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Battle Healer")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Battle Healer")
    test.done()
