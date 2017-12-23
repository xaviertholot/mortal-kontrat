<template>
    <div id="app">
      <v-app dark>
        <Toolbar />
        <main>
            <transition name="slide">
                <router-view />
            </transition>
        </main>
        <Footer />
      </v-app>
   </div>
</template>

<script>
import Toolbar from './components/toolbar.vue';
import Footer from './components/footer.vue';

export default {
  data: function () {
    return {
      title: "Hello Vue!"
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
