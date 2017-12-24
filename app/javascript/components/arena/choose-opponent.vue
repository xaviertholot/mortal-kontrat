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
                    onClick: this.chooseOpponent,
                    icon: 'check'
                }
            ]
        }
    },
    methods: {
        chooseOpponent(opponentId) {
            const routeParams = this.$route.params
            const fighterId = routeParams.fighter
            const fighterWeaponId = routeParams['fighterWeapon']
            this.$router.push({ name: 'choose-opponent-weapon', params:
                {fighter: fighterId, 'fighterWeapon': fighterWeaponId, opponent: opponentId}
            })
        }
    }
}
</script>

<style scoped>

</style>
