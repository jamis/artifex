module.exports = class CombatVeteran
  constructor: (npc) ->
    @id = CombatVeteran.id
    @name = CombatVeteran.simpleName
    @powers = CombatVeteran.powers
    @npc = npc

    npc.feature "class", "Combat Veteran's Action"
    npc.feature "class", "Tough as Nails"

    npc.healingSurge.count.adjust 1
    npc.healingSurge.value.adjust => npc.abilities.con.modifier()

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Battle Healer")
      @npc.feature "class", "Battle Healer"

CombatVeteran.id = "combatVeteran"
CombatVeteran.simpleName = "combat veteran"
CombatVeteran.accepts = (npc) -> npc.class.name is "warlord"

CombatVeteran.powers =
  encounter:
    11: [ "SkirmishPloy" ]

  daily:
    20: [ "SuperiorTactics" ]

  utility:
    12: [ "MissMeOnce" ]
