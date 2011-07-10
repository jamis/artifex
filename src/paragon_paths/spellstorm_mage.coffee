module.exports = class SpellstormMage
  constructor: (npc) ->
    @id = SpellstormMage.id
    @name = SpellstormMage.simpleName
    @powers = SpellstormMage.powers
    @npc = npc

    npc.feature "class", "Extra Damage Action"
    npc.feature "class", "Storm Spell"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Storm Fury")
      @npc.feature "class", "Storm Fury"

SpellstormMage.id = "spellstormMage"
SpellstormMage.simpleName = "spellstorm mage"
SpellstormMage.accepts = (npc) -> npc.class.name is "wizard"

SpellstormMage.powers =
  encounter:
    11: [ "StormCage" ]

  daily:
    20: [ "MaelstromOfChaos" ]

  utility:
    12: [ "SuddenStorm" ]
