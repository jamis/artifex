{Classes, ParagonPaths, NPC} = require '../..'

MasterInfiltrator = ParagonPaths.MasterInfiltrator

newRogue = ->
  npc = new NPC
  npc.class = new Classes.Rogue npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal MasterInfiltrator.id, "masterInfiltrator"
    path = new MasterInfiltrator(new NPC)
    test.equal path.id, "masterInfiltrator"
    test.done()
    
  "should have name": (test) ->
    test.equal MasterInfiltrator.simpleName, "master infiltrator"
    path = new MasterInfiltrator(new NPC)
    test.equal path.name, "master infiltrator"
    test.done()

  "should require rogue class": (test) ->
    npc = new NPC
    npc.class = new Classes.Cleric npc
    test.ok not MasterInfiltrator.accepts(npc)
    test.ok MasterInfiltrator.accepts(newRogue())
    test.done()

  "constructor should set initial path features": (test) ->
    new MasterInfiltrator(npc = newRogue())
    test.ok npc.hasFeature("class", "Infiltrator's Action"), "expected Infiltrator's Action"
    test.ok npc.hasFeature("class", "Skillful Infiltrator"), "expected Skillful Infiltrator"
    test.ok not npc.hasFeature("class", "Invisible Infiltrator")
    test.done()

  "Skillful Infiltrator should grant skill bonus": (test) ->
    npc = newRogue()
    test.ok not npc.skills.acrobatics.has(+2)
    test.ok not npc.skills.athletics.has(+2)
    test.ok not npc.skills.stealth.has(+2)
    new MasterInfiltrator(npc)
    test.ok npc.skills.acrobatics.has(+2)
    test.ok npc.skills.athletics.has(+2)
    test.ok npc.skills.stealth.has(+2)
    test.done()

  "powers are accounted for": (test) ->
    test.ok "DistractingWound" in MasterInfiltrator.powers.encounter[11]
    test.ok "ImpossibleToCatch" in MasterInfiltrator.powers.utility[12]
    test.ok "PainfulPuncture" in MasterInfiltrator.powers.daily[20]

    klass = new MasterInfiltrator(new NPC)
    test.equal MasterInfiltrator.powers, klass.powers
    test.done()

  "advance should do nothing if level is not significant": (test) ->
    klass = new MasterInfiltrator(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 13
    count = npc.features.class.length
    npc.paragonPath.advance()
    test.equal npc.features.class.length, count
    test.done()

  "advance should add class feature if level is significant": (test) ->
    klass = new MasterInfiltrator(npc = new NPC)
    npc.paragonPath = klass
    npc.level = 16
    test.ok not npc.hasFeature("class", "Invisible Infiltrator")
    npc.paragonPath.advance()
    test.ok npc.hasFeature("class", "Invisible Infiltrator")
    test.done()
