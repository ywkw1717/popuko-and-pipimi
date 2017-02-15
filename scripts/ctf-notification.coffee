# Description:
#   Notification next CTF.
#
# Commands:
#   hubot next ctf - 次に開催されるCTFを教えてくれる．

days = ["日", "月", "火", "水", "木", "金", "土"]

module.exports = (robot) ->
  robot.hear /(n|N)ext ctf(.*)/i, (msg) ->
    timestamp = Math.floor(new Date().getTime() / 1000)
    robot.http("https://ctftime.org/api/v1/events/")
      .query({
      limit:1
      start:timestamp
      })
      .get() (err, res, body) ->
        json = JSON.parse(body)["0"]

        title          = json["title"]
        url            = json["url"]
        ctftime_url    = json["ctftime_url"]
        format         = json["format"]
        location       = json["location"]
        duration_hours = json["duration"]["hours"]
        duration_days  = json["duration"]["days"]
        start          = json["start"]

        message = "Title: #{title}\nURL: #{url}\nctftime_url: #{ctftime_url}\nFormat: #{format}\nLocation: #{location}\nDuration: hours #{duration_hours}, days #{duration_days}"

        d = new Date("#{start}")

        year  = d.getFullYear()     # 年（西暦）
        month = d.getMonth() + 1    # 月
        date  = d.getDate()         # 日
        day   = days[d.getDay()]    # 曜日
        hour  = d.getHours()        # 時
        min   = d.getMinutes()      # 分
        sec   = d.getSeconds()      # 秒
        ms    = d.getMilliseconds() # ミリ秒（1000分の1秒）

        message += "\nDate: #{year}年#{month}月#{date}日(#{day}) #{hour}時#{min}分#{sec}秒"
        message += "\n\nお前はよぉ！自分で探すってことをできねぇのかよ！？"

        msg.send message
