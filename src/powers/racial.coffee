Attribute = require '../attribute'

module.exports =
  ElvenAccuracy:
    name        : "Elven Accuracy"
    bonus       : new Attribute 0
    effect      : "reroll attack at {±bonus}"
    _formulae   :
      "±bonus": ["±", (power) -> power.bonus.score()]
