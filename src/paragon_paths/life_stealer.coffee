module.exports = class LifeStealer
  constructor: (npc) ->
    @id = LifeStealer.id
    @name = LifeStealer.simpleName
    @powers = LifeStealer.powers
    @npc = npc

    npc.feature "class", "Infernal Action"
    npc.feature "class", "Collect Life Spark"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Sustain Life Spark")
      @npc.feature "class", "Sustain Life Spark"

LifeStealer.id = "lifeStealer"
LifeStealer.simpleName = "life-stealer"
LifeStealer.accepts = (npc) ->
  npc.class.name is "warlock" and npc.hasFeature "class", "Infernal Pact"

LifeStealer.powers =
  encounter:
    11: [ "SoulScorch" ]

  daily:
    20: [ "Soultheft" ]

  utility:
    12: [ "LifeSparkSummons" ]
