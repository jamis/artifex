module.exports =
  DivineMettle:
    name        : "Channel Divinity: Divine Mettle"
    effect      : "target makes a save with {save} bonus"
    _formulae   : { save: ["±", ["if", ["<", "#cha", 1], 0, "#cha"]] }

  DivineStrength:
    name        : "Channel Divinity: Divine Strength"
    effect      : "apply {±str} extra damage on next attack"

  DivineChallenge:
    name        : "Divine Challenge"
    effect      : "target takes {damage} damage on first attack that excludes you (special)"
    _formulae   : { damage: ["+", ["case", ["<", ".level", 11], 3, ["<", ".level", 21], 6, true, 9], "#cha"] }

  LayOnHands:
    name        : "Lay on Hands"
    frequency   : "{count}/day"
    _formulae   : { count: ["if", ["<", "#wis", 1], 1, "#wis"] }

  BolsteringStrike:
    name        : "Bolstering Strike"
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "{hitDice}[W]{±cha.nz} damage, {±wis} temp HP"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  EnfeeblingStrike:
    name        : "Enfeebling Strike"
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "{hitDice}[W]{±cha.nz} damage (special)"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  HolyStrike:
    name        : "Holy Strike"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "{hitDice}[W]{±str.nz} damage ({marked} if marked)"
    _formulae   :
      hitDice: ["if", ["<", ".level", 21], 1, 2]
      marked:  ["±", ["+", "#str", "#wis"]]

  ValiantStrike:
    name        : "Valiant Strike"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} + 1/adjacent enemy vs. AC"
    hit         : "{hitDice}[W]{±str.nz} damage"
    _formulae   : { hitDice: ["if", ["<", ".level", 21], 1, 2] }

  FearsomeSmite:
    name        : "Fearsome Smite"
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "2[W]{±cha.nz} damage (special)"

  PiercingSmite:
    name        : "Piercing Smite"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. Reflex"
    hit         : "2[W]{±str.nz} damage, mark target and {#wis} adjacent enemies"

  RadiantSmite:
    name        : "Radiant Smite"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "2[W]{bonus} damage"
    _formulae   : { bonus: ["±", ["+", "#str", "#wis"]] }

  ShieldingSmite:
    name        : "Shielding Smite"
    attackTypes : [ "melee weapon" ]
    attack      : "{±cha} vs. AC"
    hit         : "2[W]{±cha.nz} damage"
    effect      : "ally w/in 5 squares gets {±wis} bonus to AC"

  OnPainOfDeath:
    name        : "On Pain of Death"
    attack      : "{±cha} vs. Will"
    hit         : "3d8{±cha.nz} damage (special)"

  PaladinsJudgement:
    name        : "Paladin's Judgement"
    attackTypes : [ "melee weapon" ]
    attack      : "{±str} vs. AC"
    hit         : "3[W]{±str.nz} damage (special)"

  RadiantDelirium:
    name        : "Radiant Delirium"
    attack      : "{±cha} vs. Reflex"
    hit         : "3d8{±cha.nz} damage (special)"
