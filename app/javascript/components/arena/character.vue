<template>
    <v-card class="mb-3">
        <v-card-media
            :src="character.picture"
            height="200px"
        />
        <v-card-title primary-title>
            <div class="headline">{{character.name}}</div>
            <router-link v-if="context === 'fighter'" :to="{ name: 'choose-opponent', params: {fighter: character.id} }">
                <v-btn
                      absolute
                      dark
                      fab
                      bottom
                      left
                      color="green"
                    >
                    <v-icon>check</v-icon>
                </v-btn>
            </router-link>
            <v-btn
                v-if="context === 'opponent'"
                v-on:click="fight"
                absolute
                dark
                fab
                bottom
                left
                color="green"
            >
                <v-icon>check</v-icon>
            </v-btn>
            <router-link v-if="context === 'fighter'" :to="{ name: 'character-edit', params: {id: character.id} }">
                <v-btn
                      absolute
                      dark
                      fab
                      bottom
                      right
                      color="red"
                    >
                    <v-icon>edit</v-icon>
                </v-btn>
            </router-link>
        </v-card-title>
        <v-card-actions>

        </v-card-actions>
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
        fight() {
            const fightResource = this.$resource('fights{/id}')
            fightResource.save({}, {fight: {fighter_id: this.fighter, opponent_id: this.character.id}}).then(response => {
                this.$router.push({ name: 'fight', params: {id: response.body.id} })
            })
        }
    },
    props: {
        character: {
            type: Object,
            default: {}
        },
        context: {
            type: String,
            default: 'fighter'
        }
    }
}
</script>

<style scoped>

</style>
