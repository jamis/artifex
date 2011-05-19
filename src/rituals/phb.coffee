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

  each: (level, callback) ->
    if this[level]?
      for key, value of this[level]
        callback key, value

  all: (level) ->
    list = []
    @each level, (name, data) -> list.push name
    list
