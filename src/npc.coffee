Attribute = require './attribute'
Ability   = require './ability'
Random    = require './random'
Skill     = require './skill'

module.exports = class NPC
  constructor: ->
    @level = 1
    @speed = new Attribute
    @random = new Random
    @descriptors = []
    @languages = []
    @implements = []
    @feats = []
    @rituals = {}
    @alignment = "unaligned"

    @initializeAbilities()
    @initializeSkills()
    @initializePowers()
    @initializeFeatures()
    @initializeHitPoints()
    @initializeHealingSurges()
    @initializeProficiencies()
    @initializeDefenses()

  feature: (collection, name, description) ->
    @features[collection].push [name, description]

  hasFeature: (collection, name) ->
    for feature in @features[collection]
      return true if feature[0] is name
    false

  learnRitual: (level, name) ->
    @rituals[level] ||= []
    @rituals[level].push name

  initializeAbilities: ->
    @abilities =
      str: new Ability 10
      con: new Ability 10
      dex: new Ability 10
      int: new Ability 10
      wis: new Ability 10
      cha: new Ability 10

  initializeSkills: ->
    @skills =
      acrobatics   : new Skill @abilities.dex
      arcana       : new Skill @abilities.int
      athletics    : new Skill @abilities.str
      bluff        : new Skill @abilities.cha
      diplomacy    : new Skill @abilities.cha
      dungeoneering: new Skill @abilities.wis
      endurance    : new Skill @abilities.con
      heal         : new Skill @abilities.wis
      history      : new Skill @abilities.int
      insight      : new Skill @abilities.wis
      intimidate   : new Skill @abilities.cha
      nature       : new Skill @abilities.wis
      perception   : new Skill @abilities.wis
      religion     : new Skill @abilities.int
      stealth      : new Skill @abilities.dex
      streetwise   : new Skill @abilities.cha
      thievery     : new Skill @abilities.dex

  initializePowers: ->
    @powers =
      atWill   : []
      encounter: []
      daily    : []
      utility  : []

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

  initializeDefenses: ->
    @defenses =
      ac  : new Attribute 10
      fort: new Attribute 10
      ref : new Attribute 10
      will: new Attribute 10

    # FIXME: only apply dex modifier if armor is light, or none
    @defenses.ac.adjust => @abilities.dex.modifier()

    @defenses.fort.adjust =>
      [str, con] = [@abilities.str.modifier(), @abilities.con.modifier()]
      if str > con then str else con

    @defenses.ref.adjust =>
      [dex, int] = [@abilities.dex.modifier(), @abilities.int.modifier()]
      if dex > int then dex else int

    @defenses.will.adjust =>
      [wis, cha] = [@abilities.wis.modifier(), @abilities.cha.modifier()]
      if wis > cha then wis else cha

    halfLevel = => Math.floor(@level/2)

    @defenses.ac.adjust halfLevel
    @defenses.fort.adjust halfLevel
    @defenses.ref.adjust halfLevel
    @defenses.will.adjust halfLevel
