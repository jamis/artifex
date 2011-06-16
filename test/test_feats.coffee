{Classes, NPC, Feats, Powers} = require '..'

hasPower = (id, category) ->
  (npc) ->
    category ||= "atWill"
    npc.powers[category].push Powers.get(id, npc: npc)

equippedWith = (item) ->
  (npc) -> npc.equipment.push(item)

featDefined = (id, expectations) ->
  (test) ->
    feat = Feats[id]

    configureNPC = (conditions) ->
      npc = new NPC
      for attribute, value of conditions
        switch attribute
          when "str", "con", "dex", "int", "int_", "wis", "cha"
            npc.abilities[attribute].baseValue = value
          when "race"
            npc.race = { name: value, is: (name) -> name is @name }
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
          when "when"
            value(npc)
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
          npc = configureNPC(value.setup ? {})
          feat.applyTo npc

          for grant, adjustment of value
            switch grant
              when "setup" then # ignore, this was handled when the NPC was configured
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
              when "tests"
                for name, fn of adjustment
                  test.ok fn(npc), "expected test `#{name}' to be true"
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
      allows: [ { feature: { class: ["Channel Divinity"] }, deity: "Bahamut" } ]
      disallows: [
        { feature: { class: ["Channel Divinity"] }, deity: "Pelor" },
        { feature: { class: ["Hunter's Quarry"] }, deity: "Bahamut" } ]
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
      allows: [ { feature: { class: ["Channel Divinity"] }, deity: "Avandra" } ]
      disallows: [
        { feature: { class: ["Channel Divinity"] }, deity: "Pelor" },
        { feature: { class: ["Hunter's Quarry"] }, deity: "Avandra" } ]
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
        tests:
          damageDie: (npc) -> npc.attacks.sneakAttack.damageDie is 8

  "[BladeOpportunist] should be defined":
    featDefined "BladeOpportunist",
      name: "Blade Opportunist"
      allows: [ { str: 13, dex: 13 } ]
      disallows: [ { str: 12, dex: 13 }, { str: 13, dex: 12 } ]

  "[BurningBlizzard] should be defined":
    featDefined "BurningBlizzard",
      name: "Burning Blizzard"
      allows: [
        { int_: 13, wis: 13, when: hasPower("AcidArrow") },
        { int_: 13, wis: 13, when: hasPower("ArmorOfAgathys") } ]
      disallows: [
        { int_: 13, wis: 13, when: hasPower("BurningHands") },
        { int_: 12, wis: 13, when: hasPower("AcidArrow") },
        { int_: 13, wis: 12, when: hasPower("AcidArrow") } ]
      grants:
        tests:
          conditionalBonus: (npc) ->
            npc.attacks.general.adjustment("acid") is 1 and
              npc.attacks.general.adjustment("cold") is 1
          paragonLevelDependentBonus: (npc) ->
            npc.level = 11
            npc.attacks.general.adjustment("acid") is 2 and
              npc.attacks.general.adjustment("cold") is 2
          epicLevelDependentBonus: (npc) ->
            npc.level = 21
            npc.attacks.general.adjustment("acid") is 3 and
              npc.attacks.general.adjustment("cold") is 3

  "[CombatReflexes] should be defined":
    featDefined "CombatReflexes",
      name: "Combat Reflexes"
      allows: [ dex: 13 ]
      disallows: [ dex: 12 ]
      grants:
        tests:
          conditionalBonus: (npc) ->
            npc.attacks.general.has 1, "feat", "opportunity attack"

  "[CorellonsGrace] should be defined":
    featDefined "CorellonsGrace",
      name: "Corellon's Grace"
      allows: [ { feature: { class: ["Channel Divinity"] }, deity: "Corellon" } ]
      disallows: [
        { feature: { class: ["Channel Divinity"] }, deity: "Pelor" },
        { feature: { class: ["Hunter's Quarry"] }, deity: "Corellon" } ]
      grants:
        power:
          encounter: [ "Channel Divinity: Corellon's Grace" ]

  "[DarkFury] should be defined":
    featDefined "DarkFury",
      name: "Dark Fury"
      allows: [
        { con: 13, wis: 13, when: hasPower("VampiricEmbrace") },
        { con: 13, wis: 13, when: hasPower("Eyebite") } ]
      disallows: [
        { con: 13, wis: 13, when: hasPower("BurningHands") },
        { con: 12, wis: 13, when: hasPower("Eyebite") },
        { con: 13, wis: 12, when: hasPower("Eyebite") } ]
      grants:
        tests:
          conditionalBonus: (npc) ->
            npc.attacks.general.adjustment("necrotic") is 1 and
              npc.attacks.general.adjustment("psychic") is 1
          paragonLevelDependentBonus: (npc) ->
            npc.level = 11
            npc.attacks.general.adjustment("necrotic") is 2 and
              npc.attacks.general.adjustment("psychic") is 2
          epicLevelDependentBonus: (npc) ->
            npc.level = 21
            npc.attacks.general.adjustment("necrotic") is 3 and
              npc.attacks.general.adjustment("psychic") is 3

  "[DefensiveMobility] should be defined":
    featDefined "DefensiveMobility",
      name: "Defensive Mobility"
      allows: [ {} ]
      grants:
        tests:
          conditionalBonus: (npc) ->
            npc.defenses.ac.has 2, "feat", "vs opportunity attack"

  "[DistractingShield] should be defined":
    featDefined "DistractingShield",
      name: "Distracting Shield"
      allows: [
        { wis: 15, class: "fighter", feature: { class: ["Combat Challenge"] }, when: equippedWith("light shield") },
        { wis: 15, class: "fighter", feature: { class: ["Combat Challenge"] }, when: equippedWith("heavy shield") } ]
      disallows: [
        { wis: 14, class: "fighter", feature: { class: ["Combat Challenge"] }, when: equippedWith("light shield") },
        { wis: 15, class: "rogue", feature: { class: ["Combat Challenge"] }, when: equippedWith("light shield") },
        { wis: 15, class: "fighter", feature: { class: ["Ballet-a-thon"] }, when: equippedWith("light shield") },
        { wis: 15, class: "fighter", feature: { class: ["Combat Challenge"] } } ]

  "[DodgeGiants] should be defined":
    featDefined "DodgeGiants",
      name: "Dodge Giants"
      allows: [ race: "dwarf" ]
      disallows: [ race: "human" ]
      grants:
        tests:
          conditionalBonus: (npc) ->
            npc.defenses.ac.has(1, "feat", "vs large") and
              npc.defenses.ref.has(1, "feat", "vs large")

  "[DragonbornFrenzy] should be defined":
    featDefined "DragonbornFrenzy",
      name: "Dragonborn Frenzy"
      allows: [ race: "dragonborn" ]
      disallows: [ race: "human" ]
      grants:
        tests:
          conditionalBonus: (npc) ->
            npc.damage.general.has(2, "feat", "bloodied")

  "[DragonbornSenses] should be defined":
    featDefined "DragonbornSenses",
      name: "Dragonborn Senses"
      allows: [ race: "dragonborn" ]
      disallows: [ race: "human" ]
      grants:
        tests:
          lowLightVision: (npc) ->
            npc.vision is "low-light"

  "[Durable] should be defined":
    featDefined "Durable",
      name: "Durable"
      allows: [ {} ]
      grants:
        tests:
          moreHealingSurges: (npc) ->
            npc.healingSurge.count.has 2, "feat"

  "[DwarvenWeaponTraining] should be defined":
    featDefined "DwarvenWeaponTraining",
      name: "Dwarven Weapon Training"
      allows: [ race: "dwarf" ]
      disallows: [ race: "human" ]
      grants:
        proficiencies:
          weapons: [ "axe", "hammer" ]
        tests:
          conditionalBonus: (npc) ->
            npc.damage.general.has(2, "feat", "axe") and
              npc.damage.general.has(2, "feat", "hammer")

  "[EladrinSoldier] should be defined":
    featDefined "EladrinSoldier",
      name: "Eladrin Soldier"
      allows: [ race: "eladrin" ]
      disallows: [ race: "human" ]
      grants:
        proficiencies:
          weapons: [ "spear" ]
        tests:
          conditionalBonus: (npc) ->
            npc.damage.general.has(2, "feat", "longsword") and
              npc.damage.general.has(2, "feat", "spear")

  "[ElvenPrecision] should be defined":
    featDefined "ElvenPrecision",
      name: "Elven Precision"
      allows: [ race: "elf", when: hasPower("ElvenAccuracy", "encounter") ]
      disallows: [
        { race: "human", when: hasPower("ElvenAccuracy", "encounter") },
        { race: "elf" } ]
      grants:
        setup:
          when: hasPower "ElvenAccuracy", "encounter"
        tests:
          attackBonus: (npc) ->
            power = npc.powers.firstThat (whence, p) -> p.id is "ElvenAccuracy"
            power.bonus.has(2, "feat")

  "[EnlargedDragonBreath] should be defined":
    featDefined "EnlargedDragonBreath",
      name: "Enlarged Dragon Breath",
      allows: [ race: "dragonborn", when: hasPower("DragonBreath", "encounter") ],
      disallows: [
        { race: "human" },
        { race: "dragonborn" },
        { race: "human", when: hasPower("DragonBreath", "encounter") } ]
      grants:
        setup:
          when: (npc) -> npc.breath = {}
        tests:
          increasedRange: (npc) -> npc.breath.range is 5

  "[EscapeArtist] should be defined":
    featDefined "EscapeArtist",
      name: "Escape Artist"
      allows: [ trained: [ "acrobatics" ] ]
      disallows: [ trained: [ "athletics" ] ]
      grants:
        skill: { acrobatics: [2, "feat"] }

  "[ExpandedSpellbook] should be defined":
    featDefined "ExpandedSpellbook",
      name: "Expanded Spellbook"
      allows: [ wis: 13, class: "wizard" ]
      disallows: [
        { wis: 12, class: "wizard" },
        { wis: 13, class: "warlock" } ]
      grants:
        setup:
          when: (npc) ->
            npc.class = new Classes.Wizard(npc)
            npc.level = 9
        tests:
          shouldAddExtraDailyOfEachLevel: (npc) ->
            npc.powers.daily.length is 3 # 1, 5, 9
          shouldDefine_advanceItem_Daily: (npc) ->
            before = npc.powers.daily.length
            npc.advanceItem_Daily(npc)
            !npc.class.advanceItem_Daily? and npc.powers.daily.length is before+3

  "[RitualCaster] should be defined":
    featDefined "RitualCaster",
      name: "Ritual Caster"
      allows: [ { trained: [ "arcana" ] }, { trained: [ "religion" ] } ]
      disallows: [ {} ]
