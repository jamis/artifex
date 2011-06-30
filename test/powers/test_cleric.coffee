{Verify} = require '../helpers'

module.exports =
  "[ArmorOfBahamut] should be defined":
    Verify.testProperties "cleric", "ArmorOfBahamut",
      name: [ expect: "Channel Divinity: Armor of Bahamut" ]
      keywords: [ expect: [ "divine" ] ]

  "[AvandrasRescue] should be defined":
    Verify.testProperties "cleric", "AvandrasRescue",
      name: [ expect: "Channel Divinity: Avandra's Rescue" ]
      keywords: [ expect: [ "divine" ] ]

  "[CorellonsGrace] should be defined":
    Verify.testProperties "cleric", "CorellonsGrace",
      name: [ expect: "Channel Divinity: Corellon's Grace" ]
      keywords: [ expect: [ "divine" ] ]

  "[HealingWord] should be defined":
    Verify.testProperties "cleric", "HealingWord",
      name: [ expect: "Healing Word" ]
      keywords: [ expect: [ "divine", "healing" ] ]
      frequency: [
        { level: 1, expect: "2/encounter" },
        { level: 15, expect: "2/encounter" },
        { level: 16, expect: "3/encounter" } ]
      effect: [
        { level:  1, expect: "surge+1d6" },
        { level:  6, expect: "surge+2d6" },
        { level: 11, expect: "surge+3d6" },
        { level: 16, expect: "surge+4d6" },
        { level: 21, expect: "surge+5d6" },
        { level: 26, expect: "surge+6d6" } ]
      attackTypes: [
        { level:  1, expect: [ "Close burst 5" ] },
        { level: 11, expect: [ "Close burst 10" ] },
        { level: 21, expect: [ "Close burst 15" ] } ]

  "[DivineFortune] should be defined":
    Verify.testProperties "cleric", "DivineFortune",
      name: [ expect: "Channel Divinity: Divine Fortune" ],
      keywords: [ expect: [ "divine" ] ]

  "[TurnUndead] should be defined":
    Verify.testProperties "cleric", "TurnUndead",
      name: [ expect: "Channel Divinity: Turn Undead" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attackTypes: [
        { level:  1, expect: [ "Close burst 2" ] },
        { level: 11, expect: [ "Close burst 5" ] },
        { level: 21, expect: [ "Close burst 8" ] } ]
      attack: [
        { wis: 10, expect: "+0 vs. Will" },
        { wis: 16, expect: "+3 vs. Will" } ]
      hit: [
        { wis: 10, cha: 10, level:  1, expect: "1d10, push 3 (special)"   },
        { wis: 16, cha: 10, level:  1, expect: "1d10+3, push 3 (special)" },
        { wis: 16, cha: 16, level:  1, expect: "1d10+3, push 6 (special)" },
        { wis: 16, cha: 16, level:  5, expect: "2d10+3, push 6 (special)" },
        { wis: 16, cha: 16, level: 11, expect: "3d10+3, push 6 (special)" },
        { wis: 16, cha: 16, level: 15, expect: "4d10+3, push 6 (special)" },
        { wis: 16, cha: 16, level: 21, expect: "5d10+3, push 6 (special)" },
        { wis: 16, cha: 16, level: 25, expect: "6d10+3, push 6 (special)" } ]

  "[LanceOfFaith] should be defined":
    Verify.testProperties "cleric", "LanceOfFaith",
      name: [ expect: "Lance of Faith" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Reflex" }, { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, wis: 10, expect: "1d8 (special)" },
        { level:  1, wis: 16, expect: "1d8+3 (special)" },
        { level: 20, wis: 16, expect: "1d8+3 (special)" }
        { level: 21, wis: 16, expect: "2d8+3 (special)" } ]

  "[PriestsShield] should be defined":
    Verify.testProperties "cleric", "PriestsShield",
      name: [ expect: "Priest's Shield" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] (special)" },
        { level:  1, str: 16, expect: "1[W]+3 (special)" },
        { level: 20, str: 16, expect: "1[W]+3 (special)" },
        { level: 21, str: 16, expect: "2[W]+3 (special)" } ]

  "[RighteousBrand] should be defined":
    Verify.testProperties "cleric", "RighteousBrand",
      name: [ expect: "Righteous Brand" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] (special)" },
        { level:  1, str: 16, expect: "1[W]+3 (special)" },
        { level: 20, str: 16, expect: "1[W]+3 (special)" },
        { level: 21, str: 16, expect: "2[W]+3 (special)" } ]

  "[SacredFlame] should be defined":
    Verify.testProperties "cleric", "SacredFlame",
      name: [ expect: "Sacred Flame" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Reflex" }, { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, wis: 10, expect: "1d6 (special)" },
        { level:  1, wis: 16, expect: "1d6+3 (special)" },
        { level: 20, wis: 16, expect: "1d6+3 (special)" },
        { level: 21, wis: 16, expect: "2d6+3 (special)" } ]

  "[CauseFear] should be defined":
    Verify.testProperties "cleric", "CauseFear",
      name: [ expect: "Cause Fear" ]
      keywords: [ expect: [ "divine", "fear", "implement" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Will" }, { wis: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "target moves speed away from you" },
        { cha: 16, expect: "target moves speed+3 away from you" } ]

  "[DivineGlow] should be defined":
    Verify.testProperties "cleric", "DivineGlow",
      name: [ expect: "Divine Glow" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Reflex" }, { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [ { wis: 10, expect: "1d8 (special)" }, { wis: 16, expect: "1d8+3 (special)" } ]

  "[HealingStrike] should be defined":
    Verify.testProperties "cleric", "HealingStrike",
      name: [ expect: "Healing Strike" ]
      keywords: [ expect: [ "divine", "healing", "radiant", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "2[W] (special)" }, { str: 16, expect: "2[W]+3 (special)" } ]

  "[WrathfulThunder] should be defined":
    Verify.testProperties "cleric", "WrathfulThunder",
      name: [ expect: "Wrathful Thunder" ]
      keywords: [ expect: [ "divine", "thunder", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "1[W] (special)" }, { str: 16, expect: "1[W]+3 (special)" } ]

  "[AvengingFlame] should be defined":
    Verify.testProperties "cleric", "AvengingFlame",
      name: [ expect: "Avenging Flame" ]
      keywords: [ expect: [ "divine", "fire", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "2[W] (special)" }, { str: 16, expect: "2[W]+3 (special)" } ]

  "[BeaconOfHope] should be defined":
    Verify.testProperties "cleric", "BeaconOfHope",
      name: [ expect: "Beacon of Hope" ]
      keywords: [ expect: [ "divine", "healing", "implement" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Will" }, { wis: 16, expect: "+3 vs. Will" } ]

  "[CascadeOfLight] should be defined":
    Verify.testProperties "cleric", "CascadeOfLight",
      name: [ expect: "Cascade of Light" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Will" }, { wis: 16, expect: "+3 vs. Will" } ]
      hit: [ { wis: 10, expect: "3d8 (special)" }, { wis: 16, expect: "3d8+3 (special)" } ]

  "[GuardianOfFaith] should be defined":
    Verify.testProperties "cleric", "GuardianOfFaith",
      name: [ expect: "Guardian of Faith" ]
      keywords: [ expect: [ "conjuration", "divine", "implement", "radiant" ] ]
      attack: [
        { wis: 10, expect: "+0 vs. Fort (special)" },
        { wis: 16, expect: "+3 vs. Fort (special)" } ]
      hit: [ { wis: 10, expect: "1d8" }, { wis: 16, expect: "1d8+3" } ]

  "[Bless] should be defined":
    Verify.testProperties "cleric", "Bless",
      name: [ expect: "Bless" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[CureLightWounds] should be defined":
    Verify.testProperties "cleric", "CureLightWounds",
      name: [ expect: "Cure Light Wounds" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "healing" ] ]

  "[DivineAid] should be defined":
    Verify.testProperties "cleric", "DivineAid",
      name: [ expect: "Divine Aid" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "divine" ] ]
      effect: [
        { cha: 10, expect: "target gains +0 bonus to save" },
        { cha: 16, expect: "target gains +3 bonus to save" } ]

  "[Sanctuary] should be defined":
    Verify.testProperties "cleric", "Sanctuary",
      name: [ expect: "Sanctuary" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "divine" ] ]

  "[ShieldOfFaith] should be defined":
    Verify.testProperties "cleric", "ShieldOfFaith",
      name: [ expect: "Shield of Faith" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine" ] ]

  "[BlazingBeacon] should be defined":
    Verify.testProperties "cleric", "BlazingBeacon",
      name: [ expect: "Blazing Beacon" ]
      keywords: [ expect: [ "divine", "radiant", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[Command] should be defined":
    Verify.testProperties "cleric", "Command",
      name: [ expect: "Command" ]
      keywords: [ expect: [ "charm", "divine", "implement" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Will" }, { wis: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "option to slide target up to 3 squares (special)" },
        { cha: 16, expect: "option to slide target up to 6 squares (special)" } ]

  "[DauntingLight] should be defined":
    Verify.testProperties "cleric", "DauntingLight",
      name: [ expect: "Daunting Light" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Reflex" }, { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { wis: 10, expect: "2d10 damage (special)" },
        { wis: 16, expect: "2d10+3 damage (special)" } ]

  "[SplitTheSky] should be defined":
    Verify.testProperties "cleric", "SplitTheSky",
      name: [ expect: "Split the Sky" ]
      keywords: [ expect: [ "divine", "thunder", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. Fortitude" },
        { str: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[ConsecratedGround] should be defined":
    Verify.testProperties "cleric", "ConsecratedGround",
      name: [ expect: "Consecrated Ground" ]
      keywords: [ expect: [ "divine", "healing", "radiant", "zone" ] ]
      effect: [
        { cha: 10, expect: "enemies take 1d6 damage, allies regain 1 HP" },
        { cha: 16, expect: "enemies take 1d6+3 damage, allies regain 4 HP" } ]

  "[RuneOfPeace] should be defined":
    Verify.testProperties "cleric", "RuneOfPeace",
      name: [ expect: "Rune of Peace" ]
      keywords: [ expect: [ "charm", "divine", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. Will" }, { str: 16, expect: "+3 vs. Will" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[SpiritualWeapon] should be defined":
    Verify.testProperties "cleric", "SpiritualWeapon",
      name: [ expect: "Spiritual Weapon" ]
      keywords: [ expect: [ "conjuration", "divine", "implement" ] ]
      attack: [ { wis: 10, expect: "+0 vs. AC" }, { wis: 16, expect: "+3 vs. AC" } ]
      hit: [
        { wis: 10, expect: "1d10 damage (special)" },
        { wis: 16, expect: "1d10+3 damage (special)" } ]

  "[WeaponOfTheGods] should be defined":
    Verify.testProperties "cleric", "WeaponOfTheGods",
      name: [ expect: "Weapon of the Gods" ]
      keywords: [ expect: [ "divine", "radiant", "weapon" ] ]

  "[BastionOfHealth] should be defined":
    Verify.testProperties "cleric", "BastionOfHealth",
      name: [ expect: "Bastion of Health" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "divine", "healing" ] ]
      effect: [
        { cha: 10, expect: "add +0 to the target's healing surge" },
        { cha: 16, expect: "add +3 to the target's healing surge" } ]

  "[CureSeriousWounds] should be defined":
    Verify.testProperties "cleric", "CureSeriousWounds",
      name: [ expect: "Cure Serious Wounds" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "healing" ] ]

  "[DivineVigor] should be defined":
    Verify.testProperties "cleric", "DivineVigor",
      name: [ expect: "Divine Vigor" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "healing" ] ]

  "[Holy Lantern] should be defined":
    Verify.testProperties "cleric", "HolyLantern",
      name: [ expect: "Holy Lantern" ]
      type: [ expect: "atWill" ]
      keywords: [ expect: [ "conjuration", "divine" ] ]

  "[AweStrike] should be defined":
    Verify.testProperties "cleric", "AweStrike",
      name: [ expect: "Awe Strike" ]
      keywords: [ expect: [ "divine", "fear", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. Will" }, { str: 16, expect: "+3 vs. Will" } ]
      hit: [
        { str: 10, expect: "1[W] damage (special)" },
        { str: 16, expect: "1[W]+3 damage (special)" } ]

  "[BreakTheSpirit] should be defined":
    Verify.testProperties "cleric", "BreakTheSpirit",
      name: [ expect: "Break the Spirit" ]
      keywords: [ expect: [ "charm", "divine", "implement", "radiant" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Will" }, { wis: 16, expect: "+3 vs. Will" } ]
      hit: [
        { wis: 10, cha: 10, expect: "2d8 damage, target takes +0 penalty to attack" },
        { wis: 16, cha: 10, expect: "2d8+3 damage, target takes +0 penalty to attack" },
        { wis: 10, cha: 14, expect: "2d8 damage, target takes -2 penalty to attack" },
        { wis: 16, cha: 14, expect: "2d8+3 damage, target takes -2 penalty to attack" } ]

  "[SearingLight] should be defined":
    Verify.testProperties "cleric", "SearingLight",
      name: [ expect: "Searing Light" ]
      keywords: [ expect: [ "divine", "implement", "radiant" ] ]
      attack: [ { wis: 10, expect: "+0 vs. Reflex" }, { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { wis: 10, expect: "2d6 damage (special)" },
        { wis: 16, expect: "2d6+3 damage (special)" } ]

  "[StrengthenTheFaithful] should be defined":
    Verify.testProperties "cleric", "StrengthenTheFaithful",
      name: [ expect: "Strengthen the Faithful" ]
      keywords: [ expect: [ "divine", "healing", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { str: 10, cha: 10, expect: "2[W] damage, adjacent allies can surge at +0" },
        { str: 16, cha: 10, expect: "2[W]+3 damage, adjacent allies can surge at +0" },
        { str: 10, cha: 14, expect: "2[W] damage, adjacent allies can surge at +2" },
        { str: 16, cha: 14, expect: "2[W]+3 damage, adjacent allies can surge at +2" } ]

  "[AstralDefenders] should be defined":
    Verify.testProperties "cleric", "AstralDefenders",
      name: [ expect: "Astral Defenders" ]
      keywords: [ expect: [ "conjuration", "divine", "implement", "radiant" ] ]
      attack: [
        { wis: 10, expect: "+0 vs. Reflex (special)" },
        { wis: 16, expect: "+3 vs. Reflex (special)" } ]
      hit: [
        { wis: 10, expect: "1d10 damage" },
        { wis: 16, expect: "1d10+3 damage" } ]

  "[BladeBarrier] should be defined":
    Verify.testProperties "cleric", "BladeBarrier",
      name: [ expect: "Blade Barrier" ]
      keywords: [ expect: [ "conjuration", "divine", "implement" ] ]
      effect: [
        { wis: 10, expect: "3d6 damage (special)" },
        { wis: 16, expect: "3d6+3 damage (special)" } ]

  "[DivinePower] should be defined":
    Verify.testProperties "cleric", "DivinePower",
      name: [ expect: "Divine Power" ]
      keywords: [ expect: [ "divine", "healing", "radiant", "weapon" ] ]
      attack: [
        { str: 10, expect: "+0 vs. Fortitude" },
        { str: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { str: 10, expect: "2[W] damage (special)" },
        { str: 16, expect: "2[W]+3 damage (special)" } ]

  "[FlameStrike] should be defined":
    Verify.testProperties "cleric", "FlameStrike",
      name: [ expect: "Flame Strike" ]
      keywords: [ expect: [ "divine", "fire", "implement" ] ]
      attack: [
        { wis: 10, expect: "+0 vs. Reflex" },
        { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { wis: 10, expect: "2d10 damage, ongoing 5 damage" },
        { wis: 16, expect: "2d10+3 damage, ongoing 8 damage" } ]

  "[AstralRefuge] should be defined":
    Verify.testProperties "cleric", "AstralRefuge",
      name: [ expect: "Astral Refuge" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "healing", "teleportation" ] ]

  "[KnightsOfUnyieldingValor] should be defined":
    Verify.testProperties "cleric", "KnightsOfUnyieldingValor",
      name: [ expect: "Knights of Unyielding Valor" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "conjuration", "divine" ] ]

  "[MassCureLightWounds] should be defined":
    Verify.testProperties "cleric", "MassCureLightWounds",
      name: [ expect: "Mass Cure Light Wounds" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "healing" ] ]
      effect: [
        { cha: 10, expect: "targets gain HP as if spending a surge, plus 0 HP" },
        { cha: 16, expect: "targets gain HP as if spending a surge, plus 3 HP" } ]

  "[ShieldingWord] should be defined":
    Verify.testProperties "cleric", "ShieldingWord",
      name: [ expect: "Shielding Word" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "divine" ] ]

  "[ArcOfTheRighteous] should be defined":
    Verify.testProperties "cleric", "ArcOfTheRighteous",
      name: [ expect: "Arc of the Righteous" ]
      keywords: [ expect: [ "divine", "lightning", "weapon" ] ]
      requires: { weapon: "melee" }

  "[InspiringStrike] should be defined":
    Verify.testProperties "cleric", "InspiringStrike",
      name: [ expect: "Inspiring Strike" ]
      keywords: [ expect: [ "divine", "healing", "weapon" ] ]
      requires: { weapon: "melee" }

  "[MantleOfGlory] should be defined":
    Verify.testProperties "cleric", "MantleOfGlory",
      name: [ expect: "Mantle of Glory" ]
      keywords: [ expect: [ "divine", "healing", "implement", "radiant" ] ]

  "[PlagueOfDoom] should be defined":
    Verify.testProperties "cleric", "PlagueOfDoom",
      name: [ expect: "Plague of Doom" ]
      keywords: [ expect: [ "divine", "implement" ] ]

  "[HolySpark] should be defined":
    Verify.testProperties "cleric", "HolySpark",
      name: [ expect: "Holy Spark" ]
      keywords: [ expect: [ "divine", "lightning", "weapon" ] ]
      requires: { weapon: "melee" }

  "[PurifyingFire] should be defined":
    Verify.testProperties "cleric", "PurifyingFire",
      name: [ expect: "Purifying Fire" ]
      keywords: [ expect: [ "divine", "fire", "healing", "implement" ] ]

  "[SealOfWarding] should be defined":
    Verify.testProperties "cleric", "SealOfWarding",
      name: [ expect: "Seal of Warding" ]
      keywords: [ expect: [ "divine", "implement", "radiant", "zone" ] ]
