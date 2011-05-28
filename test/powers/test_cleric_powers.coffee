{NPC, Powers} = require '../..'
{Verify}      = require '../helpers'

module.exports =
  "[ArmorOfBahamut] name should be set":
    Verify.testProperty "ArmorOfBahamut", "name", expect: "Channel Divinity: Armor of Bahamut"

  "[AvandrasRescue] name should be set":
    Verify.testProperty "AvandrasRescue", "name", expect: "Channel Divinity: Avandra's Rescue"

  "[HealingWord] should have correct name":
    Verify.testProperty "HealingWord", "name", expect: "Healing Word"
    
  "[HealingWord] frequency should depend on NPC level":
    Verify.testProperty "HealingWord", "frequency",
      { level: 1, expect: 2 }, { level: 15, expect: 2 }, { level: 16, expect: 3 }

  "[HealingWord] effect should depend on NPC level":
    Verify.testProperty "HealingWord", "effect",
      { level:  1, expect: "surge+1d6" },
      { level:  6, expect: "surge+2d6" },
      { level: 11, expect: "surge+3d6" },
      { level: 16, expect: "surge+4d6" },
      { level: 21, expect: "surge+5d6" },
      { level: 26, expect: "surge+6d6" }

  "[HealingWord] range should depend on NPC level":
    Verify.testProperty "HealingWord", "range",
      { level:  1, expect: "Close burst 5" },
      { level: 11, expect: "Close burst 10" },
      { level: 21, expect: "Close burst 15" }

  "[TurnUndead] name should be set":
    Verify.testProperty "TurnUndead", "name", expect: "Channel Divinity: Turn Undead"

  "[TurnUndead] range should depend on level":
    Verify.testProperty "TurnUndead", "range",
      { level:  1, expect: "Close burst 2" },
      { level: 11, expect: "Close burst 5" },
      { level: 21, expect: "Close burst 8" }

  "[TurnUndead] attack should depend on wisdom":
    Verify.testProperty "TurnUndead", "attack",
      { wis: 10, expect: "+0 vs. Will" },
      { wis: 16, expect: "+3 vs. Will" }

  "[TurnUndead] hit should depend on level, wisdom, charisma":
    Verify.testProperty "TurnUndead", "hit",
      { wis: 10, cha: 10, level:  1, expect: "1d10, push 3 (special)"     },
      { wis: 16, cha: 10, level:  1, expect: "1d10+3, push 3 (special)"   },
      { wis: 16, cha: 16, level:  1, expect: "1d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level:  5, expect: "2d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level: 11, expect: "3d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level: 15, expect: "4d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level: 21, expect: "5d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level: 25, expect: "6d10+3, push 3+3 (special)" }

  "[LanceOfFaith] name should be set":
    Verify.testProperty "LanceOfFaith", "name", expect: "Lance of Faith"

  "[LanceOfFaith] attack should depend on wisdom":
    Verify.testProperty "LanceOfFaith", "attack",
      { wis: 10, expect: "+0 vs. Reflex" },
      { wis: 16, expect: "+3 vs. Reflex" }

  "[LanceOfFaith] hit should depend on level and wisdom":
    Verify.testProperty "LanceOfFaith", "hit",
      { level:  1, wis: 10, expect: "1d8 (special)" },
      { level:  1, wis: 16, expect: "1d8+3 (special)" },
      { level: 20, wis: 16, expect: "1d8+3 (special)" }
      { level: 21, wis: 16, expect: "2d8+3 (special)" }

  "[PriestsShield] name should be set":
    Verify.testProperty "PriestsShield", "name", expect: "Priest's Shield"

  "[PriestsShield] attack should depend on strength":
    Verify.testProperty "PriestsShield", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[PriestsShield] hit should depend on level and strength":
    Verify.testProperty "PriestsShield", "hit",
      { level:  1, str: 10, expect: "1[W] (special)" },
      { level:  1, str: 16, expect: "1[W]+3 (special)" },
      { level: 20, str: 16, expect: "1[W]+3 (special)" },
      { level: 21, str: 16, expect: "2[W]+3 (special)" }

  "[RighteousBrand] name should be set":
    Verify.testProperty "RighteousBrand", "name", expect: "Righteous Brand"

  "[RighteousBrand] attack should depend on strength":
    Verify.testProperty "RighteousBrand", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[RighteousBrand] hit should depend on level and strength":
    Verify.testProperty "RighteousBrand", "hit",
      { level:  1, str: 10, expect: "1[W] (special)" },
      { level:  1, str: 16, expect: "1[W]+3 (special)" },
      { level: 20, str: 16, expect: "1[W]+3 (special)" },
      { level: 21, str: 16, expect: "2[W]+3 (special)" }

  "[SacredFlame] name should be set":
    Verify.testProperty "SacredFlame", "name", expect: "Sacred Flame"

  "[SacredFlame] attack should depend on wisdom":
    Verify.testProperty "SacredFlame", "attack",
      { wis: 10, expect: "+0 vs. Reflex" },
      { wis: 16, expect: "+3 vs. Reflex" }

  "[SacredFlame] hit should depend on level and wisdom":
    Verify.testProperty "SacredFlame", "hit",
      { level:  1, wis: 10, expect: "1d6 (special)" },
      { level:  1, wis: 16, expect: "1d6+3 (special)" },
      { level: 20, wis: 16, expect: "1d6+3 (special)" },
      { level: 21, wis: 16, expect: "2d6+3 (special)" }

  "[CauseFear] name should be set":
    Verify.testProperty "CauseFear", "name", expect: "Cause Fear"

  "[CauseFear] attack should depend on wisdom":
    Verify.testProperty "CauseFear", "attack",
      { wis: 10, expect: "+0 vs. Will" },
      { wis: 16, expect: "+3 vs. Will" }

  "[CauseFear] hit should depend on charisma":
    Verify.testProperty "CauseFear", "hit",
      { cha: 10, expect: "target moves speed away from you" },
      { cha: 16, expect: "target moves speed+3 away from you" }

  "[DivineGlow] name should be set":
    Verify.testProperty "DivineGlow", "name", expect: "Divine Glow"

  "[DivineGlow] attack should depend on wisdom":
    Verify.testProperty "DivineGlow", "attack",
      { wis: 10, expect: "+0 vs. Reflex" },
      { wis: 16, expect: "+3 vs. Reflex" }

  "[DivineGlow] hit should depend on wisdom":
    Verify.testProperty "DivineGlow", "hit",
      { wis: 10, expect: "1d8 (special)" },
      { wis: 16, expect: "1d8+3 (special)" }

  "[HealingStrike] name should be set":
    Verify.testProperty "HealingStrike", "name", expect: "Healing Strike"

  "[HealingStrike] attack should depend on strength":
    Verify.testProperty "HealingStrike", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[HealingStrike] hit should depend on strength":
    Verify.testProperty "HealingStrike", "hit",
      { str: 10, expect: "2[W] (special)" },
      { str: 16, expect: "2[W]+3 (special)" }

  "[WrathfulThunder] name should be set":
    Verify.testProperty "WrathfulThunder", "name", expect: "Wrathful Thunder"

  "[WrathfulThunder] attack should depend on strength":
    Verify.testProperty "WrathfulThunder", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[WrathfulThunder] hit should depend on strength":
    Verify.testProperty "WrathfulThunder", "hit",
      { str: 10, expect: "1[W] (special)" },
      { str: 16, expect: "1[W]+3 (special)" }

  "[AvengingFlame] name should be set":
    Verify.testProperty "AvengingFlame", "name", expect: "Avenging Flame"

  "[AvengingFlame] attack should depend on strength":
    Verify.testProperty "AvengingFlame", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[AvengingFlame] hit should depend on strength":
    Verify.testProperty "AvengingFlame", "hit",
      { str: 10, expect: "2[W] (special)" },
      { str: 16, expect: "2[W]+3 (special)" }

  "[BeaconOfHope] name should be set":
    Verify.testProperty "BeaconOfHope", "name", expect: "Beacon of Hope"

  "[BeaconOfHope] attack should depend on wisdom":
    Verify.testProperty "BeaconOfHope", "attack",
      { wis: 10, expect: "+0 vs. Will" },
      { wis: 16, expect: "+3 vs. Will" }

  "[CascadeOfLight] name should be set":
    Verify.testProperty "CascadeOfLight", "name", expect: "Cascade of Light"

  "[CascadeOfLight] attack should depend on wisdom":
    Verify.testProperty "CascadeOfLight", "attack",
      { wis: 10, expect: "+0 vs. Will" },
      { wis: 16, expect: "+3 vs. Will" }

  "[CascadeOfLight] hit should depend on wis":
    Verify.testProperty "CascadeOfLight", "hit",
      { wis: 10, expect: "3d8 (special)" },
      { wis: 16, expect: "3d8+3 (special)" }

  "[GuardianOfFaith] name should be set":
    Verify.testProperty "GuardianOfFaith", "name", expect: "Guardian of Faith"

  "[GuardianOfFaith] attack should depend on wisdom":
    Verify.testProperty "GuardianOfFaith", "attack",
      { wis: 10, expect: "+0 vs. Fort (special)" },
      { wis: 16, expect: "+3 vs. Fort (special)" }

  "[GuardianOfFaith] hit should depend on wis":
    Verify.testProperty "GuardianOfFaith", "hit",
      { wis: 10, expect: "1d8" },
      { wis: 16, expect: "1d8+3" }
