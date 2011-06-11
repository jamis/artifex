module.exports =
  Cleave:
    name        : "Cleave"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  ReapingStrike:
    name        : "Reaping Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    miss        : "{halfStr} damage ({#str} w/2h weapon)"
    _formulae   :
      halfStr: ["floor", ["/", "#str", 2]]
      hitDice: ["if", ["<", ".level", 21], 1, 2]

  SureStrike:
    name        : "Sure Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{attack} vs. AC"
    hit         : "{hitDice}[W] damage"
    _formulae   :
      attack : ["±", ["+", "#str", 2]]
      hitDice: ["if", ["<", ".level", 21], 1, 2]

  TideOfIron:
    name        : "Tide of Iron"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} damage (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  CoveringAttack:
    name        : "Covering Attack"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  PassingAttack:
    name        : "Passing Attack"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (2nd target: {secondBonus} vs. AC)"
    hit         : "1[W]{±str.nz} damage (special)"
    _formulae   : { secondBonus: ["±", ["+", "#str", 2]] }

  SpinningSweep:
    name        : "Spinning Sweep"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage (special)"

  SteelSerpentStrike:
    name        : "Steel Serpent Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  BruteStrike:
    name        : "Brute Strike"
    keywords    : [ "martial", "reliable", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage"

  ComebackStrike:
    name        : "Comeback Strike"
    keywords    : [ "healing", "martial", "reliable", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  VillainsMenace:
    name        : "Villain's Menace"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"
