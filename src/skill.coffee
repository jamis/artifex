Attribute = require './attribute'

module.exports = class Skill extends Attribute
  constructor: (ability) ->
    super 0
    @ability = ability

  score: ->
    super +
      @ability.modifier() +
      (if @trained then 5 else 0)
