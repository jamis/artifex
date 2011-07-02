module.exports = class ChampionOfOrder
  constructor: (npc) ->
    @id = ChampionOfOrder.id
    @name = ChampionOfOrder.simpleName
    @powers = ChampionOfOrder.powers
    @npc = npc

    npc.feature "class", "Champion's Action"
    npc.feature "class", "In Defense of Order"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Champion's Hammer")
      @npc.feature "class", "Champion's Hammer"

ChampionOfOrder.id = "championOfOrder"
ChampionOfOrder.simpleName = "champion of order"
ChampionOfOrder.accepts = (npc) ->
  npc.class.name is "paladin" and not npc.alignment.match /chaotic/

ChampionOfOrder.powers =
  encounter:
    11: [ "CertainJustice" ]

  daily:
    20: [ "RuleOfOrder" ]

  utility:
    12: [ "NoneShallPass" ]
