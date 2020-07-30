<template>
  <div id="app">
    <Main />
    <Viewer 
    v-model="videoLink"
    />
  </div>
</template>

<script>
import Main from '@/components/Menu'
import Viewer from '@/components/Viewer'

export default {
  name: 'App',
  components: {
    Main, Viewer
  },
  data() {
    return {
      videoLink: ""
    }
  },
  mounted() {
    fetch('http://91.203.192.143:5000/api/songs?random=true&count=1')
      .then(response => response.json())
      .then(json => this.videoLink = json['items'][0]['Video_URL'])
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
