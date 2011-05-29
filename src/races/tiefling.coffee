Generic   = require '../powers/generic'
Languages = require '../languages'

module.exports = class Tiefling
  constructor: (npc) ->
    @name = "tiefling"

    npc.vision = "low-light"

    npc.abilities.int_.adjust "racial", 2
    npc.abilities.cha.adjust "racial", 2

    npc.skills.bluff.adjust "racial", 2
    npc.skills.stealth.adjust "racial", 2

    npc.size = "medium"
    npc.speed.baseValue = 6

    npc.feature "racial", "Bloodhunt", "+1 to attack vs. bloodied foes"
    npc.feature "racial", "Fire Resistance"
    npc.feature "racial", "Infernal Wrath"

    npc.resistance.fire.baseValue = 5
    npc.resistance.fire.adjust "racial", -> Math.floor(npc.level/2)

    infernalWrath = new Generic name: "Infernal Wrath", npc: npc, hit: "{cha} (special)"
    npc.powers.encounter.push infernalWrath

    npc.languages.push "common"
    npc.languages.push npc.random.pick(Languages.possible(npc)...)

    npc.height = npc.random.fuzz(66, 72, 10)
    npc.weight = npc.random.fuzz(140, 230, 5)

    # FIXME: have a chance at picking one of Tiefling.names.modern...
    npc.name = npc.random.pick(Tiefling.names[npc.gender]...) if npc.gender?

  is: (name) -> @name is name

Tiefling.source = "phb"

Tiefling.names =
  modern: [ "art", "carrion", "chant", "despair", "fear", "gladness", "hope", "ideal",
            "music", "nowhere", "open", "poetry", "quest", "random", "reverence", "sorrow",
            "torment", "weary" ]
  male  : [ "akmenos", "amnon", "barakas", "damakos", "ekemon", "iados", "kairon", "leucis",
            "melech", "morthos", "pelaios", "skamos", "therai" ]
  female: [ "akta", "bryseis", "damaia", "ea", "kallista", "lerissa", "makaria", "nemeia",
            "orianna", "phelaia", "rieta" ]
