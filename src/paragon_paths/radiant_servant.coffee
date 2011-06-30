module.exports = class RadiantServant
  constructor: (npc) ->
    @id = RadiantServant.id
    @name = RadiantServant.simpleName
    @powers = RadiantServant.powers
    @npc = npc

    npc.feature "class", "Illuminating Attacks"
    npc.feature "class", "Radiant Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Lasting Light")
      @npc.feature "class", "Lasting Light"

RadiantServant.id = "radiantServant"
RadiantServant.simpleName = "radiant servant"
RadiantServant.accepts = (npc) -> npc.class.name is "cleric"

RadiantServant.powers =
  encounter:
    11: [ "SolarWrath" ]

  daily:
    20: [ "RadiantBrilliance" ]

  utility:
    12: [ "HealingSun" ]
