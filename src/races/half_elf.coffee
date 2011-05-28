Classes   = require '../classes'
Languages = require '../languages'
Elf       = require '../races/elf'
Human     = require '../races/human'

module.exports = class HalfElf
  constructor: (npc) ->
    @name = "half-elf"

    npc.abilities.con.adjust "racial", 2
    npc.abilities.cha.adjust "racial", 2

    npc.vision = "low-light"

    npc.skills.diplomacy.adjust "racial", 2
    npc.skills.insight.adjust "racial", 2

    npc.size = "medium"
    npc.speed.baseValue = 6

    npc.feature "racial", "Dilettante"
    npc.pendingPowers.push count: 1, category: "encounter", list: (npc) ->
        possible = []
        for klass in Classes.All
          possible.push klass unless klass.simpleName is npc.class.name
        npc.random.pick(possible...).powers.atWill[1]

    npc.feature "racial", "Dual Heritage"
    npc.feature "racial", "Group Diplomacy", "allies w/in 10 squares get +1 to diplomacy"

    npc.languages.push "common"
    npc.languages.push "elven"
    npc.languages.push npc.random.pick(Languages.possible(npc)...)

    npc.height = npc.random.fuzz(65, 74, 10)
    npc.weight = npc.random.fuzz(130, 190, 5)

    npc.name = npc.random.pick(HalfElf.names[npc.gender]...) if npc.gender?

  is: (name) -> name in [ "elf", "human", @name ]

HalfElf.source = "phb"

HalfElf.names =
  male  : Elf.names.male.concat(Human.names.male)
  female: Elf.names.female.concat(Human.names.female)
