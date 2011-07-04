module.exports = class CatBurglar
  constructor: (npc) ->
    @id = CatBurglar.id
    @name = CatBurglar.simpleName
    @powers = CatBurglar.powers
    @npc = npc

    npc.feature "class", "Acrobatic Action"
    npc.feature "class", "Body Control"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Athletic Master")
      @npc.feature "class", "Athletic Master"

CatBurglar.id = "catBurglar"
CatBurglar.simpleName = "cat burglar"
CatBurglar.accepts = (npc) -> npc.class.name is "rogue"

CatBurglar.powers =
  encounter:
    11: [ "CatBurglarsGambit" ]

  daily:
    20: [ "RedirectedDeath" ]

  utility:
    12: [ "InstantEscape" ]
