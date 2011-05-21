module.exports = class Generic
  constructor: (initializers...) ->
    for initializer in initializers
      for key, value of initializer
        this[key] = value
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

    escape = (str) ->
      str.replace(/\\/g, "\\\\").replace(/"/g, '\\"')

    while (next = value.indexOf "{", start) >= 0
      end = value.indexOf "}", next
      break if end < 0

      if next > start
        literal = value.substring start, next
        func += 'result+="' + escape(literal) + '";'

      content = value.substring(next+1, end)
      if content.charAt(0) is "+"
        content = content.substr(1)
        func += "value=this.npc.abilities['#{content}'].modifier();if(value!=0){result+=((value<0)?'':'+')+value;};"
      else if content.charAt(0) is "="
        content = content.substr(1)
        [_, attribute, operator, content] = content.match(/^(\w+)([<>])(.*)/)
        parts = content.split(/,/)
        func += "value=this.npc['#{attribute}'];"
        count = 0
        for part in parts
          func += " else " if count > 0
          count += 1
          [comparison, result] = part.split(/:/)
          func += "if(value#{operator}#{comparison})" if comparison isnt "*"
          func += "result+=\"#{escape(result)}\";"
      else
        func += "value=this.npc.abilities['#{content}'].modifier();result+=((value<0)?'':'+')+value;"

      start = end+1

    literal = value.substring(start)
    if literal.length > 0
      func += 'result+="' + escape(literal) + '";'

    func += 'return result;}'

    eval(func)
