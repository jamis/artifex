{Verify} = require '../helpers'

module.exports =
  "[Masterstroke] should be defined":
    Verify.testProperties "kensei", "Masterstroke",
      name: [ expect: "Masterstroke" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[UltimateParry] should be defined":
    Verify.testProperties "kensei", "UltimateParry",
      name: [ expect: "Ultimate Parry" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[WeaponsoulDance] should be defined":
    Verify.testProperties "kensei", "WeaponsoulDance",
      name: [ expect: "Weaponsoul Dance" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }
