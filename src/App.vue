<template>
  <div id="app">
    <Main/>
    <Viewer/>
  </div>
</template>

<script>
import Main from '@/components/Menu'
import Viewer from '@/components/Viewer'

export default {
  name: 'App',
  components: {
    Main, Viewer
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
