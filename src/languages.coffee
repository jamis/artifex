module.exports = Languages =
  list: [ "common", "deep speech", "draconic", "dwarven", "elven", "giant",
    "goblin", "primordial", "supernal", "abyssal" ]

  available: (npc, language) ->
    return false if npc.level is 1 and language in [ "supernal", "abyssal" ]
    language not in npc.languages
