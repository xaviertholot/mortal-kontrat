<template>
    <div>
        <h3 class="headline mb-2">
            {{resultLabel}}
        </h3>
        <div class="mb-1">
            {{characterFight.delta_experience > 0 ? '+' : ''}}
            {{characterFight.delta_experience || 0}} XP
        </div>
        <Character :character="characterFight.character"/>
    </div>
</template>

<script>
import Character from '../character/character.vue';

const WIN_LABEL = 'WINNER !';
const LOOSE_LABEL = 'LOOSER !';
const DRAW_LABEL = 'DRAW...';
const WIN_ENUM = 'win';
const LOOSE_ENUM = 'loose';
const DRAW_ENUM = 'draw';

const enum_label_assoc = {
    [WIN_ENUM]: WIN_LABEL,
    [DRAW_ENUM]: DRAW_LABEL,
    [LOOSE_ENUM]: LOOSE_LABEL
}

export default {
    data() {
        return {
            character: false,
            resultLabel: enum_label_assoc[this.characterFight.result]
        }
    },
    components: {
        Character
    },
    methods: {
    },
    props: {
        characterFight: {
            type: Object,
            default: () => {}
        }
    }
}
</script>

<style scoped>

</style>
