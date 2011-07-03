module.exports = class BattlefieldArcher
  constructor: (npc) ->
    @id = BattlefieldArcher.id
    @name = BattlefieldArcher.simpleName
    @powers = BattlefieldArcher.powers
    @npc = npc

    npc.feature "class", "Archer's Action"
    npc.feature "class", "Battlefield Experience"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Battle Surge")
      @npc.feature "class", "Battle Surge"

BattlefieldArcher.id = "battlefieldArcher"
BattlefieldArcher.simpleName = "battlefield archer"
BattlefieldArcher.accepts = (npc) ->
  npc.class.name is "ranger" and npc.hasFeature("class", "Archer Fighting Style")

BattlefieldArcher.powers =
  encounter:
    11: [ "CombinedFire" ]

  daily:
    20: [ "QuarrysBane" ]

  utility:
    12: [ "ArchersGlory" ]
