{Languages, NPC} = require '..'

module.exports =
  "all standard languages should be defined": (test) ->
    test.ok "common" in Languages.list
    test.ok "deep speech" in Languages.list
    test.ok "draconic" in Languages.list
    test.ok "dwarven" in Languages.list
    test.ok "elven" in Languages.list
    test.ok "giant" in Languages.list
    test.ok "goblin" in Languages.list
    test.ok "primordial" in Languages.list
    test.ok "supernal" in Languages.list
    test.ok "abyssal" in Languages.list
    test.done()

  "supernal and abyssal should not be available to L1 characters": (test) ->
    npc = new NPC
    test.ok !Languages.available(npc, "supernal")
    test.ok !Languages.available(npc, "abyssal")
    test.ok Languages.available(npc, "common")

    npc.level = 2
    test.ok Languages.available(npc, "supernal")
    test.ok Languages.available(npc, "abyssal")
    test.done()

  "languages currently known by characters are unavailable": (test) ->
    npc = new NPC
    test.ok Languages.available(npc, "common")
    npc.languages.push "common"
    test.ok !Languages.available(npc, "common")
    test.done()

  "possible returns list of all languages available to the given npc": (test) ->
    npc = new NPC
    npc.level = 1
    npc.languages.push "common"
    possible = Languages.possible(npc)
    test.ok "common" not in possible
    test.ok "supernal" not in possible
    test.ok "abyssal" not in possible
    test.done()
