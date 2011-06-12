Ability   = require './ability'
Attribute = require './attribute'
Armor     = require './armor'
Classes   = require './classes'
Feats     = require './feats'
Powers    = require './powers'
Races     = require './races'
Random    = require './random'
Skill     = require './skill'
Weapons   = require './weapons'

module.exports = class NPC
  constructor: (@options) ->
    @options ?= {}
    @level = 1
    @speed = new Attribute
    @random = new Random
    @descriptors = []
    @languages = []
    @weaponPreferences = []
    @supportedImplements = []
    @feats = []
    @pendingFeats = [count: 1]
    @pendingPowers = []
    @rituals = {}
    @alignment = "unaligned"
    @pendingSkills = []
    @gender = @options.gender
    @callbacks = {}

    @initializeAbilities()
    @initializeSkills()
    @initializePowers()
    @initializeFeatures()
    @initializeHitPoints()
    @initializeHealingSurges()
    @initializeProficiencies()
    @initializeAttacks()
    @initializeDamage()
    @initializeDefenses()
    @initializeResistance()
    @initializeEquipment()

  when: (event, callback) ->
    @callbacks[event] ?= []
    @callbacks[event].push callback

  fire: (event) ->
    for callback in (@callbacks[event] ? [])
      callback(this)

  feature: (collection, name, description) ->
    @features[collection].push [name, description]

  hasFeature: (collection, name) ->
    for feature in @features[collection]
      return true if feature[0] is name
    false

  learnRitual: (level, name) ->
    @rituals[level] ||= []
    @rituals[level].push name

  generate: ->
    @gender ?= @random.pick "male", "female"
    @alignment = @options.alignment ? @random.pick "lawful good", "good", "unaligned", "evil", "chaotic evil"

    race = @options.race ? @random.pick Races.All...
    @race = new race this

    klass = @options.class ? @random.pick Classes.All...
    @class = new klass this

    @generateAbilityScores()
    @selectTrainedSkills()
    @selectPendingFeats()

    @selectArmor()
    @selectWeapons()

    @selectPowers()

    this

  initializeAbilities: ->
    @abilities =
      "str": new Ability 10
      "con": new Ability 10
      "dex": new Ability 10
      "int": new Ability 10
      "wis": new Ability 10
      "cha": new Ability 10
    @abilities.int_ = @abilities["int"]

  initializeSkills: ->
    @skills =
      acrobatics   : new Skill @abilities.dex
      arcana       : new Skill @abilities.int_
      athletics    : new Skill @abilities.str
      bluff        : new Skill @abilities.cha
      diplomacy    : new Skill @abilities.cha
      dungeoneering: new Skill @abilities.wis
      endurance    : new Skill @abilities.con
      heal         : new Skill @abilities.wis
      history      : new Skill @abilities.int_
      insight      : new Skill @abilities.wis
      intimidate   : new Skill @abilities.cha
      nature       : new Skill @abilities.wis
      perception   : new Skill @abilities.wis
      religion     : new Skill @abilities.int_
      stealth      : new Skill @abilities.dex
      streetwise   : new Skill @abilities.cha
      thievery     : new Skill @abilities.dex

  initializePowers: ->
    @powers =
      atWill   : []
      encounter: []
      daily    : []
      utility  : []

      find: (category, name) ->
        for power in this[category]
          return power if power.name is name or power.id is name
        null

      firstThat: (callback) ->
        for category in [ "atWill", "encounter", "daily", "utility" ]
          for power in this[category]
            if callback(category, power)
              return power
        undefined

    @powersToSelect =
      atWill   : { count: 2 }
      encounter: { count: 1 }
      daily    : { count: 1 }
      utility  : { count: 0 }

  initializeFeatures: ->
    @features =
      racial: []
      class: []

  initializeHitPoints: ->
    @hitPoints = new Attribute => @abilities.con.score()

  initializeHealingSurges: ->
    @healingSurge =
      value: new Attribute => Math.floor(@hitPoints.score() / 4)
      count: new Attribute => @abilities.con.modifier()

  initializeProficiencies: ->
    @proficiencies =
      armor: []
      weapons: []

  initializeAttacks: ->
    @attacks =
      general: new Attribute 0

  initializeDamage: ->
    @damage =
      general: new Attribute 0

  initializeDefenses: ->
    @defenses =
      ac  : new Attribute 10
      fort: new Attribute 10
      ref : new Attribute 10
      will: new Attribute 10
      save: new Attribute  0

    # FIXME: only apply dex modifier if armor is light, or none
    @defenses.ac.adjust =>
      if !@armor? || Armor[@armor].category == "light"
        @abilities.dex.modifier()
      else
        0

    @defenses.fort.adjust =>
      [str, con] = [@abilities.str.modifier(), @abilities.con.modifier()]
      if str > con then str else con

    @defenses.ref.adjust =>
      [dex, int_] = [@abilities.dex.modifier(), @abilities.int_.modifier()]
      if dex > int_ then dex else int_

    @defenses.will.adjust =>
      [wis, cha] = [@abilities.wis.modifier(), @abilities.cha.modifier()]
      if wis > cha then wis else cha

    halfLevel = => Math.floor(@level/2)

    @defenses.ac.adjust halfLevel
    @defenses.fort.adjust halfLevel
    @defenses.ref.adjust halfLevel
    @defenses.will.adjust halfLevel

  initializeResistance: ->
    @resistance =
      fire: new Attribute 0

  initializeEquipment: ->
    @equipment = []
    @equipment.weapons = ->
      weapons = []
      for item in this
        weapons.push(item) if Weapons.all[item]?
      weapons
      
  generateAbilityScores: ->
    reverseSort = (a, b) -> if a < b then 1 else if a > b then -1 else 0

    best3of4 = =>
      result = 0
      for die in (@random.d(6) for i in [1..4]).sort(reverseSort).slice(0, 3)
        result += die
      result

    scores = (best3of4() for i in [1..6]).sort(reverseSort)
    nonKeyAttributes = []
    for ability in ["str", "con", "dex", "int", "wis", "cha"]
      unless ability in @class.keyAttributes
        nonKeyAttributes.push ability
    nonKeyAttributes = @random.shuffle(nonKeyAttributes...)
    attributes = @class.keyAttributes.concat(nonKeyAttributes)

    for index in [0..5]
      @abilities[attributes[index]].baseValue = scores[index]

    @fire "scoresAssigned"

  selectTrainedSkills: ->
    skills = (name for name, skill of @skills)

    for request in @pendingSkills
      list = request.list || skills
      list = list(this) if typeof list is "function"
      
      # select only untrained skills
      untrained = []
      for skill in list
        untrained.push(skill) unless @skills[skill].trained

      untrained = @random.shuffle(untrained...)
      for n in [1..request.count]
        skill = untrained.pop()
        break unless skill?
        @skills[skill].trained = true

    @pendingSkills = []

  selectPendingFeats: ->
    for pendingItems in @pendingFeats
      feats = []

      for name, feat of Feats
        feats.push(feat) if feat.allows(this)

      feats = @random.shuffle(feats...)
      for feat in feats.slice(0, pendingItems.count)
        feat.applyTo this

    @pendingFeats = []

  isSuitablePower: (id) ->
    power = Powers.get id, npc: this

    types = power.get "attackTypes"
    return true unless types?

    hasRanged = hasMelee = false
    for weapon in @equipment.weapons()
      if Weapons.category(weapon, "ranged")
        hasRanged = true
      else if Weapons.category(weapon, "melee")
        hasMelee = true

    valid = false
    for type in types
      switch type
        when "ranged weapon" then valid |= hasRanged
        when "melee weapon" then valid |= hasMelee
        else valid = true

    valid

  suitablePowersIn: (list) ->
    suitable = []
    for power in list
      suitable.push power if @isSuitablePower(power)
    suitable

  selectPowersFor: (category) ->
    if @powersToSelect[category].count > 0
      list = @suitablePowersIn @class.powers[category][1]
      for power in @random.shuffle(list...).slice(0, @powersToSelect[category].count)
        power = Powers.get power, npc: this
        @powers[category].push power

  selectPowers: ->
    @selectPowersFor "atWill"
    @selectPowersFor "encounter"
    @selectPowersFor "daily"
    @selectPowersFor "utility"

    for pending in @pendingPowers
      list = if typeof pending.list is "function" then pending.list(this) else pending.list

      # disallow selection of powers that have already been selected
      available = []
      for power in list
        available.push power if !@powers.find(pending.category, power)? && @isSuitablePower(power)

      for power in @random.shuffle(available...).slice(0, pending.count)
        @powers[pending.category].push(Powers.get power, npc: this)

    @pendingPowers = []

  selectArmor: ->
    best = undefined

    for armor in Armor.Categories.armors
      if Armor.allows(this, armor) && (!best? || (Armor[best].bonus < Armor[armor].bonus))
        best = armor

    Armor.applyTo(this, best) if best

  selectWeapons: ->
    if @weaponPreferences.length is 0
      @weaponPreferences.push count: 1

    for pref in @weaponPreferences
      for count in [1..pref.count]
        proficient = []

        for weapon, data of Weapons.all
          continue if weapon in @equipment

          isProficient = Weapons.proficient(this, weapon)
          isPreferred = !pref.type? or Weapons.category(weapon, pref.type)

          if isProficient and isPreferred
            if @preferredWeaponHandCount is 2 and @size is "small" and "versatile" in data.properties
              proficient.push weapon
            else if data.hands is (@preferredWeaponHandCount ? data.hands)
              proficient.push weapon

        @equipment.push @random.pick(proficient...)

    @weaponPreferences = []
