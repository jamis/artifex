{Classes, ParagonPaths, NPC} = require '../..'

ShadowAssassin = ParagonPaths.ShadowAssassin

newRogue = ->
  npc = new NPC
  npc.class = new Classes.Rogue npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal ShadowAssassin.id, "shadowAssassin"
    path = new ShadowAssassin(new NPC)
    test.equal path.id, "shadowAssassin"
    test.done()
    
  "should have name": (test) ->
    test.equal ShadowAssassin.simpleName, "shadow assassin"
    path = new ShadowAssassin(new NPC)
    test.equal path.name, "shadow assassin"
    test.done()

  "should require rogue class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not ShadowAssassin.accepts(npc)
    test.ok ShadowAssassin.accepts(newRogue())
    test.done()

  "constructor should set initial path features": (test) ->
    new ShadowAssassin(npc = newRogue())
    test.ok npc.hasFeature("class", "Shadow Assassin's Action"), "expected Shadow Assassin's Action"
    test.ok npc.hasFeature("class", "Shadow Assassin's Riposte"), "expected Shadow Assassin's Riposte"
    test.ok not npc.hasFeature("class", "Bloody Evisceration")
    test.done()

  "powers are accounted for": (test) ->
    test.ok "KillersEye" in ShadowAssassin.powers.encounter[11]
    test.ok "BadIdeaFriend" in ShadowAssassin.powers.utility[12]
    test.ok "FinalBlow" in ShadowAssassin.powers.daily[20]

    klass = new ShadowAssassin(new NPC)
    test.equal ShadowAssassin.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new ShadowAssassin(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new ShadowAssassin(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Bloody Evisceration")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Bloody Evisceration")
    test.done()
