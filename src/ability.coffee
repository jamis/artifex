Attribute = require './attribute'

module.exports = class Ability extends Attribute
  modifier: -> Math.floor((@score() - 10) / 2)
