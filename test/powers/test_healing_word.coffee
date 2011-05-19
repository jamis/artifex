{NPC, Powers} = require '../..'

module.exports =
  "frequency should depend on NPC level": (test) ->
    npc = new NPC
    power = new Powers.HealingWord(npc)
    test.equal power.frequency(), 2
    npc.level = 15
    test.equal power.frequency(), 2
    npc.level = 16
    test.equal power.frequency(), 3
    test.done()

  "effect should depend on NPC level": (test) ->
    npc = new NPC
    power = new Powers.HealingWord(npc)
    test.equal power.effect(), "+1d6"
    npc.level = 6
    test.equal power.effect(), "+2d6"
    npc.level = 11
    test.equal power.effect(), "+3d6"
    npc.level = 16
    test.equal power.effect(), "+4d6"
    npc.level = 21
    test.equal power.effect(), "+5d6"
    npc.level = 26
    test.equal power.effect(), "+6d6"
    test.done()

  "range should depend on NPC level": (test) ->
    npc = new NPC
    power = new Powers.HealingWord(npc)
    test.equal power.range(), "Close burst 5"
    npc.level = 11
    test.equal power.range(), "Close burst 10"
    npc.level = 21
    test.equal power.range(), "Close burst 15"
    test.done()
