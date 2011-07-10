{Verify} = require '../helpers'

module.exports =
  "[SkirmishPloy] should be defined":
    Verify.testProperties "combatVeteran", "SkirmishPloy",
      name: [ expect: "Skirmish Ploy" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[MissMeOnce] should be defined":
    Verify.testProperties "combatVeteran", "MissMeOnce",
      name: [ expect: "Miss Me Once" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[SuperiorTactics] should be defined":
    Verify.testProperties "combatVeteran", "SuperiorTactics",
      name: [ expect: "Superior Tactics" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]
