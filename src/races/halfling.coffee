Powers    = require '../powers'
Languages = require '../languages'

module.exports = class Halfling
  constructor: (npc) ->
    @name = "halfling"

    npc.abilities.dex.adjust "racial", 2
    npc.abilities.cha.adjust "racial", 2

    npc.vision = "normal"

    npc.skills.acrobatics.adjust "racial", 2
    npc.skills.thievery.adjust "racial", 2

    npc.size = "small"
    npc.speed.baseValue = 6

    npc.feature "racial", "Bold", "+5 to saves vs. fear"
    npc.defenses.save.adjustWhen "vs fear", "racial", 5

    npc.feature "racial", "Nimble Reaction", "+2 to AC vs. opportunity attacks"
    npc.defenses.ac.adjustWhen "vs opportunity attack", "racial", 2

    npc.feature "racial", "Second Chance"
    npc.powers.encounter.push Powers.get("SecondChance", npc: npc)

    npc.languages.push "common"
    npc.languages.push npc.random.pick(Languages.possible(npc)...)

    npc.height = npc.random.fuzz(46, 50, 10)
    npc.weight = npc.random.fuzz(75, 85, 5)

    npc.name = npc.random.pick(Halfling.names[npc.gender]...) if npc.gender?

  is: (name) -> @name is name

Halfling.source = "phb"

Halfling.names =
  male  : [ "ander", "corrin", "dannad", "errich", "finnan", "garret", "lazam", "lindal",
            "merric", "nebin", "ostran", "perrin", "reed", "shardon", "ulmo", "wenner" ]
  female: [ "andrey", "bree", "callie", "chenna", "eida", "kithri", "lidda", "nedda",
            "paela", "shaena", "tryn", "vani", "verna", "wella" ]
