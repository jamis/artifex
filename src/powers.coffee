DragonBreath = require './powers/dragon_breath'
Power        = require './power'

powerGetter = (key, initializers...) ->
  if typeof Powers[key] is "function"
    new Powers[key](initializers...)
  else
    new Power Powers[key], { id: key }, initializers...

module.exports = Powers =
  get: powerGetter
    
  DragonBreath: DragonBreath

for group in [ "cleric", "fighter", "paladin", "ranger", "rogue", "warlock", "warlord", "wizard" ]
  powers = require "./powers/#{group}"
  for label, data of powers
    throw "power `#{label}' is already defined outside of `#{group}'" if Powers[label]
    Powers[label] = data
