<template>
  <div id="app">
    <Main />
    <Viewer 
      v-bind:source="videoLink"
      v-on:videoEnded="updWebmUrl"
    />
      <VideoNavigationBar 
      v-on:onClick="updWebmUrl"
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
    Main, 
    Viewer, 
    VideoNavigationBar
  },
  data() {
    return {
      videoLink: "",
      videoData: {}
    }
  },
  mounted() {
    this.updWebmUrl();
  },
  methods: {
    updWebmUrl() {
      fetch('http://91.203.192.143:5000/api/songs?random=true&count=1')
        .then(response => response.json())
        .then(json => { 
          this.videoData = json['items'][0]; 
          const link = this.videoData['Video_URL']
          this.setVideoSrc(link);
        })
    },
      setVideoSrc(link) {
        this.videoLink = link;
        document.getElementById("video").load();
        
        console.log(this.videoLink)
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
