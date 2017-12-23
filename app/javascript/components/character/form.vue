<template>
    <v-form v-model="valid" ref="form">
        <v-text-field
            label="Name"
            v-model="character.name"
            :rules="nameRules"
            required
        />
        <v-text-field
            label="Picture URL"
            v-model="character.picture"
            :rules="pictureRules"
            required
        />
        <v-slider
            label="Attack"
            step="1"
            v-bind:max="10"
            v-bind:min="1"
            v-model="character.attack"
            thumb-label
            ticks
            persistent-hint
            :hint="+character.attack"
        />
        <v-slider
            label="Life points"
            step="1"
            v-bind:max="10"
            v-bind:min="1"
            v-model="character.lifepoints"
            ticks
            thumb-label
            persistent-hint
            :hint="+character.lifepoints"
        />
        <p v-if="!validPoints">You can affect only 10 points maximum</p>
        <v-btn
            color="primary"
            @click="submit"
            :disabled="!valid">{{buttonPrefix}} {{character.name}}
        </v-btn>
    </v-form>
</template>

<script>
const MAX_POINTS = 10;
const EDIT_PREFIX = 'Edit';
const CREATE_PREFIX = 'Create';

export default {
    data () {
        return {
            valid: false,
            validPoints: true,
            nameRules: [
                (v) => !!v || 'Name is required'
            ],
            pictureRules: [
                (v) => !!v || 'A picture URL is required',
                (v) => /^((http|ftp|https):\/\/)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$/.test(v) || 'The URL must be valid'
            ],
            buttonPrefix: this.context === 'creation' ? CREATE_PREFIX : EDIT_PREFIX
        };
    },
    methods: {
        submit(event) {
            if (this.$refs.form.validate() && this.validatePoint()) {
                this.$root.$emit('character-submitted', this.character);
            }
        },
        validatePoint() {
            const valid = this.character.attack + this.character.lifepoints <= MAX_POINTS
            this.validPoints = valid
            return valid;
        }
    },
    props: {
        context: {
            type: String,
            default: 'create'
        },
        character: {
            type: Object,
            default: () => ({
                name: '',
                picture: '',
                attack: 5,
                lifepoints: 5
            })
        }
    }
}
</script>

<style scoped>

</style>
