{Verify} = require '../helpers'

presenceIs = (presence) ->
  (power) -> power.npc.feature "class", "#{presence} Presence"

module.exports =
  "[InspiringPresence] should be defined":
    Verify.testProperties "warlord", "InspiringPresence",
      name: [ expect: "Inspiring Presence" ]
      effect: [
        { level:  1, cha: 10, expect: "ally regains +0 lost HP (special)" },
        { level: 10, cha: 10, expect: "ally regains +5 lost HP (special)" },
        { level:  1, cha: 16, expect: "ally regains +3 lost HP (special)" },
        { level: 10, cha: 16, expect: "ally regains +8 lost HP (special)" } ]

  "[TacticalPresence] should be defined":
    Verify.testProperties "warlord", "TacticalPresence",
      name: [ expect: "Tactical Presence" ]
      effect: [
        { int_: 10, expect: "ally gains +0 attack bonus (special)" },
        { int_: 16, expect: "ally gains +1 attack bonus (special)" },
        { int_: 18, expect: "ally gains +2 attack bonus (special)" } ]

  "[InspiringWord] should be defined":
    Verify.testProperties "warlord", "InspiringWord",
      name: [ expect: "Inspiring Word" ]
      keywords: [ expect: [ "martial", "healing" ] ]
      frequency: [
        { level:  1, expect: "2/encounter" },
        { level: 15, expect: "2/encounter" },
        { level: 16, expect: "3/encounter" } ]
      attackTypes: [
        { level:  1, expect: [ "Close burst 5" ] },
        { level: 10, expect: [ "Close burst 5" ] },
        { level: 11, expect: [ "Close burst 10" ] },
        { level: 20, expect: [ "Close burst 10" ] },
        { level: 21, expect: [ "Close burst 15" ] } ]
      effect:  [
        { level:  1, expect: "ally can regain +1d6 hit points" },
        { level:  6, expect: "ally can regain +2d6 hit points" },
        { level: 11, expect: "ally can regain +3d6 hit points" },
        { level: 16, expect: "ally can regain +4d6 hit points" },
        { level: 21, expect: "ally can regain +5d6 hit points" },
        { level: 26, expect: "ally can regain +6d6 hit points" } ]

  "[CommandersStrike] should be defined":
    Verify.testProperties "warlord", "CommandersStrike",
      name: [ expect: "Commander's Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      hit: [
        { int_: 10, expect: "ally's basic attack damage" },
        { int_: 16, expect: "ally's basic attack damage+3" } ]

  "[FuriousSmash] should be defined":
    Verify.testProperties "warlord", "FuriousSmash",
      name: [ expect: "Furious Smash" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. Fortitude" },
        { str: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { str: 10, cha: 10, expect: "0 damage, selected ally gets +0 to next attack and damage vs. this target (special)" },
        { str: 16, cha: 10, expect: "3 damage, selected ally gets +0 to next attack and damage vs. this target (special)" },
        { str: 16, cha: 14, expect: "3 damage, selected ally gets +2 to next attack and damage vs. this target (special)" } ]

  "[VipersStrike] should be defined":
    Verify.testProperties "warlord", "VipersStrike",
      name: [ expect: "Viper's Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] damage (special)" },
        { level:  1, str: 16, expect: "1[W]+3 damage (special)" },
        { level: 21, str: 16, expect: "2[W]+3 damage (special)" } ]

  "[WolfPackTactics] should be defined":
    Verify.testProperties "warlord", "WolfPackTactics",
      name: [ expect: "Wolf Pack Tactics" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] damage (special)" },
        { level:  1, str: 16, expect: "1[W]+3 damage (special)" },
        { level: 21, str: 16, expect: "2[W]+3 damage (special)" } ]

  "[GuardingAttack] should be defined":
    Verify.testProperties "warlord", "GuardingAttack",
      name: [ expect: "Guarding Attack" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, cha: 10, when: presenceIs("Inspiring"), expect: "2[W] damage, adjacent ally gets +1 AC vs. target" },
        { str: 10, cha: 10, when: presenceIs("Tactical"), expect: "2[W] damage, adjacent ally gets +2 AC vs. target" },
        { str: 16, cha: 10, when: presenceIs("Tactical"), expect: "2[W]+3 damage, adjacent ally gets +2 AC vs. target" },
        { str: 16, cha: 14, when: presenceIs("Tactical"), expect: "2[W]+3 damage, adjacent ally gets +2 AC vs. target" },
        { str: 16, cha: 14, when: presenceIs("Inspiring"), expect: "2[W]+3 damage, adjacent ally gets +3 AC vs. target" } ]

  "[HammerAndAnvil] should be defined":
    Verify.testProperties "warlord", "HammerAndAnvil",
      name: [ expect: "Hammer and Anvil" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. Reflex" }, { str: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { str: 10, cha: 10, expect: "1[W] damage, adjacent ally attacks as free action with +0 damage" },
        { str: 16, cha: 10, expect: "1[W]+3 damage, adjacent ally attacks as free action with +0 damage" },
        { str: 16, cha: 14, expect: "1[W]+3 damage, adjacent ally attacks as free action with +2 damage" } ]

  "[LeafOnTheWind] should be defined":
    Verify.testProperties "warlord", "LeafOnTheWind",
      name: [ expect: "Leaf on the Wind" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[WarlordsFavor] should be defined":
    Verify.testProperties "warlord", "WarlordsFavor",
      name: [ expect: "Warlord's Favor" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, int_: 10, when: presenceIs("Tactical"), expect: "2[W] damage, adjacent ally gets +1 to attack vs. target" },
        { str: 10, int_: 10, when: presenceIs("Inspiring"), expect: "2[W] damage, adjacent ally gets +2 to attack vs. target" },
        { str: 16, int_: 14, when: presenceIs("Inspiring"), expect: "2[W]+3 damage, adjacent ally gets +2 to attack vs. target" },
        { str: 16, int_: 14, when: presenceIs("Tactical"), expect: "2[W]+3 damage, adjacent ally gets +3 to attack vs. target" } ]

  "[BastionOfDefense] should be defined":
    Verify.testProperties "warlord", "BastionOfDefense",
      name: [ expect: "Bastion of Defense" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]
      effect: [
        { cha: 10, expect: "allies w/in 5 squares get 5 temporary HP" },
        { cha: 16, expect: "allies w/in 5 squares get 8 temporary HP" } ]

  "[LeadTheAttack] should be defined":
    Verify.testProperties "warlord", "LeadTheAttack",
      name: [ expect: "Lead the Attack" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, int_: 10, expect: "3[W] damage, +1 to attack vs. target" },
        { str: 16, int_: 10, expect: "3[W]+3 damage, +1 to attack vs. target" },
        { str: 16, int_: 14, expect: "3[W]+3 damage, +3 to attack vs. target" } ]

  "[PinTheFoe] should be defined":
    Verify.testProperties "warlord", "PinTheFoe",
      name: [ expect: "Pin the Foe" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]

  "[WhiteRavenOnslaught] should be defined":
    Verify.testProperties "warlord", "WhiteRavenOnslaught",
      name: [ expect: "White Raven Onslaught" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]

  "[AidTheInjured] should be defined":
    Verify.testProperties "warlord", "AidTheInjured",
      name: [ expect: "Aid the Injured" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "healing", "martial" ] ]

  "[CrescendoOfViolence] should be defined":
    Verify.testProperties "warlord", "CrescendoOfViolence",
      name: [ expect: "Crescendo of Violence" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      effect: [
        { cha: 10, expect: "ally gains 0 temp HP" },
        { cha: 16, expect: "ally gains 3 temp HP" } ]

  "[KnightsMove] should be defined":
    Verify.testProperties "warlord", "KnightsMove",
      name: [ expect: "Knight's Move" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]

  "[ShakeItOff] should be defined":
    Verify.testProperties "warlord", "ShakeItOff",
      name: [ expect: "Shake It Off" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      effect: [
        { cha: 10, expect: "target gets +0 bonus to save" },
        { cha: 16, expect: "target gets +3 bonus to save" } ]

  "[HoldTheLine] should be defined":
    Verify.testProperties "warlord", "HoldTheLine",
      name: [ expect: "Hold the Line" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "1[W] damage" },
        { str: 16, expect: "1[W]+3 damage" } ]

  "[InspiringWarCry] should be defined":
    Verify.testProperties "warlord", "InspiringWarCry",
      name: [ expect: "Inspiring War Cry" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage" },
        { str: 16, expect: "2[W]+3 damage" } ]

  "[SteelMonsoon] should be defined":
    Verify.testProperties "warlord", "SteelMonsoon",
      name: [ expect: "Steel Monsoon" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, int_: 14, expect: "2[W] damage, 1 ally may shift" },
        { str: 16, int_: 14, expect: "2[W]+3 damage, 1 ally may shift" },
        { str: 16, int_: 14, when: presenceIs("Inspiring"), expect: "2[W]+3 damage, 1 ally may shift" },
        { str: 16, int_: 14, when: presenceIs("Tactical"), expect: "2[W]+3 damage, 2 allies may shift" } ]

  "[WarlordsStrike] should be defined":
    Verify.testProperties "warlord", "WarlordsStrike",
      name: [ expect: "Warlord's Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, cha: 14, expect: "2[W] damage, allies gain +2 to damage" },
        { str: 16, cha: 14, expect: "2[W]+3 damage, allies gain +2 to damage" },
        { str: 16, cha: 14, when: presenceIs("Tactical"), expect: "2[W]+3 damage, allies gain +2 to damage" },
        { str: 16, cha: 14, when: presenceIs("Inspiring"), expect: "2[W]+3 damage, allies gain +3 to damage" } ]

  "[StandTheFallen] should be defined":
    Verify.testProperties "warlord", "StandTheFallen",
      name: [ expect: "Stand the Fallen" ]
      keywords: [ expect: [ "healing", "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]
      effect: [
        { cha: 10, expect: "allies can surge and regain +0 extra HP" },
        { cha: 16, expect: "allies can surge and regain +3 extra HP" } ]

  "[TurningPoint] should be defined":
    Verify.testProperties "warlord", "TurningPoint",
      name: [ expect: "Turning Point" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[VillainsNightmare] should be defined":
    Verify.testProperties "warlord", "VillainsNightmare",
      name: [ expect: "Villain's Nightmare" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. Reflex" }, { str: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]

  "[GuideTheCharge] should be defined":
    Verify.testProperties "warlord", "GuideTheCharge",
      name: [ expect: "Guide the Charge" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      effect: [
        { int_: 10, expect: "ally adds +0 to damage roll, etc." },
        { int_: 16, expect: "ally adds +3 to damage roll, etc." } ]

  "[InspiringReaction] should be defined":
    Verify.testProperties "warlord", "InspiringReaction",
      name: [ expect: "Inspiring Reaction" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "healing", "martial" ] ]
      effect: [
        { cha: 10, expect: "ally spends surge and gets +0 extra HP" },
        { cha: 16, expect: "ally spends surge and gets +3 extra HP" } ]

  "[QuickStep] should be defined":
    Verify.testProperties "warlord", "QuickStep",
      name: [ expect: "Quick Step" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[StandTough] should be defined":
    Verify.testProperties "warlord", "StandTough",
      name: [ expect: "Stand Tough" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial" ] ]
      effect: [
        { cha: 10, expect: "targets regain 10 HP" },
        { cha: 16, expect: "targets regain 13 HP" } ]

  "[LionsRoar] should be defined":
    Verify.testProperties "warlord", "LionsRoar",
      name: [ expect: "Lion's Roar" ]
      keywords: [ expect: [ "healing", "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage" },
        { str: 16, expect: "2[W]+3 damage" } ]
      effect: [
        { cha: 14, expect: "ally can surge and get +0 extra HP" },
        { cha: 14, expect: "ally can surge and get +0 extra HP" },
        { cha: 14, when: presenceIs("Tactical"), expect: "ally can surge and get +0 extra HP" },
        { cha: 14, when: presenceIs("Inspiring"), expect: "ally can surge and get +2 extra HP" } ]

  "[SunderArmor] should be defined":
    Verify.testProperties "warlord", "SunderArmor",
      name: [ expect: "Sunder Armor" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[SurpriseAttack] should be defined":
    Verify.testProperties "warlord", "SurpriseAttack",
      name: [ expect: "Surprise Attack" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, int_: 14, expect: "1[W] damage, ally makes free attack at +0" },
        { str: 16, int_: 14, expect: "1[W]+3 damage, ally makes free attack at +0" },
        { str: 16, int_: 14, when: presenceIs("Inspired"), expect: "1[W]+3 damage, ally makes free attack at +0" },
        { str: 16, int_: 14, when: presenceIs("Tactical"), expect: "1[W]+3 damage, ally makes free attack at +2" } ]

  "[SurroundFoe] should be defined":
    Verify.testProperties "warlord", "SurroundFoe",
      name: [ expect: "Surround Foe" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "2[W] damage" }, { str: 16, expect: "2[W]+3 damage" } ]

  "[IronDragonCharge] should be defined":
    Verify.testProperties "warlord", "IronDragonCharge",
      name: [ expect: "Iron Dragon Charge" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. AC (special)" },
        { str: 16, expect: "+3 vs. AC (special)" } ]
      hit: [ { str: 10, expect: "3[W] damage" }, { str: 16, expect: "3[W]+3 damage" } ]

  "[KnockThemDown] should be defined":
    Verify.testProperties "warlord", "KnockThemDown",
      name: [ expect: "Knock Them Down" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]

  "[WhiteRavenStrike] should be defined":
    Verify.testProperties "warlord", "WhiteRavenStrike",
      name: [ expect: "White Raven Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "3[W] damage" }, { str: 16, expect: "3[W]+3 damage" } ]
      effect: [
        { cha: 10, expect: "allies gain +0 extra temp HP if target dropped to 0 HP" },
        { cha: 16, expect: "allies gain +3 extra temp HP if target dropped to 0 HP" } ]

  "[DefensiveRally] should be defined":
    Verify.testProperties "warlord", "DefensiveRally",
      name: [ expect: "Defensive Rally" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "healing", "martial" ] ]

  "[EaseSuffering] should be defined":
    Verify.testProperties "warlord", "EaseSuffering",
      name: [ expect: "Ease Suffering" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[TacticalShift] should be defined":
    Verify.testProperties "warlord", "TacticalShift",
      name: [ expect: "Tactical Shift" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]
      effect: [
        { int_: 10, expect: "ally can shift 1 square" },
        { int_: 16, expect: "ally can shift 4 squares" } ]

  "[BeatThemIntoTheGround] should be defined":
    Verify.testProperties "warlord", "BeatThemIntoTheGround",
      name: [ expect: "Beat Them Into the Ground" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[BolsteringBlow] should be defined":
    Verify.testProperties "warlord", "BolsteringBlow",
      name: [ expect: "Bolstering Blow" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[DenyingSmite] should be defined":
    Verify.testProperties "warlord", "DenyingSmite",
      name: [ expect: "Denying Smite" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[FuryOfTheSirocco] should be defined":
    Verify.testProperties "warlord", "FuryOfTheSirocco",
      name: [ expect: "Fury of the Sirocco" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[MakeThemBleed] should be defined":
    Verify.testProperties "warlord", "MakeThemBleed",
      name: [ expect: "Make Them Bleed" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[RenewTheTroops] should be defined":
    Verify.testProperties "warlord", "RenewTheTroops",
      name: [ expect: "Renew the Troops" ]
      keywords: [ expect: [ "healing", "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[WarlordsGambit] should be defined":
    Verify.testProperties "warlord", "WarlordsGambit",
      name: [ expect: "Warlord's Gambit" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[HerosDefiance] should be defined":
    Verify.testProperties "warlord", "HerosDefiance",
      name: [ expect: "Hero's Defiance" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: undefined ]

  "[WarlordsBanner] should be defined":
    Verify.testProperties "warlord", "WarlordsBanner",
      name: [ expect: "Warlord's Banner" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "healing", "martial" ] ]
      requires: [ expect: undefined ]

  "[WhiteRavenFormation] should be defined":
    Verify.testProperties "warlord", "WhiteRavenFormation",
      name: [ expect: "White Raven Formation" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: undefined ]

  "[BattleOn] should be defined":
    Verify.testProperties "warlord", "BattleOn",
      name: [ expect: "Battle On" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[HailOfSteel] should be defined":
    Verify.testProperties "warlord", "HailOfSteel",
      name: [ expect: "Hail of Steel" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[ThunderousFury] should be defined":
    Verify.testProperties "warlord", "ThunderousFury",
      name: [ expect: "Thunderous Fury" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[WarlordsRush] should be defined":
    Verify.testProperties "warlord", "WarlordsRush",
      name: [ expect: "Warlord's Rush" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[BreakTheTempo] should be defined":
    Verify.testProperties "warlord", "BreakTheTempo",
      name: [ expect: "Break the Tempo" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[VictorySurge] should be defined":
    Verify.testProperties "warlord", "VictorySurge",
      name: [ expect: "Victory Surge" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]

  "[WindmillOfDoom] should be defined":
    Verify.testProperties "warlord", "WindmillOfDoom",
      name: [ expect: "Windmill of Doom" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "melee" } ]
