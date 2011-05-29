Dragonborn = require './races/dragonborn'
Dwarf      = require './races/dwarf'
Eladrin    = require './races/eladrin'
Elf        = require './races/elf'
HalfElf    = require './races/half_elf'
Halfling   = require './races/halfling'
Human      = require './races/human'
Tiefling   = require './races/tiefling'

module.exports =
  Dragonborn: Dragonborn
  Dwarf     : Dwarf
  Eladrin   : Eladrin
  Elf       : Elf
  HalfElf   : HalfElf
  Halfling  : Halfling
  Human     : Human
  Tiefling  : Tiefling

  All: [ Dragonborn, Dwarf, Eladrin, Elf, HalfElf, Halfling, Human, Tiefling ]
