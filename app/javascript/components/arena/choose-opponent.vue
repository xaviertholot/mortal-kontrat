<template>
    <v-container grid-list-xl text-xs-center  style="position: relative">
        <v-layout row wrap class="mb-5">
            <v-flex xs12>
                <h1 class="white--text mb-2 display-1 text-xs-center">
                    Choose your opponent
                </h1>
            </v-flex>
        </v-layout>
        <CharacterList
            :fighterId="fighter"
            :actions="actions"
        />
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
            fighter: this.$route.params.fighter,
            actions: [
                {
                    left: true,
                    bottom: true,
                    color: 'green',
                    onClick: this.fight,
                    icon: 'check'
                }
            ]
        }
    },
    methods: {
        fight(characterId) {
            const fightResource = this.$resource('fights{/id}')
            fightResource.save({}, {fight: {fighter_id: this.fighter, opponent_id: characterId}}).then(response => {
                this.$router.push({ name: 'fight', params: {id: response.body.id} })
            })
        }
    }
}
</script>

<style scoped>

</style>
