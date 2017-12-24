import VueRouter from 'vue-router';
import Home from '../components/home/main.vue';
import Arena from '../components/arena/choose-fighter.vue';
import CharacterCreate from '../components/character/create.vue';
import CharacterEdit from '../components/character/edit.vue';
import ChooseOpponent from '../components/arena/choose-opponent.vue';
import Fight from '../components/fight/main.vue';

const routes = [
  { path: '/', component: Home },
  { path: '/arena', component: Arena },
  { path: '/character-create', component: CharacterCreate },
  { name: 'character-edit', component: CharacterEdit, params: ['id'], path: '/character-edit/:id'},
  { name: 'choose-opponent', component: ChooseOpponent, params: ['fighter'], path: '/choose-opponent/:fighter'},
  { name: 'fight', component: Fight, params: ['id'], path: '/fight/:id'}
];

export default new VueRouter({
  routes,
  scrollBehavior(to, from, savedPosition) {
      if (savedPosition) {
        return savedPosition
      } else {
        return { x: 0, y: 0 }
      }
  }
});
