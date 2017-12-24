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
            :onWeaponClick="onWeaponClick"
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
        onWeaponClick(weaponId) {
            const fighterId = this.$route.params.fighter
            this.$router.push({ name: 'choose-opponent', params: {fighter: fighterId, 'fighterWeapon': weaponId} })
        }
    }
}
</script>

<style scoped>

</style>
