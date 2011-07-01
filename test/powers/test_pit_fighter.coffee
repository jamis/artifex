{Verify} = require '../helpers'

module.exports =
  "[AllBetsAreOff] should be defined":
    Verify.testProperties "pitFighter", "AllBetsAreOff",
      name: [ expect: "All Bets Are Off" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[DeadlyPayback] should be defined":
    Verify.testProperties "pitFighter", "DeadlyPayback",
      name: [ expect: "Deadly Payback" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial", "weapon" ] ]

  "[LionOfBattle] should be defined":
    Verify.testProperties "pitFighter", "LionOfBattle",
      name: [ expect: "Lion of Battle" ]
      keywords: [ expect: [ "fear", "martial", "weapon" ] ]
      requires: { weapon: "melee" }
