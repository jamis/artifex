{Verify} = require '../helpers'

module.exports =
  "[TheOneSword] should be defined":
    Verify.testProperties "wizardOfTheSpiralTower", "TheOneSword",
      name: [ expect: "The One Sword" ]
      keywords: [ expect: [ "arcane", "weapon" ] ]
      requires: { weapon: "melee" }

  "[ShapeTheDream] should be defined":
    Verify.testProperties "wizardOfTheSpiralTower", "ShapeTheDream",
      name: [ expect: "Shape the Dream" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "implement" ] ]

  "[CorellonsBlade] should be defined":
    Verify.testProperties "wizardOfTheSpiralTower", "CorellonsBlade",
      name: [ expect: "Corellon's Blade" ]
      keywords: [ expect: [ "arcane", "radiant", "teleportation", "weapon" ] ]
      requires: { weapon: "longsword" }
