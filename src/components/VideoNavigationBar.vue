<template>
    <div>
        <button @click="$emit('onclickRandom')">Randomize</button> &emsp;
        <button @click="$emit('onlickPlayPause')">Pause</button> &emsp;
        <button @click="$emit('onlickMoveBack')">←</button> &emsp;
        <button @click="$emit('onlickMoveFrw')">→</button> &emsp;
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

<style lang="scss" scoped>

</style>