<template>
  <div id="app">
    <Main />
    <Viewer 
      v-bind:source="videoLink"
      v-on:videoEnded="updWebmUrl"
    />
      <VideoNavigationBar 
      v-on:onclickRandom="updWebmUrl"
      v-on:onlickPlayPause="playPauseVid"
      v-on:onlickMoveBack="rewindVid(-10)"
      v-on:onlickMoveFrw="rewindVid(10)"
    />
    <SongDataViewer 
      v-bind:data="videoData"
    />
    <p>
      History
    </p>
    <History 
      v-bind:vData="history"
    />
  </div>
</template>

<script>
import Main from '@/components/Menu'
import Viewer from '@/components/Viewer'
import VideoNavigationBar from '@/components/VideoNavigationBar'
import SongDataViewer from '@/components/SongDataViewer'
import History from '@/components/History'

export default {
  name: 'App',
  components: {
    Main, 
    Viewer, 
    VideoNavigationBar,
    SongDataViewer,
    History
  },
  data() {
    return {
      videoLink: "",
      videoData: {},
      history: []
    }
  },
  mounted() {
    this.updWebmUrl();
    document.getElementById("video").load();
  },
  methods: {
    updWebmUrl() {
      fetch('http://91.203.192.143:5000/api/songs?random=true&count=1')
        .then(response => response.json())
        .then(json => {
          this.history.unshift(this.videoData);

          this.videoData = json['items'][0]; 
          const link = this.videoData['Video_URL'];
          this.setVideoSrc(link);
        })
    },
      setVideoSrc(link) {
        this.videoLink = link;
        document.getElementById("video").load();
        
        console.log(this.videoLink)
        console.log(this.history)
      },
      playPauseVid() {
        var video = document.getElementById("video")

        if (video.paused) {
          video.play();
        } else {
          video.pause();
        }
        console.log(video.currentTime)
      },
      rewindVid(seconds) {
        var video = document.getElementById("video")
        const curTime = video.currentTime
        if (seconds > 0) {
          video.currentTime = curTime + 10;
        } else if (seconds < 0 && curTime > 10) {
          video.currentTime = curTime - 10;
        } else if (seconds <0 && curTime < 10) {
          video.currentTime = 0;
        }
      }
  }
}

</script>

<style>
  body {
    margin: 0;
  }
  #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    background-color: #E8E9F3;
  }
  #app > div:nth-child(1) > h1 {
    margin: 0;
    padding: 20px;
  }
</style>
