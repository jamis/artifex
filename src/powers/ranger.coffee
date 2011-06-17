module.exports =
  HuntersQuarry:
    name        : "Hunter's Quarry"
    effect      : "deal {extra}d{quarryDie} extra damage to quarry per round"
    _formulae   :
      extra: -> @signed(@byLevel [1, 11], [2, 21], 3)
      quarryDie: -> @npc.quarryDie

  CarefulAttack:
    name        : "Careful Attack"
    keywords    : [ "martial", "weapon" ]
    attack      : "{str+2} vs. AC (melee) or {dex+2} vs. AC (ranged)"
    hit         : "{times}[W] damage"
    _formulae   :
      "str+2": -> @signed(@strM() + 2)
      "dex+2": -> @signed(@dexM() + 2)
      times  : -> @byLevel [1, 21], 2

  HitAndRun:
    name        : "Hit and Run"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{times}[W]{±str.nz} damage"
    _formulae   : { times: -> @byLevel [1, 21], 2 }

  NimbleStrike:
    name        : "Nimble Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "{times}[W]{±dex.nz} damage"
    _formulae   : { times: -> @byLevel [1, 21], 2 }

  TwinStrike:
    name        : "Twin Strike"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged), two attacks"
    hit         : "{times}[W] damage per attack"
    _formulae   : { times: -> @byLevel [1, 21], 2 }

  DireWolverineStrike:
    name        : "Dire Wolverine Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage"

  EvasiveStrike:
    name        : "Evasive Strike"
    keywords    : [ "martial", "weapon" ]
    special     : "shift {count} {squares}"
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged)"
    hit         : "2[W]{±str.nz} damage (melee) or 2[W]{±dex.nz} damage (ranged)"
    _formulae   :
      count: -> @wisM() + 1
      squares: -> @plural @count(), 'square', 'squares'

  FoxsCunning:
    name        : "Fox's Cunning"
    keywords    : [ "martial", "weapon" ]
    attack      : "basic attack {±wis}"

  TwoFangedStrike:
    name        : "Two-Fanged Strike"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged), two attacks"
    hit         : "1[W]{±str.nz} damage (melee) or 1[W]{±dex.nz} damage (ranged) per attack, {±wis} if both attacks hit"

  HuntersBearTrap:
    name        : "Hunter's Bear Trap"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged)"
    hit         : "2[W]{±str.nz} damage (melee) or 2[W]{±dex.nz} damage (ranged) (special)"

  JawsOfTheWolf:
    name        : "Jaws of the Wolf"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC, two attacks"
    hit         : "2[W]{±str.nz} damage per attack"

  SplitTheTree:
    name        : "Split the Tree"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC (special)"
    hit         : "2[W]{±dex.nz} damage"

  SuddenStrike:
    name        : "Sudden Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "1[W] damage (off-hand) (special, 2[W]{±str.nz} damage w/ main weapon)"
