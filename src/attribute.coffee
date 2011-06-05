module.exports = class Attribute
  constructor: (@baseValue) ->
    @conditions = {}

  base: ->
    if typeof @baseValue is "function"
      @baseValue()
    else
      @baseValue

  adjust: (type, amount) ->
    @adjustWhen "", type, amount

  adjustWhen: (condition, type, amount) ->
    [amount, type] = [type, amount] unless amount?
    @conditions[condition] ||= []
    @conditions[condition].push([amount, type])
    
  adjustments: (condition) ->
    @conditions[condition ? ""] ? []

  adjustment: (condition) ->
    result = 0

    for adjustment in @adjustments(condition)
      adjustment = adjustment[0]
      if typeof adjustment is "function"
        result += adjustment()
      else
        result += adjustment

    result

  score: ->
    throw new Error "no base value specified" unless @base()?
    @base() + @adjustment()

  has: (amount, type, condition) ->
    for adjustment in @adjustments(condition)
      return true if amount is adjustment[0] and type is adjustment[1]
    false
