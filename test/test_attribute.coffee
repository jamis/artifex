{Attribute} = require '..'

module.exports =
  "created attribute begins with undefined base": (test) ->
    attr = new Attribute
    test.equal attr.base(), undefined
    test.done()

  "created attribute begins with empty adjustments": (test) ->
    attr = new Attribute
    test.equal attr.adjustments().length, 0
    test.done()

  "created attribute with parameter sets base to parameter": (test) ->
    attr = new Attribute 10
    test.equal attr.base(), 10
    test.done()

  "attribute with functional base should reevaluate base on each query": (test) ->
    n = 0
    attr = new Attribute -> n
    test.equal attr.base(), 0
    n = 5
    test.equal attr.base(), 5
    test.done()

  "#adjust adds value and type to adjustments": (test) ->
    attr = new Attribute
    attr.adjust "racial", 2
    test.equal attr.adjustments().length, 1
    test.deepEqual attr.adjustments()[0], [2, "racial"]
    test.done()

  "#adjust uses undefined type when type is omitted": (test) ->
    attr = new Attribute
    attr.adjust 2
    test.equal attr.adjustments().length, 1
    test.deepEqual attr.adjustments()[0], [2, undefined]
    test.done()

  "#adjustWhen does not add value to score": (test) ->
    attr = new Attribute 0
    attr.adjustWhen "vs poison", "racial", 2
    test.equal attr.score(), 0
    test.done()

  "#adjustWhen adds value and type to conditions": (test) ->
    attr = new Attribute 0
    attr.adjustWhen "vs poison", "racial", 2
    test.equal attr.adjustments("vs poison").length, 1
    test.deepEqual attr.adjustments("vs poison")[0], [2, "racial"]
    test.done()

  "#adjustWhen uses undefined type when type is omitted": (test) ->
    attr = new Attribute
    attr.adjustWhen "vs poison", 2
    test.equal attr.adjustments("vs poison").length, 1
    test.deepEqual attr.adjustments("vs poison")[0], [2, undefined]
    test.done()

  "#adjustWhen should combine similar conditions": (test) ->
    attr = new Attribute
    attr.adjustWhen "vs poison", "class", 1
    attr.adjustWhen "vs poison", "racial", 2
    attr.adjustWhen "vs charm", "racial", 2
    test.equal attr.adjustments("vs poison").length, 2
    test.equal attr.adjustment("vs poison"), 3
    test.done()

  "#score without base raises exception": (test) ->
    attr = new Attribute
    test.throws -> attr.score()
    test.done()

  "#score without adjustments returns base": (test) ->
    attr = new Attribute 10
    test.equal attr.score(), 10
    test.done()

  "#score returns sum of adjustments and base": (test) ->
    attr = new Attribute 10
    attr.adjust "racial", 2
    attr.adjust "feat", 1
    test.equal attr.score(), 13
    test.done()

  "#score with functional adjustment should evaluate adjustment": (test) ->
    n = 2
    attr = new Attribute 10
    attr.adjust "racial", -> n
    test.equal attr.score(), 12
    n = 4
    test.equal attr.score(), 14
    test.done()
    
  "#has returns presence of matching adjustment": (test) ->
    attr = new Attribute 10
    attr.adjust "racial", 2
    test.ok !attr.has(1, "racial")
    test.ok !attr.has(2, "feat")
    test.ok attr.has(2, "racial")
    test.done()
