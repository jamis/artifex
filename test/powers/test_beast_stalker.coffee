{Verify} = require '../helpers'

module.exports =
  "[PinpointingArrow] should be defined":
    Verify.testProperties "beastStalker", "PinpointingArrow",
      name: [ expect: "Pinpointing Arrow" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "ranged" }

  "[HuntersGrace] should be defined":
    Verify.testProperties "beastStalker", "HuntersGrace",
      name: [ expect: "Hunter's Grace" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[BeastStalkersTarget] should be defined":
    Verify.testProperties "beastStalker", "BeastStalkersTarget",
      name: [ expect: "Beast Stalker's Target" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "ranged" }
