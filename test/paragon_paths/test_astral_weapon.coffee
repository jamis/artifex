{Classes, ParagonPaths, NPC} = require '../..'

AstralWeapon = ParagonPaths.AstralWeapon

newPaladin = ->
  npc = new NPC
  npc.class = new Classes.Paladin npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal AstralWeapon.id, "astralWeapon"
    path = new AstralWeapon(new NPC)
    test.equal path.id, "astralWeapon"
    test.done()
    
  "should have name": (test) ->
    test.equal AstralWeapon.simpleName, "astral weapon"
    path = new AstralWeapon(new NPC)
    test.equal path.name, "astral weapon"
    test.done()

  "should require paladin class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not AstralWeapon.accepts(npc)
    test.ok AstralWeapon.accepts(newPaladin())
    test.done()

  "constructor should set initial path features": (test) ->
    new AstralWeapon(npc = newPaladin())
    test.ok npc.hasFeature("class", "Astral Judgement"), "expected Astral Judgement"
    test.ok npc.hasFeature("class", "Astral Rejuvenation Action"), "expected Astral Rejuvenation Action"
    test.ok not npc.hasFeature("class", "Courage from on High")
    test.done()

  "Courage from on High should grant condition bonus to fear saves": (test) ->
    npc = newPaladin()
    npc.paragonPath = new AstralWeapon(npc)
    npc.level = 16
    test.ok not npc.defenses.save.has(2, undefined, "fear")
    npc.paragonPath.advance()
    test.ok npc.defenses.save.has(2, undefined, "fear")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "CarvingAPathOfLight" in AstralWeapon.powers.encounter[11]
    test.ok "PrayForMore" in AstralWeapon.powers.utility[12]
    test.ok "AstralWhirlwind" in AstralWeapon.powers.daily[20]

    klass = new AstralWeapon(new NPC)
    test.equal AstralWeapon.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new AstralWeapon(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new AstralWeapon(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Courage from on High")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Courage from on High")
    test.done()
