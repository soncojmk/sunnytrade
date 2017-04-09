<template lang="html">
  <div class="input-group">
    <input @input="update" v-model="ivalue" type="text" :value="value"/>
    <button class="increment-button" @click="increment(); update()"><fa i="chevron-up"/></button>
    <button class="decrement-button" @click="decrement(); update()"><fa i="chevron-down"/></button>
  </div>
</template>

<script lang="coffee">
module.exports =
  components:
    fa: require "./fa.vue"
  props:
    value:
      type: Number
      default: 0
    step:
      type: Number
      default: 100
    negatives:
      type: Boolean
      default: false
  data: ->
    offset: 0
  computed:
    ivalue:
      get: -> @value
      set: (val) ->
        @offset = (parseInt(val) or @value) - @value
  methods:
    decrement: ->
      if not @negatives and @value - @step < 0
        @offset = -@value
      else
        @offset -= @step
    increment: ->
      @offset += @step
    update: ->
      @$emit "input", +@value + @offset
      @offset = 0
</script>
