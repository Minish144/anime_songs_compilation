<template>
    <div>
        <button @click="$emit('onclickRandom')">Randomize</button> &emsp;
        <button @click="$emit('onclickPlayPause')" id="playPause">Pause</button> &emsp;
        <button @click="$emit('onclickMoveBack')">←</button> &emsp;
        <button @click="$emit('onclickMoveFrw')">→</button> &emsp;
        <button @click="$emit('onclickFS')">Fullscreen</button> &emsp;
    </div>
</template>

<script>
export default {
    props: ['playPause'],
    data() {
        return {
            paused: true
        }
    }
}
</script>

<style scoped>
    div {
        margin-bottom: 5px;
    }
</style>