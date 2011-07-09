module.exports = class Doomsayer
  constructor: (npc) ->
    @id = Doomsayer.id
    @name = Doomsayer.simpleName
    @powers = Doomsayer.powers
    @npc = npc

    npc.feature "class", "Doomsayer's Action"
    npc.feature "class", "Doomsayer's Proclamation"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Doomsayer's Oath")
      @npc.feature "class", "Doomsayer's Oath"

Doomsayer.id = "doomsayer"
Doomsayer.simpleName = "doomsayer"
Doomsayer.accepts = (npc) ->
  npc.class.name is "warlock" and npc.hasFeature "class", "Star Pact"

Doomsayer.powers =
  encounter:
    11: [ "FatesEntwined" ]

  daily:
    20: [ "LongFallIntoDarkness" ]

  utility:
    12: [ "AccursedShroud" ]
