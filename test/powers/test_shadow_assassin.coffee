{Verify} = require '../helpers'

module.exports =
  "[KillersEye] should be defined":
    Verify.testProperties "shadowAssassin", "KillersEye",
      name: [ expect: "Killer's Eye" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: [ "crossbow", "light blade", "sling" ] } ]

  "[BadIdeaFriend] should be defined":
    Verify.testProperties "shadowAssassin", "BadIdeaFriend",
      name: [ expect: "Bad Idea, Friend" ]
      type: [ expect: "daily" ]
      keywords: [ expect: [ "martial" ] ]

  "[FinalBlow] should be defined":
    Verify.testProperties "shadowAssassin", "FinalBlow",
      name: [ expect: "Final Blow" ]
      keywords: [ expect: [ "martial", "weapon" ] ]
      requires: [ expect: { weapon: [ "crossbow", "light blade", "sling" ] } ]
