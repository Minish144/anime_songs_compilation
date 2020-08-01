<template>
    <ul>
        <li v-for="item in handleArray(videosData)" :key = "item">
            <SongDataViewer
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
    }, 
    methods: {
        handleArray(arr) {
            if (arr.length < 4){
                return arr.slice(0, arr.length-1);
            }
            else {
                return arr.slice(0, 4);
            }
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