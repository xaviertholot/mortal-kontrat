<template>
    <v-container grid-list-xl text-xs-center  style="position: relative">
        <v-layout row wrap class="mb-5">
            <v-flex xs12>
                <h1 class="white--text mb-2 display-1 text-xs-center">
                    Choose your opponent
                </h1>
            </v-flex>
        </v-layout>
        <CharacterList :fighterId="fighter" context="opponent"/>
    </v-container>
</template>

<script>
import CharacterList from './character-list.vue'

export default {
    components: {
        CharacterList
    },
    data() {
        return {
            fighter: this.$route.params.fighter
        }
    },
    methods: {
    }
}
</script>

<style scoped>

</style>
