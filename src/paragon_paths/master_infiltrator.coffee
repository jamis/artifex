module.exports = class MasterInfiltrator
  constructor: (npc) ->
    @id = MasterInfiltrator.id
    @name = MasterInfiltrator.simpleName
    @powers = MasterInfiltrator.powers
    @npc = npc

    npc.feature "class", "Infiltrator's Action"
    npc.feature "class", "Skillful Infiltrator"

    npc.skills.acrobatics.adjust 2
    npc.skills.athletics.adjust 2
    npc.skills.stealth.adjust 2

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Invisible Infiltrator")
      @npc.feature "class", "Invisible Infiltrator"

MasterInfiltrator.id = "masterInfiltrator"
MasterInfiltrator.simpleName = "master infiltrator"
MasterInfiltrator.accepts = (npc) -> npc.class.name is "rogue"

MasterInfiltrator.powers =
  encounter:
    11: [ "DistractingWound" ]

  daily:
    20: [ "PainfulPuncture" ]

  utility:
    12: [ "ImpossibleToCatch" ]
