module.exports = class Attribute
  constructor: (@baseValue) ->
    @adjustments = []

  base: ->
    if typeof @baseValue is "function"
      @baseValue()
    else
      @baseValue

  adjust: (type, amount) ->
    [amount, type] = [type, amount] unless amount?
    @adjustments.push([amount, type])

  score: ->
    throw new Error "no base value specified" unless @base()?
    score = @base()
    for adjustment in @adjustments
      adjustment = adjustment[0]
      if typeof adjustment is "function"
        score += adjustment()
      else
        score += adjustment
    score

  has: (amount, type) ->
    for adjustment in @adjustments
      return true if amount is adjustment[0] and type is adjustment[1]
    false
