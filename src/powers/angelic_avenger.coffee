module.exports =
  AstralWave:
    name        : "Astral Wave"
    keywords    : [ "divine", "implement", "{vibranceType}" ]
    _formulae   : { vibranceType: -> @npc.astralVibranceType }

  AngelicPresence:
    name        : "Angelic Presence"
    keywords    : [ "divine", "fear" ]

  AngelAscendant:
    name        : "Angel Ascendant"
    keywords    : [ "divine", "weapon" ]
    requires    : { weapon: "melee" }
