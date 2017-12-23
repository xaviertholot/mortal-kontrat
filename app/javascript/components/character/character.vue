<template>
    <v-card class="mb-3">
        <v-card-media
            :src="character.picture"
            height="200px"
        />
        <v-card-title primary-title>
            <div class="mb-3 text-xs-left">
                 <h3 class="headline mb-3">{{character.name}}</h3>
                 <div class="mb-1">Attack : {{character.attack}}</div>
                 <div class="mb-1">Lifepoints : {{character.lifepoints}}</div>
                 <div class="mb-1">XP : {{character.experience}}</div>
             </div>
            <v-btn
                v-for="action in actions"
                absolute
                dark
                fab
                v-on:click="action.onClick(character.id)"
                :bottom="action.bottom"
                :right="action.right"
                :left="action.left"
                :color="action.color"
            >
                <v-icon>{{action.icon}}</v-icon>
            </v-btn>
        </v-card-title>
    </v-card>
</template>

<script>
export default {
    data() {
        return {
            fighter: this.$route.params.fighter
        }
    },
    methods: {
    },
    props: {
        character: {
            type: Object,
            default: {}
        },
        actions: {
            type: Array,
            default: () => []
        }
    }
}
</script>

<style scoped>

</style>
