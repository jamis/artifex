{Verify} = require '../helpers'

module.exports =
  "[SolarWrath] should be defined":
    Verify.testProperties "radiantServant", "SolarWrath",
      name: [ expect: "Solar Wrath" ]
      keywords: [ expect: [ "divine", "radiant" ] ]

  "[HealingSun] should be defined":
    Verify.testProperties "radiantServant", "HealingSun",
      name: [ expect: "Healing Sun" ]
      keywords: [ expect: [ "divine", "healing", "radiant", "zone" ] ]

  "[RadiantBrilliance] should be defined":
    Verify.testProperties "radiantServant", "RadiantBrilliance",
      name: [ expect: "Radiant Brilliance" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
