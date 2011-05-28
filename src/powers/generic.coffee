module.exports = class Generic
  constructor: (initializers...) ->
    for initializer in initializers
      for key, value of initializer
        this[key] = value

    # do the compilation after setting the attributes, in case some methods
    # depend on certain attributes being set (e.g., @npc)
    for key, value of this
      @compile(key) if typeof value is "string" and value.indexOf("{") >= 0

  get: (key) ->
    if typeof this["_#{key}"] is "function"
      this["_#{key}"]()
    else
      this[key]

  compile: (key) ->
    value = this[key]
    start = 0
    func = "this['_#{key}'] = function(){result='';"

    while (next = value.indexOf "{", start) >= 0
      end = value.indexOf "}", next
      break if end < 0

      if next > start
        literal = value.substring start, next
        func += 'result+="' + @escape(literal) + '";'

      content = value.substring(next+1, end)
      try
        func += @compileChunk content
      catch error
        console.error "oops! #{error}"
        throw error
      start = end+1

    literal = value.substring(start)
    if literal.length > 0
      func += 'result+="' + @escape(literal) + '";'

    func += 'return result;}'

    eval(func)

  escape: (str) -> str.replace(/\\/g, "\\\\").replace(/"/g, '\\"')

  compileAbility: (ability) ->
    unless ability in [ "str", "con", "dex", "int", "wis", "cha" ]
      throw "don't recognize ability `#{ability}'"

    "this.npc.abilities['#{ability}']"

  compileAbilityMod: (ability) -> @compileAbility(ability) + ".modifier()"

  compileChunk: (chunk) ->
    parts = chunk.split ","
    "result+=" + @compileParts(parts) + ";"

  compileParts: (parts) ->
    if parts.length is 1
      @prependSignTo @compileAbilityMod parts[0]
    else switch parts[0]
      when "sign" then @prependSignTo @compileParts parts.slice(1)
      when "!" then @compileNotZero parts[1]
      when "~" then @compileRange parts[1], parts[2], parts.slice(3)
      when "=" then @compileAbilityMod(parts[1])
      when "/", "*", "+", "-" then @compileArithmetic parts[0], parts[1], parts[2]
      else throw "unknown operator `#{parts[0]}'"

  prependSignTo: (value) -> "function(v){return((v<0)?'':'+')+v;}.call(this,#{value})"

  compileNotZero: (value) ->
    if value in [ "str", "con", "dex", "int", "wis", "cha" ]
      "function(v){return(v===0)?'':#{@prependSignTo('v')};}.call(this,#{@compileAbilityMod(value)})"
    else
      throw "don't know how to evaluate !0 of `#{value}'"

  compileRange: (attribute, operator, parts) ->
    throw "don't know how to evaluate range on `#{attribute}'" unless @npc[attribute]

    func = "function(){var r='',v=this.npc['#{attribute}'];"
    count = 0
    for part in parts
      func += " else " if count > 0
      count += 1
      [comparison, result] = part.split(/:/)
      func += "if(v#{operator}#{comparison})" if comparison isnt "*"
      func += "r+=\"#{@escape(result)}\";"

    func += "return r;}.call(this)"

  compileArithmetic: (operator, op1, op2) ->
    evalOp = (op) =>
      switch op
        when "str", "con", "dex", "int", "wis", "cha"
          @compileAbilityMod(op)
        when "level"
          "this.npc['#{op}']"
        else
          op

    "Math.floor(#{evalOp(op1)}#{operator}#{evalOp(op2)})"
