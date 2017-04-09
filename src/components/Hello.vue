<template lang="html">
  <div class="hello">
    <h1>{{msg}}</h1>
    <h1>hi</h1>
  </div>
</template>

<script lang="coffee">
cap = require("../lib/capital-one.coffee")
http = require("../lib/http.coffee")
module.exports =
  name: 'hello'
  created: ->
    http.get "http://api.reimaginebanking.com/accounts", {key: cap.key}
    .then (res) -> res.json()
    .then (json) =>
      @msg = json
  data: ->
    msg: {}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
