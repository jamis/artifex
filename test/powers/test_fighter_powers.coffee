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
      name: [ expect: "Covering Attack" ],
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[PassingAttack] should be defined":
    Verify.testProperties "PassingAttack",
      name: [ expect: "Passing Attack" ],
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
      name: [ expect: "Spinning Sweep" ],
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[SteelSerpentStrike] should be defined":
    Verify.testProperties "SteelSerpentStrike",
      name: [ expect: "Steel Serpent Strike" ],
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[BruteStrike] should be defined":
    Verify.testProperties "BruteStrike",
      name: [ expect: "Brute Strike" ],
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]

  "[ComebackStrike] should be defined":
    Verify.testProperties "ComebackStrike",
      name: [ expect: "Comeback Strike" ],
      keywords: [ expect: [ "healing", "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[VillainsMenace] should be defined":
    Verify.testProperties "VillainsMenace",
      name: [ expect: "Villain's Menace" ],
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[BoundlessEndurance] should be defined":
    Verify.testProperties "BoundlessEndurance",
      name: [ expect: "Boundless Endurance" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial", "stance" ] ]
      effect: [
        { con: 10, expect: "regeneration 2 when bloodied" },
        { con: 16, expect: "regeneration 5 when bloodied" } ]

  "[GetOverHere] should be defined":
    Verify.testProperties "GetOverHere",
      name: [ expect: "Get Over Here" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[NoOpening] should be defined":
    Verify.testProperties "NoOpening",
      name: [ expect: "No Opening" ],
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[Unstoppable] should be defined":
    Verify.testProperties "Unstoppable",
      name: [ expect: "Unstoppable" ],
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial" ] ]
      effect: [
        { con: 10, expect: "gain 2d6 temp HP" },
        { con: 16, expect: "gain 2d6+3 temp HP" } ]
