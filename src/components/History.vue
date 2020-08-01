<template>
    <ul>
        <li v-for="item in videosData" :key = "item">
            <SongDataViewer
                v-if="item != {}"
                v-bind:data="item"
            />
        </li>
    </ul>
</template>

<script>
import SongDataViewer from '@/components/SongDataViewer'
export default {
    components: {
        SongDataViewer
    },
    props: ['vData'],
    data() {
        return {
            videosData: this.vData
        }
    }
}
</script>

<style scoped>
    li {
        list-style-type: none;
        margin: 10px;
        margin-left: -30px !important;
    }
</style>