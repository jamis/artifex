{Verify} = require '../helpers'

vibranceIs = (type) ->
  (power) => power.npc.astralVibranceType = type

module.exports =
  "[AstralWave] should be defined":
    Verify.testProperties "angelicAvenger", "AstralWave",
      name: [ expect: "Astral Wave" ]
      keywords: [
        { when: vibranceIs("lightning"), expect: [ "divine", "implement", "lightning" ] },
        { when: vibranceIs("radiant"), expect: [ "divine", "implement", "radiant" ] },
        { when: vibranceIs("thunder"), expect: [ "divine", "implement", "thunder" ] } ]

  "[AngelicPresence] should be defined":
    Verify.testProperties "angelicAvenger", "AngelicPresence",
      name: [ expect: "Angelic Presence" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "divine", "fear" ] ]

  "[AngelAscendant] should be defined":
    Verify.testProperties "angelicAvenger", "AngelAscendant",
      name: [ expect: "Angel Ascendant" ]
      keywords: [ expect: [ "divine", "weapon" ] ]
      requires: { weapon: "melee" }
