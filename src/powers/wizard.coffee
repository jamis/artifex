module.exports =
  GhostSound:
    name        : "Ghost Sound"

  Light:
    name        : "Light"

  MageHand:
    name        : "Mage Hand"

  Prestidigitation:
    name        : "Prestidigitation"

  CloudOfDaggers:
    name        : "Cloud of Daggers"
    attack      : "{±int} vs. Reflex"
    hit         : "{dice}d6{±int.nz} damage"
    effect      : "creatures entering/exiting area take {damage} damage"
    _formulae   :
      dice  : ["if", ["<", ".level", 21], 1, 2]
      damage: ["if", ["<", "#wis", 1], 1, "#wis"]

  MagicMissile:
    name        : "Magic Missile"
    attack      : "{±int} vs. Reflex"
    hit         : "{dice}d4{±int.nz} damage"
    _formulae   : { dice  : ["if", ["<", ".level", 21], 2, 4] }

  RayOfFrost:
    name        : "Ray of Frost"
    attack      : "{±int} vs. Fortitude"
    hit         : "{dice}d6{±int.nz} damage (special)"
    _formulae   : { dice  : ["if", ["<", ".level", 21], 1, 2] }

  ScorchingBurst:
    name        : "Scorching Burst"
    attack      : "{±int} vs. Reflex"
    hit         : "{dice}d6{±int.nz} damage"
    _formulae   : { dice  : ["if", ["<", ".level", 21], 1, 2] }

  Thunderwave:
    name        : "Thunderwave"
    attack      : "{±int} vs. Fortitude"
    hit         : "{dice}d6{±int.nz} damage, push target {#wis} squares"
    _formulae   : { dice  : ["if", ["<", ".level", 21], 1, 2] }

  BurningHands:
    name        : "Burning Hands"
    attack      : "{±int} vs. Reflex"
    hit         : "2d6{±int.nz} damage"

  ChillStrike:
    name        : "Chill Strike"
    attack      : "{±int} vs. Fortitude"
    hit         : "2d8{±int.nz} damage (special)"

  ForceOrb:
    name        : "Force Orb"
    attack      : "{±int} vs. Reflex"
    hit         : "2d8{±int.nz} damage, 1d10{±int.nz} secondary (special)"

  IcyTerrain:
    name        : "Icy Terrain"
    attack      : "{±int} vs. Reflex"
    hit         : "1d6{±int.nz} damage (special)"

  RayOfEnfeeblement:
    name        : "Ray of Enfeeblement"
    attack      : "{±int} vs. Fortitude"
    hit         : "1d10{±int.nz} damage (special)"

  AcidArrow:
    name        : "Acid Arrow"
    attack      : "{±int} vs. Reflex"
    hit         : "2d8{±int.nz} damage, 1d8{±int.nz} secondary (special)"

  FlamingSphere:
    name        : "Flaming Sphere"
    attack      : "{±int} vs. Reflex"
    hit         : "2d6{±int.nz} damage (special)"
    effect      : "adjacent creatures take 1d4{±int.nz} damage"

  FreezingCloud:
    name        : "Freezing Cloud"
    attack      : "{±int} vs. Fortitude"
    hit         : "1d8{±int.nz} damage"

  Sleep:
    name        : "Sleep"
    attack      : "{±int} vs. Will"
