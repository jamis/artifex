{Verify} = require '../helpers'

module.exports =
  "[GhostSound] should be defined":
    Verify.testProperties "GhostSound",
      name: [ expect: "Ghost Sound" ]

  "[Light] should be defined":
    Verify.testProperties "Light",
      name: [ expect: "Light" ]

  "[MageHand] should be defined":
    Verify.testProperties "MageHand",
      name: [ expect: "Mage Hand" ]

  "[Prestidigitation] should be defined":
    Verify.testProperties "Prestidigitation",
      name: [ expect: "Prestidigitation" ]

  "[CloudOfDaggers] should be defined":
    Verify.testProperties "CloudOfDaggers",
      name: [ expect: "Cloud of Daggers" ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, int_: 10, expect: "1d6 damage" },
        { level:  1, int_: 16, expect: "1d6+3 damage" },
        { level: 21, int_: 16, expect: "2d6+3 damage" } ]
      effect: [
        { wis: 10, expect: "creatures entering/exiting area take 1 damage" },
        { wis: 12, expect: "creatures entering/exiting area take 1 damage" },
        { wis: 16, expect: "creatures entering/exiting area take 3 damage" } ]

  "[MagicMissile] should be defined":
    Verify.testProperties "MagicMissile",
      name: [ expect: "Magic Missile" ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, int_: 10, expect: "2d4 damage" },
        { level:  1, int_: 16, expect: "2d4+3 damage" },
        { level: 21, int_: 16, expect: "4d4+3 damage" } ]

  "[RayOfFrost] should be defined":
    Verify.testProperties "RayOfFrost",
      name: [ expect: "Ray of Frost" ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { level:  1, int_: 10, expect: "1d6 damage (special)" },
        { level:  1, int_: 16, expect: "1d6+3 damage (special)" },
        { level: 21, int_: 16, expect: "2d6+3 damage (special)" } ]

  "[ScorchingBurst] should be defined":
    Verify.testProperties "ScorchingBurst",
      name: [ expect: "Scorching Burst" ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, int_: 10, expect: "1d6 damage" },
        { level:  1, int_: 16, expect: "1d6+3 damage" },
        { level: 21, int_: 16, expect: "2d6+3 damage" } ]

  "[Thunderwave] should be defined":
    Verify.testProperties "Thunderwave",
      name: [ expect: "Thunderwave" ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { level:  1, int_: 10, wis: 10, expect: "1d6 damage, push target 0 squares" },
        { level:  1, int_: 16, wis: 10, expect: "1d6+3 damage, push target 0 squares" },
        { level:  1, int_: 10, wis: 14, expect: "1d6 damage, push target 2 squares" },
        { level:  1, int_: 16, wis: 14, expect: "1d6+3 damage, push target 2 squares" },
        { level: 21, int_: 16, wis: 14, expect: "2d6+3 damage, push target 2 squares" } ]

  "[BurningHands] should be defined":
    Verify.testProperties "BurningHands",
      name: [ expect: "Burning Hands" ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [ { int_: 10, expect: "2d6 damage" }, { int_: 16, expect: "2d6+3 damage" } ]

  "[ChillStrike] should be defined":
    Verify.testProperties "ChillStrike",
      name: [ expect: "Chill Strike" ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "2d8 damage (special)" },
        { int_: 16, expect: "2d8+3 damage (special)" } ]

  "[ForceOrb] should be defined":
    Verify.testProperties "ForceOrb",
      name: [ expect: "Force Orb" ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d8 damage, 1d10 secondary (special)" },
        { int_: 16, expect: "2d8+3 damage, 1d10+3 secondary (special)" } ]

  "[IcyTerrain] should be defined":
    Verify.testProperties "IcyTerrain",
      name: [ expect: "Icy Terrain" ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "1d6 damage (special)" },
        { int_: 16, expect: "1d6+3 damage (special)" } ]

  "[RayOfEnfeeblement] should be defined":
    Verify.testProperties "RayOfEnfeeblement",
      name: [ expect: "Ray of Enfeeblement" ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "1d10 damage (special)" },
        { int_: 16, expect: "1d10+3 damage (special)" } ]

  "[AcidArrow] should be defined":
    Verify.testProperties "AcidArrow",
      name: [ expect: "Acid Arrow" ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d8 damage, 1d8 secondary (special)" },
        { int_: 16, expect: "2d8+3 damage, 1d8+3 secondary (special)" } ]

  "[FlamingSphere] should be defined":
    Verify.testProperties "FlamingSphere",
      name: [ expect: "Flaming Sphere" ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d6 damage (special)" },
        { int_: 16, expect: "2d6+3 damage (special)" } ]
      effect: [
        { int_: 10, expect: "adjacent creatures take 1d4 damage" },
        { int_: 16, expect: "adjacent creatures take 1d4+3 damage" } ]

  "[FreezingCloud] should be defined":
    Verify.testProperties "FreezingCloud",
      name: [ expect: "Freezing Cloud" ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "1d8 damage" },
        { int_: 16, expect: "1d8+3 damage" } ]

  "[Sleep] should be defined":
    Verify.testProperties "Sleep",
      name: [ expect: "Sleep" ]
      attack: [ { int_: 10, expect: "+0 vs. Will" }, { int_: 16, expect: "+3 vs. Will" } ]
