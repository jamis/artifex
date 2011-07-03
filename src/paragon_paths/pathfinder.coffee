module.exports = class Pathfinder
  constructor: (npc) ->
    @id = Pathfinder.id
    @name = Pathfinder.simpleName
    @powers = Pathfinder.powers
    @npc = npc

    npc.feature "class", "Battlehoned"
    npc.healingSurge.count.adjust 2

    npc.feature "class", "Pathfinder's Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Cruel Recovery")
      @npc.feature "class", "Cruel Recovery"

Pathfinder.id = "pathfinder"
Pathfinder.simpleName = "pathfinder"
Pathfinder.accepts = (npc) ->
  npc.class.name is "ranger" and npc.hasFeature("class", "Two-Blade Fighting Style")

Pathfinder.powers =
  encounter:
    11: [ "WrongStep" ]

  daily:
    20: [ "SlashersMark" ]

  utility:
    12: [ "ActTogether" ]
