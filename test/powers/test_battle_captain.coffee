{Verify} = require '../helpers'

module.exports =
  "[ForceRetreat] should be defined":
    Verify.testProperties "battleCaptain", "ForceRetreat",
      name: [ expect: "Force Retreat" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[BoltOfGenius] should be defined":
    Verify.testProperties "battleCaptain", "BoltOfGenius",
      name: [ expect: "Bolt of Genius" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[CunningFlurry] should be defined":
    Verify.testProperties "battleCaptain", "CunningFlurry",
      name: [ expect: "Cunning Flurry" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]
