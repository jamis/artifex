module.exports = class Stormwarden
  constructor: (npc) ->
    @id = Stormwarden.id
    @name = Stormwarden.simpleName
    @powers = Stormwarden.powers
    @npc = npc

    npc.feature "class", "Blade Storm"
    npc.feature "class", "Stormstep Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Twin-Blade Storm")
      @npc.feature "class", "Twin-Blade Storm"

Stormwarden.id = "stormwarden"
Stormwarden.simpleName = "stormwarden"
Stormwarden.accepts = (npc) ->
  npc.class.name is "ranger" and npc.hasFeature("class", "Two-Blade Fighting Style")

Stormwarden.powers =
  encounter:
    11: [ "ClearingTheGround" ]

  daily:
    20: [ "ColdSteelHurricane" ]

  utility:
    12: [ "ThrowCautionToTheWind" ]
