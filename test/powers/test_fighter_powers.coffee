{Verify} = require '../helpers'

module.exports =
  "[Cleave] should be defined":
    Verify.testProperties "Cleave",
      name: [ expect: "Cleave" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      hit: [
        { level:  1, str: 10, expect: "1[W] (special)" },
        { level:  1, str: 16, expect: "1[W]+3 (special)" },
        { level: 20, str: 16, expect: "1[W]+3 (special)" },
        { level: 21, str: 16, expect: "2[W]+3 (special)" } ]

  "[ReapingStrike] should be defined":
    Verify.testProperties "ReapingStrike",
      name: [ expect: "Reaping Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      hit: [
        { level:  1, str: 10, expect: "1[W] (special)" },
        { level:  1, str: 16, expect: "1[W]+3 (special)" },
        { level: 20, str: 16, expect: "1[W]+3 (special)" },
        { level: 21, str: 16, expect: "2[W]+3 (special)" } ]
      miss: [
        { str: 10, expect: "0 damage (0 w/2h weapon)" },
        { str: 16, expect: "1 damage (3 w/2h weapon)" },
        { str: 18, expect: "2 damage (4 w/2h weapon)" } ]

  "[SureStrike] should be defined":
    Verify.testProperties "SureStrike",
      name: [ expect: "Sure Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { str:  4, expect: "-1 vs. AC" },
        { str: 10, expect: "+2 vs. AC" },
        { str: 16, expect: "+5 vs. AC" } ]
      hit: [
        { level:  1, expect: "1[W] damage" },
        { level: 20, expect: "1[W] damage" },
        { level: 21, expect: "2[W] damage" } ]

  "[TideOfIron] should be defined":
    Verify.testProperties "TideOfIron",
      name: [ expect: "Tide of Iron" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] damage (special)" },
        { level:  1, str: 16, expect: "1[W]+3 damage (special)" },
        { level: 20, str: 16, expect: "1[W]+3 damage (special)" },
        { level: 21, str: 16, expect: "2[W]+3 damage (special)" } ]

  "[CoveringAttack] should be defined":
    Verify.testProperties "CoveringAttack",
      name: [ expect: "Covering Attack" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[PassingAttack] should be defined":
    Verify.testProperties "PassingAttack",
      name: [ expect: "Passing Attack" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. AC (2nd target: +2 vs. AC)" },
        { str: 16, expect: "+3 vs. AC (2nd target: +5 vs. AC)" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[SpinningSweep] should be defined":
    Verify.testProperties "SpinningSweep",
      name: [ expect: "Spinning Sweep" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[SteelSerpentStrike] should be defined":
    Verify.testProperties "SteelSerpentStrike",
      name: [ expect: "Steel Serpent Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[BruteStrike] should be defined":
    Verify.testProperties "BruteStrike",
      name: [ expect: "Brute Strike" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]

  "[ComebackStrike] should be defined":
    Verify.testProperties "ComebackStrike",
      name: [ expect: "Comeback Strike" ]
      keywords: [ expect: [ "healing", "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[VillainsMenace] should be defined":
    Verify.testProperties "VillainsMenace",
      name: [ expect: "Villain's Menace" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[BoundlessEndurance] should be defined":
    Verify.testProperties "BoundlessEndurance",
      name: [ expect: "Boundless Endurance" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial", "stance" ] ]
      effect: [
        { con: 10, expect: "regeneration 2 when bloodied" },
        { con: 16, expect: "regeneration 5 when bloodied" } ]

  "[GetOverHere] should be defined":
    Verify.testProperties "GetOverHere",
      name: [ expect: "Get Over Here" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[NoOpening] should be defined":
    Verify.testProperties "NoOpening",
      name: [ expect: "No Opening" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[Unstoppable] should be defined":
    Verify.testProperties "Unstoppable",
      name: [ expect: "Unstoppable" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial" ] ]
      effect: [
        { con: 10, expect: "gain 2d6 temp HP" },
        { con: 16, expect: "gain 2d6+3 temp HP" } ]

  "[ArmorPiercingThrust] should be defined":
    Verify.testProperties "ArmorPiercingThrust",
      name: [ expect: "Armor-Piercing Thrust" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { str: 10, dex: 10, expect: "+0 vs. Reflex" },
        { str: 10, dex: 14, expect: "+0 vs. Reflex (+2 with light blade or spear)" },
        { str: 16, dex: 10, expect: "+3 vs. Reflex" },
        { str: 16, dex: 14, expect: "+3 vs. Reflex (+5 with light blade or spear)" } ]
      hit: [
        { str: 10, dex: 10, expect: "1[W] damage" },
        { str: 10, dex: 14, expect: "1[W] damage (+2 with light blade or spear)" },
        { str: 16, dex: 10, expect: "1[W]+3 damage" },
        { str: 16, dex: 14, expect: "1[W]+3 damage (+5 with light blade or spear)" } ]

  "[CrushingBlow] should be defined":
    Verify.testProperties "CrushingBlow",
      name: [ expect: "Crushing Blow" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, con: 10, expect: "2[W] damage" },
        { str: 10, con: 14, expect: "2[W] damage (+2 with axe, hammer, or mace)" },
        { str: 16, con: 10, expect: "2[W]+3 damage" },
        { str: 16, con: 14, expect: "2[W]+3 damage (+5 with axe, hammer, or mace)" } ]

  "[DanceOfSteel] should be defined":
    Verify.testProperties "DanceOfSteel",
      name: [ expect: "Dance of Steel" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[PreciseStrike] should be defined":
    Verify.testProperties "PreciseStrike",
      name: [ expect: "Precise Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+4 vs. AC" }, { str: 16, expect: "+7 vs. AC" } ]
      hit: [ { str: 10, expect: "1[W] damage" }, { str: 16, expect: "1[W]+3 damage" } ]

  "[RainOfBlows] should be defined":
    Verify.testProperties "RainOfBlows",
      name: [ expect: "Rain of Blows" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, dex: 14, expect: "1[W] damage" },
        { str: 16, dex: 14, expect: "1[W]+3 damage" },
        { str: 16, dex: 15, expect: "1[W]+3 damage (and make secondary attack if wielding light blade, spear, or flail)" } ]

  "[SweepingBlow] should be defined":
    Verify.testProperties "SweepingBlow",
      name: [ expect: "Sweeping Blow" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. AC" },
        { str: 13, expect: "+1 vs. AC" },
        { str: 18, expect: "+4 vs. AC (+6 if wielding an axe, flail, heavy blade, or pick)" } ]
      hit: [ { str: 10, expect: "1[W] damage" }, { str: 16, expect: "1[W]+3 damage" } ]

  "[CrackTheShell] should be defined":
    Verify.testProperties "CrackTheShell",
      name: [ expect: "Crack the Shell" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[DizzyingBlow] should be defined":
    Verify.testProperties "DizzyingBlow",
      name: [ expect: "Dizzying Blow" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]

  "[RainOfSteel] should be defined":
    Verify.testProperties "RainOfSteel",
      name: [ expect: "Rain of Steel" ]
      keywords: [ expect: [ "martial", "stance", "weapon" ] ]
