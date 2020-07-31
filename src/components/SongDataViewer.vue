<template>
    <div class="text-wrapper">
        From: {{data['Anime_Title']}} <br>
        Song: {{data['Song_Title']}} <br>
        Type: {{data['Song_Type']}} <br>
        <br>
        <a :href="data['Video_URL']">Video link</a> <br>
    </div>
</template>

<script>
    export default {
        props: ['data']
    }
</script>

<style scoped>
    .text-wrapper {
        position: relative;
        width: 300px;
        height: 100px;
        margin-left: auto;
        margin-right: auto;
        padding: 50px;
        margin-top: 10px;
        background-color: bisque;
        border-radius: 1em;
        max-width: 50%;
    }
    a {
        text-decoration: none;
        color:cadetblue;
        text-align: left;
    }
</style>