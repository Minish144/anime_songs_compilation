<template>
    <div>
        <video :src="source" id="video" ref="video" autoplay="autoplay"></video>
    </div>
</template>

<script>
export default {
    props: ['source'],
    methods: {
        videoUpdate() 
        {
            fetch('http://91.203.192.143:5000/api/songs?random=true&count=1')
                    .then(response => response.json())
                    .then(json => { 
                    this.videoInfo.videoData = json['items'][0];
                    document.getElementById("video").load();})
        }
    }
}
</script>

<style scoped>
video {
    height: 800px !important;
}
</style>