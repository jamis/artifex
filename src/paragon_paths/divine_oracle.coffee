module.exports = class DivineOracle
  constructor: (npc) ->
    @id = DivineOracle.id
    @name = DivineOracle.simpleName
    @powers = DivineOracle.powers
    @npc = npc

    npc.feature "class", "Foresight"
    npc.feature "class", "Prophetic Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Terrifying Insight")
      @npc.feature "class", "Terrifying Insight"

DivineOracle.id = "divineOracle"
DivineOracle.simpleName = "divine oracle"
DivineOracle.accepts = (npc) -> npc.class.name is "cleric"

DivineOracle.powers =
  encounter:
    11: [ "ProphecyOfDoom" ]

  daily:
    20: [ "HammerOfFate" ]

  utility:
    12: [ "GoodOmens" ]
