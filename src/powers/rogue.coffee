positioningStrikeSlideDistance = ->
  if @npc.hasFeature "class", "Artful Dodger"
    @max @chaM(), 1
  else
    1

torturousStrikeBonus = ->
  @dexM() + if @npc.hasFeature "class", "Brutal Scoundrel"
      @max @strM(), 0
    else
      0

module.exports =
  SneakAttack:
    name        : "Sneak Attack"
    hit         : "{count}d{die}{±bonus.nz} damage"
    _formulae   :
      count: -> @signed(@byLevel [2, 11], [3, 21], 5)
      die  : -> if @npc.attacks.sneakAttack? then @npc.attacks.sneakAttack.damageDie ? 6 else 6
      bonus: -> if @npc.attacks.sneakAttack? then @npc.attacks.sneakAttack.score() else 0
      "±bonus.nz": -> if @bonus() is 0 then "" else @signed @bonus()

  DeftStrike:
    name        : "Deft Strike"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "{count}[W]{±dex.nz} damage"
    _formulae   : { count: -> @byLevel [1, 21], 2 }

  PiercingStrike:
    name        : "Piercing Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±dex} vs. Reflex"
    hit         : "{count}[W]{±dex.nz} damage"
    _formulae   : { count: -> @byLevel [1, 21], 2 }

  RiposteStrike:
    name        : "Riposte Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±dex} vs. AC (special, riposte {±str} vs. AC)"
    hit         : "{count}[W]{±dex.nz} damage (special, riposte {count}[W]{±str.nz} damage)"
    _formulae   : { count: -> @byLevel [1, 21], 2 }

  SlyFlourish:
    name        : "Sly Flourish"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "{count}[W]{±dex+cha.nz} damage"
    _formulae   :
      count        : -> @byLevel [1, 21], 2
      "dexcha"     : -> @dexM() + @chaM()
      "±dex+cha.nz": -> if @dexcha() is 0 then "" else @signed @dexcha()

  DazingStrike:
    name        : "Dazing Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "1[W]{±dex.nz} damage (special)"

  KingsCastle:
    name        : "King's Castle"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. Reflex"
    hit         : "2[W]{±dex.nz} damage (special)"

  PositioningStrike:
    name        : "Positioning Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±dex} vs. Will"
    hit         : "1[W]{±dex.nz} damage, slide target {count} {squares}"
    _formulae   :
      count     : positioningStrikeSlideDistance
      squares   : -> @plural @count(), 'square', 'squares'

  TorturousStrike:
    name        : "Torturous Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±bonus.nz} damage"
    _formulae   :
      bonus     : torturousStrikeBonus
      "±bonus.nz": -> if @bonus() is 0 then "" else @signed @bonus()

  BlindingBarrage:
    name        : "Blinding Barrage"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±dex.nz} damage (special)"

  EasyTarget:
    name        : "Easy Target"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±dex.nz} damage (special)"

  TrickStrike:
    name        : "Trick Strike"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "3[W]{±dex.nz} damage (special)"

  FleetingGhost:
    name        : "Fleeting Ghost"
    type        : "atWill"
    keywords    : [ "martial" ]
    requires    : { trained: "stealth" }

  GreatLeap:
    name        : "Great Leap"
    type        : "atWill"
    keywords    : [ "martial" ]
    requires    : { trained: "athletics" }

  MasterOfDeceit:
    name        : "Master of Deceit"
    type        : "encounter"
    keywords    : [ "martial" ]
    requires    : { trained: "bluff" }

  QuickFingers:
    name        : "Quick Fingers"
    type        : "encounter"
    keywords    : [ "martial" ]
    requires    : { trained: "thievery" }

  Tumble:
    name        : "Tumble"
    type        : "encounter"
    keywords    : [ "martial" ]
    requires    : { trained: "acrobatics" }

  BaitAndSwitch:
    name        : "Bait and Switch"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. Will"
    hit         : "2[W]{±dex.nz} damage, shift {count} {squares} (special)"
    _formulae   :
      count     : -> if @npc.hasFeature("class", "Artful Dodger") then @max(@chaM(), 1) else 1
      squares   : -> @plural @count(), 'square', 'squares'

  SetupStrike:
    name        : "Setup Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±dex.nz} damage (special)"

  ToppleOver:
    name        : "Topple Over"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±bonus} vs. AC"
    hit         : "1[W]{±dex.nz} damage (special)"
    _formulae   :
      "±bonus": -> @signed(@dexM() + if @npc.hasFeature("class", "Brutal Scoundrel") then @strM() else 0)

  TrickstersBlade:
    name        : "Trickster's Blade"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±dex.nz} damage, {±cha} AC bonus"

  CleverRiposte:
    name        : "Clever Riposte"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±dex.nz} damage"
    effect      : "target takes {#dex} damage on attack"

  DeepCut:
    name        : "Deep Cut"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. Fortitude"
    hit         : "2[W]{±dex.nz} damage, ongoing {ongoing}"
    _formulae   :
      ongoing: -> 5 + @strM()

  WalkingWounded:
    name        : "Walking Wounded"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. Fortitude"
    hit         : "2[W]{±dex.nz} damage (special)"
    _formulae   :
      ongoing: -> 5 + @strM()

  Chameleon:
    name        : "Chameleon"
    type        : "atWill"
    keywords    : [ "martial" ]
    requires    : { trained: "stealth" }

  IgnobleEscape:
    name        : "Ignoble Escape"
    type        : "encounter"
    keywords    : [ "martial" ]
    requires    : { trained: "acrobatics" }

  MobMentality:
    name        : "Mob Mentality"
    type        : "encounter"
    keywords    : [ "martial" ]
    requires    : { trained: "intimidate" }

  NimbleClimb:
    name        : "Nimble Climb"
    type        : "atWill"
    keywords    : [ "martial" ]
    requires    : { trained: "athletics" }

  SlipperyMind:
    name        : "Slippery Mind"
    type        : "encounter"
    keywords    : [ "martial" ]
    requires    : { trained: "bluff" }

  CloudOfSteel:
    name        : "Cloud of Steel"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "1[W]{±dex.nz} damage"

  ImperilingStrike:
    name        : "Imperiling Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. Fortitude"
    hit         : "1[W]{±dex.nz} damage, target takes {penalty} to AC and Reflex"
    _formulae   :
      penalty: -> @signed(if @npc.hasFeature("class", "Brutal Scoundrel") then -@strM() else -1)

  RoguesLuck:
    name        : "Rogue's Luck"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±dex.nz} damage"
    miss        : "secondary attack at {bonus} vs. AC for 1[W]{±dex.nz} damage"
    _formulae   :
      bonus: -> @signed(@dexM() + if @npc.hasFeature("class", "Artful Dodger") then @chaM() else 0)

  SandInTheEyes:
    name        : "Sand in the Eyes"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. Reflex"
    hit         : "1[W]{±dex.nz} damage (special)"

  CrimsonEdge:
    name        : "Crimson Edge"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. Fortitude"
    hit         : "2[W]{±dex.nz} damage, ongoing {ongoing} (special)"
    _formulae   :
      ongoing: -> 5 + @strM()

  DeadlyPositioning:
    name        : "Deadly Positioning"
    keywords    : [ "martial", "weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. AC (special)"
    hit         : "3[W]{±dex.nz} damage"

  Knockout:
    name        : "Knockout"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    requires    : { weapon: "light blade" }
    attack      : "{±dex} vs. Fortitude"
    hit         : "2[W]{±dex.nz} damage (special)"

  CertainFreedom:
    name        : "Certain Freedom"
    type        : "daily"
    keywords    : [ "martial" ]
    requires    : { trained: "acrobatics" }

  CloseQuarters:
    name        : "Close Quarters"
    type        : "daily"
    keywords    : [ "martial" ]
    requires    : { trained: "acrobatics" }

  DangerousTheft:
    name        : "Dangerous Theft"
    type        : "encounter"
    keywords    : [ "martial" ]
    requires    : { trained: "thievery" }

  ShadowStride:
    name        : "Shadow Stride"
    type        : "atWill"
    keywords    : [ "martial" ]
    requires    : { trained: "stealth" }
