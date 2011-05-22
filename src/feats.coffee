Powers = require './powers'

class Feat
  constructor: (properties) ->
    for name, value of properties
      this[name] = value

  allows: (npc) ->
    for property, value of @requires
      switch property
        when "race" then return false unless npc.race.name is value
        when "class" then return false unless npc.class.name is value
        when "deity" then return false unless npc.deity is value
        when "str", "con", "dex", "int", "wis", "cha"
          return false if npc.abilities[property].score() < value
        when "feature"
          for category, features of value
            for feature in features
              return false unless npc.hasFeature(category, feature)
        else throw new Error "unsupported property: `#{property}'"
    true

  applyTo: (npc) ->
    npc.feats.push @name
    console.log(@grants)
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
