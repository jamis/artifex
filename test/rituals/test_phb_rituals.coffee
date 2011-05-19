{Rituals} = require '../..'

checkRitual = (test, level, name, skills, category, source) ->
  ritual = Rituals[level][name]
  test.ok ritual?, "expected ritual `#{name}' to exist as level #{level}"
  test.equal ritual.name, name, "expected ritual name to be `#{name}', was `#{ritual.name}'"

  keySkills = ritual.keySkills.sort()
  skills = skills.sort()
  test.deepEqual keySkills, skills, "expected ritual keySkills to be `#{skills}', was `#{keySkills}'"

  test.equal ritual.category, category, "expected ritual category to be `#{category}', was `#{ritual.category}'"
  test.equal ritual.source, source, "expected ritual source to be `#{source}', was `#{ritual.source}'"
  
module.exports =
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
