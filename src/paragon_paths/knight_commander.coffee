Armor = require '../armor'

module.exports = class KnightCommander
  constructor: (npc) ->
    @id = KnightCommander.id
    @name = KnightCommander.simpleName
    @powers = KnightCommander.powers
    @npc = npc

    npc.feature "class", "Honor and Glory"
    npc.feature "class", "Knight Commander's Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Press of Arms")
      @npc.feature "class", "Press of Arms"

KnightCommander.id = "knightCommander"
KnightCommander.simpleName = "knight commander"
KnightCommander.accepts = (npc) ->
  npc.class.name is "warlord" and Armor[npc.armor]? and Armor[npc.armor].category is "heavy"

KnightCommander.powers =
  encounter:
    11: [ "SlashAndPress" ]

  daily:
    20: [ "ControlTheField" ]

  utility:
    12: [ "BreakTheirNerve" ]
