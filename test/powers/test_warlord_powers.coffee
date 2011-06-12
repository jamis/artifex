{Verify} = require '../helpers'

presenceIs = (presence) ->
  (power) -> power.npc.feature "class", "#{presence} Presence"

module.exports =
  "[InspiringPresence] should be defined":
    Verify.testProperties "InspiringPresence",
      name: [ expect: "Inspiring Presence" ]
      effect: [
        { level:  1, cha: 10, expect: "ally regains +0 lost HP (special)" },
        { level: 10, cha: 10, expect: "ally regains +5 lost HP (special)" },
        { level:  1, cha: 16, expect: "ally regains +3 lost HP (special)" },
        { level: 10, cha: 16, expect: "ally regains +8 lost HP (special)" } ]

  "[TacticalPresence] should be defined":
    Verify.testProperties "TacticalPresence",
      name: [ expect: "Tactical Presence" ]
      effect: [
        { int_: 10, expect: "ally gains +0 attack bonus (special)" },
        { int_: 16, expect: "ally gains +1 attack bonus (special)" },
        { int_: 18, expect: "ally gains +2 attack bonus (special)" } ]

  "[InspiringWord] should be defined":
    Verify.testProperties "InspiringWord",
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
    Verify.testProperties "CommandersStrike",
      name: [ expect: "Commander's Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      hit: [
        { int_: 10, expect: "ally's basic attack damage" },
        { int_: 16, expect: "ally's basic attack damage+3" } ]

  "[FuriousSmash] should be defined":
    Verify.testProperties "FuriousSmash",
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
    Verify.testProperties "VipersStrike",
      name: [ expect: "Viper's Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] damage (special)" },
        { level:  1, str: 16, expect: "1[W]+3 damage (special)" },
        { level: 21, str: 16, expect: "2[W]+3 damage (special)" } ]

  "[WolfPackTactics] should be defined":
    Verify.testProperties "WolfPackTactics",
      name: [ expect: "Wolf Pack Tactics" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] damage (special)" },
        { level:  1, str: 16, expect: "1[W]+3 damage (special)" },
        { level: 21, str: 16, expect: "2[W]+3 damage (special)" } ]

  "[GuardingAttack] should be defined":
    Verify.testProperties "GuardingAttack",
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
    Verify.testProperties "HammerAndAnvil",
      name: [ expect: "Hammer and Anvil" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. Reflex" }, { str: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { str: 10, cha: 10, expect: "1[W] damage, adjacent ally attacks as free action with +0 damage" },
        { str: 16, cha: 10, expect: "1[W]+3 damage, adjacent ally attacks as free action with +0 damage" },
        { str: 16, cha: 14, expect: "1[W]+3 damage, adjacent ally attacks as free action with +2 damage" } ]

  "[LeafOnTheWind] should be defined":
    Verify.testProperties "LeafOnTheWind",
      name: [ expect: "Leaf on the Wind" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[WarlordsFavor] should be defined":
    Verify.testProperties "WarlordsFavor",
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
    Verify.testProperties "BastionOfDefense",
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
    Verify.testProperties "LeadTheAttack",
      name: [ expect: "Lead the Attack" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, int_: 10, expect: "3[W] damage, +1 to attack vs. target" },
        { str: 16, int_: 10, expect: "3[W]+3 damage, +1 to attack vs. target" },
        { str: 16, int_: 14, expect: "3[W]+3 damage, +3 to attack vs. target" } ]

  "[PinTheFoe] should be defined":
    Verify.testProperties "PinTheFoe",
      name: [ expect: "Pin the Foe" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage" },
        { str: 16, expect: "3[W]+3 damage" } ]

  "[WhiteRavenOnslaught] should be defined":
    Verify.testProperties "WhiteRavenOnslaught",
      name: [ expect: "White Raven Onslaught" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]
