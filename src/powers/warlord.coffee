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
