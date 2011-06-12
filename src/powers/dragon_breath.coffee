module.exports = class DragonBreath
  constructor: (@npc, descriptor) ->
    @name = "Dragon breath (#{descriptor})"
    @range = true
    @attack = true
    @hit = true
    @keywords = [ descriptor ]

  get: (name) ->
    switch name
      when "range"
        "Close burst #{@npc.breath.range}"
      when "attack"
        bonus = Math.ceil(@npc.level / 10) * 2
        bonus += @npc.attacks.general.adjustment(@keywords[0])
        total = @npc.abilities[@npc.breath.ability].modifier() + bonus
        "#{@npc.breath.ability}+#{bonus} (+#{total}) vs. Reflex"
      when "hit"
        dice = Math.ceil(@npc.level / 10)
        damage = "#{dice}d6"
        con = @npc.abilities.con.modifier()
        damage += "+#{con}" if con != 0
        damage
      else
        this[name]
