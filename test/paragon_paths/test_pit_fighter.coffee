{Armor, Classes, ParagonPaths, NPC} = require '../..'

PitFighter = ParagonPaths.PitFighter

newFighter = ->
  npc = new NPC
  npc.class = new Classes.Fighter npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal PitFighter.id, "pitFighter"
    path = new PitFighter(new NPC)
    test.equal path.id, "pitFighter"
    test.done()
    
  "should have name": (test) ->
    test.equal PitFighter.simpleName, "pit fighter"
    path = new PitFighter(new NPC)
    test.equal path.name, "pit fighter"
    test.done()

  "should require fighter class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not PitFighter.accepts(npc)
    test.ok PitFighter.accepts(newFighter())
    test.done()

  "constructor should set initial path features": (test) ->
    new PitFighter(npc = newFighter())
    test.ok npc.hasFeature("class", "Armor Optimization"), "expected Armor Optimization"
    test.ok npc.hasFeature("class", "Extra Damage Action"), "expected Extra Damage Action"
    test.ok not npc.hasFeature("class", "Dirty Fighting")
    test.done()

  "should have AC bonus when wearing armor": (test) ->
    npc = newFighter()
    Armor.applyTo npc, "chainmail"
    ac = npc.defenses.ac.score()
    new PitFighter(npc)
    test.equal npc.defenses.ac.score(), ac+1
    test.done()

  "Dirty Fighting should grant damage bonus when using a weapon": (test) ->
    npc = newFighter()
    npc.equipment.push "longsword"
    npc.paragonPath = new PitFighter(npc)
    npc.level = 16
    npc.abilities.wis.baseValue = 16
    damage = npc.damage.general.score()
    npc.paragonPath.advance()
    test.equal npc.damage.general.score(), damage+3
    test.done()

  "powers are accounted for": (test) ->
    test.ok "AllBetsAreOff" in PitFighter.powers.encounter[11]
    test.ok "DeadlyPayback" in PitFighter.powers.utility[12]
    test.ok "LionOfBattle" in PitFighter.powers.daily[20]

    klass = new PitFighter(new NPC)
    test.equal PitFighter.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new PitFighter(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new PitFighter(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Dirty Fighting")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Dirty Fighting")
    test.done()
