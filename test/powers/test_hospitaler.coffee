{Verify} = require '../helpers'

module.exports =
  "[WardingBlow] should be defined":
    Verify.testProperties "hospitaler", "WardingBlow",
      name: [ expect: "Warding Blow" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      requires: { weapon: "melee" }

  "[HealingFont] should be defined":
    Verify.testProperties "hospitaler", "HealingFont",
      name: [ expect: "Healing Font" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "healing" ] ]

  "[LifeGivingSmite] should be defined":
    Verify.testProperties "hospitaler", "LifeGivingSmite",
      name: [ expect: "Life-Giving Smite" ]
      keywords: [ expect: [ "divine", "healing", "radiant", "weapon" ] ]
      requires: { weapon: "melee" }
