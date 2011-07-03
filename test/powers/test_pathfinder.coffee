{Verify} = require '../helpers'

module.exports =
  "[WrongStep] should be defined":
    Verify.testProperties "pathfinder", "WrongStep",
      name: [ expect: "Wrong Step" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[ActTogether] should be defined":
    Verify.testProperties "pathfinder", "ActTogether",
      name: [ expect: "Act Together" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[SlashersMark] should be defined":
    Verify.testProperties "pathfinder", "SlashersMark",
      name: [ expect: "Slasher's Mark" ]
      keywords: [ expect: [ "healing", "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee", feature: { class: "Two-Blade Fighting Style" } } ]
