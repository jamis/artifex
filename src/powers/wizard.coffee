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
      dice  : ["if", ["<", ".level", 21], 1, 2]
      damage: ["if", ["<", "#wis", 1], 1, "#wis"]

  MagicMissile:
    name        : "Magic Missile"
    keywords    : [ "arcane", "force", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "{dice}d4{±int.nz} damage"
    _formulae   : { dice  : ["if", ["<", ".level", 21], 2, 4] }

  RayOfFrost:
    name        : "Ray of Frost"
    keywords    : [ "arcane", "cold", "implement" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "{dice}d6{±int.nz} damage (special)"
    _formulae   : { dice  : ["if", ["<", ".level", 21], 1, 2] }

  ScorchingBurst:
    name        : "Scorching Burst"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±int} vs. Reflex"
    hit         : "{dice}d6{±int.nz} damage"
    _formulae   : { dice  : ["if", ["<", ".level", 21], 1, 2] }

  Thunderwave:
    name        : "Thunderwave"
    keywords    : [ "arcane", "implement", "thunder" ]
    attack      : "{±int} vs. Fortitude"
    hit         : "{dice}d6{±int.nz} damage, push target {#wis} squares"
    _formulae   : { dice  : ["if", ["<", ".level", 21], 1, 2] }

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
