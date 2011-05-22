DragonBreath = require '../powers/dragon_breath'

module.exports = class Dragonborn
  constructor: (npc) ->
    @name = "dragonborn"

    npc.vision = "normal"

    npc.abilities.str.adjust "racial", 2
    npc.abilities.cha.adjust "racial", 2

    npc.skills.history.adjust "racial", 2
    npc.skills.intimidate.adjust "racial", 2

    npc.size = "medium"
    npc.speed.baseValue = 6

    @descriptor = npc.random.pick "acid", "cold", "fire", "lightning", "poison"
    npc.descriptors.push @descriptor

    # FIXME: breath.ability should be chosen more optimally.
    # should look at which npc ability is strongest and use that, but need to
    # wait until after the ability scores have been generated and assigned.

    npc.breath =
      range: 3
      ability: npc.random.pick "dex", "str", "con"

    dragonBreath = new DragonBreath npc, @descriptor
    npc.powers.encounter.push dragonBreath

    npc.feature "racial", "Dragonborn fury", "+1 to attack when bloodied"
    npc.feature "racial", "Draconic heritage", "add CON modifier to surge value"
    npc.feature "racial", dragonBreath.name

    npc.healingSurge.value.adjust "racial", => npc.abilities.con.modifier()

    npc.languages.push "common"
    npc.languages.push "draconic"

    npc.height = npc.random.fuzz(74, 80, 10)
    npc.weight = npc.random.fuzz(220, 320, 5)

    npc.name = npc.random.pick(Dragonborn.names[npc.gender]...) if npc.gender?

Dragonborn.source = "phb"

# FIXME: use names from PHB
Dragonborn.names =
  male  : [ "alf", "golf" ]
  female: [ "elf", "gilf" ]
