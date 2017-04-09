<template lang="html">
  <section>
    <h1>{{acct.nickname}}</h1>
    <div class="totals">
      <span class="flex" style="width: 100%">
        <span :class="healthColor" class="score bar green flex-right" :style="{width: ((newCurrent / newBalance) * 100) + 10 + '%'}">
          <h2><span class="label"></span> {{newCurrent | $}}</h2>
        </span>
        <span class="score bar grey" :style="{width: ((1 - (newCurrent / newBalance)) * 100) - 10  + '%'}">
          <h2><span class="label"></span> {{newBalance | $}}</h2>
        </span>
      </span>
      <h2><span class="label">Financial Health:</span> <span :class="healthColor">{{health}}</span></h2>
    </div>
    <label for="autoinvest">Autoinvest</label>
    <input id="autoinvest" v-model="invest" placeholder="Auto-Invest"/>
    <div class="buy-list">
      <div class="label">Autoinvest will buy:</div>
      <div class="stock-list" v-for="stock of this.buy">
        <span class="sym label">{{stock.sym}}</span>
        <span class="name">{{stock.name}}</span>
        <span class="price"> ${{stock.price}}</span>
        <span class="flex-right flex" style="width: 300px">
          <span class="score bar green flex-right" :style="{width: 4 * (stock.bullish - 30) + '%'}">{{stock.bullish}}% Bullish</span>
          <span class="score bar grey" :style="{width: 4 * (100 - stock.bullish) + '%'}"></span>
        </span>
      </div>
    </div>
    <div class="sell-list">
      <div class="label">Automatic sell orders:</div>
      <div class="stock-list" v-for="stock of this.sell">
        <span class="sym label">{{stock.sym}}</span>
        <span class="name">{{stock.name}}</span>
        <span class="price"> ${{stock.price}}</span>
        <span class="flex-right flex" style="width: 300px">
          <span class="score bar red flex-right" :style="{width: 4 * (stock.bearish - 30) + '%'}">{{stock.bearish}}% Bearish</span>
          <span class="score bar grey" :style="{width: 4 * (100 - stock.bearish) + '%'}"></span>
        </span>
      </div>
    </div>
    <button class="submit button">Trade</button>
  </section>
</template>

<script lang="coffee">
cap = require("../lib/capital-one.coffee")
http = require("../lib/http.coffee")
module.exports =
  created: ->
    acct = null
    http.get "http://api.reimaginebanking.com/accounts", {key: cap.key}
    .then (res) -> res.json()
    .then (json) =>
      @acct = json[0]
    for sym in cap.buy
      http.get "http://soncojmk.pythonanywhere.com/sunnytrade/score",
        stock: sym
      .then (res) ->
        res.json()
      .then (json) =>
        @buy.push(Object.assign(json))
    for sym in cap.sell
      http.get "http://soncojmk.pythonanywhere.com/sunnytrade/score",
        stock: sym
      .then (res) ->
        res.json()
      .then (json) =>
        @sell.push(Object.assign(json))
  computed:
    newCurrent: -> @current + +@invest
    newBalance: -> @acct.balance - +@invest
    health: ->
      switch
        when @newCurrent / @newBalance < .1 then "C"
        when @newCurrent / @newBalance < .15 then "C+"
        when @newCurrent / @newBalance < .18 then "B-"
        when @newCurrent / @newBalance < .20 then "B"
        when @newCurrent / @newBalance < .22 then "B+"
        when @newCurrent / @newBalance < .25 then "A-"
        when @newCurrent / @newBalance < .30 then "A"
        when @newCurrent / @newBalance < .35 then "A-"
        when @newCurrent / @newBalance < .40 then "B+"
        when @newCurrent / @newBalance < .45 then "B"
        when @newCurrent / @newBalance < .50 then "C+"
        when @newCurrent / @newBalance < .60 then "C"
        when @newCurrent / @newBalance < .70 then "D"
        else "F"
    healthColor: ->
      switch
        when @health == "D" or @health == "F" then "red"
        when @health == "B+" or @health == "B" or @health == "A-" or @health == "A" then "green"
        else "yellow"
  data: ->
    acct: {}
    current: 692.48 # replace w/ backend call
    initial: 680 # same
    invest: 0
    buy: []
    sell: []
  methods:
    transact: ->
      http.post "http://api.reimaginebanking.com/accounts/#{cap.cid}/withdrawals?key=#{cap.key}",
        transaction_date: "2017-04-08"
        status: "pending"
        payer_id: "string"
        medium: "balance"
        amount: 0.01
        description: "string"
      http.get "http://api.reimaginebanking.com/account/#{cap.cid}/withdrawals", {key: cap.key}
      .then (res) -> res.json()
      .then (json) =>
        @withdrawal = json
    subBalance: (n) -> @acct.balance -= n
    scoreColor: (score) ->
      if score > 50 then "green" else "red"
  filters:
    $: (n) ->
      if Math.floor(n) is n
        "$" + n + ".00"
      else
        "$" + n
</script>

<style lang="sass" scoped>
section
  padding: 5em 20%
  width: 100%

h1
  font-size: 2.5em
  margin-bottom: 1rem

h2
  font-size: 1.4em
  margin-bottom: .5rem

.label
  font-weight: bold

.green
  color: #008000

.yellow
  color: #FF8800

.red
  color: #FF0000

label
  font-weight: bold

.totals
  margin-bottom: 1em

.stock-list
  display: flex
  padding: 0.5em
  &:hover
    background-color: #F0F0F0
  .name
    width: 50%

.buy-list, .sell-list
  margin-bottom: 1em

//.sell-list
//  background-color: #800000

// .buy-list
//  background-coolor

.bar.green
  background-color: #80D080
  color: #005000

.bar.yellow
  background-color: #F0F080
  color: #505000

.bar.red
  background-color: #D08080
  color: #500000

.bar.grey
  background-color: #DDDDDD
  color: #333333

.bar
  padding: 4px

.flex
  display: flex
</style>
