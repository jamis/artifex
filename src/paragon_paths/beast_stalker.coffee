module.exports = class BeastStalker
  constructor: (npc) ->
    @id = BeastStalker.id
    @name = BeastStalker.simpleName
    @powers = BeastStalker.powers
    @npc = npc

    npc.feature "class", "Beast Stalker's Action"

    prey = @npc.random.pick "beast", "magical beast"
    npc.feature "class", "Chosen Prey (#{prey})"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Action Shift")
      @npc.feature "class", "Action Shift"

BeastStalker.id = "beastStalker"
BeastStalker.simpleName = "beast stalker"
BeastStalker.accepts = (npc) ->
  npc.class.name is "ranger" and npc.hasFeature("class", "Archer Fighting Style")

BeastStalker.powers =
  encounter:
    11: [ "PinpointingArrow" ]

  daily:
    20: [ "BeastStalkersTarget" ]

  utility:
    12: [ "HuntersGrace" ]
