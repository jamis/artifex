module.exports =
  1:
    "Animal Messenger":
      name     : "Animal Messenger"
      keySkills: [ "nature" ]
      category : "exploration"
      source   : "phb"
    "Comprehend Languages":
      name     : "Comprehend Languages"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"
    "Gentle Repose":
      name     : "Gentle Repose"
      keySkills: [ "heal" ]
      category : "restoration"
      source   : "phb"
    "Magic Mouth":
      name     : "Magic Mouth"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"
    "Make Whole":
      name     : "Make Whole"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"
    "Secret Page":
      name     : "Secret Page"
      keySkills: [ "arcana" ]
      category : "warding"
      source   : "phb"
    "Silence":
      name     : "Silence"
      keySkills: [ "arcana" ]
      category : "warding"
      source   : "phb"
    "Tenser's Floating Disk":
      name     : "Tenser's Floating Disk"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"

  2:
    "Endure Elements":
      name     : "Endure Elements"
      keySkills: [ "arcana", "nature" ]
      category : "exploration"
      source   : "phb"
    "Eye of Alarm":
      name     : "Eye of Alarm"
      keySkills: [ "arcana" ]
      category : "warding"
      source   : "phb"
    "Water Walk":
      name     : "Water Walk"
      keySkills: [ "nature" ]
      category : "exploration"
      source   : "phb"

  3:
    "Detect Secret Doors":
      name     : "Detect Secret Doors"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"

  4:
    "Arcane Lock":
      name     : "Arcane Lock"
      keySkills: [ "arcana" ]
      category : "warding"
      source   : "phb"
    "Enchant Magic Item":
      name     : "Enchant Magic Item"
      keySkills: [ "arcana" ]
      category : "creation"
      source   : "phb"
    "Hand of Fate":
      name     : "Hand of Fate"
      keySkills: [ "religion" ]
      category : "divination"
      source   : "phb"
    "Knock":
      name     : "Knock"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"
    "Travelers' Feast":
      name     : "Travelers' Feast"
      keySkills: [ "nature" ]
      category : "exploration"
      source   : "phb"

  5:
    "Brew Potion":
      name     : "Brew Potion"
      keySkills: [ "arcana", "religion" ]
      category : "creation"
      source   : "phb"
    "Hallucinatory Item":
      name     : "Hallucinatory Item"
      keySkills: [ "arcana" ]
      category : "deception"
      source   : "phb"
    "Magic Circle":
      name     : "Magic Circle"
      keySkills: [ "arcana" ]
      category : "binding"
      source   : "phb"

  6:
    "Commune with Nature":
      name     : "Commune with Nature"
      keySkills: [ "nature" ]
      category : "divination"
      source   : "phb"
    "Cure Disease":
      name     : "Cure Disease"
      keySkills: [ "heal" ]
      category : "restoration"
      source   : "phb"
    "Discern Lies":
      name     : "Discern Lies"
      keySkills: [ "religion" ]
      category : "divination"
      source   : "phb"
    "Disenchant Magic Item":
      name     : "Disenchant Magic Item"
      keySkills: [ "arcana" ]
      category : "creation"
      source   : "phb"
    "Leomund's Secret Chest":
      name     : "Leomund's Secret Chest"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"
    "Phantom Steed":
      name     : "Phantom Steed"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"
    "Sending":
      name     : "Sending"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"
    "Speak with Dead":
      name     : "Speak with Dead"
      keySkills: [ "religion" ]
      category : "exploration"
      source   : "phb"

  8:
    "Linked Portal":
      name     : "Linked Portal"
      keySkills: [ "arcana" ]
      category : "travel"
      source   : "phb"
    "Raise Dead":
      name     : "Raise Dead"
      keySkills: [ "heal" ]
      category : "restoration"
      source   : "phb"
    "Remove Afflication":
      name     : "Remove Afflication"
      keySkills: [ "heal" ]
      category : "restoration"
      source   : "phb"
    "Water Breathing":
      name     : "Water Breathing"
      keySkills: [ "arcana", "nature" ]
      category : "exploration"
      source   : "phb"
    "Wizard's Sight":
      name: "Wizard's Sight"
      keySkills: [ "arcana" ]
      category : "scrying"
      source   : "phb"

  10:
    "Consult Mystic Sages":
      name     : "Consult Mystic Sages"
      keySkills: [ "religion" ]
      category : "divination"
      source   : "phb"
    "Detect Object":
      name: "Detect Object"
      keySkills: [ "arcana" ]
      category : "exploration"
      source   : "phb"

  each: (level, callback) ->
    if this[level]?
      for key, value of this[level]
        callback key, value

  all: (level) ->
    list = []
    @each level, (name, data) -> list.push name
    list
