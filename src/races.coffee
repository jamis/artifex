Dragonborn = require './races/dragonborn'
Dwarf      = require './races/dwarf'
Eladrin    = require './races/eladrin'
Elf        = require './races/elf'

module.exports =
  Dragonborn: Dragonborn
  Dwarf     : Dwarf
  Eladrin   : Eladrin
  Elf       : Elf

  All: [ Dragonborn, Dwarf, Eladrin, Elf ]
