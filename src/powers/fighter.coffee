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

  BoundlessEndurance:
    name        : "Boundless Endurance"
    type        : "daily"
    keywords    : [ "healing", "martial", "stance" ]
    effect      : "regeneration {regen} when bloodied"
    _formulae   : { regen: ["+", 2, "#con"] }

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
      dexBonus: ["if", ["=", "#dex", 0], 0, ["+", "#str", "#dex"]]
      dexText:  ["if", ["=", "dexBonus", 0], ["~", ""], ["+", ["~", " ("], ["±", "dexBonus"], ["~", " with light blade or spear)"]]]

  CrushingBlow:
    name        : "Crushing Blow"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage{conText}"
    _formulae   :
      conBonus: ["if", ["=", "#con", 0], 0, ["+", "#str", "#con"]]
      conText:  ["if", ["=", "conBonus", 0], ["~", ""], ["+", ["~", " ("], ["±", "conBonus"], ["~", " with axe, hammer, or mace)"]]]

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
    _formulae   : { "±str+4": ["±", ["+", 4, "#str"]] }

  RainOfBlows:
    name        : "Rain of Blows"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage{dexText}"
    _formulae   :
      dex    : (pow) -> pow.npc.abilities.dex.score()
      dexText:  ["if", ["<", "dex", 15], ["~", ""], ["~", " (and make secondary attack if wielding light blade, spear, or flail)"]]

  SweepingBlow:
    name        : "Sweeping Blow"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±str} vs. AC{strText}"
    hit         : "1[W]{±str.nz} damage"
    _formulae   :
      strMod  : ["floor", ["/", "#str", 2]]
      strBonus: ["if", ["=", "strMod", 0], 0, ["+", "#str", "strMod"]]
      strText:  ["if", ["=", "strBonus", 0], ["~", ""], ["+", ["~", " ("], ["±", "strBonus"], ["~", " if wielding an axe, flail, heavy blade, or pick)"]]]

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
    _formulae   : { resist: ["+", 5, "#con"] }

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
    _formulae   : { "±str-2": ["±", ["-", "#str", 2]] }

  SuddenSurge:
    name        : "Sudden Surge"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage"
    effect      : "move {distance} {squares}"
    _formulae   :
      distance: ["if", ["<", "#dex", 1], 1, "#dex"]
      squares: ["if", ["=", "distance", 1], ["~", "square"], ["~", "squares"]]

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
