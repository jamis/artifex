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
      effect: [
        { int_: 10, con: 10, expect: "+10 temporary HP, adjacent enemies take 1d6 damage" },
        { int_: 16, con: 10, expect: "+13 temporary HP, adjacent enemies take 1d6 damage" },
        { int_: 10, con: 14, expect: "+10 temporary HP, adjacent enemies take 1d6+2 damage" },
        { int_: 16, con: 14, expect: "+13 temporary HP, adjacent enemies take 1d6+2 damage" } ]

  "[CurseOfTheDarkDream] should be defined":
    Verify.testProperties "CurseOfTheDarkDream",
      name: [ expect: "Curse of the Dark Dream" ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "3d8 damage (special)" },
        { cha: 16, expect: "3d8+3 damage (special)" } ]

  "[DreadStar] should be defined":
    Verify.testProperties "DreadStar",
      name: [ expect: "Dread Star" ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "3d6 damage (special)" },
        { cha: 16, expect: "3d6+3 damage (special)" } ]

  "[FlamesOfPhlegethos] should be defined":
    Verify.testProperties "FlamesOfPhlegethos",
      name: [ expect: "Flames of Phlegethos" ]
      attack: [
        { con: 10, expect: "+0 vs. Reflex" },
        { con: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { con: 10, expect: "3d10 damage (special)" },
        { con: 16, expect: "3d10+3 damage (special)" } ]
