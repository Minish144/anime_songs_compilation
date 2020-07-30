<template>
  <div id="app">
    <Main />
    <Viewer 
      v-model="videoLink" />
      <VideoNavigationBar 
      v-on:onClick="getWebmUrl"
    />
  </div>
</template>

<script>
import Main from '@/components/Menu'
import Viewer from '@/components/Viewer'
import VideoNavigationBar from '@/components/VideoNavigationBar'

export default {
  name: 'App',
  components: {
    Main, Viewer, VideoNavigationBar
  },
  data() {
    return {
      videoLink: "",
      videoData: {}
    }
  },
  methods: {
    getWebmUrl() {
      fetch('http://91.203.192.143:5000/api/songs?random=true&count=1')
        .then(response => response.json())
        .then(json => { 
          this.videoData = json['items'][0]; 
          const link = this.videoData['Video_URL']
          this.videoUpdate(link);
        })
    },
      videoUpdate(link) {
        document.getElementById("video").src = link;
        document.getElementById("video").load();
        
        console.log(this.$refs.video.src)
      }
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
