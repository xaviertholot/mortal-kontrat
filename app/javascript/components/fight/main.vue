<template>
    <v-container grid-list-xl text-xs-center>
        <v-layout row wrap>
            <v-flex xs10 offset-xs1>
                <h1 class="white--text mb-2 display-1 text-xs-center">
                    Fight summary
                </h1>
            </v-flex>
            <v-flex xs6 v-for="characterFight in fight.character_fights">
                <CharacterFightSummary :characterFight="characterFight" />
            </v-flex>
            <v-flex>
                <router-link to="/">
                    <v-btn
                      class="red lighten-2 mt-5"
                      dark
                      large
                    >
                      Back to home
                    </v-btn>
                </router-link>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
import CharacterFightSummary from './character-fight-summary.vue';

export default {
    components: {
        CharacterFightSummary
    },
    data() {
        return {
            fight: {}
        }
    },
    methods: {
    },
    created() {
        const fightResource = this.$resource('fights{/id}')
        fightResource.get({id: this.$route.params.id}).then(response => {
            this.fight = response.body
        })
    }
}
</script>

<style scoped>

</style>
