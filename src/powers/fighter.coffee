module.exports =
  Cleave:
    name        : "Cleave"
    attack      : "{str} vs. AC"
    hit         : "{~,level,<,21:1,*:2}[W]{!,str} (special)"

  ReapingStrike:
    name        : "Reaping Strike"
    attack      : "{str} vs. AC"
    hit         : "{~,level,<,21:1,*:2}[W]{!,str} (special)"
    miss        : "{/,str,2} damage ({=,str} w/2h weapon)"

  SureStrike:
    name        : "Sure Strike"
    attack      : "{sign,+,str,2} vs. AC"
    hit         : "{~,level,<,21:1,*:2}[W] damage"

  TideOfIron:
    name        : "Tide of Iron"
    attack      : "{str} vs. AC"
    hit         : "{~,level,<,21:1,*:2}[W]{!,str} damage (special)"

  CoveringAttack:
    name        : "Covering Attack"
    attack      : "{str} vs. AC"
    hit         : "2[W]{!,str} damage (special)"

  PassingAttack:
    name        : "Passing Attack"
    attack      : "{str} vs. AC (2nd target: {sign,+,str,2} vs. AC)"
    hit         : "1[W]{!,str} damage (special)"

  SpinningSweep:
    name        : "Spinning Sweep"
    attack      : "{str} vs. AC"
    hit         : "1[W]{!,str} damage (special)"

  SteelSerpentStrike:
    name        : "Steel Serpent Strike"
    attack      : "{str} vs. AC"
    hit         : "2[W]{!,str} damage (special)"

  BruteStrike:
    name        : "Brute Strike"
    attack      : "{str} vs. AC"
    hit         : "3[W]{!,str} damage"

  ComebackStrike:
    name        : "Comeback Strike"
    attack      : "{str} vs. AC"
    hit         : "2[W]{!,str} damage (special)"

  VillainsMenace:
    name        : "Villain's Menace"
    attack      : "{str} vs. AC"
    hit         : "2[W]{!,str} damage (special)"
