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

# The number of popute URL
popute_url = ["01", "02", "03", "15"]

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
    msg.send "あぁ？"

  robot.respond /.*いる[?？]\s*$/i, (msg) ->
    shuffle message
    msg.send "はーい\n#{message[0]}"

  robot.respond /ADAPTER$/i, (msg) ->
    msg.send robot.adapterName

  robot.respond /TIME$/i, (msg) ->
    msg.send "#{moment().format('YYYY年MM月DD日 H時mm分')}だよ"

  robot.hear /.*(?:つか|疲)れ/i, (msg) ->
    msg.send "お疲れやな"

  robot.hear /.*やばい/i, (msg) ->
    msg.send "やばめ〜"

  robot.hear /.*おはよ(?:う|〜||ー)/i, (msg) ->
    msg.send "今日もウキウキコーディング！"

  robot.hear /.*next(?: ej_mtg)/i, (msg) ->
    msg.send "次はない"

  robot.hear /.*つら(?:い|み)/i, (msg) ->
    msg.send "つらい時こそポプテピピック"
    shuffle popute_url
    switch popute_url[0]
      when "01"
        popute_num = 13023 + Math.floor(Math.random() * 11)
      when "02"
        popute_num = 13161 + Math.floor(Math.random() * 11)
      when "03"
        popute_num = 13309 + Math.floor(Math.random() * 11)
      when "15"
        popute_num = 15107 + Math.floor(Math.random() * 11)

    msg.send "http://mangalifewin.takeshobo.co.jp/rensai/popute/popute-0#{popute_url[0]}/#{popute_num}/"

  robot.hear /.*ポプガチャ/i, (msg) ->
    shuffle popute_url
    switch popute_url[0]
      when "01"
        popute_num = 13023 + Math.floor(Math.random() * 11)
      when "02"
        popute_num = 13161 + Math.floor(Math.random() * 11)
      when "03"
        popute_num = 13309 + Math.floor(Math.random() * 11)
      when "15"
        popute_num = 15107 + Math.floor(Math.random() * 11)

    msg.send "http://mangalifewin.takeshobo.co.jp/rensai/popute/popute-0#{popute_url[0]}/#{popute_num}/"
