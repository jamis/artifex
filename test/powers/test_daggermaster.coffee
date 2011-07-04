{Verify} = require '../helpers'

module.exports =
  "[CriticalOpportunity] should be defined":
    Verify.testProperties "daggermaster", "CriticalOpportunity",
      name: [ expect: "Critical Opportunity" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "dagger" } ]

  "[MeditationOfTheBlade] should be defined":
    Verify.testProperties "daggermaster", "MeditationOfTheBlade",
      name: [ expect: "Meditation of the Blade" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "dagger" } ]

  "[DeepDaggerWound] should be defined":
    Verify.testProperties "daggermaster", "DeepDaggerWound",
      name: [ expect: "Deep Dagger Wound" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "dagger" } ]
