{NPC, Powers} = require '../..'
{Verify}      = require '../helpers'

module.exports =
  "[BolsteringStrike] should be defined":
    Verify.testProperties "BolsteringStrike",
      name: [ expect: "Bolstering Strike" ]
      attack: [ { cha: 10, expect: "+0 vs. AC" }, { cha: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, cha: 10, wis: 10, expect: "1[W] damage, +0 temp HP" },
        { level:  1, cha: 16, wis: 10, expect: "1[W]+3 damage, +0 temp HP" },
        { level:  1, cha: 16, wis: 14, expect: "1[W]+3 damage, +2 temp HP" },
        { level: 20, cha: 16, wis: 14, expect: "1[W]+3 damage, +2 temp HP" },
        { level: 21, cha: 16, wis: 14, expect: "2[W]+3 damage, +2 temp HP" } ]

  "[EnfeeblingStrike] should be defined":
    Verify.testProperties "EnfeeblingStrike",
      name: [ expect: "Enfeebling Strike" ]
      attack: [ { cha: 10, expect: "+0 vs. AC" }, { cha: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, cha: 10, expect: "1[W] damage (special)" },
        { level:  1, cha: 16, expect: "1[W]+3 damage (special)" },
        { level: 20, cha: 16, expect: "1[W]+3 damage (special)" },
        { level: 21, cha: 16, expect: "2[W]+3 damage (special)" } ]

  "[HolyStrike] should be defined":
    Verify.testProperties "HolyStrike",
      name: [ expect: "Holy Strike" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, wis: 10, expect: "1[W] damage (+0 if marked)" },
        { level:  1, str: 16, wis: 10, expect: "1[W]+3 damage (+3 if marked)" },
        { level:  1, str: 16, wis: 14, expect: "1[W]+3 damage (+5 if marked)" },
        { level: 20, str: 16, wis: 14, expect: "1[W]+3 damage (+5 if marked)" },
        { level: 21, str: 16, wis: 14, expect: "2[W]+3 damage (+5 if marked)" } ]

  "[ValiantStrike] should be defined":
    Verify.testProperties "ValiantStrike",
      name: [ expect: "Valiant Strike" ]
      attack: [
        { str: 10, expect: "+0 + 1/adjacent enemy vs. AC" },
        { str: 16, expect: "+3 + 1/adjacent enemy vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] damage" },
        { level:  1, str: 16, expect: "1[W]+3 damage" },
        { level: 20, str: 16, expect: "1[W]+3 damage" },
        { level: 21, str: 16, expect: "2[W]+3 damage" } ]

  "[FearsomeSmite] should be defined":
    Verify.testProperties "FearsomeSmite",
      name: [ expect: "Fearsome Smite" ]
      attack: [ { cha: 10, expect: "+0 vs. AC" }, { cha: 16, expect: "+3 vs. AC" } ]
      hit: [
        { cha: 10, expect: "2[W] damage (special)" },
        { cha: 16, expect: "2[W]+3 damage (special)" } ]

  "[PiercingSmite] should be defined":
    Verify.testProperties "PiercingSmite",
      name: [ expect: "Piercing Smite" ]
      attack: [ { str: 10, expect: "+0 vs. Reflex" }, { str: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { str: 10, wis: 10, expect: "2[W] damage, mark target and 0 adjacent enemies" },
        { str: 16, wis: 10, expect: "2[W]+3 damage, mark target and 0 adjacent enemies" },
        { str: 16, wis: 18, expect: "2[W]+3 damage, mark target and 4 adjacent enemies" } ]

  "[RadiantSmite] should be defined":
    Verify.testProperties "RadiantSmite",
      name: [ expect: "Radiant Smite" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, wis: 10, expect: "2[W]+0 damage" },
        { str: 14, wis: 10, expect: "2[W]+2 damage" },
        { str: 14, wis: 16, expect: "2[W]+5 damage" } ]

  "[ShieldingSmite] should be defined":
    Verify.testProperties "ShieldingSmite",
      name: [ expect: "Shielding Smite" ]
      attack: [ { cha: 10, expect: "+0 vs. AC" }, { cha: 16, expect: "+3 vs. AC" } ]
      hit: [
        { cha: 10, expect: "2[W] damage" },
        { cha: 14, expect: "2[W]+2 damage" } ]
      effect: [
        { wis: 10, expect: "ally w/in 5 squares gets +0 bonus to AC" },
        { wis: 16, expect: "ally w/in 5 squares gets +3 bonus to AC" } ]

  "[OnPainOfDeath] should be defined":
    Verify.testProperties "OnPainOfDeath",
      name: [ expect: "On Pain of Death" ]
      attack: [ { cha: 10, expect: "+0 vs. Will" }, { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "3d8 damage (special)" },
        { cha: 16, expect: "3d8+3 damage (special)" } ]

  "[PaladinsJudgement] should be defined":
    Verify.testProperties "PaladinsJudgement",
      name: [ expect: "Paladin's Judgement" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]

  "[RadiantDelirium] should be defined":
    Verify.testProperties "RadiantDelirium",
      name: [ expect: "Radiant Delirium" ]
      attack: [ { cha: 10, expect: "+0 vs. Reflex" }, { cha: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { cha: 10, expect: "3d8 damage (special)" },
        { cha: 16, expect: "3d8+3 damage (special)" } ]
