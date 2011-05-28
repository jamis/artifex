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
            npc.race = { name: value, is: (name) -> name is value }
          when "class"
            npc.class = name: value
          when "deity"
            npc.deity = value
          when "trained"
            for skill in value
              npc.skills[skill].trained = true
          when "feature"
            for category, features of value
              for feature in features
                npc.feature category, feature
          when "proficiencies"
            for category, list of value
              for item in list
                npc.proficiencies[category].push(item)
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
              when "proficiencies"
                for category, list of adjustment
                  for item in list
                    test.ok item in npc.proficiencies[category], "should have #{category} proficiency with `#{item}'"
              when "property"
                for name, value of adjustment
                  test.equal npc[name], value
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
      allows: [ { feature: { class: ["Channel Divinity"] }, deity: "bahamut" } ]
      disallows: [
        { feature: { class: ["Channel Divinity"] }, deity: "pelor" },
        { feature: { class: ["Hunter's Quarry"] }, deity: "bahamut" } ]
      grants:
        power:
          encounter: [ "Channel Divinity: Armor of Bahamut" ]

  "[ChainmailProficiency] should be defined":
    featDefined "ChainmailProficiency",
      name: "Armor Proficiency (Chainmail)"
      allows: [
        { str: 13, con: 13, proficiencies: { armor: [ "leather" ] } },
        { str: 13, con: 13, proficiencies: { armor: [ "hide" ] } } ]
      disallows: [
        { str: 12, con: 13, proficiencies: { armor: [ "leather" ] } },
        { str: 13, con: 12, proficiencies: { armor: [ "hide" ] } },
        { str: 13, con: 13, proficiencies: { armor: [ "cloth" ] } },
        { str: 13, con: 13, proficiencies: { armor: [ "leather", "chainmail" ] } } ],
      grants:
        proficiencies:
          armor: [ "chainmail" ]

  "[HideProficiency] should be defined":
    featDefined "HideProficiency",
      name: "Armor Proficiency (Hide)"
      allows: [ { str: 13, con: 13, proficiencies: { armor: [ "leather" ] } } ]
      disallows: [
        { str: 12, con: 13, proficiencies: { armor: [ "leather" ] } },
        { str: 13, con: 13 },
        { str: 13, con: 13, proficiencies: { armor: [ "hide" } ] } ]
      grants:
        proficiencies:
          armor: [ "hide" ]

  "[LeatherProficiency] should be defined":
    featDefined "LeatherProficiency",
      name: "Armor Proficiency (Leather)"
      disallows: [ { proficiencies: { armor: [ "leather" ] } } ]
      grants:
        proficiencies:
          armor: [ "leather" ]

  "[PlateProficiency] should be defined":
    featDefined "PlateProficiency",
      name: "Armor Proficiency (Plate)"
      allows: [ { str: 15, con: 15, proficiencies: { armor: [ "scale" ] } } ]
      disallows: [
        { str: 14, con: 15, proficiencies: { armor: [ "scale" ] } },
        { str: 15, con: 14, proficiencies: { armor: [ "scale" ] } },
        { str: 15, con: 15, proficiencies: { armor: [ "chainmail" ] } },
        { str: 15, con: 15, proficiencies: { armor: [ "plate" ] } } ]
      grants:
        proficiencies:
          armor: [ "plate" ]

  "[ScaleProficiency] should be defined":
    featDefined "ScaleProficiency",
      name: "Armor Proficiency (Scale)"
      allows: [ { str: 13, con: 13, proficiencies: { armor: [ "chainmail" ] } } ]
      disallows: [
        { str: 12, con: 13, proficiencies: { armor: [ "chainmail" ] } },
        { str: 13, con: 12, proficiencies: { armor: [ "chainmail" ] } },
        { str: 13, con: 13, proficiencies: { armor: [ "scale" ] } } ]
      grants:
        proficiencies:
          armor: [ "scale" ]

  "[AstralFire] should be defined":
    featDefined "AstralFire",
      name: "Astral Fire"
      allows: [ { dex: 13, cha: 13 } ]
      disallows: [ { dex: 12, cha: 13 }, { dex: 13, cha: 12 } ]

  "[AvandrasRescue] should be defined":
    featDefined "AvandrasRescue",
      name: "Avandra's Rescue"
      allows: [ { feature: { class: ["Channel Divinity"] }, deity: "avandra" } ]
      disallows: [
        { feature: { class: ["Channel Divinity"] }, deity: "pelor" },
        { feature: { class: ["Hunter's Quarry"] }, deity: "avandra" } ]
      grants:
        power:
          encounter: [ "Channel Divinity: Avandra's Rescue" ]

  "[Backstabber] should be defined":
    featDefined "Backstabber",
      name: "Backstabber"
      allows: [ { class: "rogue", feature: { class: ["Sneak Attack"] } } ]
      disallows: [
        { class: "wizard", feature: { class: ["Sneak Attack"] } },
        { class: "rogue" } ]
      grants:
        property: { sneakAttackDamageDie: 8 }

  "[BladeOpportunist] should be defined":
    featDefined "BladeOpportunist",
      name: "Blade Opportunist"
      allows: [ { str: 13, dex: 13 } ]
      disallows: [ { str: 12, dex: 13 }, { str: 13, dex: 12 } ]


  "[RitualCaster] should be defined":
    featDefined "RitualCaster",
      name: "Ritual Caster"
      allows: [ { trained: [ "arcana" ] }, { trained: [ "religion" ] } ]
      disallows: [ {} ]
