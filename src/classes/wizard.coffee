Feats   = require '../feats'
Powers  = require '../powers'
Rituals = require '../rituals'

module.exports = class Wizard
  constructor: (npc) ->
    @options = npc.options.wizard ? {}
    @name = Wizard.simpleName
    @powerSource = Wizard.powerSource
    @powerName = "spell"
    @powers = Wizard.powers
    @skills = Wizard.skills
    @keyAttributes = [ "int", "wis", "dex" ]

    npc.proficiencies.armor.push "cloth"

    npc.proficiencies.weapons.push "dagger"
    npc.proficiencies.weapons.push "quarterstaff"

    npc.supportedImplements.push "orb"
    npc.supportedImplements.push "staff"
    npc.supportedImplements.push "wand"

    npc.defenses.will.adjust "class", 2
    npc.hitPoints.adjust "class", 10
    npc.hitPointsPerLevel = 4
    npc.healingSurge.count.adjust "class", 6

    npc.skills.arcana.trained = true
    npc.pendingSkills.push count: 3, list: Wizard.skills

    implement = @options.mastery ? npc.random.pick "Orb", "Staff", "Wand"
    switch implement
      when "Orb"
        npc.feature "class", "Orb of Imposition"
        npc.equipment.push "orb"
      when "Staff"
        npc.feature "class", "Staff of Defense"
        npc.equipment.push "quarterstaff"
      when "Wand"
        npc.feature "class", "Wand of Accuracy"
        npc.equipment.push "wand"
      else
        throw new Error "unknown mastery implement `#{implement}'"

    npc.feature "class", "Cantrips"
    npc.powers.atWill.push Powers.get("wizard", "GhostSound", npc: npc)
    npc.powers.atWill.push Powers.get("wizard", "Light", npc: npc)
    npc.powers.atWill.push Powers.get("wizard", "MageHand", npc: npc)
    npc.powers.atWill.push Powers.get("wizard", "Prestidigitation", npc: npc)

    npc.feature "class", "Ritual Casting"
    Feats.RitualCaster.applyTo npc

    npc.feature "class", "Spellbook"
    for ritual in npc.random.shuffle(Rituals.all(1)...)[0...3]
      npc.learnRitual 1, ritual

    npc.selectInitialPowers = ->
      @selectPowersFor "atWill", 2
      @selectPowersFor "encounter", 1
      @selectPowersFor "daily", 2

    npc.advanceItem_Utility = ->
      @selectPowersFor "utility", 2

    npc.advanceItem_Daily = ->
      @selectPowersFor "daily", 2

    npc.when "advance:after", =>
      @considerRitualsFor npc
        
  considerRitualsFor: (npc) ->
    if npc.level in [5, 11, 15, 21, 25]
      @addHighestLevelRitualsFor npc

  relevantRitualsFor: (npc, level) ->
    list = []
    for ritual in Rituals.all(level)
      list.push(ritual) unless ritual in (npc.rituals[level] ? [])
    list

  addHighestLevelRitualsFor: (npc) ->
    level = npc.level
    remaining = 2
    while level > 0
      list = npc.random.shuffle(@relevantRitualsFor(npc, level)...)[0...remaining]
      for ritual in list
        npc.learnRitual level, ritual
        remaining--
      break if remaining is 0
      level--

Wizard.simpleName = "wizard"
Wizard.source = "phb"
Wizard.powerSource = "arcane"
Wizard.skills = [ "arcana", "diplomacy", "dungeoneering", "history", "insight", "nature", "religion" ]

Wizard.powers =
  atWill:
    1: [ "CloudOfDaggers", "MagicMissile", "RayOfFrost", "ScorchingBurst", "Thunderwave" ]

  encounter:
    1 : [ "BurningHands", "ChillStrike", "ForceOrb", "IcyTerrain", "RayOfEnfeeblement" ]
    3 : [ "ColorSpray", "FireShroud", "IcyRays", "ShockSphere" ]
    7 : [ "FireBurst", "LightningBolt", "SpectralRam", "WintersWrath" ]
    13: [ "Frostburn", "MesmericHold", "PrismaticBurst", "Thunderlance" ]
    17: [ "Combust", "CrushingTitansFist", "ForceVolley", "IceTomb" ]

  daily:
    1 : [ "AcidArrow", "FlamingSphere", "FreezingCloud", "Sleep" ]
    5 : [ "BigbysIcyGrasp", "Fireball", "StinkingCloud", "Web" ]
    9 : [ "IceStorm", "LightningSerpent", "MordenkainensSword", "WallOfFire" ]
    15: [ "BigbysGraspingHands", "BlastOfCold", "OtilukesResilientSphere", "PrismaticBeams", "WallOfIce" ]
    19: [ "AcidWave", "Cloudkill", "Disintegrate", "EvardsBlackTentacles" ]

  utility:
    2 : [ "ExpeditiousRetreat", "FeatherFall", "Jump", "Shield" ]
    6 : [ "DimensionDoor", "DisguiseSelf", "DispelMagic", "Invisibility", "Levitate", "WallOfFog" ]
    10: [ "ArcaneGate", "Blur", "MirrorImage", "Resistance" ]
    16: [ "Displacement", "Fly", "GreaterInvisibility", "Stoneskin" ]
