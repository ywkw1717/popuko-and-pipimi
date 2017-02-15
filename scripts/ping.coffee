# Description:
#   Utility commands surrounding Hubot uptime.

moment = require 'moment'

message = [
  'オッ テメーいい度胸してんねー'
  'さてはアンチだなオメー'
  'オ゛オ゛ア゛ア゛ア゛ア゛ーッ'
  '文句あっか？'
  ''
  '君さぁプライドなさすぎちゃう？'
]

shuffle = (arr) ->
  i = arr.length
  if i is 0 then return false
  while --i
    j = Math.floor Math.random() * (i + 1)
    tmpi = arr[i]
    tmpj = arr[j]
    arr[i] = tmpj
    arr[j] = tmpi
  return

module.exports = (robot) ->
  robot.respond /PING$/i, (msg) ->
    msg.send "PONG"

  robot.respond /.*いる[?？]\s*$/i, (msg) ->
    shuffle message
    msg.send "はーい\n#{message[0]}"

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /ECHO (.*)$/i, (msg) ->
    msg.send msg.match[1]

  robot.respond /TIME$/i, (msg) ->
    msg.send "#{moment().format('YYYY年MM月DD日 H時mm分')}だよ"
