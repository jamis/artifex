module.exports =
  HealingWord:
    name        : "Healing Word"
    keywords    : [ "divine", "healing" ]
    attackTypes : [ "Close burst {burstSize}" ]
    frequency   : "{frequency}/encounter"
    effect      : "surge+{surgeDice}d6"
    _formulae   :
      burstSize: ["case", ["<", ".level", 11], 5, ["<", ".level", 21], 10, true, 15]
      frequency: ["if", ["<", ".level", 16], 2, 3]
      surgeDice: ["case", ["<", ".level", 6], 1, ["<", ".level", 11], 2, ["<", ".level", 16], 3, ["<", ".level", 21], 4, ["<", ".level", 26], 5, true, 6]

  DivineFortune:
    name        : "Channel Divinity: Divine Fortune"
    keywords    : [ "divine" ]

  TurnUndead:
    name        : "Channel Divinity: Turn Undead"
    keywords    : [ "divine", "implement", "radiant" ]
    attackTypes : [ "Close burst {burstSize}" ]
    attack      : "{±wis} vs. Will"
    hit         : "{hitDice}d10{±wis.nz}, push {push} (special)"
    _formulae   :
      burstSize: ["case", ["<", ".level", 11], 2, ["<", ".level", 21], 5, true, 8]
      hitDice  : ["case", ["<", ".level", 5], 1, ["<", ".level", 11], 2, ["<", ".level", 15], 3, ["<", ".level", 21], 4, ["<", ".level", 25], 5, true, 6]
      push     : ["+", 3, "#cha"]

  ArmorOfBahamut:
    name        : "Channel Divinity: Armor of Bahamut"
    keywords    : [ "divine" ]

  AvandrasRescue:
    name        : "Channel Divinity: Avandra's Rescue"
    keywords    : [ "divine" ]

  CorellonsGrace:
    name        : "Channel Divinity: Corellon's Grace"
    keywords    : [ "divine" ]

  LanceOfFaith:
    name        : "Lance of Faith"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Reflex"
    hit         : "{hitDice}d8{±wis.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }
  PriestsShield:
    name        : "Priest's Shield"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }
  RighteousBrand:
    name        : "Righteous Brand"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }
  SacredFlame:
    name        : "Sacred Flame"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Reflex"
    hit         : "{hitDice}d6{±wis.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  CauseFear:
    name        : "Cause Fear"
    keywords    : [ "divine", "fear", "implement" ]
    attack      : "{±wis} vs. Will"
    hit         : "target moves speed{±cha.nz} away from you"
  DivineGlow:
    name        : "Divine Glow"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Reflex"
    hit         : "1d8{±wis.nz} (special)"
  HealingStrike:
    name        : "Healing Strike"
    keywords    : [ "divine", "healing", "radiant", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} (special)"
  WrathfulThunder:
    name        : "Wrathful Thunder"
    keywords    : [ "divine", "thunder", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} (special)"

  AvengingFlame:
    name        : "Avenging Flame"
    keywords    : [ "divine", "fire", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} (special)"
  BeaconOfHope:
    name        : "Beacon of Hope"
    keywords    : [ "divine", "healing", "implement" ]
    attack      : "{±wis} vs. Will"
    hit         : "(special)"
  CascadeOfLight:
    name        : "Cascade of Light"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Will"
    hit         : "3d8{±wis.nz} (special)"
  GuardianOfFaith:
    name        : "Guardian of Faith"
    keywords    : [ "conjuration", "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Fort (special)"
    hit         : "1d8{±wis.nz}"

  Bless:
    name        : "Bless"
    type        : "daily"
    keywords    : [ "divine" ]
  CureLightWounds:
    name        : "Cure Light Wounds"
    type        : "daily"
    keywords    : [ "divine", "healing" ]
  DivineAid:
    name        : "Divine Aid"
    type        : "encounter"
    keywords    : [ "divine" ]
    effect      : "target gains {±cha} bonus to save"
  Sanctuary:
    name        : "Sanctuary"
    type        : "encounter"
    keywords    : [ "divine" ]
  ShieldOfFaith:
    name        : "Shield of Faith"
    type        : "daily"
    keywords    : [ "divine" ]

  BlazingBeacon:
    name        : "Blazing Beacon"
    keywords    : [ "divine", "radiant", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage (special)"
  Command:
    name        : "Command"
    keywords    : [ "charm", "divine", "implement" ]
    attack      : "{±wis} vs. Will"
    hit         : "option to slide target up to {distance} squares (special)"
    _formulae   : { distance: ["+", 3, "#cha"] }
  DauntingLight:
    name        : "Daunting Light"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Reflex"
    hit         : "2d10{±wis.nz} damage (special)"
  SplitTheSky:
    name        : "Split the Sky"
    keywords    : [ "divine", "thunder", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Fortitude"
    hit         : "1[W]{±str.nz} damage (special)"

  ConsecratedGround:
    name        : "Consecrated Ground"
    keywords    : [ "divine", "healing", "radiant", "zone" ]
    effect      : "enemies take 1d6{±cha.nz} damage, allies regain {regen} HP"
    _formulae   : { regen: ["+", 1, "#cha"] }
  RuneOfPeace:
    name        : "Rune of Peace"
    keywords    : [ "charm", "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Will"
    hit         : "1[W]{±str.nz} damage (special)"
  SpiritualWeapon:
    name        : "Spiritual Weapon"
    keywords    : [ "conjuration", "divine", "implement" ]
    attack      : "{±wis} vs. AC"
    hit         : "1d10{±wis.nz} damage (special)"
  WeaponOfTheGods:
    name        : "Weapon of the Gods"
    keywords    : [ "divine", "radiant", "weapon" ]

  BastionOfHealth:
    name        : "Bastion of Health"
    type        : "encounter"
    keywords    : [ "divine", "healing" ]
    effect      : "add {±cha} to the target's healing surge"
  CureSeriousWounds:
    name        : "Cure Serious Wounds"
    type        : "daily"
    keywords    : [ "divine", "healing" ]
  DivineVigor:
    name        : "Divine Vigor"
    type        : "daily"
    keywords    : [ "divine", "healing" ]
  HolyLantern:
    name        : "Holy Lantern"
    type        : "atWill"
    keywords    : [ "conjuration", "divine" ]

  AweStrike:
    name        : "Awe Strike"
    keywords    : [ "divine", "fear", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Will"
    hit         : "1[W]{±str.nz} damage (special)"
  BreakTheSpirit:
    name        : "Break the Spirit"
    keywords    : [ "charm", "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Will"
    hit         : "2d8{±wis.nz} damage, target takes {penalty} penalty to attack"
    _formulae   : { penalty: ["±", ["-", 0, "#cha"]] }
  SearingLight:
    name        : "Searing Light"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Reflex"
    hit         : "2d6{±wis.nz} damage (special)"
  StrengthenTheFaithful:
    name        : "Strengthen the Faithful"
    keywords    : [ "divine", "healing", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage, adjacent allies can surge at {±cha}"

  AstralDefenders:
    name        : "Astral Defenders"
    keywords    : [ "conjuration", "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Reflex (special)"
    hit         : "1d10{±wis.nz} damage"
  BladeBarrier:
    name        : "Blade Barrier"
    keywords    : [ "conjuration", "divine", "implement" ]
    effect      : "3d6{±wis.nz} damage (special)"
  DivinePower:
    name        : "Divine Power"
    keywords    : [ "divine", "healing", "radiant", "weapon" ]
    attack      : "{±str} vs. Fortitude"
    hit         : "2[W]{±str.nz} damage (special)"
  FlameStrike:
    name        : "Flame Strike"
    keywords    : [ "divine", "fire", "implement" ]
    attack      : "{±wis} vs. Reflex"
    hit         : "2d10{±wis.nz} damage, ongoing {ongoing} damage"
    _formulae   : { ongoing: ["+", 5, "#wis"] }

  AstralRefuge:
    name        : "Astral Refuge"
    type        : "daily"
    keywords    : [ "divine", "healing", "teleportation" ]
  KnightsOfUnyieldingValor:
    name        : "Knights of Unyielding Valor"
    type        : "daily"
    keywords    : [ "conjuration", "divine" ]
  MassCureLightWounds:
    name        : "Mass Cure Light Wounds"
    type        : "daily"
    keywords    : [ "divine", "healing" ]
    effect      : "targets gain HP as if spending a surge, plus {#cha} HP"
  ShieldingWord:
    name        : "Shielding Word"
    type        : "encounter"
    keywords    : [ "divine" ]
