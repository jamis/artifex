{Deities} = require '..'

module.exports =
  "lawful good deities should be accounted for": (test) ->
    test.ok "Bahamut" in Deities["lawful good"]
    test.ok "Moradin" in Deities["lawful good"]
    test.done()

  "good deities should be accounted for": (test) ->
    test.ok "Avandra" in Deities["good"]
    test.ok "Pelor" in Deities["good"]
    test.done()

  "unaligned deities should be accounted for": (test) ->
    test.ok "Corellon" in Deities["unaligned"]
    test.ok "Erathis" in Deities["unaligned"]
    test.ok "Ioun" in Deities["unaligned"]
    test.ok "Kord" in Deities["unaligned"]
    test.ok "Melora" in Deities["unaligned"]
    test.ok "Raven Queen" in Deities["unaligned"]
    test.ok "Sehanine" in Deities["unaligned"]
    test.done()

  "evil deities should be accounted for": (test) ->
    test.ok "Asmodeus" in Deities["evil"]
    test.ok "Bane" in Deities["evil"]
    test.ok "Tiamat" in Deities["evil"]
    test.ok "Torog" in Deities["evil"]
    test.ok "Vecna" in Deities["evil"]
    test.ok "Zehir" in Deities["evil"]
    test.done()

  "chaotic evil deities should be accounted for": (test) ->
    test.ok "Gruumsh" in Deities["chaotic evil"]
    test.ok "Lolth" in Deities["chaotic evil"]
    test.done()
