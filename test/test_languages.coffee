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
    test.done()

  "languages currently known by characters are unavailable": (test) ->
    npc = new NPC
    test.ok Languages.available(npc, "common")
    npc.languages.push "common"
    test.ok !Languages.available(npc, "common")
    test.done()
