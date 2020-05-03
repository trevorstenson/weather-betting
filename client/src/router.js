import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from './components/Home'
import Profile from './components/Profile'
import Login from './components/Login'
import Bets from './components/Bets'
import Refresh from './components/Refresh'

Vue.use(VueRouter)

export const router = new VueRouter({
    mode: 'history',
    routes: [
        { path: '/', component: Home },
        { path: '/profile', component: Profile },
        { path: '/login', component: Login },
        { path: '/bets', component: Bets },
        { path: '/refresh', component: Refresh }
    ]
});

router.beforeEach((to, from, next) => {
    const publicPages = ['/', '/login'];
    const authRequired = !publicPages.includes(to.path);    
    const loggedIn = localStorage.getItem('user');

    if (authRequired && !loggedIn) {
        next('/login');
    } else {
        next();
    }
});