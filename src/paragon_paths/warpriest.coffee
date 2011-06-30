Armor = require '../armor'

module.exports = class Warpriest
  constructor: (npc) ->
    @id = Warpriest.id
    @name = Warpriest.simpleName
    @powers = Warpriest.powers
    @npc = npc

    npc.feature "class", "Extra Damage Action"
    npc.feature "class", "Warpriest's Strategy"
    npc.feature "class", "Warpriest's Training"

    npc.defenses.ac.adjust "Warpriest", ->
      if Armor[npc.armor]? and Armor[npc.armor].category is "heavy"
        1
      else
        0

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Warpriest's Challenge")
      @npc.feature "class", "Warpriest's Challenge"

Warpriest.id = "warpriest"
Warpriest.simpleName = "warpriest"
Warpriest.accepts = (npc) -> npc.class.name is "cleric"

Warpriest.powers =
  encounter:
    11: [ "BattleCry" ]

  daily:
    20: [ "BattlePyres" ]

  utility:
    12: [ "BattleFavor" ]
