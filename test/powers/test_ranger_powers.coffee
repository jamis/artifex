{NPC, Powers} = require '../..'
{Verify}      = require '../helpers'

module.exports =
  "[HuntersQuarry] should be defined":
    Verify.testProperties "HuntersQuarry",
      name: [ expect: "Hunter's Quarry" ]
      effect: [
        { level:  1, quarryDie: 6, expect: "deal +1d6 extra damage to quarry per round" },
        { level: 11, quarryDie: 6, expect: "deal +2d6 extra damage to quarry per round" },
        { level: 21, quarryDie: 6, expect: "deal +3d6 extra damage to quarry per round" },
        { level: 21, quarryDie: 8, expect: "deal +3d8 extra damage to quarry per round" } ]

  "[CarefulAttack] should be defined":
    Verify.testProperties "CarefulAttack",
      name: [ expect: "Careful Attack" ]
      attack: [
        { str: 10, dex: 10, expect: "+2 vs. AC (melee) or +2 vs. AC (ranged)" },
        { str: 16, dex: 10, expect: "+5 vs. AC (melee) or +2 vs. AC (ranged)" },
        { str: 10, dex: 16, expect: "+2 vs. AC (melee) or +5 vs. AC (ranged)" },
        { str: 16, dex: 16, expect: "+5 vs. AC (melee) or +5 vs. AC (ranged)" } ]
      hit: [
        { level:  1, expect: "1[W] damage" },
        { level: 20, expect: "1[W] damage" },
        { level: 21, expect: "2[W] damage" } ]

  "[HitAndRun] should be defined":
    Verify.testProperties "HitAndRun",
      name: [ expect: "Hit and Run" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] damage" },
        { level:  1, str: 16, expect: "1[W]+3 damage" },
        { level: 20, str: 16, expect: "1[W]+3 damage" },
        { level: 21, str: 16, expect: "2[W]+3 damage" } ]

  "[NimbleStrike] should be defined":
    Verify.testProperties "NimbleStrike",
      name: [ expect: "Nimble Strike" ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, dex: 10, expect: "1[W] damage" },
        { level:  1, dex: 16, expect: "1[W]+3 damage" },
        { level: 20, dex: 16, expect: "1[W]+3 damage" },
        { level: 21, dex: 16, expect: "2[W]+3 damage" } ]

  "[TwinStrike] should be defined":
    Verify.testProperties "TwinStrike",
      name: [ expect: "Twin Strike" ]
      attack: [
        { str: 10, dex: 10, expect: "+0 vs. AC (melee) or +0 vs. AC (ranged), two attacks" },
        { str: 16, dex: 10, expect: "+3 vs. AC (melee) or +0 vs. AC (ranged), two attacks" },
        { str: 10, dex: 16, expect: "+0 vs. AC (melee) or +3 vs. AC (ranged), two attacks" },
        { str: 16, dex: 16, expect: "+3 vs. AC (melee) or +3 vs. AC (ranged), two attacks" } ]
      hit: [
        { level:  1, expect: "1[W] damage per attack" },
        { level: 20, expect: "1[W] damage per attack" },
        { level: 21, expect: "2[W] damage per attack" } ]

  "[DireWolverineStrike] should be defined":
    Verify.testProperties "DireWolverineStrike",
      name: [ expect: "Dire Wolverine Strike" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "1[W] damage" }, { str: 16, expect: "1[W]+3 damage" } ]

  "[EvasiveStrike] should be defined":
    Verify.testProperties "EvasiveStrike",
      name: [ expect: "Evasive Strike" ]
      special: [ { wis: 10, expect: "shift 1 square" }, { wis: 16, expect: "shift 4 squares" } ]
      attack: [
        { str: 10, dex: 10, expect: "+0 vs. AC (melee) or +0 vs. AC (ranged)" },
        { str: 16, dex: 10, expect: "+3 vs. AC (melee) or +0 vs. AC (ranged)" },
        { str: 10, dex: 16, expect: "+0 vs. AC (melee) or +3 vs. AC (ranged)" },
        { str: 16, dex: 16, expect: "+3 vs. AC (melee) or +3 vs. AC (ranged)" } ]
      hit: [
        { str: 10, dex: 10, expect: "2[W] damage (melee) or 2[W] damage (ranged)" },
        { str: 16, dex: 10, expect: "2[W]+3 damage (melee) or 2[W] damage (ranged)" },
        { str: 10, dex: 16, expect: "2[W] damage (melee) or 2[W]+3 damage (ranged)" },
        { str: 16, dex: 16, expect: "2[W]+3 damage (melee) or 2[W]+3 damage (ranged)" } ]

  "[FoxsCunning] should be defined":
    Verify.testProperties "FoxsCunning",
      name: [ expect: "Fox's Cunning" ]
      attack: [ { wis: 10, expect: "basic attack +0" }, { wis: 16, expect: "basic attack +3" } ]

  "[TwoFangedStrike] should be defined":
    Verify.testProperties "TwoFangedStrike",
      name: [ expect: "Two-Fanged Strike" ],
      attack: [
        { str: 10, dex: 10, expect: "+0 vs. AC (melee) or +0 vs. AC (ranged), two attacks" },
        { str: 16, dex: 10, expect: "+3 vs. AC (melee) or +0 vs. AC (ranged), two attacks" },
        { str: 10, dex: 16, expect: "+0 vs. AC (melee) or +3 vs. AC (ranged), two attacks" },
        { str: 16, dex: 16, expect: "+3 vs. AC (melee) or +3 vs. AC (ranged), two attacks" } ]
      hit: [
        { str: 10, dex: 10, wis: 10, expect: "1[W] damage (melee) or 1[W] damage (ranged) per attack, +0 if both attacks hit" },
        { str: 16, dex: 10, wis: 10, expect: "1[W]+3 damage (melee) or 1[W] damage (ranged) per attack, +0 if both attacks hit" },
        { str: 10, dex: 16, wis: 10, expect: "1[W] damage (melee) or 1[W]+3 damage (ranged) per attack, +0 if both attacks hit" },
        { str: 16, dex: 16, wis: 10, expect: "1[W]+3 damage (melee) or 1[W]+3 damage (ranged) per attack, +0 if both attacks hit" },
        { str: 16, dex: 16, wis: 16, expect: "1[W]+3 damage (melee) or 1[W]+3 damage (ranged) per attack, +3 if both attacks hit" } ]

  "[HuntersBearTrap] should be defined":
    Verify.testProperties "HuntersBearTrap",
      name: [ expect: "Hunter's Bear Trap" ],
      attack: [
        { str: 10, dex: 10, expect: "+0 vs. AC (melee) or +0 vs. AC (ranged)" },
        { str: 16, dex: 10, expect: "+3 vs. AC (melee) or +0 vs. AC (ranged)" },
        { str: 10, dex: 16, expect: "+0 vs. AC (melee) or +3 vs. AC (ranged)" },
        { str: 16, dex: 16, expect: "+3 vs. AC (melee) or +3 vs. AC (ranged)" } ]
      hit: [
        { str: 10, dex: 10, expect: "2[W] damage (melee) or 2[W] damage (ranged) (special)" },
        { str: 16, dex: 10, expect: "2[W]+3 damage (melee) or 2[W] damage (ranged) (special)" },
        { str: 10, dex: 16, expect: "2[W] damage (melee) or 2[W]+3 damage (ranged) (special)" },
        { str: 16, dex: 16, expect: "2[W]+3 damage (melee) or 2[W]+3 damage (ranged) (special)" } ]

  "[JawsOfTheWolf] should be defined":
    Verify.testProperties "JawsOfTheWolf",
      name: [ expect: "Jaws of the Wolf" ],
      attack: [
        { str: 10, expect: "+0 vs. AC, two attacks" },
        { str: 16, expect: "+3 vs. AC, two attacks" } ]
      hit: [
        { str: 10, expect: "2[W] damage per attack" },
        { str: 16, expect: "2[W]+3 damage per attack" } ]

  "[SplitTheTree] should be defined":
    Verify.testProperties "SplitTheTree",
      name: [ expect: "Split the Tree" ],
      attack: [
        { dex: 10, expect: "+0 vs. AC (special)" },
        { dex: 16, expect: "+3 vs. AC (special)" } ]
      hit: [
        { dex: 10, expect: "2[W] damage" },
        { dex: 16, expect: "2[W]+3 damage" } ]

  "[SuddenStrike] should be defined":
    Verify.testProperties "SuddenStrike",
      name: [ expect: "Sudden Strike" ],
      attack: [
        { str: 10, expect: "+0 vs. AC (special)" },
        { str: 16, expect: "+3 vs. AC (special)" } ]
      hit: [
        { str: 10, expect: "1[W] damage (off-hand) (special, 2[W] damage w/ main weapon)" },
        { str: 16, expect: "1[W] damage (off-hand) (special, 2[W]+3 damage w/ main weapon)" } ]
