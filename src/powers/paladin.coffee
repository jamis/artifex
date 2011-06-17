module.exports =
  DivineMettle:
    name        : "Channel Divinity: Divine Mettle"
    keywords    : [ "divine" ]
    effect      : "target makes a save with {save} bonus"
    _formulae   : { save: -> @signed(@max(@chaM(), 0)) }

  DivineStrength:
    name        : "Channel Divinity: Divine Strength"
    keywords    : [ "divine" ]
    effect      : "apply {±str} extra damage on next attack"

  DivineChallenge:
    name        : "Divine Challenge"
    keywords    : [ "divine", "radiant" ]
    effect      : "target takes {damage} damage on first attack that excludes you (special)"
    _formulae   : { damage: -> @chaM() + @byLevel [3, 11], [6, 21], 9 }

  LayOnHands:
    name        : "Lay on Hands"
    keywords    : [ "divine", "healing" ]
    frequency   : "{count}/day"
    _formulae   : { count: -> @max(@wisM(), 1) }

  BolsteringStrike:
    name        : "Bolstering Strike"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "{hitDice}[W]{±cha.nz} damage, {±wis} temp HP"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

  EnfeeblingStrike:
    name        : "Enfeebling Strike"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "{hitDice}[W]{±cha.nz} damage (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

  HolyStrike:
    name        : "Holy Strike"
    keywords    : [ "divine", "radiant", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} damage ({marked} if marked)"
    _formulae   :
      hitDice: -> @byLevel [1, 21], 2
      marked:  -> @signed(@strM() + @wisM())

  ValiantStrike:
    name        : "Valiant Strike"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} + 1/adjacent enemy vs. AC"
    hit         : "{hitDice}[W]{±str.nz} damage"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

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
    _formulae   : { bonus: -> @signed(@strM() + @wisM()) }

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
    _formulae   : { regen: -> 5 + @wisM() }

  RighteousSmite:
    name        : "Righteous Smite"
    keywords    : [ "divine", "healing", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "2[W]{±cha.nz} damage, allies get {regen} temp HP"
    _formulae   : { regen: -> 5 + @wisM() }

  StaggeringSmite:
    name        : "Staggering Smite"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage{pushText}"
    _formulae   :
      pushText: -> if @wisM() < 1 then "" else ", target pushed #{@wisM()} #{@plural @wisM(), 'square', 'squares'}"

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
      pullText: -> if @wisM() < 1 then "" else ", pull target #{@wisM()} #{@plural @wisM(), 'square', 'squares'}"

  BenignTransposition:
    name        : "Benign Transposition"
    keywords    : [ "divine", "teleportation", "weapon" ]
    attackTypes : [ "melee weapon" ]
    target      : "one ally within {minRange} {squares} (primary)"
    attack      : "{±cha} vs. AC (secondary)"
    hit         : "2[W]{±cha.nz} damage (secondary)"
    _formulae   :
      minRange: -> @max(@wisM(), 1)
      squares : -> @plural @minRange(), "square", "squares"

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
