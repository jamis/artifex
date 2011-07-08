hasPact = (pact) ->
  -> @npc.hasFeature "class", "#{pact} Pact"

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

  BeguilingTongue:
    name        : "Beguiling Tongue"
    type        : "encounter"
    keywords    : [ "arcane" ]

  EtherealStride:
    name        : "Ethereal Stride"
    type        : "encounter"
    keywords    : [ "arcane", "teleportation" ]

  FiendishResilience:
    name        : "Fiendish Resilience"
    type        : "daily"
    keywords    : [ "arcane" ]
    effect      : "gain {bonus} temp HP"
    _formulae   : { bonus: -> 5 + @conM() }

  ShadowVeil:
    name        : "Shadow Veil"
    type        : "encounter"
    keywords    : [ "arcane", "illusion" ]

  EldritchRain:
    name        : "Eldritch Rain"
    keywords    : [ "arcane", "implement" ]
    attack      : "{±cha} vs. Reflex (special)"
    hit         : "1d10{±bonus.nz} damage"
    _formulae   :
      fey: hasPact "Fey"
      bonus: -> @chaM() + if @fey() then @intM() else 0
      "±bonus.nz": -> if @bonus() is 0 then "" else @signed @bonus()

  FieryBolt:
    name        : "Fiery Bolt"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±con} vs. Reflex"
    hit         : "3d6{±con.nz} damage, adjacent creatures take 1d6{±bonus.nz} damage"
    _formulae   :
      infernal: hasPact "Infernal"
      bonus: -> @conM() + if @infernal() then @intM() else 0
      "±bonus.nz": -> if @bonus() is 0 then "" else @signed @bonus()

  FrigidDarkness:
    name        : "Frigid Darkness"
    keywords    : [ "arcane", "cold", "fear", "implement" ]
    attack      : "{±con} vs. Fortitude"
    hit         : "2d8{±con.nz} damage{pactText} (special)"
    _formulae   :
      star: hasPact "Star"
      pactText: -> if @star() then ", target has #{@signed(-@intM())} to AC" else ""

  OtherwindStride:
    name        : "Otherwind Stride"
    keywords    : [ "arcane", "implement", "teleportation" ]
    attack      : "{±cha} vs. Fortitude"
    hit         : "1d8{±cha.nz} damage (special)"
    effect      : "teleport {distance} squares"
    _formulae   :
      fey: hasPact "Fey"
      distance: -> 5 + if @fey() then @intM() else 0

  AvernianEruption:
    name        : "Avernian Eruption"
    keywords    : [ "arcane", "fire", "implement" ]
    attack      : "{±con} vs. Reflex"
    hit         : "2d10{±con.nz} damage"

  CrownOfMadness:
    name        : "Crown of Madness"
    keywords    : [ "arcane", "charm", "implement", "psychic" ]
    attack      : "{±cha} vs. Will"
    hit         : "2d6{±cha.nz} damage"

  CurseOfTheBloodyFangs:
    name        : "Curse of the Bloody Fangs"
    keywords    : [ "arcane", "implement" ]
    attack      : "{±cha} vs. AC"
    hit         : "2d10{±cha.nz} damage"

  HungerOfHadar:
    name        : "Hunger of Hadar"
    keywords    : [ "arcane", "implement", "necrotic", "zone" ]
    attack      : "{±con} vs. Fortitude (secondary)"
    hit         : "1d6{±con.nz} damage (secondary)"

  DarkOnesOwnLuck:
    name        : "Dark One's Own Luck"
    type        : "daily"
    keywords    : [ "arcane" ]

  FeySwitch:
    name        : "Fey Switch"
    type        : "encounter"
    keywords    : [ "arcane", "teleportation" ]

  ShroudOfBlackSteel:
    name        : "Shroud of Black Steel"
    type        : "daily"
    keywords    : [ "arcane", "polymorph" ]

  SpiderClimb:
    name        : "Spider Climb"
    type        : "encounter"
    keywords    : [ "arcane" ]

  HowlOfDoom:
    name        : "Howl of Doom"
    keywords    : [ "arcane", "fear", "implement", "thunder" ]
    attack      : "{±con} vs. Fortitude"
    hit         : "2d6{±con.nz} damage, push target {count} {squares}"
    _formulae   :
      infernal: hasPact "Infernal"
      count: -> if @infernal() then 1 + @intM() else 2
      squares: -> @plural @count(), "square", "squares"

  InfernalMoonCurse:
    name        : "Infernal Moon Curse"
    keywords    : [ "arcane", "implement", "poison" ]
    attack      : "{±con} vs. Fortitude"
    hit         : "2d8{±bonus.nz} damage (special)"
    _formulae   :
      infernal: hasPact "Infernal"
      bonus: -> @conM() + if @infernal() then @intM() else 0
      "±bonus.nz": -> if @bonus() is 0 then "" else @signed @bonus()

  MireTheMind:
    name        : "Mire the Mind"
    keywords    : [ "arcane", "illusion", "implement", "psychic" ]
    attack      : "{±cha} vs. Will"
    hit         : "1d10{±cha.nz} damage{pactText} (special)"
    _formulae   :
      fey: hasPact "Fey"
      pactText: -> if @fey() then ", stealth checks at #{@signed @intM()}" else ""

  SignOfIllOmen:
    name        : "Sign of Ill Omen"
    keywords    : [ "arcane", "implement" ]
    attack      : "{±cha} vs. Will"
    hit         : "2d6{±cha.nz} damage{pactText} (special)"
    _formulae   :
      star: hasPact "Star"
      pactText: -> if @star() then ", target has #{@signed(-@intM())} to next attack" else ""

  CurseOfTheBlackFrost:
    name        : "Curse of the Black Frost"
    keywords    : [ "arcane", "cold", "implement" ]
    attack      : "{±cha} vs. Reflex"
    hit         : "2d8{±cha.nz} damage (special)"

  IronSpikeOfDis:
    name        : "Iron Spike of Dis"
    keywords    : [ "arcane", "implement" ]
    attack      : "{±con} vs. Reflex"
    hit         : "3d10{±con.nz} damage (special)"

  SummonsOfKhirad:
    name        : "Summons of Khirad"
    keywords    : [ "arcane", "implement", "psychic", "teleportation" ]
    attack      : "{±con} vs. Will"
    hit         : "2d10{±con.nz} damage (special)"

  ThiefOfFiveFates:
    name        : "Thief of Five Fates"
    keywords    : [ "arcane", "implement" ]
    attack      : "{±cha} vs. Will"

  AmbassadorImp:
    name        : "Ambassador Imp"
    type        : "daily"
    keywords    : [ "arcane", "conjuration" ]

  ShadowForm:
    name        : "Shadow Form"
    type        : "daily"
    keywords    : [ "arcane", "polymorph" ]

  ShieldingShades:
    name        : "Shielding Shades"
    type        : "daily"
    keywords    : [ "arcane" ]

  WarlocksLeap:
    name        : "Warlock's Leap"
    type        : "daily"
    keywords    : [ "arcane", "teleportation" ]

  BewitchingWhispers:
    name        : "Bewitching Whispers"
    keywords    : [ "arcane", "charm", "implement" ]

  ColdfireVortex:
    name        : "Coldfire Vortex"
    keywords    : [ "arcane", "cold", "implement", "radiant" ]

  Harrowstorm:
    name        : "Harrowstorm"
    keywords    : [ "arcane", "implement", "thunder" ]

  SoulFlaying:
    name        : "Soul Flaying"
    keywords    : [ "arcane", "implement", "necrotic" ]

  CurseOfTheGoldenMist:
    name        : "Curse of the Golden Mist"
    keywords    : [ "arcane", "charm", "implement" ]

  Fireswarm:
    name        : "Fireswarm"
    keywords    : [ "arcane", "fire", "implement", "poison" ]

  TendrilsOfThuban:
    name        : "Tendrils of Thuban"
    keywords    : [ "arcane", "cold", "implement", "zone" ]

  ThirstingMaw:
    name        : "Thirsting Maw"
    keywords    : [ "arcane", "implement" ]

  CloakOfShadow:
    name        : "Cloak of Shadow"
    type        : "encounter"
    keywords    : [ "arcane" ]

  EyeOfTheWarlock:
    name        : "Eye of the Warlock"
    type        : "daily"
    keywords    : [ "arcane" ]

  InfuriatingElusiveness:
    name        : "Infuriating Elusiveness"
    type        : "encounter"
    keywords    : [ "arcane", "illusion", "teleportation" ]

  StrandOfFate:
    name        : "Strand of Fate"
    keywords    : [ "arcane", "implement" ]

  ThirstingTendrils:
    name        : "Thirsting Tendrils"
    keywords    : [ "arcane", "healing", "implement" ]

  WarlocksBargain:
    name        : "Warlock's Bargain"
    keywords    : [ "arcane", "implement" ]

  DelusionsOfLoyalty:
    name        : "Delusions of Loyalty"
    keywords    : [ "arcane", "charm", "implement" ]

  MinionsOfMalbolge:
    name        : "Minions of Malbolge"
    keywords    : [ "arcane", "conjuration", "fire", "implement" ]

  WrathOfAcamar:
    name        : "Wrath of Acamar"
    keywords    : [ "arcane", "implement", "necrotic", "teleportation" ]
