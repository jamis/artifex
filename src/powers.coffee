Power = require './power'

module.exports = Powers =
  get: (collection, key, initializers...) ->
    new Power Powers.collections[collection][key],
      { collection: collection, id: key },
      initializers...
    
  collections:
    racial : require "./powers/racial"

    cleric : require "./powers/cleric"
    fighter: require "./powers/fighter"
    paladin: require "./powers/paladin"
    ranger : require "./powers/ranger"
    rogue  : require "./powers/rogue"
    warlock: require "./powers/warlock"
    warlord: require "./powers/warlord"
    wizard : require "./powers/wizard"

    angelicAvenger   : require "./powers/angelic_avenger"
    astralWeapon     : require "./powers/astral_weapon"
    battleCaptain    : require "./powers/battle_captain"
    battleMage       : require "./powers/battle_mage"
    battlefieldArcher: require "./powers/battlefield_archer"
    beastStalker     : require "./powers/beast_stalker"
    bloodMage        : require "./powers/blood_mage"
    catBurglar       : require "./powers/cat_burglar"
    championOfOrder  : require "./powers/champion_of_order"
    combatVeteran    : require "./powers/combat_veteran"
    daggermaster     : require "./powers/daggermaster"
    divineOracle     : require "./powers/divine_oracle"
    doomsayer        : require "./powers/doomsayer"
    feytouched       : require "./powers/feytouched"
    hospitaler       : require "./powers/hospitaler"
    ironVanguard     : require "./powers/iron_vanguard"
    justiciar        : require "./powers/justiciar"
    kensei           : require "./powers/kensei"
    knightCommander  : require "./powers/knight_commander"
    lifeStealer      : require "./powers/life_stealer"
    masterInfiltrator: require "./powers/master_infiltrator"
    pathfinder       : require "./powers/pathfinder"
    pitFighter       : require "./powers/pit_fighter"
    radiantServant   : require "./powers/radiant_servant"
    shadowAssassin   : require "./powers/shadow_assassin"
    spellstormMage   : require "./powers/spellstorm_mage"
    stormwarden      : require "./powers/stormwarden"
    swordMarshal     : require "./powers/sword_marshal"
    swordmaster      : require "./powers/swordmaster"
    warpriest        : require "./powers/warpriest"
    wizardOfTheSpiralTower: require "./powers/wizard_of_the_spiral_tower"
