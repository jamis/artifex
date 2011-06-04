module.exports =
  HuntersQuarry:
    name        : "Hunter's Quarry"
    effect      : "deal {extra}d{quarryDie} extra damage to quarry per round"
    _formulae   :
      extra: ["±", ["case", ["<", ".level", 11], 1, ["<", ".level", 21], 2, true, 3]]
      quarryDie: ".quarryDie"

  CarefulAttack:
    name        : "Careful Attack"
    attack      : "{str+2} vs. AC (melee) or {dex+2} vs. AC (ranged)"
    hit         : "{times}[W] damage"
    _formulae   :
      "str+2": ["±", ["+", "#str", 2]]
      "dex+2": ["±", ["+", "#dex", 2]]
      times  : ["if", ["<", ".level", 21], 1, 2]

  HitAndRun:
    name        : "Hit and Run"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{times}[W]{±str.nz} damage"
    _formulae   : { times : ["if", ["<", ".level", 21], 1, 2] }

  NimbleStrike:
    name        : "Nimble Strike"
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "{times}[W]{±dex.nz} damage"
    _formulae   : { times : ["if", ["<", ".level", 21], 1, 2] }

  TwinStrike:
    name        : "Twin Strike"
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged), two attacks"
    hit         : "{times}[W] damage per attack"
    _formulae   : { times : ["if", ["<", ".level", 21], 1, 2] }

  DireWolverineStrike:
    name        : "Dire Wolverine Strike"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage"

  EvasiveStrike:
    name        : "Evasive Strike"
    special     : "shift {count} {squares}"
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged)"
    hit         : "2[W]{±str.nz} damage (melee) or 2[W]{±dex.nz} damage (ranged)"
    _formulae   :
      count: ["+", "#wis", 1]
      squares: ["if", ["=", "count", 1], ["~", "square"], ["~", "squares"]]

  FoxsCunning:
    name        : "Fox's Cunning"
    attack      : "basic attack {±wis}"

  TwoFangedStrike:
    name        : "Two-Fanged Strike"
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged), two attacks"
    hit         : "1[W]{±str.nz} damage (melee) or 1[W]{±dex.nz} damage (ranged) per attack, {±wis} if both attacks hit"

  HuntersBearTrap:
    name        : "Hunter's Bear Trap"
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged)"
    hit         : "2[W]{±str.nz} damage (melee) or 2[W]{±dex.nz} damage (ranged) (special)"

  JawsOfTheWolf:
    name        : "Jaws of the Wolf"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC, two attacks"
    hit         : "2[W]{±str.nz} damage per attack"

  SplitTheTree:
    name        : "Split the Tree"
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC (special)"
    hit         : "2[W]{±dex.nz} damage"

  SuddenStrike:
    name        : "Sudden Strike"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "1[W] damage (off-hand) (special, 2[W]{±str.nz} damage w/ main weapon)"
