{Verify} = require '../helpers'

module.exports =
  "[BloodPulse] should be defined":
    Verify.testProperties "bloodMage", "BloodPulse",
      name: [ expect: "Blood Pulse" ]
      keywords: [ expect: [ "arcane", "implement" ] ]

  "[SoulBurn] should be defined":
    Verify.testProperties "bloodMage", "SoulBurn",
      name: [ expect: "Soul Burn" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[DestructiveSalutation] should be defined":
    Verify.testProperties "bloodMage", "DestructiveSalutation",
      name: [ expect: "Destructive Salutation" ]
      keywords: [ expect: [ "arcane", "implement", "psychic" ] ]
