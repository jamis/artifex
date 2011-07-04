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
    battlefieldArcher: require "./powers/battlefield_archer"
    beastStalker     : require "./powers/beast_stalker"
    catBurglar       : require "./powers/cat_burglar"
    championOfOrder  : require "./powers/champion_of_order"
    daggermaster     : require "./powers/daggermaster"
    divineOracle     : require "./powers/divine_oracle"
    hospitaler       : require "./powers/hospitaler"
    ironVanguard     : require "./powers/iron_vanguard"
    justiciar        : require "./powers/justiciar"
    kensei           : require "./powers/kensei"
    masterInfiltrator: require "./powers/master_infiltrator"
    pathfinder       : require "./powers/pathfinder"
    pitFighter       : require "./powers/pit_fighter"
    radiantServant   : require "./powers/radiant_servant"
    shadowAssassin   : require "./powers/shadow_assassin"
    stormwarden      : require "./powers/stormwarden"
    swordmaster      : require "./powers/swordmaster"
    warpriest        : require "./powers/warpriest"
