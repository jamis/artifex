{Verify} = require '../helpers'

module.exports =
  "[ClearingTheGround] should be defined":
    Verify.testProperties "stormwarden", "ClearingTheGround",
      name: [ expect: "Clearing the Ground" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee", feature: { class: "Two-Blade Fighting Style" } } ]

  "[ThrowCautionToTheWind] should be defined":
    Verify.testProperties "stormwarden", "ThrowCautionToTheWind",
      name: [ expect: "Throw Caution to the Wind" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial", "stance" ] ]

  "[ColdSteelHurricane] should be defined":
    Verify.testProperties "stormwarden", "ColdSteelHurricane",
      name: [ expect: "Cold Steel Hurricane" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee", feature: { class: "Two-Blade Fighting Style" } } ]
