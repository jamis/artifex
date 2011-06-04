{NPC, Powers} = require '../..'
{Verify}      = require '../helpers'

module.exports =
  "[ArmorOfBahamut] should be defined":
    Verify.testProperties "ArmorOfBahamut",
      name: [ expect: "Channel Divinity: Armor of Bahamut" ]

  "[AvandrasRescue] should be defined":
    Verify.testProperties "AvandrasRescue",
      name: [ expect: "Channel Divinity: Avandra's Rescue" ]

  "[HealingWord] should be defined":
    Verify.testProperties "HealingWord",
      name: [ expect: "Healing Word" ]
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

  "[TurnUndead] should be defined":
    Verify.testProperties "TurnUndead",
      name: [ expect: "Channel Divinity: Turn Undead" ]
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
    Verify.testProperties "LanceOfFaith",
      name: [ expect: "Lance of Faith" ]
      attack: [ { wis: 10, expect: "+0 vs. Reflex" }, { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, wis: 10, expect: "1d8 (special)" },
        { level:  1, wis: 16, expect: "1d8+3 (special)" },
        { level: 20, wis: 16, expect: "1d8+3 (special)" }
        { level: 21, wis: 16, expect: "2d8+3 (special)" } ]

  "[PriestsShield] should be defined":
    Verify.testProperties "PriestsShield",
      name: [ expect: "Priest's Shield" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] (special)" },
        { level:  1, str: 16, expect: "1[W]+3 (special)" },
        { level: 20, str: 16, expect: "1[W]+3 (special)" },
        { level: 21, str: 16, expect: "2[W]+3 (special)" } ]

  "[RighteousBrand] should be defined":
    Verify.testProperties "RighteousBrand",
      name: [ expect: "Righteous Brand" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, str: 10, expect: "1[W] (special)" },
        { level:  1, str: 16, expect: "1[W]+3 (special)" },
        { level: 20, str: 16, expect: "1[W]+3 (special)" },
        { level: 21, str: 16, expect: "2[W]+3 (special)" } ]

  "[SacredFlame] should be defined":
    Verify.testProperties "SacredFlame",
      name: [ expect: "Sacred Flame" ]
      attack: [ { wis: 10, expect: "+0 vs. Reflex" }, { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, wis: 10, expect: "1d6 (special)" },
        { level:  1, wis: 16, expect: "1d6+3 (special)" },
        { level: 20, wis: 16, expect: "1d6+3 (special)" },
        { level: 21, wis: 16, expect: "2d6+3 (special)" } ]

  "[CauseFear] should be defined":
    Verify.testProperties "CauseFear",
      name: [ expect: "Cause Fear" ]
      attack: [ { wis: 10, expect: "+0 vs. Will" }, { wis: 16, expect: "+3 vs. Will" } ]
      hit: [
        { cha: 10, expect: "target moves speed away from you" },
        { cha: 16, expect: "target moves speed+3 away from you" } ]

  "[DivineGlow] should be defined":
    Verify.testProperties "DivineGlow",
      name: [ expect: "Divine Glow" ]
      attack: [ { wis: 10, expect: "+0 vs. Reflex" }, { wis: 16, expect: "+3 vs. Reflex" } ]
      hit: [ { wis: 10, expect: "1d8 (special)" }, { wis: 16, expect: "1d8+3 (special)" } ]

  "[HealingStrike] should be defined":
    Verify.testProperties "HealingStrike",
      name: [ expect: "Healing Strike" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "2[W] (special)" }, { str: 16, expect: "2[W]+3 (special)" } ]

  "[WrathfulThunder] should be defined":
    Verify.testProperties "WrathfulThunder",
      name: [ expect: "Wrathful Thunder" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "1[W] (special)" }, { str: 16, expect: "1[W]+3 (special)" } ]

  "[AvengingFlame] should be defined":
    Verify.testProperties "AvengingFlame",
      name: [ expect: "Avenging Flame" ]
      attack: [ { str: 10, expect: "+0 vs. AC" }, { str: 16, expect: "+3 vs. AC" } ]
      hit: [ { str: 10, expect: "2[W] (special)" }, { str: 16, expect: "2[W]+3 (special)" } ]

  "[BeaconOfHope] should be defined":
    Verify.testProperties "BeaconOfHope",
      name: [ expect: "Beacon of Hope" ]
      attack: [ { wis: 10, expect: "+0 vs. Will" }, { wis: 16, expect: "+3 vs. Will" } ]

  "[CascadeOfLight] should be defined":
    Verify.testProperties "CascadeOfLight",
      name: [ expect: "Cascade of Light" ]
      attack: [ { wis: 10, expect: "+0 vs. Will" }, { wis: 16, expect: "+3 vs. Will" } ]
      hit: [ { wis: 10, expect: "3d8 (special)" }, { wis: 16, expect: "3d8+3 (special)" } ]

  "[GuardianOfFaith] should be defined":
    Verify.testProperties "GuardianOfFaith",
      name: [ expect: "Guardian of Faith" ]
      attack: [
        { wis: 10, expect: "+0 vs. Fort (special)" },
        { wis: 16, expect: "+3 vs. Fort (special)" } ]
      hit: [ { wis: 10, expect: "1d8" }, { wis: 16, expect: "1d8+3" } ]
