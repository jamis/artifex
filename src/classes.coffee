Cleric  = require './classes/cleric'
Fighter = require './classes/fighter'
Paladin = require './classes/paladin'
Ranger  = require './classes/ranger'
Rogue   = require './classes/rogue'
Warlock = require './classes/warlock'
Warlord = require './classes/warlord'

module.exports =
  Cleric : Cleric
  Fighter: Fighter
  Paladin: Paladin
  Ranger : Ranger
  Rogue  : Rogue
  Warlock: Warlock
  Warlord: Warlord

  All: [ Cleric, Fighter, Paladin, Ranger, Rogue, Warlock, Warlord ]
