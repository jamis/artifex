{Verify} = require '../helpers'

attrBonusIs = (attr, bonus) ->
  (power) -> power[attr].adjust bonus

breathIs = (definition) ->
  (power) -> power.npc.breath = definition

module.exports =
  "[DragonBreath] should be defined":
    Verify.testProperties "DragonBreath",
      name: [
        { when: breathIs(type: "poison"), expect: "Dragon Breath (poison)" },
        { when: breathIs(type: "cold"), expect: "Dragon Breath (cold)" } ]
      keywords: [
        { when: breathIs(type: "poison"), expect: [ "poison" ] },
        { when: breathIs(type: "acid"), expect: [ "acid" ] } ]
      attackTypes: [
        { when: breathIs(range: 3), expect: [ "Close burst 3" ] },
        { when: breathIs(range: 7), expect: [ "Close burst 7" ] } ]
      ability: [
        { when: breathIs(ability: "dex"), expect: "dex" },
        { when: breathIs(ability: "con"), expect: "con" } ]
      attack: [
        { when: breathIs(ability: "dex"), dex: 10, level:  1, expect: "+2 vs. Reflex" },
        { when: breathIs(ability: "dex"), dex: 16, level:  1, expect: "+5 vs. Reflex" },
        { when: breathIs(ability: "con"), dex: 16, level:  1, expect: "+2 vs. Reflex" },
        { when: breathIs(ability: "con"), con: 16, level:  1, expect: "+5 vs. Reflex" },
        { when: breathIs(ability: "con"), con: 16, level: 11, expect: "+7 vs. Reflex" },
        { when: breathIs(ability: "con"), con: 16, level: 21, expect: "+9 vs. Reflex" } ]
      hit: [
        { con: 10, level:  1, expect: "1d6 damage" },
        { con: 16, level:  1, expect: "1d6+3 damage" },
        { con: 16, level: 11, expect: "2d6+3 damage" },
        { con: 16, level: 21, expect: "3d6+3 damage" } ]
        

  "[ElvenAccuracy] should be defined":
    Verify.testProperties "ElvenAccuracy",
      name: [ expect: "Elven Accuracy" ]
      keywords: [ expect: [] ]
      effect: [
        { expect: "reroll attack at +0" }
        { when: attrBonusIs("bonus", 2), expect: "reroll attack at +2" } ]

  "[FeyStep] should be defined":
    Verify.testProperties "FeyStep",
      name: [ expect: "Fey Step" ]
      keywords: [ expect: [ "teleportation" ] ]

  "[InfernalWrath] should be defined":
    Verify.testProperties "InfernalWrath",
      name: [ expect: "Infernal Wrath" ]
      keywords: [ expect: [] ]
      effect: [
        { cha: 10, expect: "+0 extra damage (special)" },
        { cha: 16, expect: "+3 extra damage (special)" } ]
    
  "[SecondChance] should be defined":
    Verify.testProperties "SecondChance",
      name: [ expect: "Second Chance" ]
      keywords: [ expect: [] ]
