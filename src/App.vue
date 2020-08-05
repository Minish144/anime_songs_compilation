<template>
  <div id="app">
    <Main />
    <Viewer 
      v-bind:source="videoLink"
      v-on:videoEnded="updWebmUrl"
    />
    <VideoNavigationBar 
      v-on:onclickRandom="updWebmUrl"
      v-on:onclickPlayPause="playPauseVid"
      v-on:onclickMoveBack="rewindVid(-10)"
      v-on:onclickMoveFrw="rewindVid(10)"
      v-on:onclickFS="vidFullscreen"
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
      },
      playPauseVid() {
        var video = document.getElementById("video")
        if (video.paused) {
          video.play();
        } else {
          video.pause();
        }
        this.changePlayButtonLeg();
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
      },
      vidFullscreen() {
        var video = document.getElementById("video")

        if (video.requestFullscreen) {
        video.requestFullscreen();
        } else if (video.mozRequestFullScreen) { /* Firefox */
        video.mozRequestFullScreen();
        } else if (video.webkitRequestFullscreen) { /* Chrome, Safari and Opera */
        video.webkitRequestFullscreen();
        } else if (video.msRequestFullscreen) { /* IE/Edge */
        video.msRequestFullscreen();
        }
      },
      changePlayButtonLeg() {
        const pbutton = document.getElementById("playPause");
        const val = pbutton.innerText;
        console.log(val);
        if (val == 'Pause') {
          pbutton.innerText = "Play";
        } else {
          pbutton.innerText = "Pause";
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
