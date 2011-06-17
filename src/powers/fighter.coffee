module.exports =
  Cleave:
    name        : "Cleave"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

  ReapingStrike:
    name        : "Reaping Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    miss        : "{halfStr} damage ({#str} w/2h weapon)"
    _formulae   :
      halfStr: -> Math.floor(@strM() / 2)
      hitDice: -> @byLevel [1, 21], 2

  SureStrike:
    name        : "Sure Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{bonus} vs. AC"
    hit         : "{hitDice}[W] damage"
    _formulae   :
      bonus  : -> @signed(@strM() + 2)
      hitDice: -> @byLevel [1, 21], 2

  TideOfIron:
    name        : "Tide of Iron"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} damage (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

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
    _formulae   : { secondBonus: -> @signed(@strM() + 2) }

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

  BoundlessEndurance:
    name        : "Boundless Endurance"
    type        : "daily"
    keywords    : [ "healing", "martial", "stance" ]
    effect      : "regeneration {regen} when bloodied"
    _formulae   : { regen: -> @conM() + 2 }

  GetOverHere:
    name        : "Get Over Here"
    type        : "encounter"
    keywords    : [ "martial" ]

  NoOpening:
    name        : "No Opening"
    type        : "encounter"
    keywords    : [ "martial" ]

  Unstoppable:
    name        : "Unstoppable"
    type        : "daily"
    keywords    : [ "healing", "martial" ]
    effect      : "gain 2d6{±con.nz} temp HP"

  ArmorPiercingThrust:
    name        : "Armor-Piercing Thrust"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Reflex{dexText}"
    hit         : "1[W]{±str.nz} damage{dexText}"
    _formulae   :
      dexBonus: -> if @dexM() is 0 then 0 else @strM() + @dexM()
      dexText : -> if @dexBonus() is 0 then "" else " (#{@signed @dexBonus()} with light blade or spear)"

  CrushingBlow:
    name        : "Crushing Blow"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage{conText}"
    _formulae   :
      conBonus: -> if @conM() is 0 then 0 else @strM() + @conM()
      conText : -> if @conBonus() is 0 then "" else " (#{@signed @conBonus()} with axe, hammer, or mace)"

  DanceOfSteel:
    name        : "Dance of Steel"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  PreciseStrike:
    name        : "Precise Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str+4} vs. AC"
    hit         : "1[W]{±str.nz} damage"
    _formulae   : { "±str+4": -> @signed(@strM() + 4) }

  RainOfBlows:
    name        : "Rain of Blows"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage{dexText}"
    _formulae   :
      dexText: -> if @dex() < 15 then "" else " (and make secondary attack if wielding light blade, spear, or flail)"

  SweepingBlow:
    name        : "Sweeping Blow"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC{strText}"
    hit         : "1[W]{±str.nz} damage"
    _formulae   :
      halfStrM: -> Math.floor(@strM() / 2)
      strBonus: -> if @halfStrM() is 0 then 0 else @strM() + @halfStrM()
      strText : -> if @strBonus() is 0 then "" else " (#{@signed @strBonus()} if wielding an axe, flail, heavy blade, or pick)"

  CrackTheShell:
    name        : "Crack the Shell"
    keywords    : [ "martial", "reliable", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  DizzyingBlow:
    name        : "Dizzying Blow"
    keywords    : [ "martial", "reliable", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"

  RainOfSteel:
    name        : "Rain of Steel"
    keywords    : [ "martial", "stance", "weapon" ]

  BattleAwareness:
    name        : "Battle Awareness"
    type        : "daily"
    keywords    : [ "martial" ]

  DefensiveTraining:
    name        : "Defensive Training"
    type        : "daily"
    keywords    : [ "martial", "stance" ]

  Unbreakable:
    name        : "Unbreakable"
    type        : "encounter"
    keywords    : [ "martial" ]
    effect      : "reduce damage from attack by {resist}"
    _formulae   : { resist: -> 5 + @conM() }

  ComeAndGetIt:
    name        : "Come and Get It"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage"

  GriffonsWrath:
    name        : "Griffon's Wrath"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  IronBulwark:
    name        : "Iron Bulwark"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage"

  RecklessStrike:
    name        : "Reckless Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str-2} vs. AC"
    hit         : "3[W]{±str.nz} damage"
    _formulae   : { "±str-2": -> @signed(@strM() - 2) }

  SuddenSurge:
    name        : "Sudden Surge"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage"
    effect      : "move {distance} {squares}"
    _formulae   :
      distance: -> if @dexM() < 1 then 1 else @dexM()
      squares : -> @plural @distance(), "square", "squares"

  ShiftTheBattlefield:
    name        : "Shift the Battlefield"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  ThicketOfBlades:
    name        : "Thicket of Blades"
    keywords    : [ "martial", "reliable", "weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"

  VictoriousSurge:
    name        : "Victorious Surge"
    keywords    : [ "martial", "reliable", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"

  IntoTheFray:
    name        : "Into the Fray"
    type        : "encounter"
    keywords    : [ "martial" ]

  LastDitchEvasion:
    name        : "Last Ditch Evasion"
    type        : "daily"
    keywords    : [ "martial" ]

  StalwartGuard:
    name        : "Stalwart Guard"
    type        : "daily"
    keywords    : [ "martial" ]
