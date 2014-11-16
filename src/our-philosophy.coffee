# Description:
#   Slightly conversational answers to practical questions
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot (various)
#
# Author:
#   Peter Kaminski

# are you
# bed time story
# bedtime story
# do you know
# do you think
# is
# lullaby
# now i lay me down to sleep
# what is
# what is your

yesNoResponses = [
  'yes',
  'Yes.',
  'Yes, of course.',
  'no',
  'Nope.',
  'No, certainly not.',
  'What do you think?',
  'None of your business!',
  'Whatever, dude.'
]

tooDeepResponses = [
  "%, I am but a simple bot -- I can't answer that one.",
  "That question is too deep for me, %!",
  "I don't know.",
  "I don't really know, %.",
  "Honestly, I don't know.",
  "I don't have a clue, %."
]

module.exports = (robot) ->
  robot.respond /(are you)\s+/i, (msg) ->
    msg.send msg.random yesNoResponses

  robot.respond /(is)\s+/i, (msg) ->
    msg.send msg.random yesNoResponses

  robot.respond /(do you\s+)(think|know|wonder)\s+/i, (msg) ->
    response = msg.random tooDeepResponses
    msg.send response.replace "%", msg.message.user.name

  robot.respond /(what\s+)/i, (msg) ->
    response = msg.random tooDeepResponses
    msg.send response.replace "%", msg.message.user.name

  robot.respond /(bed\s*time story)/i, (msg) ->
    msg.send "Once upon a time..."

  robot.respond /(lullaby)/i, (msg) ->
    msg.send "o/~ Lullaby, and good night... o/~"

  robot.respond /(now i lay me down to sleep)/i, (msg) ->
    msg.send "I pray the Lord my soul to keep"
