<template>
    <div class='video-wrapper'>
        <video :src="source" id="video" ref="video" width="1280" height="720" autoplay="autoplay" @ended="$emit('videoEnded')"></video>
    </div>
</template>

<script>
export default {
    props: ['source'],
    data() {
        return {
            videoLink: "",
        }
    },
    mounted() {
        fetch('http://91.203.192.143:5000/api/songs?random=true&count=1')
        .then(response => response.json())
        .then(json => this.videoLink = json['items'][0]['Video_URL'])
    },
    methods: {
        
    }
}
</script>

<style scoped>

</style>