// main.js
import { createApp } from './assets/vue/vue.esm-browser.min.js';
import { createRouter, createWebHistory } from './assets/vue/vue-router.esm-browser.min.js';
import App from './App.vue';
import routes from './routes.js';

const app = createApp(App);

const router = createRouter({
  history: createWebHistory(),
  routes,
});

app.use(router);

app.mount('#app');
