{Verify} = require '../helpers'

module.exports =
  "[JustRadiance] should be defined":
    Verify.testProperties "justiciar", "JustRadiance",
      name: [ expect: "Just Radiance" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]

  "[StrikeMeInstead] should be defined":
    Verify.testProperties "justiciar", "StrikeMeInstead",
      name: [ expect: "Strike Me Instead" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[ChallengeTheUnjust] should be defined":
    Verify.testProperties "justiciar", "ChallengeTheUnjust",
      name: [ expect: "Challenge the Unjust" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
