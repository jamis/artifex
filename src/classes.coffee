Cleric  = require './classes/cleric'
Fighter = require './classes/fighter'
Paladin = require './classes/paladin'
Ranger  = require './classes/ranger'
Rogue   = require './classes/rogue'

module.exports =
  Cleric : Cleric
  Fighter: Fighter
  Paladin: Paladin
  Ranger : Ranger
  Rogue  : Rogue

  All: [ Cleric, Fighter, Paladin, Ranger, Rogue ]
