hasPact = (pact) ->
  -> @npc.hasFeature("class", "#{pact} Pact")

module.exports =
  WarlocksCurse:
    name        : "Warlock's Curse"
    effect      : "+{hitDice}d6 extra damage (special)"
    _formulae   : { hitDice: -> @byLevel [1, 11], [2, 21], 3 }

  DireRadiance:
    name        : "Dire Radiance"
    keywords    : [ "arcane", "fear", "implement", "radiant" ]
    attack      : "{±con} vs. Fortitude"
    hit         : "{hitDice}d6{±con.nz} damage (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

  EldritchBlast:
    name        : "Eldritch Blast"
    keywords    : [ "arcane", "implement" ]
    attack      : "{±ability} vs. Reflex"
    hit         : "{hitDice}d10{±ability.nz} damage"
    _formulae   :
      hitDice   : -> @byLevel [1, 21], 2
      abilityM  : -> @npc.abilities[@ability].modifier()
      "±ability": -> @signed @abilityM()
      "±ability.nz": -> if @abilityM() is 0 then "" else @signed @abilityM()

  Eyebite:
    name        : "Eyebite"
    keywords    : [ "arcane", "charm", "implement", "psychic" ]
    attack      : "{±cha} vs. Will"
    hit         : "{hitDice}d6{±cha.nz} damage (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

  HellishRebuke:
    name        : "Hellish Rebuke"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±con} vs. Reflex"
    hit         : "{hitDice}d6{±con.nz} damage (special)"
    _formulae   : { hitDice: -> @byLevel [1, 21], 2 }

  DiabolicGrasp:
    name        : "Diabolic Grasp"
    keywords    : [ "arcane", "implement" ]
    attack      : "{±con} vs. Fortitude"
    hit         : "2d8{±con.nz} damage, slide target {distance} {squares}"
    _formulae   :
      infernal: hasPact "Infernal"
      distance: -> if @infernal() then @intM()+1 else 2
      squares : -> @plural @distance(), 'square', 'squares'

  DreadfulWord:
    name        : "Dreadful Word"
    keywords    : [ "arcane", "fear", "implement", "psychic" ]
    attack      : "{±cha} vs. Will"
    hit         : "2d8{±cha.nz} damage, target has {penalty} Will"
    _formulae   :
      star   : hasPact "Star"
      penalty: -> @signed(-(if @star() then @intM() + 1 else 1))

  VampiricEmbrace:
    name        : "Vampiric Embrace"
    keywords    : [ "arcane", "implement", "necrotic" ]
    attack      : "{±con} vs. Will"
    hit         : "2d8{±con.nz} damage, you gain {hp} temporary HP"
    _formulae   :
      infernal: hasPact "Infernal"
      hp: -> if @infernal() then @intM() + 5 else 5

  Witchfire:
    name        : "Witchfire"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±cha} vs. Reflex"
    hit         : "2d6{±cha.nz} damage, target has {penalty} attack"
    _formulae   :
      fey: hasPact "Fey"
      penalty: -> @signed(-(if @fey() then @intM() + 2 else 2))

  ArmorOfAgathys:
    name        : "Armor of Agathys"
    keywords    : [ "arcane", "cold" ]
    effect      : "{±tempHP} temporary HP, adjacent enemies take 1d6{±con.nz} damage"
    _formulae   :
      "±tempHP": -> @signed(@intM() + 10)

  CurseOfTheDarkDream:
    name        : "Curse of the Dark Dream"
    keywords    : [ "arcane", "charm", "implement", "psychic" ]
    attack      : "{±cha} vs. Will"
    hit         : "3d8{±cha.nz} damage (special)"

  DreadStar:
    name        : "Dread Star"
    keywords    : [ "arcane", "fear", "implement", "radiant" ]
    attack      : "{±cha} vs. Will"
    hit         : "3d6{±cha.nz} damage (special)"

  FlamesOfPhlegethos:
    name        : "Flames of Phlegethos"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±con} vs. Reflex"
    hit         : "3d10{±con.nz} damage (special)"
