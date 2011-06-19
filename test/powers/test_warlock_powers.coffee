{Verify} = require '../helpers'

uses = (ability) ->
  (power) -> power.ability = ability

pact = (pact) ->
  (power) -> power.npc.feature "class", "#{pact} Pact"

module.exports =
  "[WarlocksCurse] should be defined":
    Verify.testProperties "WarlocksCurse",
      name: [ expect: "Warlock's Curse" ]
      effect: [
        { level:  1, expect: "+1d6 extra damage (special)" },
        { level: 10, expect: "+1d6 extra damage (special)" },
        { level: 11, expect: "+2d6 extra damage (special)" },
        { level: 20, expect: "+2d6 extra damage (special)" },
        { level: 21, expect: "+3d6 extra damage (special)" } ]

  "[DireRadiance] should be defined":
    Verify.testProperties "DireRadiance",
      name: [ expect: "Dire Radiance" ]
      keywords: [ expect: [ "arcane", "fear", "implement", "radiant" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Fortitude" },
        { con: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { level:  1, con: 10, expect: "1d6 damage (special)" },
        { level:  1, con: 16, expect: "1d6+3 damage (special)" },
        { level: 20, con: 16, expect: "1d6+3 damage (special)" }
        { level: 21, con: 16, expect: "2d6+3 damage (special)" } ]

  "[EldritchBlast] should be defined":
    Verify.testProperties "EldritchBlast",
      name: [ expect: "Eldritch Blast" ]
      keywords: [ expect: [ "arcane", "implement" ] ]
      attack: [
        { con: 10, cha: 16, when: uses("con"), expect: "+0 vs. Reflex" },
        { con: 16, cha: 10, when: uses("cha"), expect: "+0 vs. Reflex" },
        { con: 16, cha: 14, when: uses("con"), expect: "+3 vs. Reflex" },
        { con: 16, cha: 14, when: uses("cha"), expect: "+2 vs. Reflex" } ]
      hit: [
        { level:  1, con: 10, cha: 16, when: uses("con"), expect: "1d10 damage" },
        { level:  1, con: 16, cha: 10, when: uses("cha"), expect: "1d10 damage" },
        { level:  1, con: 16, cha: 14, when: uses("con"), expect: "1d10+3 damage" },
        { level:  1, con: 16, cha: 14, when: uses("cha"), expect: "1d10+2 damage" },
        { level: 21, con: 16, cha: 14, when: uses("con"), expect: "2d10+3 damage" } ]

  "[Eyebite] should be defined":
    Verify.testProperties "Eyebite",
      name: [ expect: "Eyebite" ]
      keywords: [ expect: [ "arcane", "charm", "implement", "psychic" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { level:  1, cha: 10, expect: "1d6 damage (special)" },
        { level:  1, cha: 16, expect: "1d6+3 damage (special)" },
        { level: 20, cha: 16, expect: "1d6+3 damage (special)" }
        { level: 21, cha: 16, expect: "2d6+3 damage (special)" } ]

  "[HellishRebuke] should be defined":
    Verify.testProperties "HellishRebuke",
      name: [ expect: "Hellish Rebuke" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Reflex" },
        { con: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, con: 10, expect: "1d6 damage (special)" },
        { level:  1, con: 16, expect: "1d6+3 damage (special)" },
        { level: 20, con: 16, expect: "1d6+3 damage (special)" }
        { level: 21, con: 16, expect: "2d6+3 damage (special)" } ]

  "[DiabolicGrasp] should be defined":
    Verify.testProperties "DiabolicGrasp",
      name: [ expect: "Diabolic Grasp" ]
      keywords: [ expect: [ "arcane", "implement" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Fortitude" },
        { con: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { int_: 10, con: 10, expect: "2d8 damage, slide target 2 squares" },
        { int_: 16, con: 10, expect: "2d8 damage, slide target 2 squares" },
        { int_: 10, con: 16, expect: "2d8+3 damage, slide target 2 squares" },
        { int_: 10, con: 16, when: pact("Star"), expect: "2d8+3 damage, slide target 2 squares" },
        { int_: 10, con: 16, when: pact("Fey"), expect: "2d8+3 damage, slide target 2 squares" },
        { int_: 10, con: 16, when: pact("Infernal"), expect: "2d8+3 damage, slide target 1 square" },
        { int_: 18, con: 16, when: pact("Infernal"), expect: "2d8+3 damage, slide target 5 squares" } ]

  "[DreadfulWord] should be defined":
    Verify.testProperties "DreadfulWord",
      name: [ expect: "Dreadful Word" ]
      keywords: [ expect: [ "arcane", "fear", "implement", "psychic" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { int_: 10, cha: 10, expect: "2d8 damage, target has -1 Will" },
        { int_: 16, cha: 10, expect: "2d8 damage, target has -1 Will" },
        { int_: 10, cha: 16, expect: "2d8+3 damage, target has -1 Will" },
        { int_: 10, cha: 16, when: pact("Infernal"), expect: "2d8+3 damage, target has -1 Will" },
        { int_: 10, cha: 16, when: pact("Fey"), expect: "2d8+3 damage, target has -1 Will" },
        { int_: 10, cha: 16, when: pact("Star"), expect: "2d8+3 damage, target has -1 Will" },
        { int_: 18, cha: 16, when: pact("Star"), expect: "2d8+3 damage, target has -5 Will" } ]

  "[VampiricEmbrace] should be defined":
    Verify.testProperties "VampiricEmbrace",
      name: [ expect: "Vampiric Embrace" ]
      keywords: [ expect: [ "arcane", "implement", "necrotic" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Will" },
        { con: 16, expect: "+3 vs. Will" } ]
      hit: [
        { int_: 10, con: 10, expect: "2d8 damage, you gain 5 temporary HP" },
        { int_: 16, con: 10, expect: "2d8 damage, you gain 5 temporary HP" },
        { int_: 10, con: 16, expect: "2d8+3 damage, you gain 5 temporary HP" },
        { int_: 10, con: 16, when: pact("Star"), expect: "2d8+3 damage, you gain 5 temporary HP" },
        { int_: 10, con: 16, when: pact("Fey"), expect: "2d8+3 damage, you gain 5 temporary HP" },
        { int_: 10, con: 16, when: pact("Infernal"), expect: "2d8+3 damage, you gain 5 temporary HP" },
        { int_: 18, con: 16, when: pact("Infernal"), expect: "2d8+3 damage, you gain 9 temporary HP" } ]

  "[Witchfire] should be defined":
    Verify.testProperties "Witchfire",
      name: [ expect: "Witchfire" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Reflex" },
        { cha: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { int_: 10, cha: 10, expect: "2d6 damage, target has -2 attack" },
        { int_: 16, cha: 10, expect: "2d6 damage, target has -2 attack" },
        { int_: 10, cha: 16, expect: "2d6+3 damage, target has -2 attack" },
        { int_: 10, cha: 16, when: pact("Infernal"), expect: "2d6+3 damage, target has -2 attack" },
        { int_: 10, cha: 16, when: pact("Star"), expect: "2d6+3 damage, target has -2 attack" },
        { int_: 10, cha: 16, when: pact("Fey"), expect: "2d6+3 damage, target has -2 attack" },
        { int_: 18, cha: 16, when: pact("Fey"), expect: "2d6+3 damage, target has -6 attack" } ]

  "[ArmorOfAgathys] should be defined":
    Verify.testProperties "ArmorOfAgathys",
      name: [ expect: "Armor of Agathys" ]
      keywords: [ expect: [ "arcane", "cold" ] ]
      effect: [
        { int_: 10, con: 10, expect: "+10 temporary HP, adjacent enemies take 1d6 damage" },
        { int_: 16, con: 10, expect: "+13 temporary HP, adjacent enemies take 1d6 damage" },
        { int_: 10, con: 14, expect: "+10 temporary HP, adjacent enemies take 1d6+2 damage" },
        { int_: 16, con: 14, expect: "+13 temporary HP, adjacent enemies take 1d6+2 damage" } ]

  "[CurseOfTheDarkDream] should be defined":
    Verify.testProperties "CurseOfTheDarkDream",
      name: [ expect: "Curse of the Dark Dream" ]
      keywords: [ expect: [ "arcane", "charm", "implement", "psychic" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "3d8 damage (special)" },
        { cha: 16, expect: "3d8+3 damage (special)" } ]

  "[DreadStar] should be defined":
    Verify.testProperties "DreadStar",
      name: [ expect: "Dread Star" ]
      keywords: [ expect: [ "arcane", "fear", "implement", "radiant" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "3d6 damage (special)" },
        { cha: 16, expect: "3d6+3 damage (special)" } ]

  "[FlamesOfPhlegethos] should be defined":
    Verify.testProperties "FlamesOfPhlegethos",
      name: [ expect: "Flames of Phlegethos" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Reflex" },
        { con: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { con: 10, expect: "3d10 damage (special)" },
        { con: 16, expect: "3d10+3 damage (special)" } ]

  "[BeguilingTongue] should be defined":
    Verify.testProperties "BeguilingTongue",
      name: [ expect: "Beguiling Tongue" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane" ] ]

  "[EtherealStride] should be defined":
    Verify.testProperties "EtherealStride",
      name: [ expect: "Ethereal Stride" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane", "teleportation" ] ]

  "[FiendishResilience] should be defined":
    Verify.testProperties "FiendishResilience",
      name: [ expect: "Fiendish Resilience" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]
      effect: [
        { con: 10, expect: "gain 5 temp HP" },
        { con: 16, expect: "gain 8 temp HP" } ]

  "[ShadowVeil] should be defined":
    Verify.testProperties "ShadowVeil",
      name: [ expect: "Shadow Veil" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane", "illusion" ] ]

  "[EldritchRain] should be defined":
    Verify.testProperties "EldritchRain",
      name: [ expect: "Eldritch Rain" ]
      keywords: [ expect: [ "arcane", "implement" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Reflex (special)" },
        { cha: 16, expect: "+3 vs. Reflex (special)" } ]
      hit: [
        { cha: 10, int_: 14, expect: "1d10 damage" },
        { cha: 16, int_: 14, expect: "1d10+3 damage" },
        { cha: 16, int_: 14, when: pact("Star"), expect: "1d10+3 damage" },
        { cha: 16, int_: 14, when: pact("Fey"), expect: "1d10+5 damage" } ]

  "[FieryBolt] should be defined":
    Verify.testProperties "FieryBolt",
      name: [ expect: "Fiery Bolt" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Reflex" },
        { con: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { con: 10, int_: 14, expect: "3d6 damage, adjacent creatures take 1d6 damage" },
        { con: 16, int_: 14, expect: "3d6+3 damage, adjacent creatures take 1d6+3 damage" },
        { con: 16, int_: 14, when: pact("Star"), expect: "3d6+3 damage, adjacent creatures take 1d6+3 damage" },
        { con: 16, int_: 14, when: pact("Infernal"), expect: "3d6+3 damage, adjacent creatures take 1d6+5 damage" } ]

  "[FrigidDarkness] should be defined":
    Verify.testProperties "FrigidDarkness",
      name: [ expect: "Frigid Darkness" ]
      keywords: [ expect: [ "arcane", "cold", "fear", "implement" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Fortitude" },
        { con: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { con: 10, int_: 14, expect: "2d8 damage (special)" },
        { con: 16, int_: 14, expect: "2d8+3 damage (special)" },
        { con: 16, int_: 14, when: pact("Fey"), expect: "2d8+3 damage (special)" },
        { con: 16, int_: 14, when: pact("Star"), expect: "2d8+3 damage, target has -2 to AC (special)" } ]

  "[OtherwindStride] should be defined":
    Verify.testProperties "OtherwindStride",
      name: [ expect: "Otherwind Stride" ]
      keywords: [ expect: [ "arcane", "implement", "teleportation" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Fortitude" },
        { cha: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { cha: 10, expect: "1d8 damage (special)" },
        { cha: 16, expect: "1d8+3 damage (special)" } ]
      effect: [
        { int_: 14, expect: "teleport 5 squares" },
        { int_: 14, when: pact("Star"), expect: "teleport 5 squares" },
        { int_: 14, when: pact("Fey"), expect: "teleport 7 squares" } ]
