module.exports =
  WrongStep:
    name        : "Wrong Step"
    keywords    : [ "martial", "weapon" ]
    requires    : { weapon: "melee" }

  ActTogether:
    name        : "Act Together"
    type        : "daily"
    keywords    : [ "martial" ]

  SlashersMark:
    name        : "Slasher's Mark"
    keywords    : [ "healing", "martial", "weapon" ]
    requires    : { weapon: "melee", feature: { class: "Two-Blade Fighting Style" } }
