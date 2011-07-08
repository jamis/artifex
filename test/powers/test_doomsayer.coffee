{Verify} = require '../helpers'

module.exports =
  "[FatesEntwined] should be defined":
    Verify.testProperties "doomsayer", "FatesEntwined",
      name: [ expect: "Fates Entwined" ]
      keywords: [ expect: [ "arcane", "fear", "implement", "psychic" ] ]

  "[AccursedShroud] should be defined":
    Verify.testProperties "doomsayer", "AccursedShroud",
      name: [ expect: "Accursed Shroud" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[LongFallIntoDarkness] should be defined":
    Verify.testProperties "doomsayer", "LongFallIntoDarkness",
      name: [ expect: "Long Fall Into Darkness" ]
      keywords: [ expect: [ "arcane", "fear", "illusion", "implement", "psychic" ] ]
