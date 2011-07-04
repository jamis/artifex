module.exports = class ShadowAssassin
  constructor: (npc) ->
    @id = ShadowAssassin.id
    @name = ShadowAssassin.simpleName
    @powers = ShadowAssassin.powers
    @npc = npc

    npc.feature "class", "Shadow Assassin's Action"
    npc.feature "class", "Shadow Assassin's Riposte"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Bloody Evisceration")
      @npc.feature "class", "Bloody Evisceration"

ShadowAssassin.id = "shadowAssassin"
ShadowAssassin.simpleName = "shadow assassin"
ShadowAssassin.accepts = (npc) -> npc.class.name is "rogue"

ShadowAssassin.powers =
  encounter:
    11: [ "KillersEye" ]

  daily:
    20: [ "FinalBlow" ]

  utility:
    12: [ "BadIdeaFriend" ]
