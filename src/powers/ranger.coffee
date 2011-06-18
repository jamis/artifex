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

  CrucialAdvice:
    name        : "Crucial Advice"
    type        : "encounter"
    keywords    : [ "martial" ]
    effect      : "ally rerolls skill check with {±wis} bonus"

  UnbalancingParry:
    name        : "Unbalancing Parry"
    type        : "encounter"
    keywords    : [ "martial", "weapon" ]

  YieldGround:
    name        : "Yield Ground"
    type        : "encounter"
    keywords    : [ "martial" ]
    effect      : "shift {#wis} {squares}"
    _formulae:
      squares: -> @plural @wisM(), "square", "squares"

  CutAndRun:
    name        : "Cut and Run"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged) (special)"
    hit         : "1[W]{±str.nz} damage (melee) or 1[W]{±dex.nz} damage (ranged), shift {distance} {squares}"
    _formulae:
      distance: -> @max(1 + @wisM(), 1)
      squares: -> @plural @distance(), "square", "squares"

  DisruptiveStrike:
    name        : "Disruptive Strike"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged)"
    hit         : "1[W]{±str.nz} damage (melee) or 1[W]{±dex.nz} damage (ranged), target takes {penalty} attack penalty"
    _formulae: { penalty: -> @signed(-(3 + @wisM())) }

  ShadowWaspStrike:
    name        : "Shadow Wasp Strike"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged)"
    hit         : "2[W]{±str.nz} damage (melee) or 2[W]{±dex.nz} damage (ranged)"

  ThundertuskBoarStrike:
    name        : "Thundertusk Boar Strike"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged) (special)"
    hit         : "1[W]{±str.nz} damage (melee) or 1[W]{±dex.nz} damage (ranged), push target {distance} {squares} (special)"
    _formulae:
      distance: -> @max(1 + @wisM(), 1)
      squares: -> @plural @distance(), "square", "squares"

  ExcruciatingShot:
    name        : "Excruciating Shot"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "3[W]{±dex.nz} damage (special)"

  FrenziedSkirmish:
    name        : "Frenzied Skirmish"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "1[W]{±str.nz} damage (special)"

  SplinteringShot:
    name        : "Splintering Shot"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "3[W]{±dex.nz} damage (special)"

  TwoWolfPounce:
    name        : "Two-Wolf Pounce"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "2[W]{±str.nz} damage (main), 1[W]{±str.nz} damage (off-hand) (special)"

  EvadeAmbush:
    name        : "Evade Ambush"
    type        : "daily"
    keywords    : [ "martial" ]
    effect      : "{#wis} {alliesAvoid} surprise"
    _formulae:
      alliesAvoid: -> @plural @wisM(), "ally avoids", "allies avoid"

  SkilledCompanion:
    name        : "Skilled Companion"
    type        : "daily"
    keywords    : [ "martial" ]
    effect      : "ally gets {±wis} to skill check"

  WeaveThroughTheFray:
    name        : "Weave through the Fray"
    type        : "encounter"
    keywords    : [ "martial" ]
    effect      : "shift {#wis} {squares}"
    _formulae   :
      squares: -> @plural @wisM(), "square", "squares"

  ClawsOfTheGriffon:
    name        : "Claws of the Griffon"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "2[W]{±str.nz} damage (main), 1[W]{±str.nz} damage (off-hand)"

  HawksTalon:
    name        : "Hawk's Talon"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str+wis} vs. AC (melee) or {±dex+wis} vs. AC (ranged) (special)"
    hit         : "2[W]{±str.nz} damage (melee) or 2[W]{±dex.nz} damage (ranged)"
    _formulae   :
      "±str+wis": -> @signed(@strM() + @wisM())
      "±dex+wis": -> @signed(@dexM() + @wisM())

  SpikesOfTheManticore:
    name        : "Spikes of the Manticore"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC (special)"
    hit         : "2[W]{±dex.nz} damage (first), 1[W]{±dex.nz} damage (second)"

  SweepingWhirlwind:
    name        : "Sweeping Whirlwind"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage, target pushed {#wis} {squares} (special)"
    _formulae:
      squares: -> @plural @wisM(), "square", "squares"

  AttacksOnTheRun:
    name        : "Attacks on the Run"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC (melee) or {±dex} vs. AC (ranged) (special)"
    hit         : "3[W]{±str.nz} damage (melee) or 3[W]{±dex.nz} damage (ranged)"

  CloseQuartersShot:
    name        : "Close Quarters Shot"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC (special)"
    hit         : "4[W]{±dex.nz} damage"

  SprayOfArrows:
    name        : "Spray of Arrows"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "ranged weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±dex.nz} damage"

  SwirlingLeavesOfSteel:
    name        : "Swirling Leaves of Steel"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "2[W]{±str.nz} damage"

  ExpeditiousStride:
    name        : "Expeditious Stride"
    type        : "encounter"
    keywords    : [ "martial" ]

  OpenTheRange:
    name        : "Open the Range"
    type        : "daily"
    keywords    : [ "martial" ]
    effect      : "move {count} {squares} (special)"
    _formulae   :
      count: -> @wisM() + 1
      squares: -> @plural @count(), "square", "squares"

  UndauntedStride:
    name        : "Undaunted Stride"
    type        : "daily"
    keywords    : [ "martial", "stance" ]
