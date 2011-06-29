{Classes, ParagonPaths, NPC, Powers, Weapons} = require '../..'

AngelicAvenger = ParagonPaths.AngelicAvenger

newCleric = ->
  npc = new NPC
  npc.class = new Classes.Cleric npc
  npc

module.exports =
  "should have id": (test) ->
    test.equal AngelicAvenger.id, "angelicAvenger"
    avenger = new AngelicAvenger(new NPC)
    test.equal avenger.id, "angelicAvenger"
    test.done()
    
  "should have name": (test) ->
    test.equal AngelicAvenger.simpleName, "angelic avenger"
    avenger = new AngelicAvenger(new NPC)
    test.equal avenger.name, "angelic avenger"
    test.done()

  "should require cleric class": (test) ->
    npc = new NPC
    npc.class = new Classes.Fighter npc
    test.ok not AngelicAvenger.accepts(npc)
    test.ok AngelicAvenger.accepts(newCleric())
    test.done()

  "constructor should set initial path features": (test) ->
    new AngelicAvenger(npc = newCleric())
    test.ok npc.hasFeature("class", "Angelic Action"), "expected Angelic Action"
    test.ok npc.hasFeature("class", /^Astral Vibrance \((lightning|radiant|thunder)\)$/), "expected Astral Vibrance"
    test.ok npc.hasFeature("class", /^Weapon Training \(.*\)$/), "expected Weapon Training"
    test.ok not npc.hasFeature("class", "Blood and Radiance")
    test.done()

  "should set the astralVibranceType": (test) ->
    new AngelicAvenger(npc = newCleric())
    test.ok npc.astralVibranceType in ["lightning", "radiant", "thunder"]
    test.done()

  "should gain training in a single heavy-blade weapon": (test) ->
    npc = new NPC
    test.ok npc.proficiencies.weapons.length is 0
    new AngelicAvenger npc
    test.ok npc.proficiencies.weapons.length is 1
    weapon = npc.proficiencies.weapons[0]
    test.ok "heavy blade" in Weapons.all[weapon].groups
    test.ok weapon in npc.equipment.weapons()
    test.done()

  "should prefer a weapon in which the character is not already proficient": (test) ->
    npc = new NPC
    npc.proficiencies.weapons.push "simple melee"
    npc.proficiencies.weapons.push "military melee"
    new AngelicAvenger npc
    test.ok "bastardSword" in npc.proficiencies.weapons
    test.ok "bastardSword" in npc.equipment.weapons()
    test.done()

  "powers are accounted for": (test) ->
    test.ok "AstralWave" in AngelicAvenger.powers.encounter[11]
    test.ok "AngelicPresence" in AngelicAvenger.powers.utility[12]
    test.ok "AngelAscendant" in AngelicAvenger.powers.daily[20]

    klass = new AngelicAvenger(new NPC)
    test.equal AngelicAvenger.powers, klass.powers
    test.done()
