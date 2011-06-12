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
      "breath.type": (power) -> power.npc.breath.type
      "breath.range": (power) -> power.npc.breath.range
      "breath.ability": (power) -> power.npc.breath.ability
      "ability.bonus": (power) -> power.npc.abilities[power.npc.breath.ability].modifier()
      "level.bonus": ["case", ["<", ".level", 11], 2, ["<", ".level", 21], 4, true, 6]
      "±attack": ["±", ["+", "ability.bonus", "level.bonus"]]
      dice: ["case", ["<", ".level", 11], 1, ["<", ".level", 21], 2, true, 3]

  ElvenAccuracy:
    name        : "Elven Accuracy"
    keywords    : []
    bonus       : new Attribute 0
    effect      : "reroll attack at {±bonus}"
    _formulae   :
      "±bonus": ["±", (power) -> power.bonus.score()]
