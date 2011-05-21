{NPC, Powers} = require '../..'

module.exports =
  "[HealingWord] should have correct name": (test) ->
    power = Powers.get "HealingWord", npc: new NPC
    test.equal power.name, "Healing Word"
    test.done()
    
  "[HealingWord] frequency should depend on NPC level": (test) ->
    power = Powers.get "HealingWord", npc: new NPC
    test.equal power.get("frequency"), 2
    power.npc.level = 15
    test.equal power.get("frequency"), 2
    power.npc.level = 16
    test.equal power.get("frequency"), 3
    test.done()

  "[HealingWord] effect should depend on NPC level": (test) ->
    power = Powers.get "HealingWord", npc: new NPC
    test.equal power.get("effect"), "surge+1d6"
    power.npc.level = 6
    test.equal power.get("effect"), "surge+2d6"
    power.npc.level = 11
    test.equal power.get("effect"), "surge+3d6"
    power.npc.level = 16
    test.equal power.get("effect"), "surge+4d6"
    power.npc.level = 21
    test.equal power.get("effect"), "surge+5d6"
    power.npc.level = 26
    test.equal power.get("effect"), "surge+6d6"
    test.done()

  "[HealingWord] range should depend on NPC level": (test) ->
    power = Powers.get "HealingWord", npc: new NPC
    test.equal power.get("range"), "Close burst 5"
    power.npc.level = 11
    test.equal power.get("range"), "Close burst 10"
    power.npc.level = 21
    test.equal power.get("range"), "Close burst 15"
    test.done()

  "[TurnUndead] name should be set": (test) ->
    power = Powers.get "TurnUndead", npc: new NPC
    test.equal power.name, "Channel Divinity: Turn Undead"
    test.done()

  "[TurnUndead] range should depend on level": (test) ->
    power = Powers.get "TurnUndead", npc: new NPC
    test.equal power.get("range"), "Close burst 2"
    power.npc.level = 11
    test.equal power.get("range"), "Close burst 5"
    power.npc.level = 21
    test.equal power.get("range"), "Close burst 8"
    test.done()

  "[TurnUndead] attack should depend on wisdom": (test) ->
    power = Powers.get "TurnUndead", npc: new NPC
    test.equal power.get("attack"), "+0 vs. Will"
    power.npc.abilities.wis.baseValue = 16
    test.equal power.get("attack"), "+3 vs. Will"
    test.done()

  "[TurnUndead] hit should depend on level, wisdom, charisma": (test) ->
    power = Powers.get "TurnUndead", npc: new NPC
    test.equal power.get("hit"), "1d10, push 3 (special)"
    power.npc.abilities.wis.baseValue = 16
    test.equal power.get("hit"), "1d10+3, push 3 (special)"
    power.npc.abilities.cha.baseValue = 16
    test.equal power.get("hit"), "1d10+3, push 3+3 (special)"
    power.npc.level = 5
    test.equal power.get("hit"), "2d10+3, push 3+3 (special)"
    power.npc.level = 11
    test.equal power.get("hit"), "3d10+3, push 3+3 (special)"
    power.npc.level = 15
    test.equal power.get("hit"), "4d10+3, push 3+3 (special)"
    power.npc.level = 21
    test.equal power.get("hit"), "5d10+3, push 3+3 (special)"
    power.npc.level = 25
    test.equal power.get("hit"), "6d10+3, push 3+3 (special)"
    test.done()

  "[LanceOfFaith] name should be set": (test) ->
    power = Powers.get "LanceOfFaith", npc: new NPC
    test.equal power.name, "Lance of Faith"
    test.done()

  "[LanceOfFaith] attack should depend on wisdom": (test) ->
    power = Powers.get "LanceOfFaith", npc: new NPC
    test.equal power.get("attack"), "+0 vs. Reflex"
    power.npc.abilities.wis.baseValue = 16
    test.equal power.get("attack"), "+3 vs. Reflex"
    test.done()

  "[LanceOfFaith] hit should depend on level and wisdom": (test) ->
    power = Powers.get "LanceOfFaith", npc: new NPC
    test.equal power.get("hit"), "1d8 (special)"
    power.npc.abilities.wis.baseValue = 16
    test.equal power.get("hit"), "1d8+3 (special)"
    power.npc.level = 20
    test.equal power.get("hit"), "1d8+3 (special)"
    power.npc.level = 21
    test.equal power.get("hit"), "2d8+3 (special)"
    test.done()

  "[PriestsShield] name should be set": (test) ->
    power = Powers.get "PriestsShield", npc: new NPC
    test.equal power.name, "Priest's Shield"
    test.done()

  "[PriestsShield] attack should depend on strength": (test) ->
    power = Powers.get "PriestsShield", npc: new NPC
    test.equal power.get("attack"), "+0 vs. AC"
    power.npc.abilities.str.baseValue = 16
    test.equal power.get("attack"), "+3 vs. AC"
    test.done()

  "[PriestsShield] hit should depend on level and strength": (test) ->
    power = Powers.get "PriestsShield", npc: new NPC
    test.equal power.get("hit"), "1[W] (special)"
    power.npc.abilities.str.baseValue = 16
    test.equal power.get("hit"), "1[W]+3 (special)"
    power.npc.level = 20
    test.equal power.get("hit"), "1[W]+3 (special)"
    power.npc.level = 21
    test.equal power.get("hit"), "2[W]+3 (special)"
    test.done()

  "[RighteousBrand] name should be set": (test) ->
    power = Powers.get "RighteousBrand", npc: new NPC
    test.equal power.name, "Righteous Brand"
    test.done()

  "[RighteousBrand] attack should depend on strength": (test) ->
    power = Powers.get "RighteousBrand", npc: new NPC
    test.equal power.get("attack"), "+0 vs. AC"
    power.npc.abilities.str.baseValue = 16
    test.equal power.get("attack"), "+3 vs. AC"
    test.done()

  "[RighteousBrand] hit should depend on level and strength": (test) ->
    power = Powers.get "RighteousBrand", npc: new NPC
    test.equal power.get("hit"), "1[W] (special)"
    power.npc.abilities.str.baseValue = 16
    test.equal power.get("hit"), "1[W]+3 (special)"
    power.npc.level = 20
    test.equal power.get("hit"), "1[W]+3 (special)"
    power.npc.level = 21
    test.equal power.get("hit"), "2[W]+3 (special)"
    test.done()

  "[SacredFlame] name should be set": (test) ->
    power = Powers.get "SacredFlame", npc: new NPC
    test.equal power.name, "Sacred Flame"
    test.done()

  "[SacredFlame] attack should depend on wisdom": (test) ->
    power = Powers.get "SacredFlame", npc: new NPC
    test.equal power.get("attack"), "+0 vs. Reflex"
    power.npc.abilities.wis.baseValue = 16
    test.equal power.get("attack"), "+3 vs. Reflex"
    test.done()

  "[SacredFlame] hit should depend on level and wisdom": (test) ->
    power = Powers.get "SacredFlame", npc: new NPC
    test.equal power.get("hit"), "1d6 (special)"
    power.npc.abilities.wis.baseValue = 16
    test.equal power.get("hit"), "1d6+3 (special)"
    power.npc.level = 20
    test.equal power.get("hit"), "1d6+3 (special)"
    power.npc.level = 21
    test.equal power.get("hit"), "2d6+3 (special)"
    test.done()
