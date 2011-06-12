module.exports = class Power
  constructor: (initializers...) ->
    for initializer in initializers
      for key, value of initializer
        if typeof value is "function"
          this[key] = value(this)
        else
          this[key] = value

    @_formulae ?= {}

  get: (name) ->
    value = this[name]

    if typeof value is "object" and value.length?
      @parse item for item in value

    else if typeof value is "string"
      @parse value

    else
      value

  parse: (value) ->
    result = ""
    start = 0

    while (pos = value.indexOf("{", start)) >= 0
      ePos = value.indexOf "}", pos
      break unless ePos > pos

      key = value.substring pos+1, ePos
      result += value.substring start, pos
      result += @evaluate key

      start = ePos+1

    result + value.substring start

  evaluate: (value) ->
    switch typeof value
      when "number", "boolean"
        value
      when "function"
        value(this)
      when "object"
        [operation, operands...] = value
        switch operation
          when "±" then @prependSign operands...
          when "~" then operands.join ""
          when "+", "-", "*", "/" then @performArithmetic operation, operands
          when "<", ">", "=" then @performComparison operation, operands...
          when "if" then @performIfCondition operands...
          when "case" then @performCaseCondition operands
          when "floor" then Math.floor(@evaluate operands[0])
          else throw new Error "unknown operation `#{operation}'"
      when "string"
        switch value
          when "#str", "#con", "#dex", "#int", "#wis", "#cha"
            @npc.abilities[value.slice(1)].modifier()
          when "±str", "±con", "±dex", "±int", "±wis", "±cha"
            @prependSign @npc.abilities[value.slice(1)].modifier()
          when "±str.nz", "±con.nz", "±dex.nz", "±int.nz", "±wis.nz", "±cha.nz"
            value = @npc.abilities[value.slice 1, 4].modifier()
            if value != 0 then @prependSign value else ""
          else
            if (result = value.match /^\.(.*)/)
              @npc[result[1]]
            else if @_formulae[value]?
              @evaluate @_formulae[value]
            else
              throw new Error "unknown formula `#{value}'"
      else
        throw new Error "unsupported value `#{value}' (#{typeof value})"

  evaluateMap: (operands) -> @evaluate(operand) for operand in operands

  prependSign: (value) ->
    value = @evaluate value
    if value >= 0 then "+#{value}" else "#{value}"

  arithmetic:
    "+": (a, b) -> a + b
    "-": (a, b) -> a - b
    "*": (a, b) -> a * b
    "/": (a, b) -> a / b

  performArithmetic: (operation, operands) ->
    for operand in operands
      operand = @evaluate operand
      if result?
        result = @arithmetic[operation](result, operand)
      else
        result = operand
    result

  comparisons:
    "<": (a, b) -> a < b
    ">": (a, b) -> a > b
    "=": (a, b) -> a is b

  performComparison: (operation, a, b) ->
    @comparisons[operation](@evaluate(a), @evaluate(b))

  performIfCondition: (condition, whenTrue, whenFalse) ->
    if @evaluate condition
      @evaluate whenTrue
    else
      @evaluate whenFalse

  performCaseCondition: (operands) ->
    i = 0
    while operands[i]?
      if @evaluate operands[i]
        return @evaluate operands[i+1]
      i += 2
    undefined
