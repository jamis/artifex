{Verify} = require '../helpers'

module.exports =
  "[DivineMettle] should be defined":
    Verify.testProperties "DivineMettle",
      name: [ expect: "Channel Divinity: Divine Mettle" ]
      keywords: [ expect: [ "divine" ] ]
      effect: [
        { cha:  6, expect: "target makes a save with +0 bonus" },
        { cha: 10, expect: "target makes a save with +0 bonus" },
        { cha: 18, expect: "target makes a save with +4 bonus" } ]
    
  "[DivineStrength] should be defined":
    Verify.testProperties "DivineStrength",
      name: [ expect: "Channel Divinity: Divine Strength" ]
      keywords: [ expect: [ "divine" ] ]
      effect: [
        { str: 10, expect: "apply +0 extra damage on next attack" },
        { str: 18, expect: "apply +4 extra damage on next attack" } ]
    
  "[DivineChallenge] should be defined":
    Verify.testProperties "DivineChallenge",
      name: [ expect: "Divine Challenge" ]
      keywords: [ expect: [ "divine", "radiant" ] ]
      effect: [
        { level: 1, cha: 10, expect: "target takes 3 damage on first attack that excludes you (special)" },
        { level: 1, cha: 16, expect: "target takes 6 damage on first attack that excludes you (special)" },
        { level: 10, cha: 16, expect: "target takes 6 damage on first attack that excludes you (special)" },
        { level: 11, cha: 16, expect: "target takes 9 damage on first attack that excludes you (special)" },
        { level: 20, cha: 16, expect: "target takes 9 damage on first attack that excludes you (special)" },
        { level: 21, cha: 16, expect: "target takes 12 damage on first attack that excludes you (special)" } ]

  "[LayOnHands] should be defined":
    Verify.testProperties "LayOnHands",
      name: [ expect: "Lay on Hands" ]
      keywords: [ expect: [ "divine", "healing" ] ]
      frequency: [ { wis: 10, expect: "1/day" }, { wis: 16, expect: "3/day" } ]

  "[BolsteringStrike] should be defined":
    Verify.testProperties "BolsteringStrike",
      name: [ expect: "Bolstering Strike" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
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
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { cha: 10, expect: "+0 vs. AC" }, { cha: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, cha: 10, expect: "1[W] damage (special)" },
        { level:  1, cha: 16, expect: "1[W]+3 damage (special)" },
        { level: 20, cha: 16, expect: "1[W]+3 damage (special)" },
        { level: 21, cha: 16, expect: "2[W]+3 damage (special)" } ]

  "[HolyStrike] should be defined":
    Verify.testProperties "HolyStrike",
      name: [ expect: "Holy Strike" ]
      keywords: [ expect: [ "divine", "radiant", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
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
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
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
      keywords: [ expect: [ "divine", "fear", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { cha: 10, expect: "+0 vs. AC" }, { cha: 16, expect: "+3 vs. AC" } ]
      hit: [
        { cha: 10, expect: "2[W] damage (special)" },
        { cha: 16, expect: "2[W]+3 damage (special)" } ]

  "[PiercingSmite] should be defined":
    Verify.testProperties "PiercingSmite",
      name: [ expect: "Piercing Smite" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. Reflex" }, { str: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { str: 10, wis: 10, expect: "2[W] damage, mark target and 0 adjacent enemies" },
        { str: 16, wis: 10, expect: "2[W]+3 damage, mark target and 0 adjacent enemies" },
        { str: 16, wis: 18, expect: "2[W]+3 damage, mark target and 4 adjacent enemies" } ]

  "[RadiantSmite] should be defined":
    Verify.testProperties "RadiantSmite",
      name: [ expect: "Radiant Smite" ]
      keywords: [ expect: [ "divine", "radiant", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, wis: 10, expect: "2[W]+0 damage" },
        { str: 14, wis: 10, expect: "2[W]+2 damage" },
        { str: 14, wis: 16, expect: "2[W]+5 damage" } ]

  "[ShieldingSmite] should be defined":
    Verify.testProperties "ShieldingSmite",
      name: [ expect: "Shielding Smite" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
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
      keywords: [ expect: [ "divine", "implement" ] ]
      attack: [ { cha: 10, expect: "+0 vs. Will" }, { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "3d8 damage (special)" },
        { cha: 16, expect: "3d8+3 damage (special)" } ]

  "[PaladinsJudgement] should be defined":
    Verify.testProperties "PaladinsJudgement",
      name: [ expect: "Paladin's Judgement" ]
      keywords: [ expect: [ "divine", "healing", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "3[W] damage (special)" },
        { str: 16, expect: "3[W]+3 damage (special)" } ]

  "[RadiantDelirium] should be defined":
    Verify.testProperties "RadiantDelirium",
      name: [ expect: "Radiant Delirium" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { cha: 10, expect: "+0 vs. Reflex" }, { cha: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { cha: 10, expect: "3d8 damage (special)" },
        { cha: 16, expect: "3d8+3 damage (special)" } ]

  "[AstralSpeech] should be defined":
    Verify.testProperties "AstralSpeech",
      name: [ expect: "Astral Speech" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[MartyrsBlessing] should be defined":
    Verify.testProperties "MartyrsBlessing",
      name: [ expect: "Martyr's Blessing" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[SacredCircle] should be defined":
    Verify.testProperties "SacredCircle",
      name: [ expect: "Sacred Circle" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "implement", "zone" ] ]

  "[ArcingSmite] should be defined":
    Verify.testProperties "ArcingSmite",
      name: [ expect: "Arcing Smite" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[InvigoratingSmite] should be defined":
    Verify.testProperties "InvigoratingSmite",
      name: [ expect: "Invigorating Smite" ]
      keywords: [ expect: [ "divine", "healing", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { cha: 10, expect: "+0 vs. Will" }, { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, wis: 10, expect: "2[W] damage, bloodied allies regain 5 HP" },
        { cha: 10, wis: 14, expect: "2[W] damage, bloodied allies regain 7 HP" },
        { cha: 16, wis: 10, expect: "2[W]+3 damage, bloodied allies regain 5 HP" },
        { cha: 16, wis: 14, expect: "2[W]+3 damage, bloodied allies regain 7 HP" } ]

  "[RighteousSmite] should be defined":
    Verify.testProperties "RighteousSmite",
      name: [ expect: "Righteous Smite" ]
      keywords: [ expect: [ "divine", "healing", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { cha: 10, expect: "+0 vs. AC" }, { cha: 16, expect: "+3 vs. AC" } ]
      hit: [
        { cha: 10, wis: 10, expect: "2[W] damage, allies get 5 temp HP" },
        { cha: 10, wis: 14, expect: "2[W] damage, allies get 7 temp HP" },
        { cha: 16, wis: 10, expect: "2[W]+3 damage, allies get 5 temp HP" },
        { cha: 16, wis: 14, expect: "2[W]+3 damage, allies get 7 temp HP" } ]

  "[StaggeringSmite] should be defined":
    Verify.testProperties "StaggeringSmite",
      name: [ expect: "Staggering Smite" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, wis: 10, expect: "2[W] damage" },
        { str: 10, wis: 12, expect: "2[W] damage, target pushed 1 square" },
        { str: 10, wis: 14, expect: "2[W] damage, target pushed 2 squares" },
        { str: 16, wis: 10, expect: "2[W]+3 damage" },
        { str: 16, wis: 14, expect: "2[W]+3 damage, target pushed 2 squares" } ]

  "[HallowedCircle] should be defined":
    Verify.testProperties "HallowedCircle",
      name: [ expect: "Hallowed Circle" ]
      keywords: [ expect: [ "divine", "implement", "zone" ] ]
      attack: [ { cha: 10, expect: "+0 vs. Reflex" }, { cha: 16, expect: "+3 vs. Reflex" } ]
      hit: [ { cha: 10, expect: "2d6 damage" }, { cha: 16, expect: "2d6+3 damage" } ]

  "[MartyrsRetribution] should be defined":
    Verify.testProperties "MartyrsRetribution",
      name: [ expect: "Martyr's Retribution" ]
      keywords: [ expect: [ "divine", "radiant", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. AC (special)" },
        { str: 16, expect: "+3 vs. AC (special)" } ]
      hit: [ { str: 10, expect: "4[W] damage" }, { str: 16, expect: "4[W]+3 damage" } ]

  "[SignOfVulnerability] should be defined":
    Verify.testProperties "SignOfVulnerability",
      name: [ expect: "Sign of Vulnerability" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Fortitude" },
        { cha: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { cha: 10, expect: "3d8 damage (special)" },
        { cha: 16, expect: "3d8+3 damage (special)" } ]

  "[DivineBodyguard] should be defined":
    Verify.testProperties "DivineBodyguard",
      name: [ expect: "Divine Bodyguard" ]
      type: [expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[OneHeartOneMind] should be defined":
    Verify.testProperties "OneHeartOneMind",
      name: [ expect: "One Heart, One Mind" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[WrathOfTheGods] should be defined":
    Verify.testProperties "WrathOfTheGods",
      name: [ expect: "Wrath of the Gods" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]
      effect: [
        { cha: 10, expect: "targets add +0 to damage rolls" },
        { cha: 16, expect: "targets add +3 to damage rolls" } ]

  "[BeckonFoe] should be defined":
    Verify.testProperties "BeckonFoe",
      name: [ expect: "Beckon Foe" ]
      keywords: [ expect: [ "divine", "implement" ] ]
      attack: [ { cha: 10, expect: "+0 vs. Will" }, { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, wis: 8, expect: "2d10 damage" },
        { cha: 10, wis: 10, expect: "2d10 damage" },
        { cha: 10, wis: 12, expect: "2d10 damage, pull target 1 square" },
        { cha: 10, wis: 14, expect: "2d10 damage, pull target 2 squares" },
        { cha: 16, wis: 10, expect: "2d10+3 damage" },
        { cha: 16, wis: 14, expect: "2d10+3 damage, pull target 2 squares" } ]

  "[BenignTransposition] should be defined":
    Verify.testProperties "BenignTransposition",
      name: [ expect: "Benign Transposition" ]
      keywords: [ expect: [ "divine", "teleportation", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      target: [
        { wis: 10, expect: "one ally within 1 square (primary)" },
        { wis: 16, expect: "one ally within 3 squares (primary)" } ]
      attack: [
        { cha: 10, expect: "+0 vs. AC (secondary)" },
        { cha: 16, expect: "+3 vs. AC (secondary)" } ]
      hit: [
        { cha: 10, expect: "2[W] damage (secondary)" },
        { cha: 16, expect: "2[W]+3 damage (secondary)" } ]

  "[DivineReverence] should be defined":
    Verify.testProperties "DivineReverence",
      name: [ expect: "Divine Reverence" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { cha: 10, expect: "+0 vs. Will" }, { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "1d8 damage (special)" },
        { cha: 16, expect: "1d8+3 damage (special)" } ]

  "[ThunderSmite] should be defined":
    Verify.testProperties "ThunderSmite",
      name: [ expect: "Thunder Smite" ]
      keywords: [ expect: [ "divine", "thunder", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. AC (special)" },
        { str: 16, expect: "+3 vs. AC (special)" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[CrownOfGlory] should be defined":
    Verify.testProperties "CrownOfGlory",
      name: [ expect: "Crown of Glory" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { cha: 10, expect: "+0 vs. Will" }, { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "2d8 damage (special)" },
        { cha: 16, expect: "2d8+3 damage (special)" } ]

  "[OneStandsAlone] should be defined":
    Verify.testProperties "OneStandsAlone",
      name: [ expect: "One Stands Alone" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { cha: 10, expect: "+0 vs. Will" }, { cha: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "2d8 damage (special)" },
        { cha: 16, expect: "2d8+3 damage (special)" } ]

  "[RadiantPulse] should be defined":
    Verify.testProperties "RadiantPulse",
      name: [ expect: "Radiant Pulse" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [
        { cha: 10, expect: "+0 vs. Fortitude" },
        { cha: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { cha: 10, expect: "1d10 damage (special)" },
        { cha: 16, expect: "1d10+3 damage (special)" } ]

  "[CleansingSpirit] should be defined":
    Verify.testProperties "CleansingSpirit",
      name: [ expect: "Cleansing Spirit" ]
      type: [expect: "encounter" ]
      keywords: [ expect: [ "divine" ] ]

  "[NobleShield] should be defined":
    Verify.testProperties "NobleShield",
      name: [ expect: "Noble Shield" ]
      type: [expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[TurnTheTide] should be defined":
    Verify.testProperties "TurnTheTide",
      name: [ expect: "Turn the Tide" ]
      type: [expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]
