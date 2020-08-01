<template>
    <div class="text-wrapper">
        From: "{{data['Anime_Title']}}" <br><br>
        Song: <a :href="data['Video_URL']">"{{data['Song_Title']}}"</a> <br><br>
        Type: {{data['Song_Type']}}
    </div>
</template>

<script>
    export default {
        props: ['data']
    }
</script>

<style scoped>
    .text-wrapper {
        text-align: left;
        width: 300px;
        height: 100px;
        background-color: bisque;
        border-radius: 1em;
        max-width: 50%;
        display: inline-block;
        padding: 50px;
    }
    a {
        text-decoration: none;
        color:cadetblue;
    }
</style>