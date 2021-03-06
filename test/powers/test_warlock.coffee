{Verify} = require '../helpers'

uses = (ability) ->
  (power) -> power.ability = ability

pact = (pact) ->
  (power) -> power.npc.feature "class", "#{pact} Pact"

module.exports =
  "[WarlocksCurse] should be defined":
    Verify.testProperties "warlock", "WarlocksCurse",
      name: [ expect: "Warlock's Curse" ]
      effect: [
        { level:  1, expect: "+1d6 extra damage (special)" },
        { level: 10, expect: "+1d6 extra damage (special)" },
        { level: 11, expect: "+2d6 extra damage (special)" },
        { level: 20, expect: "+2d6 extra damage (special)" },
        { level: 21, expect: "+3d6 extra damage (special)" } ]

  "[DireRadiance] should be defined":
    Verify.testProperties "warlock", "DireRadiance",
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
    Verify.testProperties "warlock", "EldritchBlast",
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
    Verify.testProperties "warlock", "Eyebite",
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
    Verify.testProperties "warlock", "HellishRebuke",
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
    Verify.testProperties "warlock", "DiabolicGrasp",
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
    Verify.testProperties "warlock", "DreadfulWord",
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
    Verify.testProperties "warlock", "VampiricEmbrace",
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
    Verify.testProperties "warlock", "Witchfire",
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
    Verify.testProperties "warlock", "ArmorOfAgathys",
      name: [ expect: "Armor of Agathys" ]
      keywords: [ expect: [ "arcane", "cold" ] ]
      effect: [
        { int_: 10, con: 10, expect: "+10 temporary HP, adjacent enemies take 1d6 damage" },
        { int_: 16, con: 10, expect: "+13 temporary HP, adjacent enemies take 1d6 damage" },
        { int_: 10, con: 14, expect: "+10 temporary HP, adjacent enemies take 1d6+2 damage" },
        { int_: 16, con: 14, expect: "+13 temporary HP, adjacent enemies take 1d6+2 damage" } ]

  "[CurseOfTheDarkDream] should be defined":
    Verify.testProperties "warlock", "CurseOfTheDarkDream",
      name: [ expect: "Curse of the Dark Dream" ]
      keywords: [ expect: [ "arcane", "charm", "implement", "psychic" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "3d8 damage (special)" },
        { cha: 16, expect: "3d8+3 damage (special)" } ]

  "[DreadStar] should be defined":
    Verify.testProperties "warlock", "DreadStar",
      name: [ expect: "Dread Star" ]
      keywords: [ expect: [ "arcane", "fear", "implement", "radiant" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "3d6 damage (special)" },
        { cha: 16, expect: "3d6+3 damage (special)" } ]

  "[FlamesOfPhlegethos] should be defined":
    Verify.testProperties "warlock", "FlamesOfPhlegethos",
      name: [ expect: "Flames of Phlegethos" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Reflex" },
        { con: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { con: 10, expect: "3d10 damage (special)" },
        { con: 16, expect: "3d10+3 damage (special)" } ]

  "[BeguilingTongue] should be defined":
    Verify.testProperties "warlock", "BeguilingTongue",
      name: [ expect: "Beguiling Tongue" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane" ] ]

  "[EtherealStride] should be defined":
    Verify.testProperties "warlock", "EtherealStride",
      name: [ expect: "Ethereal Stride" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane", "teleportation" ] ]

  "[FiendishResilience] should be defined":
    Verify.testProperties "warlock", "FiendishResilience",
      name: [ expect: "Fiendish Resilience" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]
      effect: [
        { con: 10, expect: "gain 5 temp HP" },
        { con: 16, expect: "gain 8 temp HP" } ]

  "[ShadowVeil] should be defined":
    Verify.testProperties "warlock", "ShadowVeil",
      name: [ expect: "Shadow Veil" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane", "illusion" ] ]

  "[EldritchRain] should be defined":
    Verify.testProperties "warlock", "EldritchRain",
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
    Verify.testProperties "warlock", "FieryBolt",
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
    Verify.testProperties "warlock", "FrigidDarkness",
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
    Verify.testProperties "warlock", "OtherwindStride",
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

  "[AvernianEruption] should be defined":
    Verify.testProperties "warlock", "AvernianEruption",
      name: [ expect: "Avernian Eruption" ]
      keywords: [ expect: [ "arcane", "fire", "implement" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Reflex" },
        { con: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { con: 10, expect: "2d10 damage" },
        { con: 16, expect: "2d10+3 damage" } ]

  "[CrownOfMadness] should be defined":
    Verify.testProperties "warlock", "CrownOfMadness",
      name: [ expect: "Crown of Madness" ]
      keywords: [ expect: [ "arcane", "charm", "implement", "psychic" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "2d6 damage" },
        { cha: 16, expect: "2d6+3 damage" } ]

  "[CurseOfTheBloodyFangs] should be defined":
    Verify.testProperties "warlock", "CurseOfTheBloodyFangs",
      name: [ expect: "Curse of the Bloody Fangs" ]
      keywords: [ expect: [ "arcane", "implement" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. AC" },
        { cha: 16, expect: "+3 vs. AC" } ]
      hit: [
        { cha: 10, expect: "2d10 damage" },
        { cha: 16, expect: "2d10+3 damage" } ]

  "[HungerOfHadar] should be defined":
    Verify.testProperties "warlock", "HungerOfHadar",
      name: [ expect: "Hunger of Hadar" ]
      keywords: [ expect: [ "arcane", "implement", "necrotic", "zone" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Fortitude (secondary)" },
        { con: 16, expect: "+3 vs. Fortitude (secondary)" } ]
      hit: [
        { con: 10, expect: "1d6 damage (secondary)" },
        { con: 16, expect: "1d6+3 damage (secondary)" } ]

  "[DarkOnesOwnLuck] should be defined":
    Verify.testProperties "warlock", "DarkOnesOwnLuck",
      name: [ expect: "Dark One's Own Luck" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[FeySwitch] should be defined":
    Verify.testProperties "warlock", "FeySwitch",
      name: [ expect: "Fey Switch" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane", "teleportation" ] ]

  "[ShroudOfBlackSteel] should be defined":
    Verify.testProperties "warlock", "ShroudOfBlackSteel",
      name: [ expect: "Shroud of Black Steel" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "polymorph" ] ]

  "[SpiderClimb] should be defined":
    Verify.testProperties "warlock", "SpiderClimb",
      name: [ expect: "Spider Climb" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane" ] ]

  "[HowlOfDoom] should be defined":
    Verify.testProperties "warlock", "HowlOfDoom",
      name: [ expect: "Howl of Doom" ]
      keywords: [ expect: [ "arcane", "fear", "implement", "thunder" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Fortitude" },
        { con: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { con: 10, int_: 14, expect: "2d6 damage, push target 2 squares" },
        { con: 16, int_: 14, expect: "2d6+3 damage, push target 2 squares" },
        { con: 16, int_: 14, when: pact("Fey"), expect: "2d6+3 damage, push target 2 squares" },
        { con: 16, int_: 14, when: pact("Infernal"), expect: "2d6+3 damage, push target 3 squares" } ]

  "[InfernalMoonCurse] should be defined":
    Verify.testProperties "warlock", "InfernalMoonCurse",
      name: [ expect: "Infernal Moon Curse" ]
      keywords: [ expect: [ "arcane", "implement", "poison" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Fortitude" },
        { con: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { con: 10, int_: 14, expect: "2d8 damage (special)" },
        { con: 16, int_: 14, expect: "2d8+3 damage (special)" },
        { con: 16, int_: 14, when: pact("Fey"), expect: "2d8+3 damage (special)" },
        { con: 16, int_: 14, when: pact("Infernal"), expect: "2d8+5 damage (special)" } ]

  "[MireTheMind] should be defined":
    Verify.testProperties "warlock", "MireTheMind",
      name: [ expect: "Mire the Mind" ]
      keywords: [ expect: [ "arcane", "illusion", "implement", "psychic" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, int_: 14, expect: "1d10 damage (special)" },
        { cha: 16, int_: 14, expect: "1d10+3 damage (special)" },
        { cha: 16, int_: 14, when: pact("Infernal"), expect: "1d10+3 damage (special)" },
        { cha: 16, int_: 14, when: pact("Fey"), expect: "1d10+3 damage, stealth checks at +2 (special)" } ]

  "[SignOfIllOmen] should be defined":
    Verify.testProperties "warlock", "SignOfIllOmen",
      name: [ expect: "Sign of Ill Omen" ]
      keywords: [ expect: [ "arcane", "implement" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, int_: 14, expect: "2d6 damage (special)" },
        { cha: 16, int_: 14, expect: "2d6+3 damage (special)" },
        { cha: 16, int_: 14, when: pact("Infernal"), expect: "2d6+3 damage (special)" },
        { cha: 16, int_: 14, when: pact("Star"), expect: "2d6+3 damage, target has -2 to next attack (special)" } ]

  "[CurseOfTheBlackFrost] should be defined":
    Verify.testProperties "warlock", "CurseOfTheBlackFrost",
      name: [ expect: "Curse of the Black Frost" ]
      keywords: [ expect: [ "arcane", "cold", "implement" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Reflex" },
        { cha: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { cha: 10, expect: "2d8 damage (special)" },
        { cha: 16, expect: "2d8+3 damage (special)" } ]

  "[IronSpikeOfDis] should be defined":
    Verify.testProperties "warlock", "IronSpikeOfDis",
      name: [ expect: "Iron Spike of Dis" ]
      keywords: [ expect: [ "arcane", "implement" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Reflex" },
        { con: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { con: 10, expect: "3d10 damage (special)" },
        { con: 16, expect: "3d10+3 damage (special)" } ]

  "[SummonsOfKhirad] should be defined":
    Verify.testProperties "warlock", "SummonsOfKhirad",
      name: [ expect: "Summons of Khirad" ]
      keywords: [ expect: [ "arcane", "implement", "psychic", "teleportation" ] ]
      attack: [
        { con: 10, expect: "+0 vs. Will" },
        { con: 16, expect: "+3 vs. Will" } ]
      hit: [
        { con: 10, expect: "2d10 damage (special)" },
        { con: 16, expect: "2d10+3 damage (special)" } ]

  "[ThiefOfFiveFates] should be defined":
    Verify.testProperties "warlock", "ThiefOfFiveFates",
      name: [ expect: "Thief of Five Fates" ]
      keywords: [ expect: [ "arcane", "implement" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Will" },
        { cha: 16, expect: "+3 vs. Will" } ]

  "[AmbassadorImp] should be defined":
    Verify.testProperties "warlock", "AmbassadorImp",
      name: [ expect: "Ambassador Imp" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "conjuration" ] ]

  "[ShadowForm] should be defined":
    Verify.testProperties "warlock", "ShadowForm",
      name: [ expect: "Shadow Form" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "polymorph" ] ]

  "[ShieldingShades] should be defined":
    Verify.testProperties "warlock", "ShieldingShades",
      name: [ expect: "Shielding Shades" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[WarlocksLeap] should be defined":
    Verify.testProperties "warlock", "WarlocksLeap",
      name: [ expect: "Warlock's Leap" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane", "teleportation" ] ]

  "[BewitchingWhispers] should be defined":
    Verify.testProperties "warlock", "BewitchingWhispers",
      name: [ expect: "Bewitching Whispers" ]
      keywords: [ expect: [ "arcane", "charm", "implement" ] ]

  "[ColdfireVortex] should be defined":
    Verify.testProperties "warlock", "ColdfireVortex",
      name: [ expect: "Coldfire Vortex" ]
      keywords: [ expect: [ "arcane", "cold", "implement", "radiant" ] ]

  "[Harrowstorm] should be defined":
    Verify.testProperties "warlock", "Harrowstorm",
      name: [ expect: "Harrowstorm" ]
      keywords: [ expect: [ "arcane", "implement", "thunder" ] ]

  "[SoulFlaying] should be defined":
    Verify.testProperties "warlock", "SoulFlaying",
      name: [ expect: "Soul Flaying" ]
      keywords: [ expect: [ "arcane", "implement", "necrotic" ] ]

  "[CurseOfTheGoldenMist] should be defined":
    Verify.testProperties "warlock", "CurseOfTheGoldenMist",
      name: [ expect: "Curse of the Golden Mist" ]
      keywords: [ expect: [ "arcane", "charm", "implement" ] ]

  "[Fireswarm] should be defined":
    Verify.testProperties "warlock", "Fireswarm",
      name: [ expect: "Fireswarm" ]
      keywords: [ expect: [ "arcane", "fire", "implement", "poison" ] ]

  "[TendrilsOfThuban] should be defined":
    Verify.testProperties "warlock", "TendrilsOfThuban",
      name: [ expect: "Tendrils of Thuban" ]
      keywords: [ expect: [ "arcane", "cold", "implement", "zone" ] ]

  "[ThirstingMaw] should be defined":
    Verify.testProperties "warlock", "ThirstingMaw",
      name: [ expect: "Thirsting Maw" ]
      keywords: [ expect: [ "arcane", "implement" ] ]

  "[CloakOfShadow] should be defined":
    Verify.testProperties "warlock", "CloakOfShadow",
      name: [ expect: "Cloak of Shadow" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane" ] ]

  "[EyeOfTheWarlock] should be defined":
    Verify.testProperties "warlock", "EyeOfTheWarlock",
      name: [ expect: "Eye of the Warlock" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "arcane" ] ]

  "[InfuriatingElusiveness] should be defined":
    Verify.testProperties "warlock", "InfuriatingElusiveness",
      name: [ expect: "Infuriating Elusiveness" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "arcane", "illusion", "teleportation" ] ]

  "[StrandOfFate] should be defined":
    Verify.testProperties "warlock", "StrandOfFate",
      name: [ expect: "Strand of Fate" ]
      keywords: [ expect: [ "arcane", "implement" ] ]

  "[ThirstingTendrils] should be defined":
    Verify.testProperties "warlock", "ThirstingTendrils",
      name: [ expect: "Thirsting Tendrils" ]
      keywords: [ expect: [ "arcane", "healing", "implement" ] ]

  "[WarlocksBargain] should be defined":
    Verify.testProperties "warlock", "WarlocksBargain",
      name: [ expect: "Warlock's Bargain" ]
      keywords: [ expect: [ "arcane", "implement" ] ]

  "[DelusionsOfLoyalty] should be defined":
    Verify.testProperties "warlock", "DelusionsOfLoyalty",
      name: [ expect: "Delusions of Loyalty" ]
      keywords: [ expect: [ "arcane", "charm", "implement" ] ]

  "[MinionsOfMalbolge] should be defined":
    Verify.testProperties "warlock", "MinionsOfMalbolge",
      name: [ expect: "Minions of Malbolge" ]
      keywords: [ expect: [ "arcane", "conjuration", "fire", "implement" ] ]

  "[WrathOfAcamar] should be defined":
    Verify.testProperties "warlock", "WrathOfAcamar",
      name: [ expect: "Wrath of Acamar" ]
      keywords: [ expect: [ "arcane", "implement", "necrotic", "teleportation" ] ]
