Attribute = require '../attribute'
Powers    = require '../powers'

module.exports = class Rogue
  constructor: (npc) ->
    @options = npc.options.rogue ? {}
    @name = Rogue.simpleName
    @powerSource = Rogue.powerSource
    @powerName = "exploit"
    @powers = Rogue.powers
    @skills = Rogue.skills
    @keyAttributes = [ "dex", "str", "cha" ]

    npc.proficiencies.armor.push "cloth"
    npc.proficiencies.armor.push "leather"

    npc.proficiencies.weapons.push "dagger"
    npc.proficiencies.weapons.push "handCrossbow"
    npc.proficiencies.weapons.push "shuriken"
    npc.proficiencies.weapons.push "sling"
    npc.proficiencies.weapons.push "shortSword"

    npc.defenses.ref.adjust "class", 2

    npc.attacks.sneakAttack = new Attribute 0

    npc.hitPoints.adjust "class", 12
    npc.hitPointsPerLevel = 5
    npc.healingSurge.count.adjust "class", 6

    npc.skills.stealth.trained = true
    npc.skills.thievery.trained = true
    npc.pendingSkills.push count: 4, list: Rogue.skills

    npc.feature "class", "First Strike"

    tactics = @options.tactics || npc.random.pick "Artful Dodger", "Brutal Scoundrel"
    npc.feature "class", tactics

    if tactics is "Artful Dodger"
      npc.defenses.ac.adjustWhen "vs opportunity attack", "class", =>
        npc.abilities.cha.modifier()
    else
      npc.attacks.sneakAttack.adjust "class", =>
        npc.abilities.str.modifier()

    npc.feature "class", "Rogue Weapon Talent"

    npc.feature "class", "Sneak Attack"
    npc.powers.atWill.push Powers.get("SneakAttack", npc: npc)

Rogue.simpleName = "rogue"
Rogue.source = "phb"
Rogue.powerSource = "martial"
Rogue.skills = [ "acrobatics", "athletics", "bluff", "dungeoneering", "insight", "intimidate", "perception", "stealth", "streetwise", "thievery" ]

Rogue.powers =
  atWill:
    1: [ "DeftStrike", "PiercingStrike", "RiposteStrike", "SlyFlourish" ]

  encounter:
    1: [ "DazingStrike", "KingsCastle", "PositioningStrike", "TorturousStrike" ]

  daily:
    1: [ "BlindingBarrage", "EasyTarget", "TrickStrike" ]
