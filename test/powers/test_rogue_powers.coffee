{Attribute} = require '../..'
{Verify} = require '../helpers'

sneakAttack = (die, adjust) ->
  (power) =>
    power.npc.attacks.sneakAttack ||= new Attribute 0
    power.npc.attacks.sneakAttack.damageDie = die
    power.npc.attacks.sneakAttack.adjust adjust

artfulDodger = (power) -> power.npc.feature "class", "Artful Dodger"
brutalScoundrel = (power) -> power.npc.feature "class", "Brutal Scoundrel"
  
module.exports =
  "[SneakAttack] should be defined":
    Verify.testProperties "SneakAttack",
      name: [ expect: "Sneak Attack" ]
      hit: [
        { level:  1, expect: "+2d6 damage" },
        { level:  1, when: sneakAttack(8, 0), expect: "+2d8 damage" },
        { level:  1, when: sneakAttack(6, 4), expect: "+2d6+4 damage" },
        { level: 11, expect: "+3d6 damage" },
        { level: 21, expect: "+5d6 damage" } ]

  "[DeftStrike] should be defined":
    Verify.testProperties "DeftStrike",
      name: [ expect: "Deft Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, dex: 10, expect: "1[W] damage" },
        { level:  1, dex: 16, expect: "1[W]+3 damage" },
        { level: 21, dex: 16, expect: "2[W]+3 damage" } ]

  "[PiercingStrike] should be defined":
    Verify.testProperties "PiercingStrike",
      name: [ expect: "Piercing Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. Reflex" }, { dex: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { level:  1, dex: 10, expect: "1[W] damage" },
        { level:  1, dex: 16, expect: "1[W]+3 damage" },
        { level: 21, dex: 16, expect: "2[W]+3 damage" } ]

  "[RiposteStrike] should be defined":
    Verify.testProperties "RiposteStrike",
      name: [ expect: "Riposte Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [
        { dex: 10, str: 10, expect: "+0 vs. AC (special, riposte +0 vs. AC)" },
        { dex: 10, str: 16, expect: "+0 vs. AC (special, riposte +3 vs. AC)" },
        { dex: 16, str: 10, expect: "+3 vs. AC (special, riposte +0 vs. AC)" },
        { dex: 16, str: 16, expect: "+3 vs. AC (special, riposte +3 vs. AC)" } ]
      hit: [
        { level:  1, dex: 10, str: 10, expect: "1[W] damage (special, riposte 1[W] damage)" },
        { level:  1, dex: 16, str: 10, expect: "1[W]+3 damage (special, riposte 1[W] damage)" },
        { level:  1, dex: 10, str: 16, expect: "1[W] damage (special, riposte 1[W]+3 damage)" },
        { level:  1, dex: 16, str: 16, expect: "1[W]+3 damage (special, riposte 1[W]+3 damage)" },
        { level: 21, dex: 16, str: 16, expect: "2[W]+3 damage (special, riposte 2[W]+3 damage)" } ]

  "[SlyFlourish] should be defined":
    Verify.testProperties "SlyFlourish",
      name: [ expect: "Sly Flourish" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { level:  1, dex: 10, cha: 10, expect: "1[W] damage" },
        { level:  1, dex: 16, cha: 10, expect: "1[W]+3 damage" },
        { level:  1, dex: 10, cha: 14, expect: "1[W]+2 damage" },
        { level:  1, dex: 16, cha: 14, expect: "1[W]+5 damage" },
        { level: 21, dex: 16, cha: 14, expect: "2[W]+5 damage" } ]

  "[DazingStrike] should be defined":
    Verify.testProperties "DazingStrike",
      name: [ expect: "Dazing Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, expect: "1[W] damage (special)" },
        { dex: 16, expect: "1[W]+3 damage (special)" } ]

  "[KingsCastle] should be defined":
    Verify.testProperties "KingsCastle",
      name: [ expect: "King's Castle" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. Reflex" }, { dex: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { dex: 10, expect: "2[W] damage (special)" },
        { dex: 16, expect: "2[W]+3 damage (special)" } ]

  "[PositioningStrike] should be defined":
    Verify.testProperties "PositioningStrike",
      name: [ expect: "Positioning Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. Will" }, { dex: 16, expect: "+3 vs. Will" } ]
      hit: [
        { dex: 10, cha: 10, expect: "1[W] damage, slide target 1 square" },
        { dex: 10, cha: 16, expect: "1[W] damage, slide target 1 square" },
        { dex: 10, cha: 16, when: artfulDodger, expect: "1[W] damage, slide target 3 squares" },
        { dex: 10, cha:  8, when: artfulDodger, expect: "1[W] damage, slide target 1 square" },
        { dex: 14, cha: 16, when: artfulDodger, expect: "1[W]+2 damage, slide target 3 squares" } ]

  "[TorturousStrike] should be defined":
    Verify.testProperties "TorturousStrike",
      name: [ expect: "Torturous Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, str: 10, expect: "2[W] damage" },
        { dex: 14, str: 10, expect: "2[W]+2 damage" },
        { dex: 14, str: 16, expect: "2[W]+2 damage" },
        { dex: 10, str: 16, when: brutalScoundrel, expect: "2[W]+3 damage" },
        { dex: 14, str: 16, when: brutalScoundrel, expect: "2[W]+5 damage" } ]

  "[BlindingBarrage] should be defined":
    Verify.testProperties "BlindingBarrage",
      name: [ expect: "Blinding Barrage" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, expect: "2[W] damage (special)" },
        { dex: 16, expect: "2[W]+3 damage (special)" } ]

  "[EasyTarget] should be defined":
    Verify.testProperties "EasyTarget",
      name: [ expect: "Easy Target" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, expect: "2[W] damage (special)" },
        { dex: 16, expect: "2[W]+3 damage (special)" } ]

  "[TrickStrike] should be defined":
    Verify.testProperties "TrickStrike",
      name: [ expect: "Trick Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, expect: "3[W] damage (special)" },
        { dex: 16, expect: "3[W]+3 damage (special)" } ]

  "[FleetingGhost] should be defined":
    Verify.testProperties "FleetingGhost",
      name: [ expect: "Fleeting Ghost" ]
      type: [ expect: "atWill" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "stealth" } ]

  "[GreatLeap] should be defined":
    Verify.testProperties "GreatLeap",
      name: [ expect: "Great Leap" ]
      type: [ expect: "atWill" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "athletics" } ]

  "[MasterOfDeceit] should be defined":
    Verify.testProperties "MasterOfDeceit",
      name: [ expect: "Master of Deceit" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "bluff" } ]

  "[QuickFingers] should be defined":
    Verify.testProperties "QuickFingers",
      name: [ expect: "Quick Fingers" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "thievery" } ]

  "[Tumble] should be defined":
    Verify.testProperties "Tumble",
      name: [ expect: "Tumble" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "acrobatics" } ]

  "[BaitAndSwitch] should be defined":
    Verify.testProperties "BaitAndSwitch",
      name: [ expect: "Bait and Switch" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [ { dex: 10, expect: "+0 vs. Will" }, { dex: 16, expect: "+3 vs. Will" } ]
      hit: [
        { dex: 10, cha: 14, expect: "2[W] damage, shift 1 square (special)" },
        { dex: 16, cha: 14, expect: "2[W]+3 damage, shift 1 square (special)" },
        { dex: 16, cha: 14, when: artfulDodger, expect: "2[W]+3 damage, shift 2 squares (special)" } ]

  "[SetupStrike] should be defined":
    Verify.testProperties "SetupStrike",
      name: [ expect: "Setup Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, expect: "2[W] damage (special)" },
        { dex: 16, expect: "2[W]+3 damage (special)" } ]

  "[ToppleOver] should be defined":
    Verify.testProperties "ToppleOver",
      name: [ expect: "Topple Over" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [
        { dex: 10, str: 14, expect: "+0 vs. AC" },
        { dex: 16, str: 14, expect: "+3 vs. AC" },
        { dex: 16, str: 14, when: brutalScoundrel, expect: "+5 vs. AC" } ]
      hit: [
        { dex: 10, expect: "1[W] damage (special)" },
        { dex: 16, expect: "1[W]+3 damage (special)" } ]

  "[TrickstersBlade] should be defined":
    Verify.testProperties "TrickstersBlade",
      name: [ expect: "Trickster's Blade" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, cha: 10, expect: "2[W] damage, +0 AC bonus" },
        { dex: 16, cha: 10, expect: "2[W]+3 damage, +0 AC bonus" },
        { dex: 16, cha: 14, expect: "2[W]+3 damage, +2 AC bonus" } ]

  "[CleverRiposte] should be defined":
    Verify.testProperties "CleverRiposte",
      name: [ expect: "Clever Riposte" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [ { dex: 10, expect: "+0 vs. AC" }, { dex: 16, expect: "+3 vs. AC" } ]
      hit: [ { dex: 10, expect: "2[W] damage" }, { dex: 16, expect: "2[W]+3 damage" } ]
      effect: [
        { dex: 10, expect: "target takes 0 damage on attack" },
        { dex: 16, expect: "target takes 3 damage on attack" } ]

  "[DeepCut] should be defined":
    Verify.testProperties "DeepCut",
      name: [ expect: "Deep Cut" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [
        { dex: 10, expect: "+0 vs. Fortitude" },
        { dex: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { dex: 10, str: 10, expect: "2[W] damage, ongoing 5" },
        { dex: 16, str: 14, expect: "2[W]+3 damage, ongoing 7" } ]

  "[WalkingWounded] should be defined":
    Verify.testProperties "WalkingWounded",
      name: [ expect: "Walking Wounded" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [
        { dex: 10, expect: "+0 vs. Fortitude" },
        { dex: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { dex: 10, expect: "2[W] damage (special)" },
        { dex: 16, expect: "2[W]+3 damage (special)" } ]

  "[Chameleon] should be defined":
    Verify.testProperties "Chameleon",
      name: [ expect: "Chameleon" ]
      type: [ expect: "atWill" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "stealth" } ]

  "[IgnobleEscape] should be defined":
    Verify.testProperties "IgnobleEscape",
      name: [ expect: "Ignoble Escape" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "acrobatics" } ]

  "[MobMentality] should be defined":
    Verify.testProperties "MobMentality",
      name: [ expect: "Mob Mentality" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "intimidate" } ]

  "[NimbleClimb] should be defined":
    Verify.testProperties "NimbleClimb",
      name: [ expect: "Nimble Climb" ]
      type: [ expect: "atWill" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "athletics" } ]

  "[SlipperyMind] should be defined":
    Verify.testProperties "SlipperyMind",
      name: [ expect: "Slippery Mind" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "bluff" } ]

  "[CloudOfSteel] should be defined":
    Verify.testProperties "CloudOfSteel",
      name: [ expect: "Cloud of Steel" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [
        { dex: 10, expect: "+0 vs. AC" },
        { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, expect: "1[W] damage" },
        { dex: 16, expect: "1[W]+3 damage" } ]

  "[ImperilingStrike] should be defined":
    Verify.testProperties "ImperilingStrike",
      name: [ expect: "Imperiling Strike" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [
        { dex: 10, expect: "+0 vs. Fortitude" },
        { dex: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { dex: 10, str: 14, expect: "1[W] damage, target takes -1 to AC and Reflex" },
        { dex: 16, str: 14, expect: "1[W]+3 damage, target takes -1 to AC and Reflex" },
        { dex: 16, str: 14, when: brutalScoundrel, expect: "1[W]+3 damage, target takes -2 to AC and Reflex" } ]

  "[RoguesLuck] should be defined":
    Verify.testProperties "RoguesLuck",
      name: [ expect: "Rogue's Luck" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attack: [
        { dex: 10, expect: "+0 vs. AC" },
        { dex: 16, expect: "+3 vs. AC" } ]
      hit: [
        { dex: 10, expect: "2[W] damage" },
        { dex: 16, expect: "2[W]+3 damage" } ]
      miss: [
        { dex: 10, cha: 10, expect: "secondary attack at +0 vs. AC for 1[W] damage" },
        { dex: 16, cha: 10, expect: "secondary attack at +3 vs. AC for 1[W]+3 damage" },
        { dex: 16, cha: 14, expect: "secondary attack at +3 vs. AC for 1[W]+3 damage" },
        { dex: 16, cha: 14, when: artfulDodger, expect: "secondary attack at +5 vs. AC for 1[W]+3 damage" } ]

  "[SandInTheEyes] should be defined":
    Verify.testProperties "SandInTheEyes",
      name: [ expect: "Sand in the Eyes" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [
        { dex: 10, expect: "+0 vs. Reflex" },
        { dex: 16, expect: "+3 vs. Reflex" } ]
      hit: [
        { dex: 10, expect: "1[W] damage (special)" },
        { dex: 16, expect: "1[W]+3 damage (special)" } ]

  "[CrimsonEdge] should be defined":
    Verify.testProperties "CrimsonEdge",
      name: [ expect: "Crimson Edge" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [
        { dex: 10, expect: "+0 vs. Fortitude" },
        { dex: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { dex: 10, str: 10, expect: "2[W] damage, ongoing 5 (special)" },
        { dex: 16, str: 10, expect: "2[W]+3 damage, ongoing 5 (special)" },
        { dex: 16, str: 14, expect: "2[W]+3 damage, ongoing 7 (special)" } ]

  "[DeadlyPositioning] should be defined":
    Verify.testProperties "DeadlyPositioning",
      name: [ expect: "Deadly Positioning" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [
        { dex: 10, expect: "+0 vs. AC (special)" },
        { dex: 16, expect: "+3 vs. AC (special)" } ]
      hit: [
        { dex: 10, expect: "3[W] damage" },
        { dex: 16, expect: "3[W]+3 damage" } ]

  "[Knockout] should be defined":
    Verify.testProperties "Knockout",
      name: [ expect: "Knockout" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      attackTypes: [ expect: [ "melee weapon" ] ]
      requires: [ expect: { weapon: "light blade" } ]
      attack: [
        { dex: 10, expect: "+0 vs. Fortitude" },
        { dex: 16, expect: "+3 vs. Fortitude" } ]
      hit: [
        { dex: 10, expect: "2[W] damage (special)" },
        { dex: 16, expect: "2[W]+3 damage (special)" } ]

  "[CertainFreedom] should be defined":
    Verify.testProperties "CertainFreedom",
      name: [ expect: "Certain Freedom" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "acrobatics" } ]

  "[CloseQuarters] should be defined":
    Verify.testProperties "CloseQuarters",
      name: [ expect: "Close Quarters" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "acrobatics" } ]

  "[DangerousTheft] should be defined":
    Verify.testProperties "DangerousTheft",
      name: [ expect: "Dangerous Theft" ]
      type: [ expect: "encounter" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "thievery" } ]

  "[ShadowStride] should be defined":
    Verify.testProperties "ShadowStride",
      name: [ expect: "Shadow Stride" ]
      type: [ expect: "atWill" ]
      keywords: [ expect: [ "martial" ] ]
      requires: [ expect: { trained: "stealth" } ]
