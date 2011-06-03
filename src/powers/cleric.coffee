module.exports =
  HealingWord:
    name        : "Healing Word"
    range       : "Close burst {burstSize}"
    frequency   : "{frequency}/encounter"
    effect      : "surge+{surgeDice}d6"
    _formulae   :
      burstSize: ["case", ["<", ".level", 11], 5, ["<", ".level", 21], 10, true, 15]
      frequency: ["if", ["<", ".level", 16], 2, 3]
      surgeDice: ["case", ["<", ".level", 6], 1, ["<", ".level", 11], 2, ["<", ".level", 16], 3, ["<", ".level", 21], 4, ["<", ".level", 26], 5, true, 6]

  DivineFortune:
    name        : "Channel Divinity: Divine Fortune"

  TurnUndead:
    name        : "Channel Divinity: Turn Undead"
    range       : "Close burst {burstSize}"
    attack      : "{±wis} vs. Will"
    hit         : "{hitDice}d10{±wis.nz}, push {push} (special)"
    _formulae   :
      burstSize: ["case", ["<", ".level", 11], 2, ["<", ".level", 21], 5, true, 8]
      hitDice  : ["case", ["<", ".level", 5], 1, ["<", ".level", 11], 2, ["<", ".level", 15], 3, ["<", ".level", 21], 4, ["<", ".level", 25], 5, true, 6]
      push     : ["+", 3, "#cha"]

  ArmorOfBahamut:
    name        : "Channel Divinity: Armor of Bahamut"

  AvandrasRescue:
    name        : "Channel Divinity: Avandra's Rescue"

  LanceOfFaith:
    name        : "Lance of Faith"
    attack      : "{±wis} vs. Reflex"
    hit         : "{hitDice}d8{±wis.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }
  PriestsShield:
    name        : "Priest's Shield"
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }
  RighteousBrand:
    name        : "Righteous Brand"
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }
  SacredFlame:
    name        : "Sacred Flame"
    attack      : "{±wis} vs. Reflex"
    hit         : "{hitDice}d6{±wis.nz} (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  CauseFear:
    name        : "Cause Fear"
    attack      : "{±wis} vs. Will"
    hit         : "target moves speed{±cha.nz} away from you"
  DivineGlow:
    name        : "Divine Glow"
    attack      : "{±wis} vs. Reflex"
    hit         : "1d8{±wis.nz} (special)"
  HealingStrike:
    name        : "Healing Strike"
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} (special)"
  WrathfulThunder:
    name        : "Wrathful Thunder"
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} (special)"

  AvengingFlame:
    name        : "Avenging Flame"
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} (special)"
  BeaconOfHope:
    name        : "Beacon of Hope"
    attack      : "{±wis} vs. Will"
    hit         : "(special)"
  CascadeOfLight:
    name        : "Cascade of Light"
    attack      : "{±wis} vs. Will"
    hit         : "3d8{±wis.nz} (special)"
  GuardianOfFaith:
    name        : "Guardian of Faith"
    attack      : "{±wis} vs. Fort (special)"
    hit         : "1d8{±wis.nz}"
