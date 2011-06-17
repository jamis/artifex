module.exports =
  GhostSound:
    name        : "Ghost Sound"
    keywords    : [ "arcane", "illusion" ]

  Light:
    name        : "Light"
    keywords    : [ "arcane" ]

  MageHand:
    name        : "Mage Hand"
    keywords    : [ "arcane", "conjuration" ]

  Prestidigitation:
    name        : "Prestidigitation"
    keywords    : [ "arcane" ]

  CloudOfDaggers:
    name        : "Cloud of Daggers"
    keywords    : [ "arcane", "force", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "{dice}d6{±int.nz} damage"
    effect      : "creatures entering/exiting area take {damage} damage"
    _formulae   :
      dice  : -> @byLevel [1, 21], 2
      damage: -> @max @wisM(), 1

  MagicMissile:
    name        : "Magic Missile"
    keywords    : [ "arcane", "force", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "{dice}d4{±int.nz} damage"
    _formulae   : { dice: -> @byLevel [2, 21], 4 }

  RayOfFrost:
    name        : "Ray of Frost"
    keywords    : [ "arcane", "cold", "implement" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "{dice}d6{±int.nz} damage (special)"
    _formulae   : { dice: -> @byLevel [1, 21], 2 }

  ScorchingBurst:
    name        : "Scorching Burst"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "{dice}d6{±int.nz} damage"
    _formulae   : { dice: -> @byLevel [1, 21], 2 }

  Thunderwave:
    name        : "Thunderwave"
    keywords    : [ "arcane", "implement", "thunder" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "{dice}d6{±int.nz} damage, push target {#wis} squares"
    _formulae   : { dice: -> @byLevel [1, 21], 2 }

  BurningHands:
    name        : "Burning Hands"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "2d6{±int.nz} damage"

  ChillStrike:
    name        : "Chill Strike"
    keywords    : [ "arcane", "cold", "implement" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "2d8{±int.nz} damage (special)"

  ForceOrb:
    name        : "Force Orb"
    keywords    : [ "arcane", "force", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "2d8{±int.nz} damage, 1d10{±int.nz} secondary (special)"

  IcyTerrain:
    name        : "Icy Terrain"
    keywords    : [ "arcane", "cold", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "1d6{±int.nz} damage (special)"

  RayOfEnfeeblement:
    name        : "Ray of Enfeeblement"
    keywords    : [ "arcane", "implement", "necrotic" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "1d10{±int.nz} damage (special)"

  AcidArrow:
    name        : "Acid Arrow"
    keywords    : [ "acid", "arcane", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "2d8{±int.nz} damage, 1d8{±int.nz} secondary (special)"

  FlamingSphere:
    name        : "Flaming Sphere"
    keywords    : [ "arcane", "conjuration", "fire", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "2d6{±int.nz} damage (special)"
    effect      : "adjacent creatures take 1d4{±int.nz} damage"

  FreezingCloud:
    name        : "Freezing Cloud"
    keywords    : [ "arcane", "cold", "implement" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "1d8{±int.nz} damage"

  Sleep:
    name        : "Sleep"
    keywords    : [ "arcane", "implement", "sleep" ]
    attack      : "{±int} vs. Will"

  ExpeditiousRetreat:
    name        : "Expeditious Retreat"
    type        : "daily"
    keywords    : [ "arcane" ]

  FeatherFall:
    name        : "Feather Fall"
    type        : "daily"
    keywords    : [ "arcane" ]

  Jump:
    name        : "Jump"
    type        : "encounter"
    keywords    : [ "arcane" ]

  Shield:
    name        : "Shield"
    type        : "encounter"
    keywords    : [ "arcane", "force" ]

  ColorSpray:
    name        : "Color Spray"
    keywords    : [ "arcane", "implement", "radiant" ]
    attack      : "{±int} vs. Will"
    hit         : "1d6{±int.nz} damage (special)"

  FireShroud:
    name        : "Fire Shroud"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "1d8{±int.nz} damage (special)"

  IcyRays:
    name        : "Icy Rays"
    keywords    : [ "arcane", "cold", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "1d10{±int.nz} damage (special)"

  ShockSphere:
    name        : "Shock Sphere"
    keywords    : [ "arcane", "implement", "lightning" ]
    attack      : "{±int} vs. Reflex"
    hit         : "2d6{±int.nz} damage"

  BigbysIcyGrasp:
    name        : "Bigby's Icy Grasp"
    keywords    : [ "arcane", "cold", "conjuration", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "2d8{±int.nz} damage (special)"

  Fireball:
    name        : "Fireball"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "3d6{±int.nz} damage"

  StinkingCloud:
    name        : "Stinking Cloud"
    keywords    : [ "arcane", "implement", "poison", "zone" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "1d10{±int.nz} damage (special)"

  Web:
    name        : "Web"
    keywords    : [ "arcane", "implement", "zone" ]
    attack      : "{±int} vs. Reflex"

  DimensionDoor:
    name        : "Dimension Door"
    type        : "daily"
    keywords    : [ "arcane", "teleportation" ]

  DisguiseSelf:
    name        : "Disguise Self"
    type        : "daily"
    keywords    : [ "arcane", "illusion" ]

  DispelMagic:
    name        : "Dispel Magic"
    type        : "daily"
    keywords    : [ "arcane" ]
    attack      : "{±int} vs. Will (special)"

  Invisibility:
    name        : "Invisibility"
    type        : "daily"
    keywords    : [ "arcane", "illusion" ]

  Levitate:
    name        : "Levitate"
    type        : "daily"
    keywords    : [ "arcane" ]

  WallOfFog:
    name        : "Wall of Fog"
    type        : "daily"
    keywords    : [ "arcane", "conjuration" ]

  FireBurst:
    name        : "Fire Burst"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "3d6{±int.nz} damage"

  LightningBolt:
    name        : "Lightning Bolt"
    keywords    : [ "arcane", "implement", "lightning" ]
    attack      : "{±int} vs. Reflex"
    hit         : "2d6{±int.nz} damage, secondary 1d6{±int.nz} (special)"

  SpectralRam:
    name        : "Spectral Ram"
    keywords    : [ "arcane", "force", "implement" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "2d10{±int.nz} damage (special)"

  WintersWrath:
    name        : "Winter's Wrath"
    keywords    : [ "arcane", "cold", "implement" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "2d8{±int.nz} damage (special)"

  IceStorm:
    name        : "Ice Storm"
    keywords    : [ "arcane", "cold", "implement", "zone" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "2d8{±int.nz} damage (special)"

  LightningSerpent:
    name        : "Lightning Serpent"
    keywords    : [ "arcane", "implement", "lightning", "poison" ]
    attack      : "{±int} vs. Reflex"
    hit         : "2d12{±int.nz} damage (special)"

  MordenkainensSword:
    name        : "Mordenkainen's Sword"
    keywords    : [ "arcane", "conjuration", "force", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "1d10{±int.nz} damage (special)"

  WallOfFire:
    name        : "Wall of Fire"
    keywords    : [ "arcane", "conjuration", "fire", "implement" ]
    effect      : "1d6{±int.nz} damage (adjacent), 3d6{±int.nz} damage (inside) (special)"
