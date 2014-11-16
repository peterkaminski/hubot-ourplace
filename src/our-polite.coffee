# Description:
#   Make hubot more polite.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   dannymcc, peterkaminski, "hello" author

gratitudeResponses = [
  "You're welcome, %.",
  "No problem, %.",
  "Any time!",
  "That's what I'm here for!",
  "%, you are more than welcome.",
#  "You don't have to thank me, I'm your loyal servant.",
  "Don't mention it."
]

shortResponses = [
  'yvw',
  'vw',
  'np',
]

farewellResponses = [
  'Goodbye!',
  'Have a good one, %',
  'Bye %!',
  'Take care',
  'Nice speaking with you',
  'See you later',
  'See you around, %!',
  'See ya, %!',
  'Take care, %!',
  'Talk to you later, %!'
]

greetingResponses = [
  'Hello %',
  'How are you today, %?',
  "'Sup, %?",
]

chocolateResponses = [
  'Did somebody say chocolate?!?',
  'Mmm, chocolate...',
  'Thanks for reminding me, %! ::munches some chocolate::',
  "And here's a piece of chocolate for you, %!",
  'As they say, the four food groups: milk chocolate, dark chocolate, white chocolate, and chocolate truffles.',
  'The 12-step chocoholics program: NEVER BE MORE THAN 12 STEPS AWAY FROM CHOCOLATE!',
  "All I really need is love, but a little chocolate now and then doesn't hurt."
]

pete2Responses = [
  '%, what do you know of pete2?',
  'pete2?',
  'pete2? et tu, %?',
  'pete2? did you just say "pete2"?',
  "pete2? what's that?",
  "pete2? who's that?",
  'pete2 is a shadowy figure, not often seen around these parts',
  "we don't speak of pete2, %",
  "say, %, do you think there will ever be a pete3?",
  "%2, i say!"
]

whatsUpResponses = [
  "Dude, I don't know.",
  "I've been wondering the exact same thing, %.",
  "The weather's fine.  At least from where I sit...",
  "The birds are singing, the sun is shining (somewhere in the world) - what could be better?",
  "Pile of work on my desk.  How about you, %?",
  "Storm's a-brewin', I tells ya",
  "You know that thing about the other thing?  Didn't really happen!",
  "It's a happy bot who gets to hang out with you, %.",
  "What?  I wasn't sleeping, I swear.",
  "Pizza!  We should totally order pizza.",
  'A Roman walks into a bar, sticks two fingers up to the barman and says, "Five beers please."',
  "Of all the channels, on all the servers, around the world, she logs into into mine.",
  "We'll always have Paris.",
  "%, you don't even know...",
  "%, you don't even _want_ to know..."
]

# http://en.wikipedia.org/wiki/You_talkin'_to_me%3F
youTalkinToMe = (msg, robot) ->
  input = msg.message.text.toLowerCase()
  name = robot.name.toLowerCase()
  input.match(new RegExp('\\b' + name + '\\b', 'i'))?

module.exports = (robot) ->
  robot.hear /\b(thanks|thank you|cheers|nice one)\b/i, (msg) ->
    response = msg.random gratitudeResponses
    msg.send response.replace "%", msg.message.user.name if youTalkinToMe(msg, robot)

  robot.hear /\b(ty|thx)\b/i, (msg) ->
    response = msg.random shortResponses
    msg.send response.replace "%", msg.message.user.name if youTalkinToMe(msg, robot)

  robot.hear /\b(hey|hello|hi|sup|howdy|good (morning|evening|afternoon))\b/i, (msg) ->
    response = msg.random greetingResponses
    msg.send response.replace "%", msg.message.user.name if youTalkinToMe(msg, robot)
    
  robot.hear /\b(bye|night|goodbye|good night|g.nite|gnite)\b/i, (msg) ->
    response = msg.random farewellResponses
    msg.send response.replace "%", msg.message.user.name if youTalkinToMe(msg, robot)

  robot.hear /\b(what.s\s+)(up|happening|happenin|cookin|cooking)\b/i, (msg) ->
    response = msg.random whatsUpResponses
    msg.send response.replace "%", msg.message.user.name if youTalkinToMe(msg, robot)

  robot.hear /\b(chocolate)\b/i, (msg) ->
    response = msg.random chocolateResponses
    msg.send response.replace "%", msg.message.user.name

  robot.hear /\b(pete2)\b/i, (msg) ->
    response = msg.random pete2Responses
    msg.send response.replace "%", msg.message.user.name
