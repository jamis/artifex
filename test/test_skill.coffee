{Ability, Skill} = require '..'

module.exports =
  "should automatically set base to 0": (test) ->
    skill = new Skill new Ability 10
    test.equal skill.base(), 0
    test.done()
    
  "should accept an ability score on construction": (test) ->
    skill = new Skill new Ability 10
    test.ok skill.ability.score(), 10
    test.done()

  "#score should include ability modifier": (test) ->
    skill = new Skill new Ability 10
    test.equal skill.score(), 0
    skill.ability = new Ability 14
    test.equal skill.score(), 2
    test.done()

  "#score should add 5 when skill is trained": (test) ->
    skill = new Skill new Ability 14
    test.equal skill.score(), 2
    skill.trained = true
    test.equal skill.score(), 7
    test.done()
