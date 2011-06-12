Powers = require '../powers'

module.exports = class Eladrin
  constructor: (npc) ->
    @name = "eladrin"

    npc.vision = "low-light"

    npc.abilities.dex.adjust "racial", 2
    npc.abilities.int_.adjust "racial", 2

    npc.skills.arcana.adjust "racial", 2
    npc.skills.history.adjust "racial", 2

    npc.size = "medium"
    npc.speed.baseValue = 6

    npc.feature "racial", "Eladrin Education"
    npc.pendingSkills.push count: 1

    npc.feature "racial", "Eladrin Weapon Proficiency"
    npc.proficiencies.weapons.push "longsword"

    npc.feature "racial", "Eladrin Will", "+1 to Will, +5 vs. saves against charm"
    npc.defenses.will.adjust "racial", 1
    npc.defenses.save.adjustWhen "vs charm", "racial", 5

    npc.feature "racial", "Fey Origin"
    npc.descriptors.push "fey"
    npc.feature "racial", "Trance", "4 hour trance, same as 6 hour sleep"

    npc.feature "racial", "Fey Step"
    npc.powers.encounter.push Powers.get("FeyStep", npc: npc)

    npc.languages.push "common"
    npc.languages.push "elven"

    npc.height = npc.random.fuzz(65, 73, 10)
    npc.weight = npc.random.fuzz(130, 180, 5)

    npc.name = npc.random.pick(Eladrin.names[npc.gender]...) if npc.gender?

  is: (name) -> @name is name

Eladrin.source = "phb"

Eladrin.names =
  male  : [ "aramil", "arannis", "berrian", "dayereth", "erevan", "galinndan", "hadarai",
            "immeral", "mindartis", "paelias", "quarion", "rioardon", "soveliss" ]
  female: [ "althaea", "anastrianna", "andraste", "bethrynna", "caelynna", "jelenneth",
            "leshanna", "meriele", "naivara", "quelenna", "sariel", "shanairra",
            "theirastra", "valenae" ]
