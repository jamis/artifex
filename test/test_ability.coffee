{Ability} = require '..'

module.exports =
  "#modifier should be (n-10)/2": (test) ->
    ability = new Ability 14
    test.equal ability.modifier(), 2

    ability = new Ability 15
    test.equal ability.modifier(), 2

    ability = new Ability 9
    test.equal ability.modifier(), -1

    ability = new Ability 10
    ability.adjust 2
    test.equal ability.modifier(), 1

    test.done()
