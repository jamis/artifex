{NPC, Powers} = require '../..'

module.exports =
  "should map argument's properties on construction": (test) ->
    power = new Powers.Generic npc: new NPC, name: "Healing Word"
    test.equal power.npc.level, 1
    test.equal power.name, "Healing Word"
    test.done()

  "constructor should map all arguments' properties if given multiple objects": (test) ->
    obj = name: "Volcano", hit: "10d10"
    power = new Powers.Generic obj, npc: new NPC
    test.equal power.npc.level, 1
    test.equal power.name, "Volcano"
    test.equal power.hit, "10d10"
    test.done()

  "constructor should precompile attributes with ability score references": (test) ->
    power = new Powers.Generic npc: new NPC, attack: "{str} vs. AC"
    test.equal power.attack, "{str} vs. AC"
    test.ok typeof power._attack is "function"
    test.equal power._attack(), "+0 vs. AC"
    power.npc.abilities.str.baseValue = 16
    test.equal power._attack(), "+3 vs. AC"
    power.npc.abilities.str.baseValue = 6
    test.equal power._attack(), "-2 vs. AC"
    test.done()

  "constructor should precompile attributes with !,ability score references": (test) ->
    power = new Powers.Generic npc: new NPC, hit: "1d8{!,str}"
    test.equal power.hit, "1d8{!,str}"
    test.ok typeof power._hit is "function"
    test.equal power._hit(), "1d8"
    power.npc.abilities.str.baseValue = 16
    test.equal power._hit(), "1d8+3"
    power.npc.abilities.str.baseValue = 6
    test.equal power._hit(), "1d8-2"
    test.done()

  "constructor should precompile attributes with range comparisons": (test) ->
    power = new Powers.Generic npc: new NPC, hit: "{~,level,<,6:1,11:2,16:3,21:4,*:5}d8"
    test.ok typeof power._hit is "function"
    test.equal power._hit(), "1d8"
    power.npc.level = 6
    test.equal power._hit(), "2d8"
    power.npc.level = 11
    test.equal power._hit(), "3d8"
    power.npc.level = 16
    test.equal power._hit(), "4d8"
    power.npc.level = 21
    test.equal power._hit(), "5d8"
    test.done()

  "constructor should precompile attributes with multiple references": (test) ->
    power = new Powers.Generic npc: new NPC, hit: "{~,level,<,16:1,*:2}d8{!,str}"
    test.ok typeof power._hit is "function"
    test.equal power._hit(), "1d8"
    power.npc.level = 16
    test.equal power._hit(), "2d8"
    power.npc.abilities.str.baseValue = 16
    test.equal power._hit(), "2d8+3"
    test.done()

  "constructor should precompile raw references": (test) ->
    power = new Powers.Generic npc: new NPC, hit: "{=,str}"
    test.ok typeof power._hit is "function"
    test.equal power._hit(), "0"
    test.done()

  "constructor should precompile arithmetic references": (test) ->
    power = new Powers.Generic npc: new NPC, hit: "{/,str,2}"
    test.ok typeof power._hit is "function"
    test.equal power._hit(), "0"
    power.npc.abilities.str.baseValue = 14
    test.equal power._hit(), "1"
    power.npc.abilities.str.baseValue = 16
    test.equal power._hit(), "1"
    power.npc.abilities.str.baseValue = 18
    test.equal power._hit(), "2"
    test.done()

  "constructor should precompile sign references": (test) ->
    power = new Powers.Generic npc: new NPC, hit: "{sign,+,str,2}"
    test.ok typeof power._hit is "function"
    test.equal power._hit(), "+2"
    power.npc.abilities.str.baseValue = 4
    test.equal power._hit(), "-1"
    power.npc.abilities.str.baseValue = 6
    test.equal power._hit(), "+0"
    power.npc.abilities.str.baseValue = 16
    test.equal power._hit(), "+5"
    test.done()

  "#get should invoke functions, or return literals": (test) ->
    power = new Powers.Generic npc: new NPC, name: "Testing", hit: "{~,level,<,16:1,*:2}d8{!,str}"
    test.equal power.get("name"), "Testing"
    test.equal power.get("hit"), "1d8"
    test.done()
