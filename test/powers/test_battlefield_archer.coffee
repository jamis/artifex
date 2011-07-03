{Verify} = require '../helpers'

module.exports =
  "[CombinedFire] should be defined":
    Verify.testProperties "battlefieldArcher", "CombinedFire",
      name: [ expect: "Combined Fire" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "ranged" }

  "[ArchersGlory] should be defined":
    Verify.testProperties "battlefieldArcher", "ArchersGlory",
      name: [ expect: "Archer's Glory" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[QuarrysBane] should be defined":
    Verify.testProperties "battlefieldArcher", "QuarrysBane",
      name: [ expect: "Quarry's Bane" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "ranged" }
