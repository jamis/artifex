Cleric  = require './classes/cleric'
Fighter = require './classes/fighter'
Paladin = require './classes/paladin'
Ranger  = require './classes/ranger'
Rogue   = require './classes/rogue'
Warlock = require './classes/warlock'
Warlord = require './classes/warlord'
Wizard  = require './classes/wizard'

module.exports =
  Cleric : Cleric
  Fighter: Fighter
  Paladin: Paladin
  Ranger : Ranger
  Rogue  : Rogue
  Warlock: Warlock
  Warlord: Warlord
  Wizard : Wizard

  All: [ Cleric, Fighter, Paladin, Ranger, Rogue, Warlock, Warlord, Wizard ]
