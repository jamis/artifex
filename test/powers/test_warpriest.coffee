{Verify} = require '../helpers'

module.exports =
  "[BattleCry] should be defined":
    Verify.testProperties "warpriest", "BattleCry",
      name: [ expect: "Battle Cry" ]
      keywords: [ expect: [ "divine", "healing", "implement" ] ]

  "[BattleFavor] should be defined":
    Verify.testProperties "warpriest", "BattleFavor",
      name: [ expect: "Battle Favor" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "healing" ] ]

  "[BattlePyres] should be defined":
    Verify.testProperties "warpriest", "BattlePyres",
      name: [ expect: "Battle Pyres" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
