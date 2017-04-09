<template lang="html">
  <section>
    <input class="input" name="user" placeholder="Username"/>
    <input class="input" name="password" type="password" placeholder ="Password"/>
    <router-link to="/">
      <button class="input button flex-right submit">Log In</button>
    </router-link>
  </section>
</template>

<script lang="coffee">
</script>

<style lang="sass" scoped>
.input
  margin-bottom: 1em

section
  padding: 5em 20%
</style>
