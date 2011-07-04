{Verify} = require '../helpers'

module.exports =
  "[DistractingWound] should be defined":
    Verify.testProperties "masterInfiltrator", "DistractingWound",
      name: [ expect: "Distracting Wound" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: [ "crossbow", "light blade", "sling" ] } ]

  "[ImpossibleToCatch] should be defined":
    Verify.testProperties "masterInfiltrator", "ImpossibleToCatch",
      name: [ expect: "Impossible to Catch" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[PainfulPuncture] should be defined":
    Verify.testProperties "masterInfiltrator", "PainfulPuncture",
      name: [ expect: "Painful Puncture" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: [ "crossbow", "light blade", "sling" ] } ]
