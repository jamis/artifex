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

  "formulae should be added to power as methods": (test) ->
    power = new Power _formulae: { one: (-> @two()), two: -> 2 }
    test.ok power.one?
    test.ok power.two?
    test.equal power.one(), 2
    test.done()

  "get() should return named property": (test) ->
    power = new Power one: "two"
    test.equal power.get("one"), "two"
    test.equal power.get("two"), undefined
    test.done()

  "process() should attempt to parse strings": (test) ->
    power = new Power
    power.parse = (str) -> test.equal str, "testing"
    test.expect 1
    power.process "testing"
    test.done()

  "process() should return strings": (test) ->
    power = new Power
    test.equal power.parse("testing"), "testing"
    test.done()

  "process() should recursively process arrays": (test) ->
    power = new Power

    n = 0
    a = [ "one", "two" ]

    power.parse = (str) -> test.equal str, a[n++]
    test.expect 2
    power.process a
    test.done()

  "process() should return arrays": (test) ->
    power = new Power
    test.deepEqual power.process(["one", "two"]), ["one", "two"]
    test.done()

  "process() should pass other values through directly": (test) ->
    power = new Power
    test.equal power.process(5), 5
    test.done()

  "should defined signed method": (test) ->
    power = new Power
    test.equal power.signed(-5), "-5"
    test.equal power.signed(0), "+0"
    test.equal power.signed(6), "+6"
    test.done()

  "should define plural method": (test) ->
    power = new Power
    test.equal power.plural(0, "thing", "things"), "things"
    test.equal power.plural(1, "thing", "things"), "thing"
    test.equal power.plural(2, "thing", "things"), "things"
    test.done()

  "should define byLevel method": (test) ->
    power = new Power npc: new NPC
    test.equal power.byLevel([5, 11], [10, 21], 15), 5
    power.npc.level = 11
    test.equal power.byLevel([5, 11], [10, 21], 15), 10
    power.npc.level = 21
    test.equal power.byLevel([5, 11], [10, 21], 15), 15
    test.done()

  "should define min method": (test) ->
    power = new Power
    test.equal power.min(1, 5), 1
    test.equal power.min(7, 5), 5
    test.done()

  "should define max method": (test) ->
    power = new Power
    test.equal power.max(1, 5), 5
    test.equal power.max(7, 5), 7
    test.done()

  "should define str method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.str.baseValue = 16
    test.equal power["str"](), 16
    test.done()

  "should define con method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.con.baseValue = 16
    test.equal power["con"](), 16
    test.done()

  "should define dex method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.dex.baseValue = 16
    test.equal power["dex"](), 16
    test.done()

  "should define int method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.int_.baseValue = 16
    test.equal power["int"](), 16
    test.equal power["int_"](), 16
    test.done()

  "should define wis method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.wis.baseValue = 16
    test.equal power["wis"](), 16
    test.done()

  "should define cha method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.cha.baseValue = 16
    test.equal power["cha"](), 16
    test.done()

  "should define #str method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.str.baseValue = 16
    test.equal power["#str"](), 3
    test.equal power["strM"](), 3
    test.done()

  "should define #con method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.con.baseValue = 16
    test.equal power["#con"](), 3
    test.equal power["conM"](), 3
    test.done()

  "should define #dex method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.dex.baseValue = 16
    test.equal power["#dex"](), 3
    test.equal power["dexM"](), 3
    test.done()

  "should define #int method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.int_.baseValue = 16
    test.equal power["#int"](), 3
    test.equal power["intM"](), 3
    test.done()

  "should define #wis method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.wis.baseValue = 16
    test.equal power["#wis"](), 3
    test.equal power["wisM"](), 3
    test.done()

  "should define #cha method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.cha.baseValue = 16
    test.equal power["#cha"](), 3
    test.done()

  "should define ±str method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.str.baseValue = 16
    test.equal power["±str"](), "+3"
    test.done()

  "should define ±con method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.con.baseValue = 16
    test.equal power["±con"](), "+3"
    test.done()

  "should define ±dex method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.dex.baseValue = 16
    test.equal power["±dex"](), "+3"
    test.done()

  "should define ±int method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.int_.baseValue = 16
    test.equal power["±int"](), "+3"
    test.done()

  "should define ±wis method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.wis.baseValue = 16
    test.equal power["±wis"](), "+3"
    test.done()

  "should define ±cha method": (test) ->
    power = new Power npc: new NPC
    power.npc.abilities.cha.baseValue = 16
    test.equal power["±cha"](), "+3"
    test.done()

  "should define ±str.nz method": (test) ->
    power = new Power npc: new NPC
    test.equal power["±str.nz"](), ""
    power.npc.abilities.str.baseValue = 16
    test.equal power["±str.nz"](), "+3"
    test.done()

  "should define ±con.nz method": (test) ->
    power = new Power npc: new NPC
    test.equal power["±con.nz"](), ""
    power.npc.abilities.con.baseValue = 16
    test.equal power["±con.nz"](), "+3"
    test.done()

  "should define ±dex.nz method": (test) ->
    power = new Power npc: new NPC
    test.equal power["±dex.nz"](), ""
    power.npc.abilities.dex.baseValue = 16
    test.equal power["±dex.nz"](), "+3"
    test.done()

  "should define ±int.nz method": (test) ->
    power = new Power npc: new NPC
    test.equal power["±int.nz"](), ""
    power.npc.abilities.int_.baseValue = 16
    test.equal power["±int.nz"](), "+3"
    test.done()

  "should define ±wis.nz method": (test) ->
    power = new Power npc: new NPC
    test.equal power["±wis.nz"](), ""
    power.npc.abilities.wis.baseValue = 16
    test.equal power["±wis.nz"](), "+3"
    test.done()

  "should define ±cha.nz method": (test) ->
    power = new Power npc: new NPC
    test.equal power["±cha.nz"](), ""
    power.npc.abilities.cha.baseValue = 16
    test.equal power["±cha.nz"](), "+3"
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
        burst: -> if @npc.level < 21 then 5 else 10
        melee: -> if @npc.level < 21 then 1 else 2

    power.npc.level = 1
    test.deepEqual power.get("attackTypes"), [ "Close burst 5", "Melee 1" ]
    power.npc.level = 21
    test.deepEqual power.get("attackTypes"), [ "Close burst 10", "Melee 2" ]
    test.done()

  "allowed() should compare attackType with weaponStyle": (test) ->
    archer = new NPC
    archer.preferredWeaponStyle = "ranged"

    swordsman = new NPC
    swordsman.preferredWeaponStyle = "melee"

    flexible = new NPC
    flexible.equipment.push "longsword"
    flexible.equipment.push "crossbow"

    melee = { attackTypes: [ "melee weapon" ] }
    ranged = { attackTypes: [ "ranged weapon" ] }
    both = { attackTypes: [ "melee weapon", "ranged weapon" ] }
    any = { }

    archer_melee = new Power melee, npc: archer
    archer_ranged = new Power ranged, npc: archer
    archer_both = new Power both, npc: archer
    archer_any = new Power any, npc: archer

    swordsman_melee = new Power melee, npc: swordsman
    swordsman_ranged = new Power ranged, npc: swordsman
    swordsman_both = new Power both, npc: swordsman
    swordsman_any = new Power any, npc: swordsman

    both_melee = new Power melee, npc: flexible
    both_ranged = new Power ranged, npc: flexible
    both_both = new Power both, npc: flexible
    both_any = new Power any, npc: flexible

    test.ok not archer_melee.allowed()
    test.ok archer_ranged.allowed()
    test.ok archer_both.allowed()
    test.ok archer_any.allowed()

    test.ok swordsman_melee.allowed()
    test.ok not swordsman_ranged.allowed()
    test.ok swordsman_both.allowed()
    test.ok swordsman_any.allowed()

    test.ok both_melee.allowed()
    test.ok both_ranged.allowed()
    test.ok both_both.allowed()
    test.ok both_any.allowed()

    test.done()

  "allowed() should return false if the power is already selected": (test) ->
    npc = new NPC
    power1 = new Power npc: npc, id: "EldritchBlast"
    power2 = new Power npc: npc, id: "EldritchBlast"
    test.ok power2.allowed()
    npc.powers.daily.push power1
    test.ok not power2.allowed()
    test.done()

  "allowed() should respect the 'trained' condition in the require key": (test) ->
    npc = new NPC
    power = new Power npc: npc, id: "FooTest", requires: { trained: 'stealth' }
    test.ok not power.allowed()
    npc.skills.stealth.trained = true
    test.ok power.allowed()
    test.done()

  "allowed() should respect the 'weapon' condition in the require key": (test) ->
    npc = new NPC
    power1 = new Power npc: npc, id: "FooTest", requires: { weapon: 'light blade' }
    power2 = new Power npc: npc, id: "FooTest", requires: { weapon: 'simple melee' }
    power3 = new Power npc: npc, id: "FooTest", requires: { weapon: 'dagger' }
    power4 = new Power npc: npc, id: "FooTest", requires: { weapon: 'longbow' }
    npc.equipment.push "dagger"
    test.ok power1.allowed(), "expected 'light blade' to match 'dagger'"
    test.ok power2.allowed(), "expected 'simple melee' to match 'dagger'"
    test.ok power3.allowed(), "expected 'dagger' to match 'dagger'"
    test.ok not power4.allowed(), "expected 'longbow' to not match 'dagger'"
    test.done()

  "allowed() should understand complicated weapon requirements": (test) ->
    npc = new NPC
    power = new Power npc: npc, id: "FooTest",
      requires: { weapon: { yes: [ 'light blade', 'heavy blade' ], no: 'polearm' } }

    npc.equipment[0] = "crossbow"
    test.ok not power.allowed()

    npc.equipment[0] = "longsword"
    test.ok power.allowed()

    npc.equipment[0] = "shortSword"
    test.ok power.allowed()

    npc.equipment[0] = "glaive"
    test.ok not power.allowed()
    test.done()
