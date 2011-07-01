module.exports = class IronVanguard
  constructor: (npc) ->
    @id = IronVanguard.id
    @name = IronVanguard.simpleName
    @powers = IronVanguard.powers
    @npc = npc

    npc.feature "class", "Enduring Warrior"
    npc.feature "class", "Ferocious Reaction"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Trample the Fallen")
      @npc.feature "class", "Trample the Fallen"

IronVanguard.id = "ironVanguard"
IronVanguard.simpleName = "iron vanguard"
IronVanguard.accepts = (npc) -> npc.class.name is "fighter"

IronVanguard.powers =
  encounter:
    11: [ "FrontlineSurge" ]

  daily:
    20: [ "IndomitableStrength" ]

  utility:
    12: [ "InexorableShift" ]
