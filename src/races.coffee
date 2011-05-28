Dragonborn = require './races/dragonborn'
Dwarf      = require './races/dwarf'
Eladrin    = require './races/eladrin'
Elf        = require './races/elf'
HalfElf    = require './races/half_elf'

module.exports =
  Dragonborn: Dragonborn
  Dwarf     : Dwarf
  Eladrin   : Eladrin
  Elf       : Elf
  HalfElf   : HalfElf

  All: [ Dragonborn, Dwarf, Eladrin, Elf, HalfElf ]
