<template>
    <div>
        <video v-bind:src="videoLink" autoplay="autoplay" controls="controls"></video>
    </div>
</template>

<script>
export default {
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

<style scoped>
    video {
        width: 50%;
        height: auto;
    }
</style>