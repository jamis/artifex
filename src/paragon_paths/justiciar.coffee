module.exports = class Justiciar
  constructor: (npc) ->
    @id = Justiciar.id
    @name = Justiciar.simpleName
    @powers = Justiciar.powers
    @npc = npc

    npc.feature "class", "Just Action"
    npc.feature "class", "Just Spirit"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Just Shelter")
      @npc.feature "class", "Just Shelter"

Justiciar.id = "justiciar"
Justiciar.simpleName = "justiciar"
Justiciar.accepts = (npc) -> npc.class.name is "paladin"

Justiciar.powers =
  encounter:
    11: [ "JustRadiance" ]

  daily:
    20: [ "ChallengeTheUnjust" ]

  utility:
    12: [ "StrikeMeInstead" ]
