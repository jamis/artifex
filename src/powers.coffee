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

    angelicAvenger: require "./powers/angelic_avenger"
    divineOracle  : require "./powers/divine_oracle"
    ironVanguard  : require "./powers/iron_vanguard"
    kensei        : require "./powers/kensei"
    pitFighter    : require "./powers/pit_fighter"
    radiantServant: require "./powers/radiant_servant"
    warpriest     : require "./powers/warpriest"
