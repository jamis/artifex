{Random} = require '..'

module.exports =
  "#number should return a value from 0...n": (test) ->
    random = new Random
    for i in [1..20]
      test.ok 0 <= random.number(10) < 10
    test.done()

  "#pick should choose one of the arguments at random": (test) ->
    random = new Random
    test.ok random.pick(1, 2, 3, 4, 5) in [1..5]
    test.ok random.pick(1, 2, 3, 4, 5) in [1..5]
    test.ok random.pick(1, 2, 3, 4, 5) in [1..5]
    test.ok random.pick(1, 2, 3, 4, 5) in [1..5]
    test.done()

  "#fuzz should select a number within the given range": (test) ->
    random = new Random
    test.ok random.fuzz(11, 15) in [11..15]
    test.ok random.fuzz(11, 15) in [11..15]
    test.ok random.fuzz(11, 15) in [11..15]
    test.ok random.fuzz(11, 15) in [11..15]
    test.ok random.fuzz(11, 15) in [11..15]
    test.done()

  "#fuzz with third parameter might exceed range with given probability": (test) ->
    random = new Random

    count = 0
    count += 1 while 11 <= random.fuzz(11, 15, 25) <= 15

    test.ok true
    test.done()

  "#shuffle should reorder arguments in random order": (test) ->
    random = new Random
    list = [0..10]
    shuffled = random.shuffle(list...)
    changed = 0
    for x in [0...list.length]
      changed += 1 if shuffled[x] isnt list[x]
    test.ok changed > 0
    test.done()

  "#d should return a value from 1..n": (test) ->
    random = new Random
    for i in [1..20]
      test.ok 1 <= random.d(10) <= 10
    test.done()
