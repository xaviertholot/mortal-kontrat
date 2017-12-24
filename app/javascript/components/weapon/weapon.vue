<template>
    <v-card class="mb-3">
        <v-card-media
            contain
            :src="weapon.picture"
            height="200px"
        />
        <v-card-title primary-title>
            <div class="mb-3 text-xs-left">
                 <h3 class="headline mb-3">{{weapon.name}}</h3>
                 <div class="mb-1">Force : {{weapon.force}}</div>
             </div>
            <v-btn
                v-if="onWeaponClick"
                absolute
                dark
                fab
                v-on:click="onWeaponClick(weapon.id)"
                bottom
                right
                color="green"
            >
                <v-icon>check</v-icon>
            </v-btn>
        </v-card-title>
    </v-card>
</template>

<script>
export default {
    data() {
        return {
        }
    },
    methods: {
    },
    props: {
        weapon: {
            type: Object,
            default: () => {}
        },
        onWeaponClick: {
            type: Function,
            default: null
        }
    }
}
</script>

<style scoped>

</style>
