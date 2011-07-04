{Verify} = require '../helpers'

module.exports =
  "[CatBurglarsGambit] should be defined":
    Verify.testProperties "catBurglar", "CatBurglarsGambit",
      name: [ expect: "Cat Burglar's Gambit" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: { yes: "light blade", no: "ranged" } } ]

  "[InstantEscape] should be defined":
    Verify.testProperties "catBurglar", "InstantEscape",
      name: [ expect: "Instant Escape" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[RedirectedDeath] should be defined":
    Verify.testProperties "catBurglar", "RedirectedDeath",
      name: [ expect: "Redirected Death" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: { yes: "light blade", no: "ranged" } } ]
