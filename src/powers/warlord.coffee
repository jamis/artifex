hasPresence = (presence) ->
  (power) -> power.npc.hasFeature("class", "#{presence} Presence")

module.exports =
  InspiringPresence:
    name        : "Inspiring Presence"
    effect      : "ally regains {±bonus} lost HP (special)"
    _formulae   : { "±bonus": ["±", ["+", ["floor", ["/", ".level", 2]], "#cha"]] }

  TacticalPresence:
    name        : "Tactical Presence"
    effect      : "ally gains {±bonus} attack bonus (special)"
    _formulae   : { "±bonus": ["±", ["floor", ["/", "#int", 2]]] }

  InspiringWord:
    name        : "Inspiring Word"
    frequency   : "{times}/encounter"
    attackTypes : [ "Close burst {size}" ]
    effect      : "ally can regain +{dice}d6 hit points"
    _formulae   :
      times: ["if", ["<", ".level", 16], 2, 3]
      size : ["case", ["<", ".level", 11], 5, ["<", ".level", 21], 10, true, 15]
      dice : ["floor", ["/", ["+", ".level", 5], 5]]

  CommandersStrike:
    name        : "Commander's Strike"
    hit         : "ally's basic attack damage{±int.nz}"

  FuriousSmash:
    name        : "Furious Smash"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Fortitude"
    hit         : "{#str} damage, selected ally gets {±cha} to next attack and damage vs. this target (special)"

  VipersStrike:
    name        : "Viper's Strike"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{count}[W]{±str.nz} damage (special)"
    _formulae   : { count: ["if", ["<", ".level", 21], 1, 2] }

  WolfPackTactics:
    name        : "Wolf Pack Tactics"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{count}[W]{±str.nz} damage (special)"
    _formulae   : { count: ["if", ["<", ".level", 21], 1, 2] }

  GuardingAttack:
    name        : "Guarding Attack"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage, adjacent ally gets {±bonus} AC vs. target"
    _formulae   :
      "±bonus": ["±", ["if", hasPresence("Inspiring"), ["+", 1, "#cha"], 2]]

  HammerAndAnvil:
    name        : "Hammer and Anvil"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Reflex"
    hit         : "1[W]{±str.nz} damage, adjacent ally attacks as free action with {±cha} damage"

  LeafOnTheWind:
    name        : "Leaf on the Wind"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage (special)"

  WarlordsFavor:
    name        : "Warlord's Favor"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{±str.nz} damage, adjacent ally gets {±bonus} to attack vs. target"
    _formulae   :
      "±bonus": ["±", ["if", hasPresence("Tactical"), ["+", 1, "#int"], 2]]

  BastionOfDefense:
    name        : "Bastion of Defense"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"
    effect      : "allies w/in 5 squares get {bonus} temporary HP"
    _formulae   : { bonus: ["+", 5, "#cha"] }

  LeadTheAttack:
    name        : "Lead the Attack"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage, {±bonus} to attack vs. target"
    _formulae   : { "±bonus": ["±", ["+", 1, "#int"]] }

  PinTheFoe:
    name        : "Pin the Foe"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage"

  WhiteRavenOnslaught:
    name        : "White Raven Onslaught"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"
