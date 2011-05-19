module.exports = class TurnUndead
  constructor: (@npc) ->
    @name = "Channel Divinity: Turn Undead"

  range: ->
    size = if @npc.level < 11
        2
      else if @npc.level < 21
        5
      else
        8

    "Close burst #{size}"

  attack: ->
    "Wisdom (+#{@npc.abilities.wis.modifier()}) vs. Will"

  hit: ->
    wis = @npc.abilities.wis.modifier()

    dice = if @npc.level < 5
      1
    else if @npc.level < 11
      2
    else if @npc.level < 15
      3
    else if @npc.level < 21
      4
    else if @npc.level < 25
      5
    else
      6
    
    distance = 3 + @npc.abilities.cha.modifier()

    damage = "#{dice}d10"
    damage += "+#{wis}" if wis isnt 0
    damage + ", pushed #{distance} (special)"
