Cleric  = require './classes/cleric'
Fighter = require './classes/fighter'
Paladin = require './classes/paladin'
Ranger  = require './classes/ranger'

module.exports =
  Cleric : Cleric
  Fighter: Fighter
  Paladin: Paladin
  Ranger : Ranger

  All: [ Cleric, Fighter, Paladin ]
