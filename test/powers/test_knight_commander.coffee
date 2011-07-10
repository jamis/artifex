{Verify} = require '../helpers'

module.exports =
  "[SlashAndPress] should be defined":
    Verify.testProperties "knightCommander", "SlashAndPress",
      name: [ expect: "Slash and Press" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[BreakTheirNerve] should be defined":
    Verify.testProperties "knightCommander", "BreakTheirNerve",
      name: [ expect: "Break Their Nerve" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[ControlTheField] should be defined":
    Verify.testProperties "knightCommander", "ControlTheField",
      name: [ expect: "Control the Field" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]
