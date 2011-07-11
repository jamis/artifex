{Rituals} = require '../..'

checkRitual = (test, level, name, skills, category, source) ->
  ritual = Rituals[level][name]
  test.ok ritual?, "expected ritual `#{name}' to exist as level #{level}"
  test.equal ritual.name, name, "expected ritual name to be `#{name}', was `#{ritual.name}'"

  keySkills = (ritual.keySkills ? []).sort()
  skills = skills.sort()
  test.deepEqual keySkills, skills, "expected ritual keySkills to be `#{skills}', was `#{keySkills}'"

  test.equal ritual.category, category, "expected ritual category to be `#{category}', was `#{ritual.category}'"
  test.equal ritual.source, source, "expected ritual source to be `#{source}', was `#{ritual.source}'"
  
module.exports =
  "#each should iterate over each ritual of the given level": (test) ->
    test.expect 8
    Rituals.each 1, (name, data) ->
      test.ok true if data.source is "phb"
    test.done()

  "#all should return the names of all rituals of the given level": (test) ->
    levelOne = Rituals.all(1)
    test.equal levelOne.length, 8
    test.ok "Gentle Repose" in levelOne
    test.done()
      
  "Animal Messenger should be present": (test) ->
    checkRitual test, 1, "Animal Messenger", ["nature"], "exploration", "phb"
    test.done()

  "Comprehend Languages should be present": (test) ->
    checkRitual test, 1, "Comprehend Languages", ["arcana"], "exploration", "phb"
    test.done()

  "Gentle Repose should be present": (test) ->
    checkRitual test, 1, "Gentle Repose", ["heal"], "restoration", "phb"
    test.done()

  "Magic Mouth should be present": (test) ->
    checkRitual test, 1, "Magic Mouth", ["arcana"], "exploration", "phb"
    test.done()

  "Make Whole should be present": (test) ->
    checkRitual test, 1, "Make Whole", ["arcana"], "exploration", "phb"
    test.done()

  "Secret Page should be present": (test) ->
    checkRitual test, 1, "Secret Page", ["arcana"], "warding", "phb"
    test.done()

  "Silence should be present": (test) ->
    checkRitual test, 1, "Silence", ["arcana"], "warding", "phb"
    test.done()

  "Tenser's Floating Disk should be present": (test) ->
    checkRitual test, 1, "Tenser's Floating Disk", ["arcana"], "exploration", "phb"
    test.done()

  "Endure Elements should be present": (test) ->
    checkRitual test, 2, "Endure Elements", ["arcana", "nature"], "exploration", "phb"
    test.done()

  "Eye of Alarm should be present": (test) ->
    checkRitual test, 2, "Eye of Alarm", ["arcana"], "warding", "phb"
    test.done()

  "Water Walk should be present": (test) ->
    checkRitual test, 2, "Water Walk", ["nature"], "exploration", "phb"
    test.done()

  "Detect Secret Doors should be present": (test) ->
    checkRitual test, 3, "Detect Secret Doors", ["arcana"], "exploration", "phb"
    test.done()

  "Arcane Lock should be present": (test) ->
    checkRitual test, 4, "Arcane Lock", ["arcana"], "warding", "phb"
    test.done()

  "Enchant Magic Item should be present": (test) ->
    checkRitual test, 4, "Enchant Magic Item", ["arcana"], "creation", "phb"
    test.done()

  "Hand of Fate should be present": (test) ->
    checkRitual test, 4, "Hand of Fate", ["religion"], "divination", "phb"
    test.done()

  "Knock should be present": (test) ->
    checkRitual test, 4, "Knock", ["arcana"], "exploration", "phb"
    test.done()

  "Travelers' Feast should be present": (test) ->
    checkRitual test, 4, "Travelers' Feast", ["nature"], "exploration", "phb"
    test.done()

  "Brew Potion should be present": (test) ->
    checkRitual test, 5, "Brew Potion", ["arcana", "religion"], "creation", "phb"
    test.done()

  "Hallucinatory Item should be present": (test) ->
    checkRitual test, 5, "Hallucinatory Item", ["arcana"], "deception", "phb"
    test.done()

  "Magic Circle should be present": (test) ->
    checkRitual test, 5, "Magic Circle", ["arcana"], "binding", "phb"
    test.done()

  "Commune with Nature should be present": (test) ->
    checkRitual test, 6, "Commune with Nature", ["nature"], "divination", "phb"
    test.done()

  "Cure Disease should be present": (test) ->
    checkRitual test, 6, "Cure Disease", ["heal"], "restoration", "phb"
    test.done()

  "Discern Lies should be present": (test) ->
    checkRitual test, 6, "Discern Lies", ["religion"], "divination", "phb"
    test.done()

  "Disenchant Magic Item should be present": (test) ->
    checkRitual test, 6, "Disenchant Magic Item", ["arcana"], "creation", "phb"
    test.done()

  "Leomund's Secret Chest should be present": (test) ->
    checkRitual test, 6, "Leomund's Secret Chest", ["arcana"], "exploration", "phb"
    test.done()

  "Phantom Steed should be present": (test) ->
    checkRitual test, 6, "Phantom Steed", ["arcana"], "exploration", "phb"
    test.done()

  "Sending should be present": (test) ->
    checkRitual test, 6, "Sending", ["arcana"], "exploration", "phb"
    test.done()

  "Speak with Dead should be present": (test) ->
    checkRitual test, 6, "Speak with Dead", ["religion"], "exploration", "phb"
    test.done()

  "Linked Portal should be present": (test) ->
    checkRitual test, 8, "Linked Portal", ["arcana"], "travel", "phb"
    test.done()

  "Raise Dead should be present": (test) ->
    checkRitual test, 8, "Raise Dead", ["heal"], "restoration", "phb"
    test.done()

  "Remove Afflication should be present": (test) ->
    checkRitual test, 8, "Remove Afflication", ["heal"], "restoration", "phb"
    test.done()

  "Water Breathing should be present": (test) ->
    checkRitual test, 8, "Water Breathing", ["arcana", "nature"], "exploration", "phb"
    test.done()

  "Wizard's Sight should be present": (test) ->
    checkRitual test, 8, "Wizard's Sight", ["arcana"], "scrying", "phb"
    test.done()

  "Consult Mystic Sages should be present": (test) ->
    checkRitual test, 10, "Consult Mystic Sages", ["religion"], "divination", "phb"
    test.done()

  "Detect Object should be present": (test) ->
    checkRitual test, 10, "Detect Object", ["arcana"], "exploration", "phb"
    test.done()

  "Drawmij's Instant Summons should be present": (test) ->
    checkRitual test, 12, "Drawmij's Instant Summons", ["arcana"], "travel", "phb"
    test.done()

  "Hallucinatory Creature should be present": (test) ->
    checkRitual test, 12, "Hallucinatory Creature", ["arcana"], "deception", "phb"
    test.done()

  "Passwall should be present": (test) ->
    checkRitual test, 12, "Passwall", ["arcana"], "exploration", "phb"
    test.done()

  "Shadow Walk should be present": (test) ->
    checkRitual test, 12, "Shadow Walk", ["arcana"], "exploration", "phb"
    test.done()

  "Eye of Warning should be present": (test) ->
    checkRitual test, 14, "Eye of Warning", ["arcana"], "warding", "phb"
    test.done()

  "View Location should be present": (test) ->
    checkRitual test, 14, "View Location", ["arcana"], "scrying", "phb"
    test.done()

  "Consult Oracle should be present": (test) ->
    checkRitual test, 16, "Consult Oracle", ["religion"], "divination", "phb"
    test.done()

  "Planar Portal should be present": (test) ->
    checkRitual test, 18, "Planar Portal", ["arcana"], "travel", "phb"
    test.done()

  "View Object should be present": (test) ->
    checkRitual test, 18, "View Object", ["arcana"], "scrying", "phb"
    test.done()

  "Forbiddance should be present": (test) ->
    checkRitual test, 20, "Forbiddance", ["arcana"], "warding", "phb"
    test.done()

  "Loremaster's Bargain should be present": (test) ->
    checkRitual test, 22, "Loremaster's Bargain", ["religion"], "divination", "phb"
    test.done()

  "Observe Creature should be present": (test) ->
    checkRitual test, 24, "Observe Creature", ["arcana"], "scrying", "phb"
    test.done()

  "Voice of Fate should be present": (test) ->
    checkRitual test, 26, "Voice of Fate", ["religion"], "divination", "phb"
    test.done()

  "True Portal should be present": (test) ->
    checkRitual test, 28, "True Portal", ["arcana"], "travel", "phb"
    test.done()
