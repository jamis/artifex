positioningStrikeSlideDistance = (power) ->
  if power.npc.hasFeature "class", "Artful Dodger"
    if power.npc.abilities.cha.modifier() > 0
      power.npc.abilities.cha.modifier()
    else
      1
  else
    1

torturousStrikeBonus = (power) ->
  if power.npc.hasFeature "class", "Brutal Scoundrel"
    if power.npc.abilities.str.modifier() > 0
      power.npc.abilities.str.modifier()
    else
      0
  else
    0

module.exports =
  SneakAttack:
    name        : "Sneak Attack"
    hit         : "{count}d{die}{±bonus.nz} damage"
    _formulae   :
      count: ["±", ["case", ["<", ".level", 11], 2, ["<", ".level", 21], 3, true, 5]]
      die  : (power) -> if power.npc.attacks.sneakAttack? then power.npc.attacks.sneakAttack.damageDie ? 6 else 6
      bonus: (power) -> if power.npc.attacks.sneakAttack? then power.npc.attacks.sneakAttack.score() else 0
      "±bonus.nz": ["if", ["=", "bonus", 0], ["~", ""], ["±", "bonus"]]

  DeftStrike:
    name        : "Deft Strike"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "{count}[W]{±dex.nz} damage"
    _formulae   : { count: ["if", ["<", ".level", 21], 1, 2] }

  PiercingStrike:
    name        : "Piercing Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±dex} vs. Reflex"
    hit         : "{count}[W]{±dex.nz} damage"
    _formulae   : { count: ["if", ["<", ".level", 21], 1, 2] }

  RiposteStrike:
    name        : "Riposte Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±dex} vs. AC (special, riposte {±str} vs. AC)"
    hit         : "{count}[W]{±dex.nz} damage (special, riposte {count}[W]{±str.nz} damage)"
    _formulae   : { count: ["if", ["<", ".level", 21], 1, 2] }

  SlyFlourish:
    name        : "Sly Flourish"
    keywords    : [ "martial", "weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "{count}[W]{±dex+cha.nz} damage"
    _formulae   :
      count        : ["if", ["<", ".level", 21], 1, 2]
      "dex+cha"    : ["+", "#dex", "#cha"]
      "±dex+cha.nz": ["if", ["=", "dex+cha", 0], ["~", ""], ["±", "dex+cha"]]

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
      squares   : ["if", ["=", positioningStrikeSlideDistance, 1], ["~", "square"], ["~", "squares"]]

  TorturousStrike:
    name        : "Torturous Strike"
    keywords    : [ "martial", "weapon" ]
    attackTypes : [ "melee weapon" ]
    attack      : "{±dex} vs. AC"
    hit         : "2[W]{±bonus.nz} damage"
    _formulae   :
      bonus     : ["+", "#dex", torturousStrikeBonus]
      "±bonus.nz": ["if", ["=", "bonus", 0], ["~", ""], ["±", "bonus"]]

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
