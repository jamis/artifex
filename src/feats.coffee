Armor     = require './armor'
Attribute = require './attribute'
Languages = require './languages'
Powers    = require './powers'
Rituals   = require './rituals'
Weapons   = require './weapons'

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
      when "str", "con", "dex", "int", "int_", "wis", "cha"
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
      when "power"
        return @processCombination(value, (id) ->
          npc.powers.firstThat (whence, power) -> power.id is id)
      when "weapon"
        for weapon in npc.equipment.weapons()
          switch value
            when "projectile"
              return true if Weapons.isProjectile(weapon)
            when "thrown"
              return true if Weapons.isThrown(weapon)
            when weapon
              return true
            else
              return true if weapons.category(weapon, value)
              return true if Weapons.group(weapon, value)
        false
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
              for info in list
                power = Powers.get info.collection, info.id, npc: npc
                npc.powers[category].push power
          when "proficiencies"
            for category, list of value
              for item in list
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

proficientWithAll = (weapons...) ->
  (npc) ->
    for weapon in weapons
      return false if weapon not in npc.proficiencies.weapons
    true

pact = (pact) ->
  (npc) -> npc.hasFeature "class", "#{pact} Pact"

presence = (presence) ->
  (npc) -> npc.hasFeature "class", "#{presence} Presence"

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
        encounter: [ collection: "cleric", id: "ArmorOfBahamut" ]

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
        armor: [ "chainmail" ]

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
        armor: [ "hide" ]

  LeatherProficiency: new Feat
    name: "Armor Proficiency (Leather)"
    forbids:
      proficiencies:
        armor: "leather"
    grants:
      proficiencies:
        armor: [ "leather" ]

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
        armor: [ "plate" ]

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
        armor: [ "scale" ]

  AstralFire: new Feat(name: "Astral Fire", requires: { dex: 13, cha: 13 })

  AvandrasRescue: new Feat
    name: "Avandra's Rescue"
    requires:
      deity: "Avandra"
      feature: { class: [ "Channel Divinity" ] }
    grants:
      power:
        encounter: [ collection: "cleric", id: "AvandrasRescue" ]

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
      int_: 13
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
        encounter: [ collection: "cleric", id: "CorellonsGrace" ]

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

  Durable: new Feat
    name: "Durable"
    grants:
      apply: (npc) ->
        npc.healingSurge.count.adjust "feat", 2

  DwarvenWeaponTraining: new Feat
    name: "Dwarven Weapon Training"
    requires:
      race: "dwarf"
    grants:
      proficiencies:
        weapons: [ "axe", "hammer" ]
      apply: (npc) ->
        npc.damage.general.adjustWhen "axe", "feat", 2
        npc.damage.general.adjustWhen "hammer", "feat", 2

  EladrinSoldier: new Feat
    name: "Eladrin Soldier"
    requires:
      race: "eladrin"
    grants:
      proficiencies:
        weapons: [ "spear" ]
      apply: (npc) ->
        npc.damage.general.adjustWhen "longsword", "feat", 2
        npc.damage.general.adjustWhen "spear", "feat", 2

  ElvenPrecision: new Feat
    name: "Elven Precision"
    requires:
      race: "elf"
      power: "ElvenAccuracy"
    grants:
      apply: (npc) ->
        power = npc.powers.firstThat (whence, p) -> p.id is "ElvenAccuracy"
        power.bonus.adjust "feat", 2

  EnlargedDragonBreath: new Feat
    name: "Enlarged Dragon Breath"
    requires:
      race: "dragonborn"
      power: "DragonBreath"
    grants:
      apply: (npc) -> npc.breath.range = 5

  EscapeArtist: new Feat
    name: "Escape Artist"
    requires:
      trained: "acrobatics"
    grants:
      skill:
        acrobatics: [2, "feat"]

  ExpandedSpellbook: new Feat
    name: "Expanded Spellbook"
    requires:
      wis: 13
      class: "wizard"
    grants:
      apply: (npc) ->
        for level in [1..npc.level]
          if npc.class.powers.daily[level]?
            list = npc.suitablePowersIn(npc.class.powers.daily[level])
            id = npc.random.pick(list...)
            npc.powers.daily.push Powers.get(npc.class.name, id, npc: npc)

        npc.advanceItem_Daily = -> @selectPowersFor "daily", 3

  FarShot: new Feat
    name: "Far Shot"
    requires:
      dex: 13
      weapon: "projectile"

  FarThrow: new Feat
    name: "Far Throw"
    requires:
      str: 13
      weapon: "thrown"

  FastRunner: new Feat
    name: "Fast Runner"
    requires: { con: 13 }

  FerociousRebuke: new Feat
    name: "Ferocious Rebuke"
    requires: { race: "tiefling" }

  GroupInsight: new Feat
    name: "Group Insight"
    requires: { race: "half-elf" }

  HalflingAgility: new Feat
    name: "Halfling Agility"
    requires: { race: "halfling" }

  HarmonyOfErathis: new Feat
    name: "Harmony of Erathis"
    requires:
      deity: "Erathis"
      feature: { class: [ "Channel Divinity" ] }
    grants:
      power:
        encounter: [ collection: "cleric", id: "HarmonyOfErathis" ]

  HealingHands: new Feat
    name: "Healing Hands"
    requires:
      class: "paladin"
      power: "LayOnHands"

  HellfireBlood: new Feat
    name: "Hellfire Blood"
    requires:
      race: "tiefling"

  HumanPerseverance: new Feat
    name: "Human Perseverance"
    requires:
      race: "human"
    grants:
      apply: (npc) -> npc.defenses.save.adjust "feat", +1

  ImprovedDarkOnesBlessing: new Feat
    name: "Improved Dark One's Blessing"
    requires:
      con: 15
      class: "warlock"
      with: pact("Infernal")

  ImprovedFateOfTheVoid: new Feat
    name: "Improved Fate of the Void"
    requires:
      class: "warlock"
      with: (npc) ->
        npc.hasFeature("class", "Star Pact") and
          (npc.abilities.con.score() >= 13 or npc.abilities.cha.score() >= 13)

  ImprovedInitiative: new Feat
    name: "Improved Initiative"
    grants:
      apply: (npc) -> npc.initiative.adjust "feat", +4

  ImprovedMistyStep: new Feat
    name: "Improved Misty Step"
    requires:
      int: 13
      class: "warlock"
      with: pact("Fey")

  InspiredRecovery: new Feat
    name: "Inspired Recovery"
    requires:
      class: "warlord"
      with: presence("Inspiring")

  IounsPoise: new Feat
    name: "Ioun's Poise"
    requires:
      deity: "Ioun"
      feature: { class: [ "Channel Divinity" ] }
    grants:
      power:
        encounter: [ collection: "cleric", id: "IounsPoise" ]

  JackOfAllTrades: new Feat
    name: "Jack of All Trades"
    requires: { int: 13 }
    grants:
      apply: (npc) ->
        for name, skill of npc.skills
          do (skill) ->
            skill.adjust "feat", => if skill.trained then 0 else 2

  KordsFavor: new Feat
    name: "Kord's Favor"
    requires:
      deity: "Kord"
      feature: { class: [ "Channel Divinity" ] }
    grants:
      power:
        encounter: [ collection: "cleric", id: "KordsFavor" ]

  LethalHunter: new Feat
    name: "Lethal Hunter"
    requires:
      class: "ranger"
      feature: { class: [ "Hunter's Quarry" ] }
    grants:
      apply: (npc) -> npc.quarryDie = 8

  LightStep: new Feat
    name: "Light Step"
    requires: { race: "elf" }
    grants:
      apply: (npc) ->
        npc.skills.acrobatics.adjust "feat", 1
        npc.skills.stealth.adjust "feat", 1

  Linguist: new Feat
    name: "Linguist"
    requires: { int: 13 }
    multiple: true
    grants:
      apply: (npc) ->
        langs = Languages.possible(npc)
        for lang in npc.random.shuffle(langs...)[0...3]
          npc.languages.push(lang)

  LongJumper: new Feat
    name: "Long Jumper"
    requires: { trained: "athletics" }
    grants:
      apply: (npc) -> npc.skills.athletics.adjust "feat", +1

  LostInTheCrowd: new Feat
    name: "Lost in the Crowd"
    requires: { race: "halfing" }

  # FIXME: taking RitualCaster ought to grant an initial ritual or two
  RitualCaster: new Feat
    name: "Ritual Caster"
    requires:
      trained: "religion|arcana"
    grants:
      apply: (npc) ->
        npc.advanceItem_RitualCaster = ->
          if npc.random.number(100) < 50
            list = []
            for level in [1..npc.level]
              for ritual in Rituals.all(level)
                unless ritual in (npc.rituals[level] ? [])
                  list.push v: [level, ritual], w: Math.pow(31 - level, 2)
            [level, ritual] = npc.random.pickw(list...)
            npc.learnRitual level, ritual

        npc.when "advance:after", -> npc.advanceItem_RitualCaster()
