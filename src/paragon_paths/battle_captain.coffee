module.exports = class BattleCaptain
  constructor: (npc) ->
    @id = BattleCaptain.id
    @name = BattleCaptain.simpleName
    @powers = BattleCaptain.powers
    @npc = npc

    npc.feature "class", "Battle Action"
    npc.feature "class", "Cry Havoc"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Battle Inspiration")
      @npc.feature "class", "Battle Inspiration"

BattleCaptain.id = "battleCaptain"
BattleCaptain.simpleName = "battle captain"
BattleCaptain.accepts = (npc) -> npc.class.name is "warlord"

BattleCaptain.powers =
  encounter:
    11: [ "ForceRetreat" ]

  daily:
    20: [ "CunningFlurry" ]

  utility:
    12: [ "BoltOfGenius" ]
