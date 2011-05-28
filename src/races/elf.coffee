Generic = require '../powers/generic'

module.exports = class Elf
  constructor: (npc) ->
    @name = "elf"

    npc.abilities.dex.adjust "racial", 2
    npc.abilities.wis.adjust "racial", 2

    npc.vision = "low-light"

    npc.skills.nature.adjust "racial", 2
    npc.skills.perception.adjust "racial", 2

    npc.size = "medium"
    npc.speed.baseValue = 7

    npc.feature "racial", "Elven Weapon Proficiency"
    npc.proficiencies.weapons.push "longbow"
    npc.proficiencies.weapons.push "shortbow"

    npc.feature "racial", "Fey Origin"
    npc.descriptors.push "fey"

    npc.feature "racial", "Group Awareness", "non-elf allies w/in 5 squares get +1 to perception"
    npc.feature "racial", "Wild Step", "ignore difficult terrain while shifting"

    npc.feature "racial", "Elven Accuracy"
    npc.powers.encounter.push new Generic name: "Elven Accuracy"

    npc.languages.push "common"
    npc.languages.push "elven"

    npc.height = npc.random.fuzz(64, 72, 10)
    npc.weight = npc.random.fuzz(130, 170, 5)

    npc.name = npc.random.pick(Elf.names[npc.gender]...) if npc.gender?

Elf.source = "phb"

Elf.names =
  male  : [ "adran", "aelar", "beiro", "carric", "erdan", "gennal", "heian", "lucan",
            "peren", "rolan", "theren", "varis" ]
  female: [ "adrie", "birel", "chaedi", "dara", "enna", "faral", "irann", "keyleth",
            "lia", "mialee", "shava", "thia", "valna" ]
