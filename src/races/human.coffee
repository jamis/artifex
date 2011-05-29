Languages = require '../languages'

module.exports = class Human
  constructor: (npc) ->
    @name = "human"

    # FIXME: defer selection of the ability score bonus until after ability
    # scores have been generated and assigned.
    score = npc.random.pick "str", "con", "dex", "int", "wis", "cha"
    npc.abilities[score].adjust "racial", 2

    npc.vision = "normal"

    npc.size = "medium"
    npc.speed.baseValue = 6

    npc.feature "racial", "Bonus At-Will Power"
    npc.pendingPowers.push count: 1, category: "atWill", list: (npc) -> npc.class.powers.atWill[1]

    npc.feature "racial", "Bonus Feat"
    npc.pendingFeats.push count: 1

    npc.feature "racial", "Bonus Skill"
    npc.pendingSkills.push count: 1, list: (npc) -> npc.class.skills

    npc.feature "racial", "Human Defense Bonuses"
    npc.defenses.fort.adjust "racial", 1
    npc.defenses.ref.adjust "racial", 1
    npc.defenses.will.adjust "racial", 1

    npc.languages.push "common"
    npc.languages.push npc.random.pick(Languages.possible(npc)...)

    npc.height = npc.random.fuzz(66, 74, 10)
    npc.weight = npc.random.fuzz(135, 220, 5)

    npc.name = npc.random.pick(Human.names[npc.gender]...) if npc.gender?

  is: (name) -> @name is name

Human.source = "phb"

Human.names =
  male  : [ "alain", "alek", "benn", "brandis", "donn", "drew", "erik", "greg", "jonn",
            "kris", "marc", "mikal", "pieter", "regdar", "quinn", "samm", "thom", "wil" ]
  female: [ "ana", "cassi", "eliza", "gwenn", "jenn", "kat", "keira", "luusi", "mari",
            "mika", "miri", "stasi", "shawna", "zanne" ]
