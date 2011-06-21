hasPresence = (presence) ->
  -> @npc.hasFeature "class", "#{presence} Presence"

module.exports =
  InspiringPresence:
    name        : "Inspiring Presence"
    effect      : "ally regains {±bonus} lost HP (special)"
    _formulae   : { "±bonus": -> @signed(Math.floor(@npc.level / 2) + @chaM()) }

  TacticalPresence:
    name        : "Tactical Presence"
    effect      : "ally gains {±bonus} attack bonus (special)"
    _formulae   : { "±bonus": -> @signed(Math.floor(@intM() / 2)) }

  InspiringWord:
    name        : "Inspiring Word"
    keywords    : [ "martial", "healing" ]
    frequency   : "{times}/encounter"
    attackTypes : [ "Close burst {size}" ]
    effect      : "ally can regain +{dice}d6 hit points"
    _formulae   :
      times: -> @byLevel [2, 16], 3
      size : -> @byLevel [5, 11], [10, 21], 15
      dice : -> Math.floor((@npc.level + 5) / 5)

  CommandersStrike:
    name        : "Commander's Strike"
    keywords    : [ "martial", "weapon" ]
    hit         : "ally's basic attack damage{±int.nz}"

  FuriousSmash:
    name        : "Furious Smash"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Fortitude"
    hit         : "{#str} damage, selected ally gets {±cha} to next attack and damage vs. this target (special)"

  VipersStrike:
    name        : "Viper's Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{count}[W]{±str.nz} damage (special)"
    _formulae   : { count: -> @byLevel [1, 21], 2 }

  WolfPackTactics:
    name        : "Wolf Pack Tactics"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{count}[W]{±str.nz} damage (special)"
    _formulae   : { count: -> @byLevel [1, 21], 2 }

  GuardingAttack:
    name        : "Guarding Attack"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage, adjacent ally gets {±bonus} AC vs. target"
    _formulae   :
      inspiring: hasPresence "Inspiring"
      "±bonus": -> @signed(if @inspiring() then @chaM() + 1 else 2)

  HammerAndAnvil:
    name        : "Hammer and Anvil"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Reflex"
    hit         : "1[W]{±str.nz} damage, adjacent ally attacks as free action with {±cha} damage"

  LeafOnTheWind:
    name        : "Leaf on the Wind"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  WarlordsFavor:
    name        : "Warlord's Favor"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage, adjacent ally gets {±bonus} to attack vs. target"
    _formulae   :
      tactical: hasPresence "Tactical"
      "±bonus": -> @signed(if @tactical() then @intM() + 1 else 2)

  BastionOfDefense:
    name        : "Bastion of Defense"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"
    effect      : "allies w/in 5 squares get {bonus} temporary HP"
    _formulae   : { bonus: -> 5 + @chaM() }

  LeadTheAttack:
    name        : "Lead the Attack"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage, {±bonus} to attack vs. target"
    _formulae   : { "±bonus": -> @signed(@intM() + 1) }

  PinTheFoe:
    name        : "Pin the Foe"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage"

  WhiteRavenOnslaught:
    name        : "White Raven Onslaught"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"

  AidTheInjured:
    name        : "Aid the Injured"
    type        : "encounter"
    keywords    : [ "healing", "martial" ]

  CrescendoOfViolence:
    name        : "Crescendo of Violence"
    type        : "encounter"
    keywords    : [ "martial" ]
    effect      : "ally gains {#cha} temp HP"

  KnightsMove:
    name        : "Knight's Move"
    type        : "encounter"
    keywords    : [ "martial" ]

  ShakeItOff:
    name        : "Shake It Off"
    type        : "encounter"
    keywords    : [ "martial" ]
    effect      : "target gets {±cha} bonus to save"

  HoldTheLine:
    name        : "Hold the Line"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage"

  InspiringWarCry:
    name        : "Inspiring War Cry"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage"

  SteelMonsoon:
    name        : "Steel Monsoon"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage, {count} {allies} may shift"
    _formulae   :
      tactical: hasPresence "Tactical"
      count: -> if @tactical() then @intM() else 1
      allies: -> @plural @count(), "ally", "allies"

  WarlordsStrike:
    name        : "Warlord's Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage, allies gain {±bonus} to damage"
    _formulae   :
      inspiring: hasPresence "Inspiring"
      "±bonus": -> @signed(if @inspiring() then 1+@chaM() else 2)

  StandTheFallen:
    name        : "Stand the Fallen"
    keywords    : [ "healing", "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage"
    effect      : "allies can surge and regain {±cha} extra HP"

  TurningPoint:
    name        : "Turning Point"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  VillainsNightmare:
    name        : "Villain's Nightmare"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Reflex"
    hit         : "3[W]{±str.nz} damage"

  GuideTheCharge:
    name        : "Guide the Charge"
    type        : "encounter"
    keywords    : [ "martial" ]
    effect      : "ally adds {±int} to damage roll, etc."

  InspiringReaction:
    name        : "Inspiring Reaction"
    type        : "encounter"
    keywords    : [ "healing", "martial" ]
    effect      : "ally spends surge and gets {±cha} extra HP"

  QuickStep:
    name        : "Quick Step"
    type        : "daily"
    keywords    : [ "martial" ]

  StandTough:
    name        : "Stand Tough"
    type        : "daily"
    keywords    : [ "healing", "martial" ]
    effect      : "targets regain {regen} HP"
    _formulae   : { regen: -> 10 + @chaM() }

  LionsRoar:
    name        : "Lion's Roar"
    keywords    : [ "healing", "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage"
    effect      : "ally can surge and get {±bonus} extra HP"
    _formulae   :
      inspiring: hasPresence "Inspiring"
      "±bonus": -> @signed(if @inspiring() then @chaM() else 0)

  SunderArmor:
    name        : "Sunder Armor"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  SurpriseAttack:
    name        : "Surprise Attack"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "1[W]{±str.nz} damage, ally makes free attack at {±bonus}"
    _formulae   :
      tactical: hasPresence "Tactical"
      "±bonus": -> @signed(if @tactical() then @intM() else 0)

  SurroundFoe:
    name        : "Surround Foe"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage"

  IronDragonCharge:
    name        : "Iron Dragon Charge"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC (special)"
    hit         : "3[W]{±str.nz} damage"

  KnockThemDown:
    name        : "Knock Them Down"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"

  WhiteRavenStrike:
    name        : "White Raven Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage"
    effect      : "allies gain {±cha} extra temp HP if target dropped to 0 HP"

  DefensiveRally:
    name        : "Defensive Rally"
    type        : "daily"
    keywords    : [ "healing", "martial" ]

  EaseSuffering:
    name        : "Ease Suffering"
    type        : "daily"
    keywords    : [ "martial" ]

  TacticalShift:
    name        : "Tactical Shift"
    type        : "daily"
    keywords    : [ "martial" ]
    effect      : "ally can shift {distance} {squares}"
    _formulae   :
      distance: -> 1 + @intM()
      squares: -> @plural @distance(), "square", "squares"
