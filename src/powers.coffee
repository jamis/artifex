DragonBreath   = require './powers/dragon_breath'
Generic        = require './powers/generic'

powerGetter = (key, initializers...) ->
  if typeof Powers[key] is "function"
    new Powers[key](initializers...)
  else
    new Generic Powers[key], initializers...

module.exports = Powers =
  get: powerGetter
    
  DragonBreath  : DragonBreath
  Generic       : Generic

  HealingWord:
    name        : "Healing Word"
    range       : "Close burst {=level<11:5,21:10,*:15}"
    frequency   : "{=level<16:2,*:3}"
    effect      : "surge+{=level<6:1,11:2,16:3,21:4,26:5,*:6}d6"
  DivineFortune:
    name        : "Channel Divinity: Divine Fortune"
  TurnUndead:
    name        : "Channel Divinity: Turn Undead"
    range       : "Close burst {=level<11:2,21:5,*:8}"
    attack      : "{wis} vs. Will"
    hit         : "{=level<5:1,11:2,15:3,21:4,25:5,*:6}d10{+wis}, push 3{+cha} (special)"

  LanceOfFaith:
    name        : "Lance of Faith"
    attack      : "{wis} vs. Reflex"
    hit         : "{=level<21:1,*:2}d8{+wis} (special)"
  PriestsShield:
    name        : "Priest's Shield"
    attack      : "{str} vs. AC"
    hit         : "{=level<21:1,*:2}[W]{+str} (special)"
  RighteousBrand:
    name        : "Righteous Brand"
    attack      : "{str} vs. AC"
    hit         : "{=level<21:1,*:2}[W]{+str} (special)"
  SacredFlame:
    name        : "Sacred Flame"
    attack      : "{wis} vs. Reflex"
    hit         : "{=level<21:1,*:2}d6{+wis} (special)"

  CauseFear:
    name        : "Cause Fear"
    attack      : "{wis} vs. Will"
    hit         : "target moves speed{+cha} away from you"
  DivineGlow:
    name        : "Divine Glow"
    attack      : "{wis} vs. Reflex"
    hit         : "1d8{+wis} (special)"
  HealingStrike:
    name        : "Healing Strike"
    attack      : "{str} vs. AC"
    damage      : "2[W]{+str} (special)"
  WrathfulThunder:
    name        : "Wrathful Thunder"
    attack      : "{str} vs. AC"
    damage      : "1[W]{+str} (special)"

  AvengingFlame:
    name        : "Avenging Flame"
    attack      : "{str} vs. AC"
    hit         : "2[W]{+str} (special)"
  BeaconOfHope:
    name        : "Beacon of Hope"
    attack      : "{wis} vs. Will"
    hit         : "(special)"
  CascadeOfLight:
    name        : "Cascade of Light"
    attack      : "{wis} vs. Will"
    hit         : "3d8{+wis} (special)"
  GuardianOfFaith:
    name        : "Guardian of Faith"
    attack      : "{wis} vs. Fort (special)"
    hit         : "1d8{+wis} (special)"
