{Verify} = require '../helpers'

module.exports =
  "[ForcefulRetort] should be defined":
    Verify.testProperties "battleMage", "ForcefulRetort",
      name: [ expect: "Forceful Retort" ]
      keywords: [ expect: [ "arcane", "implement" ] ]

  "[ArcaneRejuvenation] should be defined":
    Verify.testProperties "battleMage", "ArcaneRejuvenation",
      name: [ expect: "Arcane Rejuvenation" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "healing" ] ]

  "[ClosingSpell] should be defined":
    Verify.testProperties "battleMage", "ClosingSpell",
      name: [ expect: "Closing Spell" ]
      keywords: [ expect: [ "arcane", "implement", "cold", "fire", "lightning", "thunder" ] ]
