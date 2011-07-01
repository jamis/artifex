Armor = require '../armor'

module.exports = class PitFighter
  constructor: (npc) ->
    @id = PitFighter.id
    @name = PitFighter.simpleName
    @powers = PitFighter.powers
    @npc = npc

    npc.feature "class", "Armor Optimization"
    npc.defenses.ac.adjust ->
      if Armor[npc.armor]? && Armor[npc.armor].bonus > 0
        1
      else
        0

    npc.feature "class", "Extra Damage Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Dirty Fighting")
      @npc.feature "class", "Dirty Fighting"
      @npc.damage.general.adjust =>
        if @npc.abilities.wis.modifier() > 0
          @npc.abilities.wis.modifier()
        else
          1

PitFighter.id = "pitFighter"
PitFighter.simpleName = "pit fighter"
PitFighter.accepts = (npc) -> npc.class.name is "fighter"

PitFighter.powers =
  encounter:
    11: [ "AllBetsAreOff" ]

  daily:
    20: [ "LionOfBattle" ]

  utility:
    12: [ "DeadlyPayback" ]
