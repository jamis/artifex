{Verify} = require '../helpers'

module.exports =
  "[CertainJustice] should be defined":
    Verify.testProperties "championOfOrder", "CertainJustice",
      name: [ expect: "Certain Justice" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      requires: { weapon: "melee" }

  "[NoneShallPass] should be defined":
    Verify.testProperties "championOfOrder", "NoneShallPass",
      name: [ expect: "None Shall Pass" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[RuleOfOrder] should be defined":
    Verify.testProperties "championOfOrder", "RuleOfOrder",
      name: [ expect: "Rule of Order" ]
      keywords: [ expect: [ "divine", "radiant", "weapon" ] ]
      requires: { weapon: "melee" }
