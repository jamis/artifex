{NPC, Powers} = require '../..'

verifyProperty = (id, property, tests...) ->
  (test) ->
    power = Powers.get id, npc: new NPC
    for conditions in tests
      expect = undefined
      for attribute, value of conditions
        switch attribute
          when "str", "con", "dex", "int", "wis", "cha"
            power.npc.abilities[attribute].baseValue = value
          when "expect"
            expect = value
          else
            power.npc[attribute] = value
      actual = power.get(property)
      test.equal actual, expect, "expected `#{property}' to be `#{expect}', was `#{actual}'"
    test.done()

module.exports =
  "[ArmorOfBahamut] name should be set":
    verifyProperty "ArmorOfBahamut", "name", expect: "Channel Divinity: Armor of Bahamut"

  "[HealingWord] should have correct name":
    verifyProperty "HealingWord", "name", expect: "Healing Word"
    
  "[HealingWord] frequency should depend on NPC level":
    verifyProperty "HealingWord", "frequency",
      { level: 1, expect: 2 }, { level: 15, expect: 2 }, { level: 16, expect: 3 }

  "[HealingWord] effect should depend on NPC level":
    verifyProperty "HealingWord", "effect",
      { level:  1, expect: "surge+1d6" },
      { level:  6, expect: "surge+2d6" },
      { level: 11, expect: "surge+3d6" },
      { level: 16, expect: "surge+4d6" },
      { level: 21, expect: "surge+5d6" },
      { level: 26, expect: "surge+6d6" }

  "[HealingWord] range should depend on NPC level":
    verifyProperty "HealingWord", "range",
      { level:  1, expect: "Close burst 5" },
      { level: 11, expect: "Close burst 10" },
      { level: 21, expect: "Close burst 15" }

  "[TurnUndead] name should be set":
    verifyProperty "TurnUndead", "name", expect: "Channel Divinity: Turn Undead"

  "[TurnUndead] range should depend on level":
    verifyProperty "TurnUndead", "range",
      { level:  1, expect: "Close burst 2" },
      { level: 11, expect: "Close burst 5" },
      { level: 21, expect: "Close burst 8" }

  "[TurnUndead] attack should depend on wisdom":
    verifyProperty "TurnUndead", "attack",
      { wis: 10, expect: "+0 vs. Will" },
      { wis: 16, expect: "+3 vs. Will" }

  "[TurnUndead] hit should depend on level, wisdom, charisma":
    verifyProperty "TurnUndead", "hit",
      { wis: 10, cha: 10, level:  1, expect: "1d10, push 3 (special)"     },
      { wis: 16, cha: 10, level:  1, expect: "1d10+3, push 3 (special)"   },
      { wis: 16, cha: 16, level:  1, expect: "1d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level:  5, expect: "2d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level: 11, expect: "3d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level: 15, expect: "4d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level: 21, expect: "5d10+3, push 3+3 (special)" },
      { wis: 16, cha: 16, level: 25, expect: "6d10+3, push 3+3 (special)" }

  "[LanceOfFaith] name should be set":
    verifyProperty "LanceOfFaith", "name", expect: "Lance of Faith"

  "[LanceOfFaith] attack should depend on wisdom":
    verifyProperty "LanceOfFaith", "attack",
      { wis: 10, expect: "+0 vs. Reflex" },
      { wis: 16, expect: "+3 vs. Reflex" }

  "[LanceOfFaith] hit should depend on level and wisdom":
    verifyProperty "LanceOfFaith", "hit",
      { level:  1, wis: 10, expect: "1d8 (special)" },
      { level:  1, wis: 16, expect: "1d8+3 (special)" },
      { level: 20, wis: 16, expect: "1d8+3 (special)" }
      { level: 21, wis: 16, expect: "2d8+3 (special)" }

  "[PriestsShield] name should be set":
    verifyProperty "PriestsShield", "name", expect: "Priest's Shield"

  "[PriestsShield] attack should depend on strength":
    verifyProperty "PriestsShield", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[PriestsShield] hit should depend on level and strength":
    verifyProperty "PriestsShield", "hit",
      { level:  1, str: 10, expect: "1[W] (special)" },
      { level:  1, str: 16, expect: "1[W]+3 (special)" },
      { level: 20, str: 16, expect: "1[W]+3 (special)" },
      { level: 21, str: 16, expect: "2[W]+3 (special)" }

  "[RighteousBrand] name should be set":
    verifyProperty "RighteousBrand", "name", expect: "Righteous Brand"

  "[RighteousBrand] attack should depend on strength":
    verifyProperty "RighteousBrand", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[RighteousBrand] hit should depend on level and strength":
    verifyProperty "RighteousBrand", "hit",
      { level:  1, str: 10, expect: "1[W] (special)" },
      { level:  1, str: 16, expect: "1[W]+3 (special)" },
      { level: 20, str: 16, expect: "1[W]+3 (special)" },
      { level: 21, str: 16, expect: "2[W]+3 (special)" }

  "[SacredFlame] name should be set":
    verifyProperty "SacredFlame", "name", expect: "Sacred Flame"

  "[SacredFlame] attack should depend on wisdom":
    verifyProperty "SacredFlame", "attack",
      { wis: 10, expect: "+0 vs. Reflex" },
      { wis: 16, expect: "+3 vs. Reflex" }

  "[SacredFlame] hit should depend on level and wisdom":
    verifyProperty "SacredFlame", "hit",
      { level:  1, wis: 10, expect: "1d6 (special)" },
      { level:  1, wis: 16, expect: "1d6+3 (special)" },
      { level: 20, wis: 16, expect: "1d6+3 (special)" },
      { level: 21, wis: 16, expect: "2d6+3 (special)" }

  "[CauseFear] name should be set":
    verifyProperty "CauseFear", "name", expect: "Cause Fear"

  "[CauseFear] attack should depend on wisdom":
    verifyProperty "CauseFear", "attack",
      { wis: 10, expect: "+0 vs. Will" },
      { wis: 16, expect: "+3 vs. Will" }

  "[CauseFear] hit should depend on charisma":
    verifyProperty "CauseFear", "hit",
      { cha: 10, expect: "target moves speed away from you" },
      { cha: 16, expect: "target moves speed+3 away from you" }

  "[DivineGlow] name should be set":
    verifyProperty "DivineGlow", "name", expect: "Divine Glow"

  "[DivineGlow] attack should depend on wisdom":
    verifyProperty "DivineGlow", "attack",
      { wis: 10, expect: "+0 vs. Reflex" },
      { wis: 16, expect: "+3 vs. Reflex" }

  "[DivineGlow] hit should depend on wisdom":
    verifyProperty "DivineGlow", "hit",
      { wis: 10, expect: "1d8 (special)" },
      { wis: 16, expect: "1d8+3 (special)" }

  "[HealingStrike] name should be set":
    verifyProperty "HealingStrike", "name", expect: "Healing Strike"

  "[HealingStrike] attack should depend on strength":
    verifyProperty "HealingStrike", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[HealingStrike] hit should depend on strength":
    verifyProperty "HealingStrike", "hit",
      { str: 10, expect: "2[W] (special)" },
      { str: 16, expect: "2[W]+3 (special)" }

  "[WrathfulThunder] name should be set":
    verifyProperty "WrathfulThunder", "name", expect: "Wrathful Thunder"

  "[WrathfulThunder] attack should depend on strength":
    verifyProperty "WrathfulThunder", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[WrathfulThunder] hit should depend on strength":
    verifyProperty "WrathfulThunder", "hit",
      { str: 10, expect: "1[W] (special)" },
      { str: 16, expect: "1[W]+3 (special)" }

  "[AvengingFlame] name should be set":
    verifyProperty "AvengingFlame", "name", expect: "Avenging Flame"

  "[AvengingFlame] attack should depend on strength":
    verifyProperty "AvengingFlame", "attack",
      { str: 10, expect: "+0 vs. AC" },
      { str: 16, expect: "+3 vs. AC" }

  "[AvengingFlame] hit should depend on strength":
    verifyProperty "AvengingFlame", "hit",
      { str: 10, expect: "2[W] (special)" },
      { str: 16, expect: "2[W]+3 (special)" }

  "[BeaconOfHope] name should be set":
    verifyProperty "BeaconOfHope", "name", expect: "Beacon of Hope"

  "[BeaconOfHope] attack should depend on wisdom":
    verifyProperty "BeaconOfHope", "attack",
      { wis: 10, expect: "+0 vs. Will" },
      { wis: 16, expect: "+3 vs. Will" }

  "[CascadeOfLight] name should be set":
    verifyProperty "CascadeOfLight", "name", expect: "Cascade of Light"

  "[CascadeOfLight] attack should depend on wisdom":
    verifyProperty "CascadeOfLight", "attack",
      { wis: 10, expect: "+0 vs. Will" },
      { wis: 16, expect: "+3 vs. Will" }

  "[CascadeOfLight] hit should depend on wis":
    verifyProperty "CascadeOfLight", "hit",
      { wis: 10, expect: "3d8 (special)" },
      { wis: 16, expect: "3d8+3 (special)" }

  "[GuardianOfFaith] name should be set":
    verifyProperty "GuardianOfFaith", "name", expect: "Guardian of Faith"

  "[GuardianOfFaith] attack should depend on wisdom":
    verifyProperty "GuardianOfFaith", "attack",
      { wis: 10, expect: "+0 vs. Fort (special)" },
      { wis: 16, expect: "+3 vs. Fort (special)" }

  "[GuardianOfFaith] hit should depend on wis":
    verifyProperty "GuardianOfFaith", "hit",
      { wis: 10, expect: "1d8" },
      { wis: 16, expect: "1d8+3" }
