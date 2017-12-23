<template>
    <v-container grid-list-xl text-xs-center>
        <v-layout row wrap>
            <v-flex xs10 offset-xs1>
                <h1 class="white--text mb-2 display-1 text-xs-center">
                    Create a Lawyer
                </h1>
                <Character context="creation"/>
            </v-flex>
        </v-layout>
    </v-container>
</template>

<script>
import Character from './main.vue';

export default {
    created() {
        const characterResource = this.$resource('/characters{/id}');
        this.$root.$on('character-submitted', function ({name, lifepoints, attack, picture}) {
            const character = {character: {name, lifepoints, attack, picture}}
            characterResource.save({}, character).then(response => {
                this.$router.push({ path: 'arena' })
            })
        })
    },
    beforeDestroy() {
        this.$root.$off('character-submitted')
    },
    components: {
        Character
    },
    methods: {
    }
}

</script>

<style scoped>

</style>
