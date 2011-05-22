{NPC, Feats} = require '..'

featDefined = (id, expectations) ->
  (test) ->
    feat = Feats[id]

    configureNPC = (conditions) ->
      npc = new NPC
      for attribute, value of conditions
        switch attribute
          when "str", "con", "dex", "int", "wis", "cha"
            npc.abilities[attribute].baseValue = value
          when "race"
            npc.race = name: value
          when "class"
            npc.class = name: value
          when "deity"
            npc.deity = value
          when "feature"
            for category, features of value
              for feature in features
                npc.feature category, feature
          else throw new Error "unsupported configure attribute: `#{attribute}'"
      npc

    for name, value of expectations
      switch name
        when "name"
          test.equal feat.name, value, "expected `#{id}' to be named `#{value}'"
        when "allows"
          for conditions in value
            test.ok feat.allows(configureNPC(conditions)), "`#{id}' should allow #{conditions}"
        when "disallows"
          for conditions in value
            test.ok !feat.allows(configureNPC(conditions)), "`#{id}' should disallow #{conditions}"
        when "grants"
          npc = new NPC
          feat.applyTo npc

          for grant, adjustment of value
            switch grant
              when "skill"
                for skill, bonus of adjustment
                  test.ok npc.skills[skill].has(bonus...), "`#{id}' should grant #{bonus} to `#{skill}'"
              when "power"
                for category, list of adjustment
                  for power in list
                    test.ok npc.powers.find(category, power), "should have `#{power}' as #{category} power"
              else throw new Error "unsupported grant: `#{grant}'"
    test.done()
            
module.exports =
  "[ActionSurge] should be defined":
    featDefined "ActionSurge",
      name: "Action Surge"
      allows: [{ race: "human" }]
      disallows: [{ race: "dragonborn" }]

  "[AgileHunter] should be defined":
    featDefined "AgileHunter",
      name: "Agile Hunter"
      allows: [
        { dex: 15, class: "ranger", feature: { class: ["Hunter's Quarry"] } } ]

      disallows: [
        { dex: 14, class: "ranger", feature: { class: ["Hunter's Quarry"] } },
        { dex: 15, class: "cleric", feature: { class: ["Hunter's Quarry"] } },
        { dex: 15, class: "ranger" } ]

  "[Alertness] should be defined":
    featDefined "Alertness",
      name: "Alertness"
      grants:
        skill: { perception: [2, "feat"] }

  "[ArmorOfBahamut] should be defined":
    featDefined "ArmorOfBahamut",
      name: "Armor of Bahamut"
      allows: [
        { feature: { class: ["Channel Divinity"] }, deity: "bahamut" } ]
      disallows: [
        { feature: { class: ["Channel Divinity"] }, deity: "pelor" },
        { feature: { class: ["Hunter's Quarry"] }, deity: "bahamut" } ]
      grants:
        power:
          encounter: [ "Channel Divinity: Armor of Bahamut" ]
