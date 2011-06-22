{Classes, NPC, Powers} = require '../..'

module.exports =
  "should be from PHB": (test) ->
    test.equal Classes.Rogue.source, "phb"
    test.done()

  "should have martial power source": (test) ->
    test.equal Classes.Rogue.powerSource, "martial"
    klass = new Classes.Rogue new NPC
    test.equal klass.powerSource, "martial"
    test.done()

  "should set name": (test) ->
    test.equal Classes.Rogue.simpleName, "rogue"
    klass = new Classes.Rogue new NPC
    test.equal klass.name, "rogue"
    test.done()

  "should set key attribute list": (test) ->
    klass = new Classes.Rogue new NPC
    test.deepEqual klass.keyAttributes, ["dex", "str", "cha"]
    test.done()

  "should set armor proficiencies": (test) ->
    new Classes.Rogue(npc = new NPC)
    for armor in ["cloth", "leather"]
      test.ok armor in npc.proficiencies.armor, "expected to find #{armor} in armor proficiencies"
    test.done()

  "should set weapon proficiencies": (test) ->
    new Classes.Rogue(npc = new NPC)
    for weapon in ["dagger", "handCrossbow", "shuriken", "sling", "shortSword"]
      test.ok weapon in npc.proficiencies.weapons, "expected to find #{weapon} in weapon proficiencies"
    test.done()

  "should prefer both melee and ranged weapons": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.equal npc.preferredWeaponStyle, "both"
    test.done()

  "should have +2 to reflex": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.ok npc.defenses.ref.has(2, "class"), "missing +2 class bonus to ref"
    test.done()

  "should have a +12 class bonus to HP": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.ok npc.hitPoints.has(12, "class"), "missing +12 class bonus to HP"
    test.done()

  "should set hitPointsPerLevel to 5": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.equal npc.hitPointsPerLevel, 5
    test.done()

  "should have +6 bonus to healingSurge.count": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.ok npc.healingSurge.count.has(6, "class"), "missing +6 class bonus to healingSurge.count"
    test.done()

  "should include appropriate skills as class skills": (test) ->
    test.ok "acrobatics" in Classes.Rogue.skills
    test.ok "athletics" in Classes.Rogue.skills
    test.ok "bluff" in Classes.Rogue.skills
    test.ok "dungeoneering" in Classes.Rogue.skills
    test.ok "insight" in Classes.Rogue.skills
    test.ok "intimidate" in Classes.Rogue.skills
    test.ok "perception" in Classes.Rogue.skills
    test.ok "stealth" in Classes.Rogue.skills
    test.ok "streetwise" in Classes.Rogue.skills
    test.ok "thievery" in Classes.Rogue.skills
    test.done()

  "should be trained in stealth and thievery": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.ok npc.skills.stealth.trained
    test.ok npc.skills.thievery.trained
    test.done()

  "should add 4 pending skills": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.equal npc.pendingSkills[0].count, 4
    test.deepEqual npc.pendingSkills[0].list, Classes.Rogue.skills
    test.done()

  "should add class features": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.ok npc.hasFeature("class", "First Strike"), "missing First Strike feature"
    rogueTactics = npc.hasFeature("class", "Artful Dodger") or
      npc.hasFeature("class", "Brutal Scoundrel")
    test.ok rogueTactics, "missing Rogue Tactics feature"
    test.ok npc.hasFeature("class", "Rogue Weapon Talent"), "missing Rogue Weapon Talent feature"
    test.ok npc.hasFeature("class", "Sneak Attack"), "missing Sneak Attack feature"
    test.done()

  "should add attribute for storing sneak attack bonuses": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.ok npc.attacks.sneakAttack?
    test.equal npc.attacks.sneakAttack.score(), 0
    test.done()
    
  "rogue: tactics option should select rogue tactics": (test) ->
    new Classes.Rogue(npc = new NPC rogue: { tactics: "Artful Dodger" })
    test.ok npc.hasFeature("class", "Artful Dodger")
    new Classes.Rogue(npc = new NPC rogue: { tactics: "Brutal Scoundrel" })
    test.ok npc.hasFeature("class", "Brutal Scoundrel")
    test.done()
    
  "artful dodger should have conditional AC adjustment": (test) ->
    new Classes.Rogue(npc = new NPC rogue: { tactics: "Artful Dodger" })
    test.equal npc.defenses.ac.adjustment("vs opportunity attack"), 0
    npc.abilities.cha.baseValue = 16
    test.equal npc.defenses.ac.adjustment("vs opportunity attack"), 3
    test.done()

  "brutal scoundrel should have bonus to sneak attack": (test) ->
    new Classes.Rogue(npc = new NPC rogue: { tactics: "Brutal Scoundrel" })
    test.equal npc.attacks.sneakAttack.score(), 0
    npc.abilities.str.baseValue = 16
    test.equal npc.attacks.sneakAttack.score(), 3
    test.done()

  "should grant SneakAttack power (via Sneak Attack)": (test) ->
    new Classes.Rogue(npc = new NPC)
    test.equal npc.powers.atWill.length, 1
    test.equal npc.powers.atWill[0].name, "Sneak Attack"
    test.done()

  "rogue powers are called exploits": (test) ->
    klass = new Classes.Rogue(new NPC)
    test.equal klass.powerName, "exploit"
    test.done()

  "level-1 exploits are accounted for": (test) ->
    for power in [ "DeftStrike", "PiercingStrike", "RiposteStrike", "SlyFlourish" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.atWill[1]

    for power in [ "DazingStrike", "KingsCastle", "PositioningStrike", "TorturousStrike" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.encounter[1]

    for power in [ "BlindingBarrage", "EasyTarget", "TrickStrike" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.daily[1]

    klass = new Classes.Rogue(new NPC)
    test.equal Classes.Rogue.powers, klass.powers
    test.done()

  "level-2 exploits are accounted for": (test) ->
    for power in [ "FleetingGhost", "GreatLeap", "MasterOfDeceit", "QuickFingers", "Tumble" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.utility[2]
    test.done()

  "level-3 exploits are accounted for": (test) ->
    for power in [ "BaitAndSwitch", "SetupStrike", "ToppleOver", "TrickstersBlade" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.encounter[3]
    test.done()

  "level-5 exploits are accounted for": (test) ->
    for power in [ "CleverRiposte", "DeepCut", "WalkingWounded" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.daily[5]
    test.done()

  "level-6 exploits are accounted for": (test) ->
    for power in [ "Chameleon", "IgnobleEscape", "MobMentality", "NimbleClimb", "SlipperyMind" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.utility[6]
    test.done()

  "level-7 exploits are accounted for": (test) ->
    for power in [ "CloudOfSteel", "ImperilingStrike", "RoguesLuck", "SandInTheEyes" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.encounter[7]
    test.done()

  "level-9 exploits are accounted for": (test) ->
    for power in [ "CrimsonEdge", "DeadlyPositioning", "Knockout" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.daily[9]
    test.done()

  "level-10 exploits are accounted for": (test) ->
    for power in [ "CertainFreedom", "CloseQuarters", "DangerousTheft", "ShadowStride" ]
      test.ok Powers[power], "`#{power}' is not defined"
      if Powers[power]
        test.ok power in Classes.Rogue.powers.utility[10]
    test.done()
