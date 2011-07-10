module.exports = class BattleMage
  constructor: (npc) ->
    @id = BattleMage.id
    @name = BattleMage.simpleName
    @powers = BattleMage.powers
    @npc = npc

    npc.feature "class", "Arcane Riposte"
    npc.feature "class", "Battle Mage Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Battle Edge")
      @npc.feature "class", "Battle Edge"

BattleMage.id = "battleMage"
BattleMage.simpleName = "battle mage"
BattleMage.accepts = (npc) -> npc.class.name is "wizard"

BattleMage.powers =
  encounter:
    11: [ "ForcefulRetort" ]

  daily:
    20: [ "ClosingSpell" ]

  utility:
    12: [ "ArcaneRejuvenation" ]
