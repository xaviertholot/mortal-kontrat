<template>
    <v-layout row wrap class="mb-5">
        <v-flex md4 xs12 sm6 v-for="weapon in weapons">
            <Weapon :weapon="weapon" :onWeaponClick="onWeaponClick"/>
        </v-flex>
    </v-layout>
</template>

<script>
import Weapon from './weapon.vue'

export default {
    components: {
        Weapon
    },
    data() {
        return {
            weapons: []
        }
    },
    methods: {
    },
    created() {
        const weaponResource = this.$resource('weapons{/id}');
        weaponResource.get().then(response => {
            this.weapons = response.body
        })
    },
    props: {
        onWeaponClick: {
            type: Function,
            default: () => {}
        }
    }
}
</script>

<style scoped>

</style>
