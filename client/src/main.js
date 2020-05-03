import Vue from 'vue'
import { router } from './router'
import store from './store'
import VueSidebarMenu from 'vue-sidebar-menu'
import 'vue-sidebar-menu/dist/vue-sidebar-menu.css'
import './assets/styles/index.css'
import './assets/styles/global.css'
import App from './App.vue'

import LoadScript from 'vue-plugin-load-script';
Vue.use(LoadScript);

Vue.loadScript("https://kit.fontawesome.com/5734df6256.js");

Vue.config.productionTip = false

Vue.use(VueSidebarMenu)

export const bus = new Vue();

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
