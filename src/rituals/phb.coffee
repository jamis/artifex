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

  each: (level, callback) ->
    if this[level]?
      for key, value of this[level]
        callback key, value

  all: (level) ->
    list = []
    @each level, (name, data) -> list.push name
    list
