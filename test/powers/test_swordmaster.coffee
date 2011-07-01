{Verify} = require '../helpers'

module.exports =
  "[PrecisionCut] should be defined":
    Verify.testProperties "swordmaster", "PrecisionCut",
      name: [ expect: "Precision Cut" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[FantasticFlourish] should be defined":
    Verify.testProperties "swordmaster", "FantasticFlourish",
      name: [ expect: "Fantastic Flourish" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      requires: { weapon: { yes: [ "light blade", "heavy blade" ], no: "polearm" } }

  "[CrescendoSword] should be defined":
    Verify.testProperties "swordmaster", "CrescendoSword",
      name: [ expect: "Crescendo Sword" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: { yes: [ "light blade", "heavy blade" ], no: "polearm" } }
