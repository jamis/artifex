{Verify} = require '../helpers'

module.exports =
  "[BladeFlurry] should be defined":
    Verify.testProperties "swordMarshal", "BladeFlurry",
      name: [ expect: "Blade Flurry" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "heavy blade" } ]

  "[SwordMarshalsBoon] should be defined":
    Verify.testProperties "swordMarshal", "SwordMarshalsBoon",
      name: [ expect: "Sword Marshal's Boon" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[DiamondBladeOfVictory] should be defined":
    Verify.testProperties "swordMarshal", "DiamondBladeOfVictory",
      name: [ expect: "Diamond Blade of Victory" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "heavy blade" } ]
