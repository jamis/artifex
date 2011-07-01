module.exports =
  PrecisionCut:
    name        : "Precision Cut"
    keywords    : [ "martial", "weapon" ]
    requires    : { weapon: "melee" }

  FantasticFlourish:
    name        : "Fantastic Flourish"
    type        : "encounter"
    keywords    : [ "martial" ]
    requires    : { weapon: { yes: [ 'light blade', 'heavy blade' ], no: 'polearm' } }

  CrescendoSword:
    name        : "Crescendo Sword"
    keywords    : [ "martial", "weapon" ]
    requires    : { weapon: { yes: [ 'light blade', 'heavy blade' ], no: 'polearm' } }
