module.exports = class AstralWeapon
  constructor: (npc) ->
    @id = AstralWeapon.id
    @name = AstralWeapon.simpleName
    @powers = AstralWeapon.powers
    @npc = npc

    npc.feature "class", "Astral Judgement"
    npc.feature "class", "Astral Rejuvenation Action"

  advance: ->
    if @npc.level >= 16 and not @npc.hasFeature("class", "Courage from on High")
      @npc.feature "class", "Courage from on High"
      @npc.defenses.save.adjustWhen "fear", 2

AstralWeapon.id = "astralWeapon"
AstralWeapon.simpleName = "astral weapon"
AstralWeapon.accepts = (npc) -> npc.class.name is "paladin"

AstralWeapon.powers =
  encounter:
    11: [ "CarvingAPathOfLight" ]

  daily:
    20: [ "AstralWhirlwind" ]

  utility:
    12: [ "PrayForMore" ]
