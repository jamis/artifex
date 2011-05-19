{NPC, Powers} = require '../..'

module.exports =
  "name should be set": (test) ->
    power = new Powers.TurnUndead(npc = new NPC)
    test.equal power.name, "Channel Divinity: Turn Undead"
    test.done()

  "range should depend on level": (test) ->
    power = new Powers.TurnUndead(npc = new NPC)
    test.equal power.range(), "Close burst 2"
    npc.level = 11
    test.equal power.range(), "Close burst 5"
    npc.level = 21
    test.equal power.range(), "Close burst 8"
    test.done()

  "attack should depend on wisdom": (test) ->
    power = new Powers.TurnUndead(npc = new NPC)
    test.equal power.attack(), "Wisdom (+0) vs. Will"
    npc.abilities.wis.baseValue = 16
    test.equal power.attack(), "Wisdom (+3) vs. Will"
    test.done()

  "hit should depend on level, wisdom, charisma": (test) ->
    power = new Powers.TurnUndead(npc = new NPC)
    test.equal power.hit(), "1d10, pushed 3 (special)"
    npc.abilities.wis.baseValue = 16
    test.equal power.hit(), "1d10+3, pushed 3 (special)"
    npc.abilities.cha.baseValue = 16
    test.equal power.hit(), "1d10+3, pushed 6 (special)"
    npc.level = 5
    test.equal power.hit(), "2d10+3, pushed 6 (special)"
    npc.level = 11
    test.equal power.hit(), "3d10+3, pushed 6 (special)"
    npc.level = 15
    test.equal power.hit(), "4d10+3, pushed 6 (special)"
    npc.level = 21
    test.equal power.hit(), "5d10+3, pushed 6 (special)"
    npc.level = 25
    test.equal power.hit(), "6d10+3, pushed 6 (special)"
    test.done()
