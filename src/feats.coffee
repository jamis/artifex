Powers = require './powers'

class Feat
  constructor: (properties) ->
    for name, value of properties
      this[name] = value

  allows: (npc) ->
    for property, value of @forbids
      return false if @match npc, property, value

    for property, value of @requires
      return false unless @match npc, property, value
    true

  match: (npc, property, value) ->
    switch property
      when "race" then return true if npc.race.name is value
      when "class" then return true if npc.class.name is value
      when "deity" then return true if npc.deity is value
      when "str", "con", "dex", "int", "wis", "cha"
        return true if npc.abilities[property].score() >= value
      when "feature"
        all = true
        for category, features of value
          for feature in features
            all &&= npc.hasFeature(category, feature)
        return all
      when "proficiencies"
        result = true
        for category, items of value
          disjuncts = items.split("|")
          any = false
          for item in disjuncts
            conjuncts = item.split("&")
            all = true
            for item in conjuncts
              all &&= item in npc.proficiencies[category]
            any ||= all
          result &&= any
        return true if result
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
          else throw new Error "unsupported attribute: `#{attribute}'"

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
      deity: "bahamut"
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
