{Verify} = require '../helpers'

module.exports =
  "[StormCage] should be defined":
    Verify.testProperties "spellstormMage", "StormCage",
      name: [ expect: "Storm Cage" ]
      keywords: [ expect: [ "arcane", "conjuration", "implement", "lightning", "thunder" ] ]

  "[SuddenStorm] should be defined":
    Verify.testProperties "spellstormMage", "SuddenStorm",
      name: [ expect: "Sudden Storm" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "zone" ] ]

  "[MaelstromOfChaos] should be defined":
    Verify.testProperties "spellstormMage", "MaelstromOfChaos",
      name: [ expect: "Maelstrom of Chaos" ]
      keywords: [ expect: [ "arcane", "force", "implement", "teleportation" ] ]
