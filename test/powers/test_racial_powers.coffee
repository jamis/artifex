{Verify} = require '../helpers'

attrBonusIs = (attr, bonus) ->
  (power) -> power[attr].adjust bonus

module.exports =
  "[ElvenAccuracy] should be defined":
    Verify.testProperties "ElvenAccuracy",
      name: [ expect: "Elven Accuracy" ]
      effect: [
        { expect: "reroll attack at +0" }
        { when: attrBonusIs("bonus", 2), expect: "reroll attack at +2" } ]
