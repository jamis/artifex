{Verify} = require '../helpers'

module.exports =
  "[ProphecyOfDoom] should be defined":
    Verify.testProperties "divineOracle", "ProphecyOfDoom",
      name: [ expect: "Prophecy of Doom" ]
      keywords: [ expect: [ "divine" ] ]

  "[GoodOmens] should be defined":
    Verify.testProperties "divineOracle", "GoodOmens",
      name: [ expect: "Good Omens" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[HammerOfFate] should be defined":
    Verify.testProperties "divineOracle", "HammerOfFate",
      name: [ expect: "Hammer of Fate" ]
      keywords: [ expect: [ "divine", "implement" ] ]
