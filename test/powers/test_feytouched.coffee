{Verify} = require '../helpers'

module.exports =
  "[WillOfTheFeywild] should be defined":
    Verify.testProperties "feytouched", "WillOfTheFeywild",
      name: [ expect: "Will of the Feywild" ]
      keywords: [ expect: [ "arcane", "charm", "implement", "psychic", "teleportation" ] ]

  "[TwilightTeleport] should be defined":
    Verify.testProperties "feytouched", "TwilightTeleport",
      name: [ expect: "Twilight Teleport" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "teleportation" ] ]

  "[WhispersOfTheFey] should be defined":
    Verify.testProperties "feytouched", "WhispersOfTheFey",
      name: [ expect: "Whispers of the Fey" ]
      keywords: [ expect: [ "arcane", "implement", "psychic" ] ]
