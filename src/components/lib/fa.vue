<template lang="html">
  <i :class="`fa fa-fw fa-${i} fa-${s} ${classes}`" aria-hidden="true"/>
</template>

<script lang="coffee">
module.exports =
  props:
    i: # Icon Type
      type: String
      required: true
    s: # Icon Size
      type: String
      default: "1x"
    classes:
      type: String
      default: ""
</script>
