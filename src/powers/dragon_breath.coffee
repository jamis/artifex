module.exports = class DragonBreath
  constructor: (@npc, @descriptor) ->
    @name = "Dragon breath (#{@descriptor})"

  range: -> "Close burst #{@npc.breath.range}"

  attack: ->
    bonus = Math.ceil(@npc.level / 10) * 2
    total = @npc.abilities[@npc.breath.ability].modifier() + bonus
    "#{@npc.breath.ability}+#{bonus} (+#{total}) vs. Reflex"

  hit: ->
    dice = Math.ceil(@npc.level / 10)
    damage = "#{dice}d6"
    con = @npc.abilities.con.modifier()
    damage += "+#{con}" if con != 0
    damage
