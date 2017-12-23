<template>
    <v-container grid-list-xl text-xs-center  style="position: relative">
        <v-layout row wrap class="mb-5">
            <v-flex xs12>
                <h1 class="white--text mb-2 display-1 text-xs-center">
                    Choose your lawyer
                </h1>
            </v-flex>
        </v-layout>
        <CharacterList context="fighter"/>
        <router-link to="/character-create">
            <v-btn
                dark
                fab
                color="primary"
            >
                <v-icon>add</v-icon>
            </v-btn>
        </router-link>
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
            characters: []
        }
    },
    methods: {
    }
}
</script>

<style scoped>

</style>
