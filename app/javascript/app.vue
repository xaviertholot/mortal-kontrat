<template>
    <v-app dark>
        <Toolbar />
        <main>
            <transition name="slide">
                <router-view></router-view>
            </transition>
        </main>
        <Footer />
    </v-app>
</template>

<script>
import Toolbar from './components/toolbar.vue';
import Footer from './components/footer.vue';

export default {
  data: function () {
    return {
    }
  },
  components: {
    Toolbar,
    Footer
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
