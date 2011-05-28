{NPC, Powers} = require '../..'
{Verify}      = require '../helpers'

module.exports =
  "[Cleave] should be defined":
    Verify.testProperties "Cleave",
      name: [ expect: "Cleave" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] (special)" },
        { level:  1, str: 16, expect: "1[W]+3 (special)" },
        { level: 20, str: 16, expect: "1[W]+3 (special)" },
        { level: 21, str: 16, expect: "2[W]+3 (special)" } ]

  "[ReapingStrike] should be defined":
    Verify.testProperties "ReapingStrike",
      name: [ expect: "Reaping Strike" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
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
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] damage (special)" },
        { level:  1, str: 16, expect: "1[W]+3 damage (special)" },
        { level: 20, str: 16, expect: "1[W]+3 damage (special)" },
        { level: 21, str: 16, expect: "2[W]+3 damage (special)" } ]

  "[CoveringAttack] should be defined":
    Verify.testProperties "CoveringAttack",
      name: [ expect: "Covering Attack" ],
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[PassingAttack] should be defined":
    Verify.testProperties "PassingAttack",
      name: [ expect: "Passing Attack" ],
      attack: [
        { str: 10, expect: "+0 vs. AC (2nd target: +2 vs. AC)" },
        { str: 16, expect: "+3 vs. AC (2nd target: +5 vs. AC)" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[SpinningSweep] should be defined":
    Verify.testProperties "SpinningSweep",
      name: [ expect: "Spinning Sweep" ],
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[SteelSerpentStrike] should be defined":
    Verify.testProperties "SteelSerpentStrike",
      name: [ expect: "Steel Serpent Strike" ],
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[BruteStrike] should be defined":
    Verify.testProperties "BruteStrike",
      name: [ expect: "Brute Strike" ],
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]

  "[ComebackStrike] should be defined":
    Verify.testProperties "ComebackStrike",
      name: [ expect: "Comeback Strike" ],
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[VillainsMenace] should be defined":
    Verify.testProperties "VillainsMenace",
      name: [ expect: "Villain's Menace" ],
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]
