module.exports = class Daggermaster
  constructor: (npc) ->
    @id = Daggermaster.id
    @name = Daggermaster.simpleName
    @powers = Daggermaster.powers
    @npc = npc

    npc.feature "class", "Daggermaster's Action"
    npc.feature "class", "Dagger Precision"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Dagger Advantage")
      @npc.feature "class", "Dagger Advantage"

Daggermaster.id = "daggermaster"
Daggermaster.simpleName = "daggermaster"
Daggermaster.accepts = (npc) ->
  npc.class.name is "rogue" and "dagger" in npc.equipment.weapons()

Daggermaster.powers =
  encounter:
    11: [ "CriticalOpportunity" ]

  daily:
    20: [ "DeepDaggerWound" ]

  utility:
    12: [ "MeditationOfTheBlade" ]
