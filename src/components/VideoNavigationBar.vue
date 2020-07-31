<template>
    <div>
        <button @click="$emit('onclickRandom')">Randomize</button>
        <button @click="$emit('onlickPlayPause')">Pause</button>
        <button @click="$emit('onlickMoveBack')">←</button>
        <button @click="$emit('onlickMoveFrw')">→</button>
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