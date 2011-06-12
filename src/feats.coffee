Armor     = require './armor'
Attribute = require './attribute'
Powers    = require './powers'

class Feat
  constructor: (properties) ->
    for name, value of properties
      this[name] = value

  allows: (npc) ->
    if !@multiple && @name in npc.feats
      return false

    for property, value of @forbids
      return false if @match npc, property, value

    for property, value of @requires
      return false unless @match npc, property, value
    true

  processCombination: (combination, callback) ->
    disjuncts = combination.split("|")
    any = false
    for item in disjuncts
      conjuncts = item.split("&")
      all = true
      for item in conjuncts
        all &&= callback item
      any ||= all
    return any

  match: (npc, property, value) ->
    switch property
      when "race" then return true if npc.race.is value
      when "class" then return true if npc.class.name is value
      when "deity" then return true if npc.deity is value
      when "str", "con", "dex", "int", "wis", "cha"
        return true if npc.abilities[property].score() >= value
      when "trained"
        return @processCombination(value, (skill) -> npc.skills[skill].trained)
      when "feature"
        all = true
        for category, features of value
          for feature in features
            all &&= npc.hasFeature(category, feature)
        return all
      when "proficiencies"
        result = true
        for category, items of value
          result &&= @processCombination items, (item) -> item in npc.proficiencies[category]
        return true if result
      when "with"
        value(npc)
      else throw new Error "unsupported property: `#{property}'"

  applyTo: (npc) ->
    npc.feats.push @name
    if @grants?
      for attribute, value of @grants
        switch attribute
          when "skill"
            for skill, adjustment of value
              npc.skills[skill].adjust adjustment[1], adjustment[0]
          when "power"
            for category, list of value
              for power in list
                power = Powers.get power, npc: npc
                npc.powers[category].push power
          when "proficiencies"
            for category, item of value
              npc.proficiencies[category].push item
          when "property"
            for name, value of value
              npc[name] = value
          when "apply"
            value(npc)
          else throw new Error "unsupported attribute: `#{attribute}'"

powersWithKeywords = (keywords...) ->
  (npc) ->
    for keyword in keywords
      if npc.powers.firstThat((whence, power) -> keyword in power.keywords)
        return true
    false

equippedShield = (npc) ->
  for item in npc.equipment
    return true if item in Armor.Categories['shield']
  false

module.exports = Feats =
  ActionSurge: new Feat
    name: "Action Surge"
    requires:
      race: "human"

  AgileHunter: new Feat
    name: "Agile Hunter"
    requires:
      dex: 15
      class: "ranger"
      feature: { class: [ "Hunter's Quarry" ] }

  Alertness: new Feat
    name: "Alertness"
    grants:
      skill:
        perception: [2, "feat"]

  ArmorOfBahamut: new Feat
    name: "Armor of Bahamut"
    requires:
      deity: "Bahamut"
      feature: { class: [ "Channel Divinity" ] }
    grants:
      power:
        encounter: [ "ArmorOfBahamut" ]

  ChainmailProficiency: new Feat
    name: "Armor Proficiency (Chainmail)"
    requires:
      str: 13
      con: 13
      proficiencies:
        armor: "leather|hide"
    forbids:
      proficiencies:
        armor: "chainmail"
    grants:
      proficiencies:
        armor: "chainmail"

  HideProficiency: new Feat
    name: "Armor Proficiency (Hide)"
    requires:
      str: 13
      con: 13
      proficiencies:
        armor: "leather"
    forbids:
      proficiencies:
        armor: "hide"
    grants:
      proficiencies:
        armor: "hide"

  LeatherProficiency: new Feat
    name: "Armor Proficiency (Leather)"
    forbids:
      proficiencies:
        armor: "leather"
    grants:
      proficiencies:
        armor: "leather"

  PlateProficiency: new Feat
    name: "Armor Proficiency (Plate)"
    requires:
      str: 15
      con: 15
      proficiencies:
        armor: "scale"
    forbids:
      proficiencies:
        armor: "plate"
    grants:
      proficiencies:
        armor: "plate"

  ScaleProficiency: new Feat
    name: "Armor Proficiency (Scale)"
    requires:
      str: 13
      con: 13
      proficiencies:
        armor: "chainmail"
    forbids:
      proficiencies:
        armor: "scale"
    grants:
      proficiencies:
        armor: "scale"

  AstralFire: new Feat(name: "Astral Fire", requires: { dex: 13, cha: 13 })

  AvandrasRescue: new Feat
    name: "Avandra's Rescue"
    requires:
      deity: "Avandra"
      feature: { class: [ "Channel Divinity" ] }
    grants:
      power:
        encounter: [ "AvandrasRescue" ]

  Backstabber: new Feat
    name: "Backstabber"
    requires:
      class: "rogue"
      feature: { class: [ "Sneak Attack" ] }
    grants:
      apply: (npc) ->
        npc.attacks.sneakAttack ||= new Attribute 0
        npc.attacks.sneakAttack.damageDie = 8

  BladeOpportunist: new Feat(name: "Blade Opportunist", requires: { str: 13, dex: 13 })

  BurningBlizzard: new Feat
    name: "Burning Blizzard"
    requires:
      int: 13
      wis: 13
      with: powersWithKeywords("acid", "cold")
    grants:
      apply: (npc) ->
        npc.attacks.general.adjustWhen "acid", "feat", -> Math.ceil(npc.level/10)
        npc.attacks.general.adjustWhen "cold", "feat", -> Math.ceil(npc.level/10)

  CombatReflexes: new Feat
    name: "Combat Reflexes"
    requires:
      dex: 13
    grants:
      apply: (npc) ->
        npc.attacks.general.adjustWhen "opportunity attack", "feat", 1

  CorellonsGrace: new Feat
    name: "Corellon's Grace"
    requires:
      deity: "Corellon"
      feature: { class: [ "Channel Divinity" ] }
    grants:
      power:
        encounter: [ "CorellonsGrace" ]

  DarkFury: new Feat
    name: "Dark Fury"
    requires:
      con: 13
      wis: 13
      with: powersWithKeywords("necrotic", "psychic")
    grants:
      apply: (npc) ->
        npc.attacks.general.adjustWhen "necrotic", "feat", -> Math.ceil(npc.level/10)
        npc.attacks.general.adjustWhen "psychic", "feat", -> Math.ceil(npc.level/10)

  DefensiveMobility: new Feat
    name: "Defensive Mobility"
    grants:
      apply: (npc) ->
        npc.defenses.ac.adjustWhen "vs opportunity attack", "feat", 2

  DistractingShield: new Feat
    name: "Distracting Shield"
    requires:
      wis: 15
      class: "fighter"
      feature: { class: [ "Combat Challenge" ] }
      with: equippedShield

  DodgeGiants: new Feat
    name: "Dodge Giants"
    requires:
      race: "dwarf"
    grants:
      apply: (npc) ->
        npc.defenses.ac.adjustWhen "vs large", "feat", 1
        npc.defenses.ref.adjustWhen "vs large", "feat", 1

  DragonbornFrenzy: new Feat
    name: "Dragonborn Frenzy"
    requires:
      race: "dragonborn"
    grants:
      apply: (npc) ->
        npc.damage.general.adjustWhen "bloodied", "feat", 2

  DragonbornSenses: new Feat
    name: "Dragonborn Senses"
    requires:
      race: "dragonborn"
    grants:
      apply: (npc) ->
        npc.vision = "low-light"

  # FIXME: taking RitualCaster ought to grant an initial ritual or two
  RitualCaster: new Feat
    name: "Ritual Caster"
    requires:
      trained: "religion|arcana"
