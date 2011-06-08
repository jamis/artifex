{NPC, Powers} = require '../..'

module.exports = Verify =
  property: (test, id, property, tests...) ->
    for conditions in tests
      power = Powers.get id, npc: new NPC
      expect = undefined
      for attribute, value of conditions
        switch attribute
          when "str", "con", "dex", "int", "wis", "cha"
            power.npc.abilities[attribute].baseValue = value
          when "expect"
            expect = value
          when "when"
            value(power)
          else
            power.npc[attribute] = value
      actual = power.get(property)
      test.deepEqual actual, expect, "expected `#{property}' to be `#{expect}', was `#{actual}'"

  testProperty: (id, property, tests...) ->
    (test) ->
      Verify.property test, id, property, tests...
      test.done()

  testProperties: (id, properties) ->
    (test) ->
      for property, tests of properties
        Verify.property test, id, property, tests...
      test.done()
