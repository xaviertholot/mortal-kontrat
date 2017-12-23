<template>
    <v-layout row wrap class="mb-5">
        <v-flex md4 xs12 sm6 v-for="character in characters">
            <Character :character="character" :actions="actions"/>
        </v-flex>
    </v-layout>
</template>

<script>
import Character from './character.vue'

export default {
    components: {
        Character
    },
    data() {
        return {
            characters: []
        }
    },
    methods: {
    },
    created() {
        const characterResource = this.$resource('characters{/id}');
        characterResource.get().then(characters => {
            this.characters = characters.body.filter(c => c.id !== this.fighterId)
        })
    },
    props: {
        fighterId: {
            type: Number,
            default: null
        },
        actions: {
            type: Array,
            default: () => []
        }
    }
}
</script>

<style scoped>

</style>
