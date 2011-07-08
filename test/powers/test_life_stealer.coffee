{Verify} = require '../helpers'

module.exports =
  "[SoulScorch] should be defined":
    Verify.testProperties "lifeStealer", "SoulScorch",
      name: [ expect: "Soul Scorch" ]
      keywords: [ expect: [ "arcane", "fire", "implement", "necrotic" ] ]

  "[LifeSparkSummons] should be defined":
    Verify.testProperties "lifeStealer", "LifeSparkSummons",
      name: [ expect: "Life Spark Summons" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[Soultheft] should be defined":
    Verify.testProperties "lifeStealer", "Soultheft",
      name: [ expect: "Soultheft" ]
      keywords: [ expect: [ "arcane", "implement", "necrotic" ] ]
