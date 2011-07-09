module.exports = class Feytouched
  constructor: (npc) ->
    @id = Feytouched.id
    @name = Feytouched.simpleName
    @powers = Feytouched.powers
    @npc = npc

    npc.feature "class", "Feytouched Action"
    npc.feature "class", "Slashing Wake"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Patron's Favor")
      @npc.feature "class", "Patron's Favor"

Feytouched.id = "feytouched"
Feytouched.simpleName = "feytouched"
Feytouched.accepts = (npc) ->
  npc.class.name is "warlock" and npc.hasFeature "class", "Fey Pact"

Feytouched.powers =
  encounter:
    11: [ "WillOfTheFeywild" ]

  daily:
    20: [ "WhispersOfTheFey" ]

  utility:
    12: [ "TwilightTeleport" ]
