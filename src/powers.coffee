DragonBreath   = require './powers/dragon_breath'
Generic        = require './powers/generic'

powerGetter = (key, initializers...) ->
  if typeof Powers[key] is "function"
    new Powers[key](initializers...)
  else
    new Generic Powers[key], { id: key }, initializers...

module.exports = Powers =
  get: powerGetter
    
  DragonBreath  : DragonBreath
  Generic       : Generic

for group in [ "cleric", "fighter", "paladin" ]
  powers = require "./powers/#{group}"
  for label, data of powers
    throw "power `#{label}' is already defined outside of `#{group}'" if Powers[label]
    Powers[label] = data
