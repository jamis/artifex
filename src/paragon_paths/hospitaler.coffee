module.exports = class Hospitaler
  constructor: (npc) ->
    @id = Hospitaler.id
    @name = Hospitaler.simpleName
    @powers = Hospitaler.powers
    @npc = npc

    npc.feature "class", "Hospitaler's Blessing"
    npc.feature "class", "Hospitaler's Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Hospitaler's Care")
      @npc.feature "class", "Hospitaler's Care"

Hospitaler.id = "hospitaler"
Hospitaler.simpleName = "hospitaler"
Hospitaler.accepts = (npc) -> npc.class.name is "paladin"

Hospitaler.powers =
  encounter:
    11: [ "WardingBlow" ]

  daily:
    20: [ "LifeGivingSmite" ]

  utility:
    12: [ "HealingFont" ]
