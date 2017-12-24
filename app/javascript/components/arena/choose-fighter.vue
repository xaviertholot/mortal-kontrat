<template>
    <v-container grid-list-xl text-xs-center  style="position: relative">
        <v-layout row wrap class="mb-5">
            <v-flex xs12>
                <h1 class="white--text mb-2 display-1 text-xs-center">
                    Choose your lawyer
                </h1>
            </v-flex>
        </v-layout>
        <CharacterList :actions="actions"/>
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
import CharacterList from '../character/character-list.vue'

export default {
    components: {
        CharacterList
    },
    data() {
        return {
            characters: [],
            actions: [
                {
                    left: true,
                    bottom: true,
                    color: 'green',
                    onClick: this.chooseFighter,
                    icon: 'check'
                },
                {
                    right: true,
                    bottom: true,
                    color: 'red',
                    onClick: this.editFighter,
                    icon: 'edit'
                }
            ]
        }
    },
    methods: {
        chooseFighter(characterId) {
            this.$router.push({ name: 'choose-fighter-weapon', params: {fighter: characterId} })
        },
        editFighter(characterId) {
            this.$router.push({ name: 'character-edit', params: {id: characterId} })
        }
    }
}
</script>

<style scoped>

</style>
