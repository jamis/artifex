module.exports =
  BolsteringStrike:
    name        : "Bolstering Strike"
    attack      : "{cha} vs. AC"
    hit         : "{~,level,<,21:1,*:2}[W]{!,cha} damage, {wis} temp HP"

  EnfeeblingStrike:
    name        : "Enfeebling Strike"
    attack      : "{cha} vs. AC"
    hit         : "{~,level,<,21:1,*:2}[W]{!,cha} damage (special)"

  HolyStrike:
    name        : "Holy Strike"
    attack      : "{str} vs. AC"
    hit         : "{~,level,<,21:1,*:2}[W]{!,str} damage ({sign,+,str,wis} if marked)"

  ValiantStrike:
    name        : "Valiant Strike"
    attack      : "{str} + 1/adjacent enemy vs. AC"
    hit         : "{~,level,<,21:1,*:2}[W]{!,str} damage"

  FearsomeSmite:
    name        : "Fearsome Smite"
    attack      : "{cha} vs. AC"
    hit         : "2[W]{!,cha} damage (special)"

  PiercingSmite:
    name        : "Piercing Smite"
    attack      : "{str} vs. Reflex"
    hit         : "2[W]{!,str} damage, mark target and {=,wis} adjacent enemies"

  RadiantSmite:
    name        : "Radiant Smite"
    attack      : "{str} vs. AC"
    hit         : "2[W]{sign,+,str,wis} damage"

  ShieldingSmite:
    name        : "Shielding Smite"
    attack      : "{cha} vs. AC"
    hit         : "2[W]{!,cha} damage"
    effect      : "ally w/in 5 squares gets {wis} bonus to AC"

  OnPainOfDeath:
    name        : "On Pain of Death"
    attack      : "{cha} vs. Will"
    hit         : "3d8{!,cha} damage (special)"

  PaladinsJudgement:
    name        : "Paladin's Judgement"
    attack      : "{str} vs. AC"
    hit         : "3[W]{!,str} damage (special)"

  RadiantDelirium:
    name        : "Radiant Delirium"
    attack      : "{cha} vs. Reflex"
    hit         : "3d8{!,cha} damage (special)"
