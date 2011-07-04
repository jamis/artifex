{Verify} = require '../helpers'

module.exports =
  "[FrontlineSurge] should be defined":
    Verify.testProperties "astralWeapon", "CarvingAPathOfLight",
      name: [ expect: "Carving a Path of Light" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[PrayForMore] should be defined":
    Verify.testProperties "astralWeapon", "PrayForMore",
      name: [ expect: "Pray for More" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "divine" ] ]

  "[AstralWhirlwind] should be defined":
    Verify.testProperties "astralWeapon", "AstralWhirlwind",
      name: [ expect: "Astral Whirlwind" ]
      keywords: [ expect: [ "divine", "fear", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]
