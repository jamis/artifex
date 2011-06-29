{Verify} = require '../helpers'

module.exports =
  "[GhostSound] should be defined":
    Verify.testProperties "wizard", "GhostSound",
      name: [ expect: "Ghost Sound" ]
      keywords: [ expect: [ "arcane", "illusion" ] ]

  "[Light] should be defined":
    Verify.testProperties "wizard", "Light",
      name: [ expect: "Light" ]
      keywords: [ expect: [ "arcane" ] ]

  "[MageHand] should be defined":
    Verify.testProperties "wizard", "MageHand",
      name: [ expect: "Mage Hand" ]
      keywords: [ expect: [ "arcane", "conjuration" ] ]

  "[Prestidigitation] should be defined":
    Verify.testProperties "wizard", "Prestidigitation",
      name: [ expect: "Prestidigitation" ]
      keywords: [ expect: [ "arcane" ] ]

  "[CloudOfDaggers] should be defined":
    Verify.testProperties "wizard", "CloudOfDaggers",
      name: [ expect: "Cloud of Daggers" ]
      keywords: [ expect: [ "arcane", "force", "implement" ] ]
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
    Verify.testProperties "wizard", "MagicMissile",
      name: [ expect: "Magic Missile" ]
      keywords: [ expect: [ "arcane", "force", "implement" ] ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, int_: 10, expect: "2d4 damage" },
        { level:  1, int_: 16, expect: "2d4+3 damage" },
        { level: 21, int_: 16, expect: "4d4+3 damage" } ]

  "[RayOfFrost] should be defined":
    Verify.testProperties "wizard", "RayOfFrost",
      name: [ expect: "Ray of Frost" ]
      keywords: [ expect: [ "arcane", "cold", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { level:  1, int_: 10, expect: "1d6 damage (special)" },
        { level:  1, int_: 16, expect: "1d6+3 damage (special)" },
        { level: 21, int_: 16, expect: "2d6+3 damage (special)" } ]

  "[ScorchingBurst] should be defined":
    Verify.testProperties "wizard", "ScorchingBurst",
      name: [ expect: "Scorching Burst" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, int_: 10, expect: "1d6 damage" },
        { level:  1, int_: 16, expect: "1d6+3 damage" },
        { level: 21, int_: 16, expect: "2d6+3 damage" } ]

  "[Thunderwave] should be defined":
    Verify.testProperties "wizard", "Thunderwave",
      name: [ expect: "Thunderwave" ]
      keywords: [ expect: [ "arcane", "implement", "thunder" ] ]
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
    Verify.testProperties "wizard", "BurningHands",
      name: [ expect: "Burning Hands" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [ { int_: 10, expect: "2d6 damage" }, { int_: 16, expect: "2d6+3 damage" } ]

  "[ChillStrike] should be defined":
    Verify.testProperties "wizard", "ChillStrike",
      name: [ expect: "Chill Strike" ]
      keywords: [ expect: [ "arcane", "cold", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "2d8 damage (special)" },
        { int_: 16, expect: "2d8+3 damage (special)" } ]

  "[ForceOrb] should be defined":
    Verify.testProperties "wizard", "ForceOrb",
      name: [ expect: "Force Orb" ]
      keywords: [ expect: [ "arcane", "force", "implement" ] ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d8 damage, 1d10 secondary (special)" },
        { int_: 16, expect: "2d8+3 damage, 1d10+3 secondary (special)" } ]

  "[IcyTerrain] should be defined":
    Verify.testProperties "wizard", "IcyTerrain",
      name: [ expect: "Icy Terrain" ]
      keywords: [ expect: [ "arcane", "cold", "implement" ] ]
      attack: [ { int_: 10, expect: "+0 vs. Reflex" }, { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "1d6 damage (special)" },
        { int_: 16, expect: "1d6+3 damage (special)" } ]

  "[RayOfEnfeeblement] should be defined":
    Verify.testProperties "wizard", "RayOfEnfeeblement",
      name: [ expect: "Ray of Enfeeblement" ]
      keywords: [ expect: [ "arcane", "implement", "necrotic" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "1d10 damage (special)" },
        { int_: 16, expect: "1d10+3 damage (special)" } ]

  "[AcidArrow] should be defined":
    Verify.testProperties "wizard", "AcidArrow",
      name: [ expect: "Acid Arrow" ]
      keywords: [ expect: [ "acid", "arcane", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d8 damage, 1d8 secondary (special)" },
        { int_: 16, expect: "2d8+3 damage, 1d8+3 secondary (special)" } ]

  "[FlamingSphere] should be defined":
    Verify.testProperties "wizard", "FlamingSphere",
      name: [ expect: "Flaming Sphere" ]
      keywords: [ expect: [ "arcane", "conjuration", "fire", "implement" ] ]
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
    Verify.testProperties "wizard", "FreezingCloud",
      name: [ expect: "Freezing Cloud" ]
      keywords: [ expect: [ "arcane", "cold", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "1d8 damage" },
        { int_: 16, expect: "1d8+3 damage" } ]

  "[Sleep] should be defined":
    Verify.testProperties "wizard", "Sleep",
      name: [ expect: "Sleep" ]
      keywords: [ expect: [ "arcane", "implement", "sleep" ] ]
      attack: [ { int_: 10, expect: "+0 vs. Will" }, { int_: 16, expect: "+3 vs. Will" } ]

  "[ExpeditiousRetreat] should be defined":
    Verify.testProperties "wizard", "ExpeditiousRetreat",
      name: [ expect: "Expeditious Retreat" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[FeatherFall] should be defined":
    Verify.testProperties "wizard", "FeatherFall",
      name: [ expect: "Feather Fall" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[Jump] should be defined":
    Verify.testProperties "wizard", "Jump",
      name: [ expect: "Jump" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane" ] ]

  "[Shield] should be defined":
    Verify.testProperties "wizard", "Shield",
      name: [ expect: "Shield" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane", "force" ] ]

  "[ColorSpray] should be defined":
    Verify.testProperties "wizard", "ColorSpray",
      name: [ expect: "Color Spray" ]
      keywords: [ expect: [ "arcane", "implement", "radiant" ] ]
      attack: [ { int_: 10, expect: "+0 vs. Will" }, { int_: 16, expect: "+3 vs. Will" } ]
      hit: [
        { int_: 10, expect: "1d6 damage (special)" },
        { int_: 16, expect: "1d6+3 damage (special)" } ]

  "[FireShroud] should be defined":
    Verify.testProperties "wizard", "FireShroud",
      name: [ expect: "Fire Shroud" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "1d8 damage (special)" },
        { int_: 16, expect: "1d8+3 damage (special)" } ]

  "[IcyRays] should be defined":
    Verify.testProperties "wizard", "IcyRays",
      name: [ expect: "Icy Rays" ]
      keywords: [ expect: [ "arcane", "cold", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "1d10 damage (special)" },
        { int_: 16, expect: "1d10+3 damage (special)" } ]

  "[ShockSphere] should be defined":
    Verify.testProperties "wizard", "ShockSphere",
      name: [ expect: "Shock Sphere" ]
      keywords: [ expect: [ "arcane", "implement", "lightning" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d6 damage" },
        { int_: 16, expect: "2d6+3 damage" } ]

  "[BigbysIcyGrasp] should be defined":
    Verify.testProperties "wizard", "BigbysIcyGrasp",
      name: [ expect: "Bigby's Icy Grasp" ]
      keywords: [ expect: [ "arcane", "cold", "conjuration", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d8 damage (special)" },
        { int_: 16, expect: "2d8+3 damage (special)" } ]

  "[Fireball] should be defined":
    Verify.testProperties "wizard", "Fireball",
      name: [ expect: "Fireball" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "3d6 damage" },
        { int_: 16, expect: "3d6+3 damage" } ]

  "[StinkingCloud] should be defined":
    Verify.testProperties "wizard", "StinkingCloud",
      name: [ expect: "Stinking Cloud" ]
      keywords: [ expect: [ "arcane", "implement", "poison", "zone" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "1d10 damage (special)" },
        { int_: 16, expect: "1d10+3 damage (special)" } ]

  "[Web] should be defined":
    Verify.testProperties "wizard", "Web",
      name: [ expect: "Web" ]
      keywords: [ expect: [ "arcane", "implement", "zone" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]

  "[DimensionDoor] should be defined":
    Verify.testProperties "wizard", "DimensionDoor",
      name: [ expect: "Dimension Door" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "teleportation" ] ]

  "[DisguiseSelf] should be defined":
    Verify.testProperties "wizard", "DisguiseSelf",
      name: [ expect: "Disguise Self" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "illusion" ] ]

  "[DispelMagic] should be defined":
    Verify.testProperties "wizard", "DispelMagic",
      name: [ expect: "Dispel Magic" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Will (special)" },
        { int_: 16, expect: "+3 vs. Will (special)" } ]

  "[Invisibility] should be defined":
    Verify.testProperties "wizard", "Invisibility",
      name: [ expect: "Invisibility" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "illusion" ] ]

  "[Levitate] should be defined":
    Verify.testProperties "wizard", "Levitate",
      name: [ expect: "Levitate" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[WallOfFog] should be defined":
    Verify.testProperties "wizard", "WallOfFog",
      name: [ expect: "Wall of Fog" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "conjuration" ] ]

  "[FireBurst] should be defined":
    Verify.testProperties "wizard", "FireBurst",
      name: [ expect: "Fire Burst" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "3d6 damage" },
        { int_: 16, expect: "3d6+3 damage" } ]

  "[LightningBolt] should be defined":
    Verify.testProperties "wizard", "LightningBolt",
      name: [ expect: "Lightning Bolt" ]
      keywords: [ expect: [ "arcane", "implement", "lightning" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d6 damage, secondary 1d6 (special)" },
        { int_: 16, expect: "2d6+3 damage, secondary 1d6+3 (special)" } ]

  "[SpectralRam] should be defined":
    Verify.testProperties "wizard", "SpectralRam",
      name: [ expect: "Spectral Ram" ]
      keywords: [ expect: [ "arcane", "force", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "2d10 damage (special)" },
        { int_: 16, expect: "2d10+3 damage (special)" } ]

  "[WintersWrath] should be defined":
    Verify.testProperties "wizard", "WintersWrath",
      name: [ expect: "Winter's Wrath" ]
      keywords: [ expect: [ "arcane", "cold", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "2d8 damage (special)" },
        { int_: 16, expect: "2d8+3 damage (special)" } ]

  "[IceStorm] should be defined":
    Verify.testProperties "wizard", "IceStorm",
      name: [ expect: "Ice Storm" ]
      keywords: [ expect: [ "arcane", "cold", "implement", "zone" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Fortitude" },
        { int_: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, expect: "2d8 damage (special)" },
        { int_: 16, expect: "2d8+3 damage (special)" } ]

  "[LightningSerpent] should be defined":
    Verify.testProperties "wizard", "LightningSerpent",
      name: [ expect: "Lightning Serpent" ]
      keywords: [ expect: [ "arcane", "implement", "lightning", "poison" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "2d12 damage (special)" },
        { int_: 16, expect: "2d12+3 damage (special)" } ]

  "[MordenkainensSword] should be defined":
    Verify.testProperties "wizard", "MordenkainensSword",
      name: [ expect: "Mordenkainen's Sword" ]
      keywords: [ expect: [ "arcane", "conjuration", "force", "implement" ] ]
      attack: [
        { int_: 10, expect: "+0 vs. Reflex" },
        { int_: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, expect: "1d10 damage (special)" },
        { int_: 16, expect: "1d10+3 damage (special)" } ]

  "[WallOfFire] should be defined":
    Verify.testProperties "wizard", "WallOfFire",
      name: [ expect: "Wall of Fire" ]
      keywords: [ expect: [ "arcane", "conjuration", "fire", "implement" ] ]
      effect: [
        { int_: 10, expect: "1d6 damage (adjacent), 3d6 damage (inside) (special)" },
        { int_: 16, expect: "1d6+3 damage (adjacent), 3d6+3 damage (inside) (special)" } ]

  "[ArcaneGate] should be defined":
    Verify.testProperties "wizard", "ArcaneGate",
      name: [ expect: "Arcane Gate" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "teleportation" ] ]

  "[Blur] should be defined":
    Verify.testProperties "wizard", "Blur",
      name: [ expect: "Blur" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "illusion" ] ]

  "[MirrorImage] should be defined":
    Verify.testProperties "wizard", "MirrorImage",
      name: [ expect: "Mirror Image" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "illusion" ] ]

  "[Resistance] should be defined":
    Verify.testProperties "wizard", "Resistance",
      name: [ expect: "Resistance" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]
      effect: [
        { int_: 10, level: 1, expect: "target gains resistance 1 vs. chosen damage type" },
        { int_: 16, level: 1, expect: "target gains resistance 4 vs. chosen damage type" },
        { int_: 10, level: 10, expect: "target gains resistance 10 vs. chosen damage type" },
        { int_: 16, level: 10, expect: "target gains resistance 13 vs. chosen damage type" } ]
