module.exports = class BloodMage
  constructor: (npc) ->
    @id = BloodMage.id
    @name = BloodMage.simpleName
    @powers = BloodMage.powers
    @npc = npc

    npc.feature "class", "Blood Action"
    npc.feature "class", "Bolstering Blood"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Burning Blood")
      @npc.feature "class", "Burning Blood"

BloodMage.id = "bloodMage"
BloodMage.simpleName = "blood mage"
BloodMage.accepts = (npc) -> npc.class.name is "wizard"

BloodMage.powers =
  encounter:
    11: [ "BloodPulse" ]

  daily:
    20: [ "DestructiveSalutation" ]

  utility:
    12: [ "SoulBurn" ]
