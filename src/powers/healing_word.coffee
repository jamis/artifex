module.exports = class HealingWord
  constructor: (@npc) ->
    @name = "Healing Word"

  range: ->
    size = if @npc.level < 11 then 5 else if @npc.level < 21 then 10 else 15
    "Close burst #{size}"

  frequency: -> if @npc.level < 16 then 2 else 3

  effect: -> "+#{Math.ceil(@npc.level/5)}d6"
