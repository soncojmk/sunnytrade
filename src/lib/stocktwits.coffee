http = require("./http.coffee")
$ = require("jquery")

url = "http://stocktwits.com/symbol/"

module.exports.call = (sym) ->
  html = http.get(url + sym).then (res) -> res.string()
  sentiment = $(res).children("#sentiment-chart div > ul > li > span").text()

  # return  sentiment is "" or sentiment is null
