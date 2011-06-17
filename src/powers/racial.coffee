Attribute = require '../attribute'

module.exports =
  DragonBreath:
    name        : "Dragon Breath ({breath.type})"
    keywords    : [ "{breath.type}" ]
    attackTypes : [ "Close burst {breath.range}" ]
    ability     : "{breath.ability}"
    attack      : "{±attack} vs. Reflex"
    hit         : "{dice}d6{±con.nz} damage"
    _formulae   :
      "breath.type": -> @npc.breath.type
      "breath.range": -> @npc.breath.range
      "breath.ability": -> @npc.breath.ability
      "ability.bonus": -> @npc.abilities[@npc.breath.ability].modifier()
      "level.bonus": -> @byLevel [2, 11], [4, 21], 6
      "±attack": -> @signed(this["ability.bonus"]() + this["level.bonus"]())
      dice: -> @byLevel [1, 11], [2, 21], 3

  ElvenAccuracy:
    name        : "Elven Accuracy"
    keywords    : []
    bonus       : -> new Attribute 0
    effect      : "reroll attack at {±bonus}"
    _formulae   :
      "±bonus": -> @signed @bonus.score()

  FeyStep:
    name        : "Fey Step"
    keywords    : [ "teleportation" ]

  InfernalWrath:
    name        : "Infernal Wrath"
    keywords    : []
    effect      : "{±cha} extra damage (special)"

  SecondChance:
    name        : "Second Chance"
    keywords    : []
