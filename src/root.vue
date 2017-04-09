<template lang="html">
  <main>
    <div id="header-border" class="border"></div>
    <section class="body">
      <router-view></router-view>
    </section>
  </main>
</template>

<script lang="coffee">
module.exports =
  name: "root"
</script>

<style lang="sass">
*
  margin: 0
  padding: 0
  font-size: 18px
  box-sizing: border-box

body
  min-height: 100vh
  background-color: #FFFFFF
  color: #333333
  font-family: "Raleway", "Helvetica Neue", "Helvetica", "sans-serif"

section.body
  position: relative
  top: 40px
  width: 100%

header
  display: flex
  align-items: center
  padding: 1em 2em
  color: #EEEEEE
  background-color: #2F343F
  > h1
    font-size: 2em
    letter-spacing: 1px
  > .button
    font-size: 1.3em
    line-height: 1.8
    margin-right: 2rem
    display: inline-block
    color: #EEEEEE
    font-weight: bold
  a
    font-size: inherit
    color: #EEEEEE

main
  position: relative
  display: flex
  align-items: flex-start
  min-height: 70em

a
  text-decoration: none

#header-border
  top: 0px
  left: 0px
  background-image: url(data:image/png;base64,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)

#footer-border
  bottom: 0px
  left: 0px
  transform: scaleY(-1)

footer
  display: flex
  padding: 2em
  color: white
  background: #2F343F
  flex-wrap: wrap
  justify-content: center
  h3
    width: 100%
    text-align: center
    margin-top: 1rem
  a
    padding: 0em 1em
    color: white

.border
  position: absolute
  display: block
  height: 38px
  width: 100%
  background-size: 720px 38px
  background-repeat: repeat-x
  z-index: 1

.flex-right
  margin-left: auto

.flex-left
  margin-right: auto

.disabled
  color: #CCCCCC

.button
  cursor: pointer

.padding
  width: 100%
  height: 100%


.flex-left
  margin-right: auto

.input-group
  display: flex
  align-items: stretch
  height: 34px
  > *
    border-radius: 0px 0px 0px 0px
    height: 100%
    border: 1px solid #999999
    border-left: none
    display: flex
    align-items: center
    padding: 0 0.5em
  > *:first-child
    border-radius: 4px 0px 0px 4px
    border-left: 1px solid #999999
  > *:last-child
    border-radius: 0px 4px 4px 0px
  > div, span
    background: #F0F0F0
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;

.button
  cursor: pointer

.menu-item
  margin-left: 3em
  font-size: 1.5em
  a
    font-size: 1em


input, button, select, textarea
  display: block
  width: 100%
  padding: 0.5em
  color: #333333
  background-color: white
  border: 1px solid #999999
  border-radius: 4px
  box-shadow: 0px 0px 2px #CCCCCC
  box-shadow: inset 0 0 3px 0px #CCCCCC
  resize: none
  -moz-appearance: none

input[type="submit"], button
  width: auto
  padding: 0.5em
  margin-bottom: 0
  color: #333333
  box-shadow: none
  cursor: pointer
  &:active
    background: #F0F0F0
  &::-moz-focus-inner
    border: 0;
</style>
