{Classes, ParagonPaths, NPC} = require '../..'

Kensei = ParagonPaths.Kensei

newFighter = ->
  npc = new NPC
  npc.class = new Classes.Fighter npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal Kensei.id, "kensei"
    path = new Kensei(new NPC)
    test.equal path.id, "kensei"
    test.done()
    
  "should have name": (test) ->
    test.equal Kensei.simpleName, "kensei"
    path = new Kensei(new NPC)
    test.equal path.name, "kensei"
    test.done()

  "should require fighter class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not Kensei.accepts(npc)
    test.ok Kensei.accepts(newFighter())
    test.done()

  "constructor should set initial path features": (test) ->
    new Kensei(npc = newFighter())
    test.ok npc.hasFeature("class", "Kensei Control Action"), "Kensei Control Action"
    test.ok npc.hasFeature("class", /^Kensei Focus \(.*\)$/), "expected Kensei Focus"
    test.ok not npc.hasFeature("class", "Kensei Mastery")
    test.done()

  "focus should grant attack bonus with preferred melee weapon": (test) ->
    npc = newFighter()
    npc.equipment.push "longsword"
    new Kensei(npc)
    test.ok npc.kenseiWeapon?
    test.ok npc.kenseiWeapon in npc.equipment.weapons()
    test.ok npc.attacks.general.has(1, undefined, npc.kenseiWeapon)
    test.ok not npc.damage.general.has(4, undefined, npc.kenseiWeapon)
    test.done()

  "mastery should grant damage bonus with preferred melee weapon": (test) ->
    npc = newFighter()
    npc.equipment.push "longsword"
    npc.paragonPath = new Kensei(npc)
    npc.level = 16
    npc.paragonPath.advance()
    test.ok npc.damage.general.has(4, undefined, npc.kenseiWeapon)
    test.done()

  "powers are accounted for": (test) ->
    test.ok "Masterstroke" in Kensei.powers.encounter[11]
    test.ok "UltimateParry" in Kensei.powers.utility[12]
    test.ok "WeaponsoulDance" in Kensei.powers.daily[20]

    klass = new Kensei(new NPC)
    test.equal Kensei.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new Kensei(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new Kensei(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Kensei Mastery")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Kensei Mastery")
    test.done()
