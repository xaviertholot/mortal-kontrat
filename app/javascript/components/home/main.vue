<template>
    <v-content>
      <section>
        <v-parallax src="lawyer-hammer.jpg" height="600">
          <v-layout
            column
            align-center
            justify-center
            class="white--text"
          >
            <h1 class="white--text mb-2 display-1 text-xs-center">Mortal Kontrat</h1>
            <div class="subheading mb-3 text-xs-center">A barely legal game</div>
            <router-link to="/arena">
                <v-btn
                  class="blue lighten-2 mt-5"
                  dark
                  large
                >
                  Fight !
                </v-btn>
            </router-link>
          </v-layout>
        </v-parallax>
      </section>

      <section>
        <v-layout
          column
          wrap
          class="my-5"
          align-center
        >
          <v-flex xs12 sm4 class="my-3">
            <div class="text-xs-center">
              <h2 class="headline">Fight against real lawyers</h2>
              <span class="subheading">
                Not for justice, just for fun
              </span>
            </div>
          </v-flex>
          <v-flex xs12>
            <v-container grid-list-xl>
              <v-layout row wrap align-center>
                <v-flex xs12 md4>
                  <v-card class="elevation-0 transparent">
                    <v-card-text class="text-xs-center">
                      <v-icon x-large class="blue--text text--lighten-2">color_lens</v-icon>
                    </v-card-text>
                    <v-card-title primary-title class="layout justify-center">
                      <div class="headline text-xs-center">Create and customize your lawyer</div>
                    </v-card-title>
                    <v-card-text>
                      Create the lawyer you've always dreamed of. Name him, and give a picture to him, you'll be all set !
                    </v-card-text>
                  </v-card>
                </v-flex>
                <v-flex xs12 md4>
                  <v-card class="elevation-0 transparent">
                    <v-card-text class="text-xs-center">
                      <v-icon x-large class="blue--text text--lighten-2">flash_on</v-icon>
                    </v-card-text>
                    <v-card-title primary-title class="layout justify-center">
                      <div class="headline">Fight !</div>
                    </v-card-title>
                    <v-card-text>
                      Fight against another lawyer
                    </v-card-text>
                  </v-card>
                </v-flex>
                <v-flex xs12 md4>
                  <v-card class="elevation-0 transparent">
                    <v-card-text class="text-xs-center">
                      <v-icon x-large class="blue--text text--lighten-2">build</v-icon>
                    </v-card-text>
                    <v-card-title primary-title class="layout justify-center">
                      <div class="headline text-xs-center">Become the best</div>
                    </v-card-title>
                    <v-card-text>
                      Make your lawyer gain experience ! The more your lawyer will gain experience, the strongest he will become.
                    </v-card-text>
                  </v-card>
                </v-flex>
              </v-layout>
            </v-container>
          </v-flex>
        </v-layout>
      </section>
    </v-content>
</template>

<script>
export default {
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
