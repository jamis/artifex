module.exports = class Random
  number: (n) -> Math.floor(Math.random() * n)

  pick: -> arguments[@number(arguments.length)]

  fuzz: (low, hi, prob) ->
    prob ?= 0
    tail = 0
    tail += 1 while @number(100) < prob

    range = hi - low + 1
    direction = if @number(2) is 0 then -1 else 1
    low = low + tail * direction * range
    hi = low + range

    low + @number(hi - low)
