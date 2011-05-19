{NPC, Powers} = require '../..'

module.exports =
  "should be able to set properties": (test) ->
    power = new Powers.Generic (p) ->
      p.name = "Healing Word"
      p.description = "+1d6"
    test.equal power.name, "Healing Word"
    test.equal power.description, "+1d6"
    test.done()
