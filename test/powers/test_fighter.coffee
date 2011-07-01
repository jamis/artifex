{Verify} = require '../helpers'

module.exports =
  "[Cleave] should be defined":
    Verify.testProperties "fighter", "Cleave",
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
    Verify.testProperties "fighter", "ReapingStrike",
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
    Verify.testProperties "fighter", "SureStrike",
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
    Verify.testProperties "fighter", "TideOfIron",
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
    Verify.testProperties "fighter", "CoveringAttack",
      name: [ expect: "Covering Attack" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[PassingAttack] should be defined":
    Verify.testProperties "fighter", "PassingAttack",
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
    Verify.testProperties "fighter", "SpinningSweep",
      name: [ expect: "Spinning Sweep" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[SteelSerpentStrike] should be defined":
    Verify.testProperties "fighter", "SteelSerpentStrike",
      name: [ expect: "Steel Serpent Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[BruteStrike] should be defined":
    Verify.testProperties "fighter", "BruteStrike",
      name: [ expect: "Brute Strike" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]

  "[ComebackStrike] should be defined":
    Verify.testProperties "fighter", "ComebackStrike",
      name: [ expect: "Comeback Strike" ]
      keywords: [ expect: [ "healing", "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[VillainsMenace] should be defined":
    Verify.testProperties "fighter", "VillainsMenace",
      name: [ expect: "Villain's Menace" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[BoundlessEndurance] should be defined":
    Verify.testProperties "fighter", "BoundlessEndurance",
      name: [ expect: "Boundless Endurance" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial", "stance" ] ]
      effect: [
        { con: 10, expect: "regeneration 2 when bloodied" },
        { con: 16, expect: "regeneration 5 when bloodied" } ]

  "[GetOverHere] should be defined":
    Verify.testProperties "fighter", "GetOverHere",
      name: [ expect: "Get Over Here" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[NoOpening] should be defined":
    Verify.testProperties "fighter", "NoOpening",
      name: [ expect: "No Opening" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[Unstoppable] should be defined":
    Verify.testProperties "fighter", "Unstoppable",
      name: [ expect: "Unstoppable" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial" ] ]
      effect: [
        { con: 10, expect: "gain 2d6 temp HP" },
        { con: 16, expect: "gain 2d6+3 temp HP" } ]

  "[ArmorPiercingThrust] should be defined":
    Verify.testProperties "fighter", "ArmorPiercingThrust",
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
    Verify.testProperties "fighter", "CrushingBlow",
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
    Verify.testProperties "fighter", "DanceOfSteel",
      name: [ expect: "Dance of Steel" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[PreciseStrike] should be defined":
    Verify.testProperties "fighter", "PreciseStrike",
      name: [ expect: "Precise Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+4 vs. AC" }, { str: 16, expect: "+7 vs. AC" } ]
      hit: [ { str: 10, expect: "1[W] damage" }, { str: 16, expect: "1[W]+3 damage" } ]

  "[RainOfBlows] should be defined":
    Verify.testProperties "fighter", "RainOfBlows",
      name: [ expect: "Rain of Blows" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, dex: 14, expect: "1[W] damage" },
        { str: 16, dex: 14, expect: "1[W]+3 damage" },
        { str: 16, dex: 15, expect: "1[W]+3 damage (and make secondary attack if wielding light blade, spear, or flail)" } ]

  "[SweepingBlow] should be defined":
    Verify.testProperties "fighter", "SweepingBlow",
      name: [ expect: "Sweeping Blow" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. AC" },
        { str: 13, expect: "+1 vs. AC" },
        { str: 18, expect: "+4 vs. AC (+6 if wielding an axe, flail, heavy blade, or pick)" } ]
      hit: [ { str: 10, expect: "1[W] damage" }, { str: 16, expect: "1[W]+3 damage" } ]

  "[CrackTheShell] should be defined":
    Verify.testProperties "fighter", "CrackTheShell",
      name: [ expect: "Crack the Shell" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[DizzyingBlow] should be defined":
    Verify.testProperties "fighter", "DizzyingBlow",
      name: [ expect: "Dizzying Blow" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]

  "[RainOfSteel] should be defined":
    Verify.testProperties "fighter", "RainOfSteel",
      name: [ expect: "Rain of Steel" ]
      keywords: [ expect: [ "martial", "stance", "weapon" ] ]

  "[BattleAwareness] should be defined":
    Verify.testProperties "fighter", "BattleAwareness",
      name: [ expect: "Battle Awareness" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[DefensiveTraining] should be defined":
    Verify.testProperties "fighter", "DefensiveTraining",
      name: [ expect: "Defensive Training" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial", "stance" ] ]

  "[Unbreakable] should be defined":
    Verify.testProperties "fighter", "Unbreakable",
      name: [ expect: "Unbreakable" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      effect: [
        { con: 10, expect: "reduce damage from attack by 5" },
        { con: 16, expect: "reduce damage from attack by 8" } ]

  "[ComeAndGetIt] should be defined":
    Verify.testProperties "fighter", "ComeAndGetIt",
      name: [ expect: "Come and Get It" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "1[W] damage" }, { str: 16, expect: "1[W]+3 damage" } ]

  "[GriffonsWrath] should be defined":
    Verify.testProperties "fighter", "GriffonsWrath",
      name: [ expect: "Griffon's Wrath" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[IronBulwark] should be defined":
    Verify.testProperties "fighter", "IronBulwark",
      name: [ expect: "Iron Bulwark" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage" },
        { str: 16, expect: "2[W]+3 damage" } ]

  "[RecklessStrike] should be defined":
    Verify.testProperties "fighter", "RecklessStrike",
      name: [ expect: "Reckless Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "-2 vs. AC" }, { str: 16, expect: "+1 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]

  "[SuddenSurge] should be defined":
    Verify.testProperties "fighter", "SuddenSurge",
      name: [ expect: "Sudden Surge" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage" },
        { str: 16, expect: "2[W]+3 damage" } ]
      effect: [
        { dex: 10, expect: "move 1 square" },
        { dex: 12, expect: "move 1 square" },
        { dex: 16, expect: "move 3 squares" } ]

  "[ShiftTheBattlefield] should be defined":
    Verify.testProperties "fighter", "ShiftTheBattlefield",
      name: [ expect: "Shift the Battlefield" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[ThicketOfBlades] should be defined":
    Verify.testProperties "fighter", "ThicketOfBlades",
      name: [ expect: "Thicket of Blades" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]

  "[VictoriousSurge] should be defined":
    Verify.testProperties "fighter", "VictoriousSurge",
      name: [ expect: "Victorious Surge" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]

  "[IntoTheFray] should be defined":
    Verify.testProperties "fighter", "IntoTheFray",
      name: [ expect: "Into the Fray" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[LastDitchEvasion] should be defined":
    Verify.testProperties "fighter", "LastDitchEvasion",
      name: [ expect: "Last Ditch Evasion" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[StalwartGuard] should be defined":
    Verify.testProperties "fighter", "StalwartGuard",
      name: [ expect: "Stalwart Guard" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[AnvilOfDoom] should be defined":
    Verify.testProperties "fighter", "AnvilOfDoom",
      name: [ expect: "Anvil of Doom" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[ChainsOfSorrow] should be defined":
    Verify.testProperties "fighter", "ChainsOfSorrow",
      name: [ expect: "Chains of Sorrow" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[GiantsWake] should be defined":
    Verify.testProperties "fighter", "GiantsWake",
      name: [ expect: "Giant's Wake" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[Silverstep] should be defined":
    Verify.testProperties "fighter", "Silverstep",
      name: [ expect: "Silverstep" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[StormOfBlows] should be defined":
    Verify.testProperties "fighter", "StormOfBlows",
      name: [ expect: "Storm of Blows" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[TalonOfTheRoc] should be defined":
    Verify.testProperties "fighter", "TalonOfTheRoc",
      name: [ expect: "Talon of the Roc" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[DragonsFangs] should be defined":
    Verify.testProperties "fighter", "DragonsFangs",
      name: [ expect: "Dragon's Fangs" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[SerpentDanceStrike] should be defined":
    Verify.testProperties "fighter", "SerpentDanceStrike",
      name: [ expect: "Serpent Dance Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[UnyieldingAvalanche] should be defined":
    Verify.testProperties "fighter", "UnyieldingAvalanche",
      name: [ expect: "Unyielding Avalanche" ]
      keywords: [ expect: [ "healing", "martial", "stance", "weapon" ] ]

  "[InterposingShield] should be defined":
    Verify.testProperties "fighter", "InterposingShield",
      name: [ expect: "Interposing Shield" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[IronWarrior] should be defined":
    Verify.testProperties "fighter", "IronWarrior",
      name: [ expect: "Iron Warrior" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial" ] ]

  "[SurpriseStep] should be defined":
    Verify.testProperties "fighter", "SurpriseStep",
      name: [ expect: "Surprise Step" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[ExactingStrike] should be defined":
    Verify.testProperties "fighter", "ExactingStrike",
      name: [ expect: "Exacting Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[ExorcismOfSteel] should be defined":
    Verify.testProperties "fighter", "ExorcismOfSteel",
      name: [ expect: "Exorcism of Steel" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[HarryingAssault] should be defined":
    Verify.testProperties "fighter", "HarryingAssault",
      name: [ expect: "Harrying Assault" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[MountainBreakingBlow] should be defined":
    Verify.testProperties "fighter", "MountainBreakingBlow",
      name: [ expect: "Mountain Breaking Blow" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[VorpalTornado] should be defined":
    Verify.testProperties "fighter", "VorpalTornado",
      name: [ expect: "Vorpal Tornado" ]
      keywords: [ expect: [ "martial", "weapon" ] ]

  "[WarriorsChallenge] should be defined":
    Verify.testProperties "fighter", "WarriorsChallenge",
      name: [ expect: "Warrior's Challenge" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }

  "[DevastationsWake] should be defined":
    Verify.testProperties "fighter", "DevastationsWake",
      name: [ expect: "Devastation's Wake" ]
      keywords: [ expect: [ "martial", "weapon" ] ]

  "[ReavingStrike] should be defined":
    Verify.testProperties "fighter", "ReavingStrike",
      name: [ expect: "Reaving Strike" ]
      keywords: [ expect: [ "martial", "reliable", "weapon" ] ]
      requires: { weapon: "melee" }

  "[StrikeOfTheWatchfulGuard] should be defined":
    Verify.testProperties "fighter", "StrikeOfTheWatchfulGuard",
      name: [ expect: "Strike of the Watchful Guard" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: { weapon: "melee" }
