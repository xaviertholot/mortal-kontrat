<template>
    <v-container grid-list-xl text-xs-center  style="position: relative">
        <v-layout row wrap class="mb-5">
            <v-flex xs12>
                <h1 class="white--text mb-2 display-1 text-xs-center">
                    Choose your weapon
                </h1>
            </v-flex>
        </v-layout>
        <WeaponList
            :onWeaponClick="fight"
        />
    </v-container>
</template>

<script>
import WeaponList from './weapon-list.vue'

export default {
    components: {
        WeaponList
    },
    data() {
        return {
        }
    },
    methods: {
        fight(opponentWeaponId) {
            const routeParams = this.$route.params
            const fighterId = routeParams.fighter
            const fighterWeaponId = routeParams['fighterWeapon']
            const opponentId = routeParams.opponent
            const fightResource = this.$resource('fights{/id}')
            fightResource.save({}, {fight: {character_fights: [
                {character: {id: fighterId}, weapon: {id: fighterWeaponId}},
                {character: {id: opponentId}, weapon: {id: opponentWeaponId}}
            ]}}).then(response => {
                this.$router.push({ name: 'fight', params: {id: response.body.id} })
            })
        }
    }
}
</script>

<style scoped>

</style>
