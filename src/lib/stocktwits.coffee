http = require("./http.coffee")
$ = require("jquery")

url = "http://stocktwits.com/symbol/"

module.exports.call = (sym) ->
  html = http.get(url + sym).then((res) -> res.string)
  sentiment = $(res).children("#sentiment-chart div > ul > li > span").text()
  return sentiment is "" or sentiment is null

buy = [ {
    name: "Apple Inc"
    symbol: "AAPL"
    value: 143.34
    score: 74
  },
  {
    name: "Alphabet Inc."
    symbol: "GOOG"
    value: 824.67
    score: 88
  },
  {
    name: "Western Copper And Gold Corporation"
    symbol: "WRN"
    value: 1.40
    score: 100
  },
  {
    name: "Advanced Micro Devices, Inc."
    symbol: "AMD"
    value: 13.48
    score: 90
  },
  {
    name: "Chesapeake Energy Corporation"
    symbol: "CHK"
    value: 6.21
    score: 96
  },
  {
    name: "Micron Technology Inc"
    symbol: "MU"
    value: 28.40
    score: 88
  },
  {
    name: "Raytheon Co."
    symbol: "RTN"
    value: 153.24
    score: 96
  } ]

sell = [ {
    name: "Capital One Financial Corp."
    symbol: "COF"
    value: 11.24
    score: 25
  },
  {
    name: "Ford Motor Co."
    symbol: "F"
    value: 11.24
    score: 26
  },
  {
    name: "Ares Capital Corporation"
    symbol: "ACC"
    value: 17.59
    score: 0
  },
  {
    name: "Fitbit"
    symbol: "FIT"
    value: 5.53
    score: 65
  },
  {
    name: "Pier 1 Imports, Inc."
    symbol: "PIR"
    value: 7.14
    score: 50
  } ]
