{NPC, Power} = require '..'

module.exports =
  "properties should be copied from constructor arguments": (test) ->
    power = new Power { one: "two", three: "four" }, five: "six"
    test.equal power.one, "two"
    test.equal power.three, "four"
    test.equal power.five, "six"
    test.done()

  "properties that are functions should be invoked and their return values cached": (test) ->
    n = 0
    power = new Power cached: (power) -> n++
    test.equal power.cached, 0
    test.equal power.cached, 0
    test.equal n, 1
    test.done()

  "get() should return named property": (test) ->
    power = new Power one: "two"
    test.equal power.get("one"), "two"
    test.equal power.get("two"), undefined
    test.done()

  "evaluate() should return value of named formula": (test) ->
    power = new Power _formulae: { test: 5 }
    test.equal power.evaluate("test"), 5
    test.done()

  "evaluate() should understand #str built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.str.baseValue = 16
    test.equal power.evaluate("#str"), 3
    test.done()

  "evaluate() should understand #con built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.con.baseValue = 16
    test.equal power.evaluate("#con"), 3
    test.done()

  "evaluate() should understand #dex built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.dex.baseValue = 16
    test.equal power.evaluate("#dex"), 3
    test.done()

  "evaluate() should understand #int built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.int_.baseValue = 16
    test.equal power.evaluate("#int"), 3
    test.done()

  "evaluate() should understand #wis built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.wis.baseValue = 16
    test.equal power.evaluate("#wis"), 3
    test.done()

  "evaluate() should understand #cha built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.cha.baseValue = 16
    test.equal power.evaluate("#cha"), 3
    test.done()

  "evaluate() should understand ±str built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.str.baseValue = 16
    test.equal power.evaluate("±str"), "+3"
    test.done()

  "evaluate() should understand ±con built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.con.baseValue = 16
    test.equal power.evaluate("±con"), "+3"
    test.done()

  "evaluate() should understand ±dex built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.dex.baseValue = 16
    test.equal power.evaluate("±dex"), "+3"
    test.done()

  "evaluate() should understand ±int built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.int_.baseValue = 16
    test.equal power.evaluate("±int"), "+3"
    test.done()

  "evaluate() should understand ±wis built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.wis.baseValue = 16
    test.equal power.evaluate("±wis"), "+3"
    test.done()

  "evaluate() should understand ±cha built-in formula": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.cha.baseValue = 16
    test.equal power.evaluate("±cha"), "+3"
    test.done()

  "evaluate() should understand ±str.nz built-in formula": (test) ->
    power = new Power npc: new NPC
    test.equal power.evaluate("±str.nz"), ""
    power.npc.abilities.str.baseValue = 16
    test.equal power.evaluate("±str.nz"), "+3"
    test.done()

  "evaluate() should understand ±con.nz built-in formula": (test) ->
    power = new Power npc: new NPC
    test.equal power.evaluate("±con.nz"), ""
    power.npc.abilities.con.baseValue = 16
    test.equal power.evaluate("±con.nz"), "+3"
    test.done()

  "evaluate() should understand ±dex.nz built-in formula": (test) ->
    power = new Power npc: new NPC
    test.equal power.evaluate("±dex.nz"), ""
    power.npc.abilities.dex.baseValue = 16
    test.equal power.evaluate("±dex.nz"), "+3"
    test.done()

  "evaluate() should understand ±int.nz built-in formula": (test) ->
    power = new Power npc: new NPC
    test.equal power.evaluate("±int.nz"), ""
    power.npc.abilities.int_.baseValue = 16
    test.equal power.evaluate("±int.nz"), "+3"
    test.done()

  "evaluate() should understand ±wis.nz built-in formula": (test) ->
    power = new Power npc: new NPC
    test.equal power.evaluate("±wis.nz"), ""
    power.npc.abilities.wis.baseValue = 16
    test.equal power.evaluate("±wis.nz"), "+3"
    test.done()

  "evaluate() should understand ±cha.nz built-in formula": (test) ->
    power = new Power npc: new NPC
    test.equal power.evaluate("±cha.nz"), ""
    power.npc.abilities.cha.baseValue = 16
    test.equal power.evaluate("±cha.nz"), "+3"
    test.done()

  "evaluate() should understand ± function": (test) ->
    power = new Power npc: new NPC,
      _formulae: { test1: ["±", 3], test2: ["±", -3], test3: ["±", "#cha"] }
    test.equal power.evaluate("test1"), "+3"
    test.equal power.evaluate("test2"), "-3"
    test.equal power.evaluate("test3"), "+0"
    power.npc.abilities.cha.baseValue = 16
    test.equal power.evaluate("test3"), "+3"
    test.done()

  "evaluate() should understand ~ function": (test) ->
    power = new Power npc: new NPC,
      _formulae: { test1: ["~", "#cha"], test2: ["~", "hello"] }
    test.equal power.evaluate("test1"), "#cha"
    test.equal power.evaluate("test2"), "hello"
    test.done()

  "evaluate() should understand arithmetic functions": (test) ->
    power = new Power npc: new NPC,
      _formulae:
        add : ["+", "#cha", 2]
        sub : ["-", "#cha", 2]
        mul : ["*", "#cha", 2]
        div : ["/", "#cha", 2]
        add2: ["+", "#cha", "#wis", 2]

    power.npc.abilities.cha.baseValue = 16
    power.npc.abilities.wis.baseValue = 14
    test.equal power.evaluate("add"), 5
    test.equal power.evaluate("sub"), 1
    test.equal power.evaluate("mul"), 6
    test.equal power.evaluate("div"), 1.5
    test.equal power.evaluate("add2"), 7
    test.done()

  "evaluate() should process nested formula": (test) ->
    power = new Power npc: new NPC, _formulae: { nest: ["*", ["+", 3, ["-", "#cha", "#wis"]], 2] }
    power.npc.abilities.cha.baseValue = 20 # +5
    power.npc.abilities.wis.baseValue = 16 # +3
    test.equal power.evaluate("nest"), 10 # 2 * (3 + (#cha - #wis))
    test.done()

  "evaluate() should understand if condition": (test) ->
    power = new Power npc: new NPC, _formulae: { true: ["if", true, 5], else: ["if", false, 5, 10] }
    test.equal power.evaluate("true"), 5
    test.equal power.evaluate("else"), 10
    test.done()

  "evaluate() should understand lt comparison": (test) ->
    power = new Power npc: new NPC, _formulae: { lt: ["<", "#cha", 3] }
    power.npc.abilities.cha.baseValue = 10
    test.ok power.evaluate("lt")
    power.npc.abilities.cha.baseValue = 15
    test.ok power.evaluate("lt")
    power.npc.abilities.cha.baseValue = 16
    test.ok !power.evaluate("lt")
    test.done()

  "evaluate() should understand gt comparison": (test) ->
    power = new Power npc: new NPC, _formulae: { gt: [">", "#cha", 3] }
    power.npc.abilities.cha.baseValue = 10
    test.ok !power.evaluate("gt")
    power.npc.abilities.cha.baseValue = 17
    test.ok !power.evaluate("gt")
    power.npc.abilities.cha.baseValue = 18
    test.ok power.evaluate("gt")
    test.done()

  "evaluate() should understand eq comparison": (test) ->
    power = new Power npc: new NPC, _formulae: { eq: ["=", "#cha", 3] }
    power.npc.abilities.cha.baseValue = 15
    test.ok !power.evaluate("eq")
    power.npc.abilities.cha.baseValue = 16
    test.ok power.evaluate("eq")
    power.npc.abilities.cha.baseValue = 17
    test.ok power.evaluate("eq")
    power.npc.abilities.cha.baseValue = 18
    test.ok !power.evaluate("eq")
    test.done()

  "evaluate() should understand case condition": (test) ->
    power = new Power npc: new NPC, _formulae:
      case: ["case",
        ["<", ".level", 11], 1,
        ["<", ".level", 21], 2,
        true, 3]

    power.npc.level = 1
    test.equal power.evaluate("case"), 1
    power.npc.level = 10
    test.equal power.evaluate("case"), 1
    power.npc.level = 11
    test.equal power.evaluate("case"), 2
    power.npc.level = 20
    test.equal power.evaluate("case"), 2
    power.npc.level = 21
    test.equal power.evaluate("case"), 3
    test.done()

  "evaluate() should understand floor operation": (test) ->
    power = new Power npc: new NPC, _formulae: { half: ["floor", ["/", "#str", 2]] }
    test.equal power.evaluate("half"), 0
    power.npc.abilities.str.baseValue = 16
    test.equal power.evaluate("half"), 1
    power.npc.abilities.str.baseValue = 18
    test.equal power.evaluate("half"), 2
    test.done()

  "evaluate() should understand direct references of the npc object": (test) ->
    power = new Power npc: new NPC, _formulae:
      level: ["±", ["+", ".level", 2]]
      frop : ".frop"

    power.npc.level = 5
    power.npc.frop = "gimme"

    test.equal power.evaluate("level"), 7
    test.equal power.evaluate("frop"), "gimme"
    test.done()

  "evaluate() should invoke functions": (test) ->
    power = new Power npc: new NPC, _formulae:
      will: (power) -> power.npc.defenses.will.score()

    test.equal power.evaluate("will"), 10
    power.npc.abilities.wis.baseValue = 16
    test.equal power.evaluate("will"), 13
    test.done()

  "get() should evaluate bracketed substrings before returning": (test) ->
    power = new Power npc: new NPC, attack: "{±cha} vs. AC"
    test.equal power.get("attack"), "+0 vs. AC"
    power.npc.abilities.cha.baseValue = 16
    test.equal power.get("attack"), "+3 vs. AC"
    test.done()

  "get() returning an array should evaluate each element of the array": (test) ->
    power = new Power npc: new NPC, attackTypes: [ "Close burst {burst}", "Melee {melee}" ],
      _formulae:
        burst: ["if", ["<", ".level", 21], 5, 10]
        melee: ["if", ["<", ".level", 21], 1, 2]

    power.npc.level = 1
    test.deepEqual power.get("attackTypes"), [ "Close burst 5", "Melee 1" ]
    power.npc.level = 21
    test.deepEqual power.get("attackTypes"), [ "Close burst 10", "Melee 2" ]
    test.done()
