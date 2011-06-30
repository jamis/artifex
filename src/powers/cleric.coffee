module.exports =
  HealingWord:
    name        : "Healing Word"
    keywords    : [ "divine", "healing" ]
    attackTypes : [ "Close burst {burstSize}" ]
    frequency   : "{times}/encounter"
    effect      : "surge+{surgeDice}d6"
    _formulae   :
      burstSize: -> @byLevel [5, 11], [10, 21], 15
      times    : -> @byLevel [2, 16], 3
      surgeDice: -> @byLevel [1, 6], [2, 11], [3, 16], [4, 21], [5, 26], 6

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
      burstSize: -> @byLevel [2, 11], [5, 21], 8
      hitDice  : -> @byLevel [1, 5], [2, 11], [3, 15], [4, 21], [5, 25], 6
      push     : -> 3 + @chaM()

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
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }
  PriestsShield:
    name        : "Priest's Shield"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }
  RighteousBrand:
    name        : "Righteous Brand"
    keywords    : [ "divine", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }
  SacredFlame:
    name        : "Sacred Flame"
    keywords    : [ "divine", "implement", "radiant" ]
    attack      : "{±wis} vs. Reflex"
    hit         : "{hitDice}d6{±wis.nz} (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

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
    _formulae   : { distance: -> 3 + @chaM() }
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
    _formulae   : { regen: -> 1 + @chaM() }
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
    _formulae   : { penalty: -> @signed(-@chaM()) }
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
    _formulae   : { ongoing: -> 5 + @wisM() }

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

  ArcOfTheRighteous:
    name        : "Arc of the Righteous"
    keywords    : [ "divine", "lightning", "weapon" ]
    requires    : { weapon: "melee" }
  InspiringStrike:
    name        : "Inspiring Strike"
    keywords    : [ "divine", "healing", "weapon" ]
    requires    : { weapon: "melee" }
  MantleOfGlory:
    name        : "Mantle of Glory"
    keywords    : [ "divine", "healing", "implement", "radiant" ]
  PlagueOfDoom:
    name        : "Plague of Doom"
    keywords    : [ "divine", "implement" ]

  HolySpark:
    name        : "Holy Spark"
    keywords    : [ "divine", "lightning", "weapon" ]
    requires    : { weapon: "melee" }
  PurifyingFire:
    name        : "Purifying Fire"
    keywords    : [ "divine", "fire", "healing", "implement" ]
  SealOfWarding:
    name        : "Seal of Warding"
    keywords    : [ "divine", "implement", "radiant", "zone" ]
