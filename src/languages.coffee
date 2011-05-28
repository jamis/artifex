module.exports = Languages =
  list: [ "common", "deep speech", "draconic", "dwarven", "elven", "giant",
    "goblin", "primordial", "supernal", "abyssal" ]

  available: (npc, language) ->
    return false if npc.level is 1 and language in [ "supernal", "abyssal" ]
    language not in npc.languages

  possible: (npc) ->
    list = []
    for lang in Languages.list
      list.push lang if Languages.available(npc, lang)
    list
