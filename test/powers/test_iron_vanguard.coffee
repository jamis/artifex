{Verify} = require '../helpers'

module.exports =
  "[FrontlineSurge] should be defined":
    Verify.testProperties "ironVanguard", "FrontlineSurge",
      name: [ expect: "Frontline Surge" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[InexorableShift] should be defined":
    Verify.testProperties "ironVanguard", "InexorableShift",
      name: [ expect: "Inexorable Shift" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[IndomitableStrength] should be defined":
    Verify.testProperties "ironVanguard", "IndomitableStrength",
      name: [ expect: "Indomitable Strength" ]
      keywords: [ expect: [ "healing", "martial", "weapon" ] ]
      requires: { weapon: "melee" }
