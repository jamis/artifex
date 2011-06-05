module.exports = class Dwarf
  constructor: (npc) ->
    @name = "dwarf"

    npc.vision = "low-light"

    npc.abilities.con.adjust "racial", 2
    npc.abilities.wis.adjust "racial", 2

    npc.skills.dungeoneering.adjust "racial", 2
    npc.skills.endurance.adjust "racial", 2

    npc.size = "medium"
    npc.speed.baseValue = 5

    npc.feature "racial", "Cast-Iron Stomach", "+5 racial bonus to save vs. poison"
    npc.defenses.save.adjustWhen "vs poison", "racial", 5

    npc.feature "racial", "Dwarven Weapon Proficiency"
    npc.proficiencies.weapons.push "throwingHammer"
    npc.proficiencies.weapons.push "warhammer"

    npc.feature "racial", "Dwarven Resilience", "second wind is a minor action"
    npc.feature "racial", "Encumbered Speed"
    npc.feature "racial", "Stand Your Ground"

    npc.languages.push "common"
    npc.languages.push "dwarven"

    npc.height = npc.random.fuzz(51, 57, 10)
    npc.weight = npc.random.fuzz(160, 220, 5)

    npc.name = npc.random.pick(Dwarf.names[npc.gender]...) if npc.gender?

  is: (name) -> @name is name

Dwarf.source = "phb"

Dwarf.names =
  male  : [ "adrik", "baern", "berend", "darrak", "eberk", "fargrim", "gardain", "harbek",
            "kildrak", "morgran", "orsik", "rangrim", "thoradin", "thorfin", "tordek",
            "travok", "vondal" ]
  female: [ "artin", "bardryn", "diesa", "eldeth", "falkrunn", "gurdis", "helja", "kathra",
            "kristryd", "mardred", "riswynn", "torbera", "vistra" ]
