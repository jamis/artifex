module.exports =
  DivineMettle:
    name        : "Channel Divinity: Divine Mettle"
    keywords    : [ "divine" ]
    effect      : "target makes a save with {save} bonus"
    _formulae   : { save: ["±", ["if", ["<", "#cha", 1], 0, "#cha"]] }

  DivineStrength:
    name        : "Channel Divinity: Divine Strength"
    keywords    : [ "divine" ]
    effect      : "apply {±str} extra damage on next attack"

  DivineChallenge:
    name        : "Divine Challenge"
    keywords    : [ "divine", "radiant" ]
    effect      : "target takes {damage} damage on first attack that excludes you (special)"
    _formulae   : { damage: ["+", ["case", ["<", ".level", 11], 3, ["<", ".level", 21], 6, true, 9], "#cha"] }

  LayOnHands:
    name        : "Lay on Hands"
    keywords    : [ "divine", "healing" ]
    frequency   : "{count}/day"
    _formulae   : { count: ["if", ["<", "#wis", 1], 1, "#wis"] }

  BolsteringStrike:
    name        : "Bolstering Strike"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "{hitDice}[W]{±cha.nz} damage, {±wis} temp HP"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  EnfeeblingStrike:
    name        : "Enfeebling Strike"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "{hitDice}[W]{±cha.nz} damage (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  HolyStrike:
    name        : "Holy Strike"
    keywords    : [ "divine", "radiant", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} damage ({marked} if marked)"
    _formulae   :
      hitDice: ["if", ["<", ".level", 21], 1, 2]
      marked:  ["±", ["+", "#str", "#wis"]]

  ValiantStrike:
    name        : "Valiant Strike"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} + 1/adjacent enemy vs. AC"
    hit         : "{hitDice}[W]{±str.nz} damage"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  FearsomeSmite:
    name        : "Fearsome Smite"
    keywords    : [ "divine", "fear", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "2[W]{±cha.nz} damage (special)"

  PiercingSmite:
    name        : "Piercing Smite"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Reflex"
    hit         : "2[W]{±str.nz} damage, mark target and {#wis} adjacent enemies"

  RadiantSmite:
    name        : "Radiant Smite"
    keywords    : [ "divine", "radiant", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{bonus} damage"
    _formulae   : { bonus: ["±", ["+", "#str", "#wis"]] }

  ShieldingSmite:
    name        : "Shielding Smite"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "2[W]{±cha.nz} damage"
    effect      : "ally w/in 5 squares gets {±wis} bonus to AC"

  OnPainOfDeath:
    name        : "On Pain of Death"
    keywords    : [ "divine", "implement" ]
    attack      : "{±cha} vs. Will"
    hit         : "3d8{±cha.nz} damage (special)"

  PaladinsJudgement:
    name        : "Paladin's Judgement"
    keywords    : [ "divine", "healing", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"

  RadiantDelirium:
    name        : "Radiant Delirium"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±cha} vs. Reflex"
    hit         : "3d8{±cha.nz} damage (special)"

  AstralSpeech:
    name        : "Astral Speech"
    type        : "daily"
    keywords    : [ "divine" ]

  MartyrsBlessing:
    name        : "Martyr's Blessing"
    type        : "daily"
    keywords    : [ "divine" ]

  SacredCircle:
    name        : "Sacred Circle"
    type        : "daily"
    keywords    : [ "divine", "implement", "zone" ]

  ArcingSmite:
    name        : "Arcing Smite"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage (special)"

  InvigoratingSmite:
    name        : "Invigorating Smite"
    keywords    : [ "divine", "healing", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. Will"
    hit         : "2[W]{±cha.nz} damage, bloodied allies regain {regen} HP"
    _formulae   : { regen: ["+", 5, "#wis"] }

  RighteousSmite:
    name        : "Righteous Smite"
    keywords    : [ "divine", "healing", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "2[W]{±cha.nz} damage, allies get {regen} temp HP"
    _formulae   : { regen: ["+", 5, "#wis"] }

  StaggeringSmite:
    name        : "Staggering Smite"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage{pushText}"
    _formulae   :
      pushText: ["if", ["<", "#wis", 1], ["~", ""], ["+", ["~", ", target pushed "], "#wis", ["if", [">", "#wis", 1], ["~", " squares"], ["~", " square"]]]]

  HallowedCircle:
    name        : "Hallowed Circle"
    keywords    : [ "divine", "implement", "zone" ]
    attack      : "{±cha} vs. Reflex"
    hit         : "2d6{±cha.nz} damage"

  MartyrsRetribution:
    name        : "Martyr's Retribution"
    keywords    : [ "divine", "radiant", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "4[W]{±str.nz} damage"

  SignOfVulnerability:
    name        : "Sign of Vulnerability"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±cha} vs. Fortitude"
    hit         : "3d8{±cha.nz} damage (special)"

  DivineBodyguard:
    name        : "Divine Bodyguard"
    type        : "daily"
    keywords    : [ "divine" ]

  OneHeartOneMind:
    name        : "One Heart, One Mind"
    type        : "daily"
    keywords    : [ "divine" ]

  WrathOfTheGods:
    name        : "Wrath of the Gods"
    type        : "daily"
    keywords    : [ "divine" ]
    effect      : "targets add {±cha} to damage rolls"

  BeckonFoe:
    name        : "Beckon Foe"
    keywords    : [ "divine", "implement" ]
    attack      : "{±cha} vs. Will"
    hit         : "2d10{±cha.nz} damage{pullText}"
    _formulae   :
      pullText: ["if", ["<", "#wis", 1], ["~", ""], ["+", ["~", ", pull target "], "#wis", ["if", [">", "#wis", 1], ["~", " squares"], ["~", " square"]]]]

  BenignTransposition:
    name        : "Benign Transposition"
    keywords    : [ "divine", "teleportation", "weapon" ]
    attackTypes : [ "melee weapon" ]
    target      : "one ally within {minRange} {squares} (primary)"
    attack      : "{±cha} vs. AC (secondary)"
    hit         : "2[W]{±cha.nz} damage (secondary)"
    _formulae   :
      minRange: ["if", ["<", "#wis", 1], 1, "#wis"]
      squares: ["if", ["=", "minRange", 1], ["~", "square"], ["~", "squares"]]

  DivineReverence:
    name        : "Divine Reverence"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±cha} vs. Will"
    hit         : "1d8{±cha.nz} damage (special)"

  ThunderSmite:
    name        : "Thunder Smite"
    keywords    : [ "divine", "thunder", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "2[W]{±str.nz} damage (special)"

  CrownOfGlory:
    name        : "Crown of Glory"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±cha} vs. Will"
    hit         : "2d8{±cha.nz} damage (special)"

  OneStandsAlone:
    name        : "One Stands Alone"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±cha} vs. Will"
    hit         : "2d8{±cha.nz} damage (special)"

  RadiantPulse:
    name        : "Radiant Pulse"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±cha} vs. Fortitude"
    hit         : "1d10{±cha.nz} damage (special)"

  CleansingSpirit:
    name        : "Cleansing Spirit"
    type        : "encounter"
    keywords    : [ "divine" ]

  NobleShield:
    name        : "Noble Shield"
    type        : "daily"
    keywords    : [ "divine" ]

  TurnTheTide:
    name        : "Turn the Tide"
    type        : "daily"
    keywords    : [ "divine" ]
