<template>
    <div id="login" class="flex flex-col items-center w-screen h-screen justify-center">
        <form class="w-full max-w-sm">
            <div class="md:flex md:items-center mb-6">
                <h1 class="text-4xl pl-8">Signup</h1>
            </div>
            <div class="md:flex md:items-center mb-6">
                <div class="md:w-1/3">
                <label class="block font-bold md:text-right mb-1 md:mb-0 pr-4" for="inline-full-name">
                    Name
                </label>
                </div>
                <div class="md:w-2/3">
                <input v-model="user.name" class="form-control bg-gray-200 appearance-none border-2 border-watermelon rounded w-full py-2 px-4 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" type="text">
                </div>
            </div>
            <div class="md:flex md:items-center mb-6">
                <div class="md:w-1/3">
                <label class="block font-bold md:text-right mb-1 md:mb-0 pr-4" for="inline-full-name">
                    Email
                </label>
                </div>
                <div class="md:w-2/3">
                <input v-model="user.email" class="form-control bg-gray-200 appearance-none border-2 border-watermelon rounded w-full py-2 px-4 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" type="text">
                </div>
            </div>
            <div class="md:flex md:items-center mb-6">
                <div class="md:w-1/3">
                <label class="block font-bold md:text-right mb-1 md:mb-0 pr-4" for="inline-full-name">
                    Username
                </label>
                </div>
                <div class="md:w-2/3">
                <input v-model="user.username" class="form-control bg-gray-200 appearance-none border-2 border-watermelon rounded w-full py-2 px-4 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" type="text">
                </div>
            </div>
            <div class="md:flex md:items-center mb-6">
                <div class="md:w-1/3">
                <label class="block font-bold md:text-right mb-1 md:mb-0 pr-4" for="inline-username">
                    Password
                </label>
                </div>
                <div class="md:w-2/3">
                <input v-model="user.password" class="form-control bg-gray-200 appearance-none border-2 border-watermelon rounded w-full py-2 px-4 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" type="password" placeholder="******************">
                </div>
            </div>
            <div class="md:flex md:items-center mb-6">
                <div class="md:w-1/3"></div>
                <div class="md:w-2/3">
                <button @click="handleRegister()" class="w-full shadow focus:shadow-outline focus:outline-none font-bold py-2 px-4 rounded border-2 border-watermelon" type="button">
                    Sign Up
                </button>
                </div>
            </div>
            <div class="md:flex md:items-center">
                <div class="md:w-1/3"></div>
                <div class="md:w-2/3">
                <button @click="handleLogin()" class="w-full shadow focus:shadow-outline focus:outline-none font-bold py-2 px-4 rounded border-2 border-watermelon" type="button">
                    Login
                </button>
                </div>
            </div>
            <div class="form-group text-2xl">{{message}}</div>
        </form>
    </div>
</template>
<script>
import User from '../models/user'

export default {
  name: 'Login',
  data() {
    return {
      user: new User('','', '', ''),
      submitted: false,
      successful: false,
      message: ''
    };
  },
  computed: {
    loggedIn() {
      return this.$store.state.auth.status.loggedIn;
    }
  },
  mounted() {
    if (this.loggedIn) {
      this.$router.push('/profile');
    }
  },
  methods: {
    handleRegister() {
      this.message = '';
      this.submitted = true;
        this.$store.dispatch('auth/register', this.user).then(
        data => {
            this.message = data;
            this.successful = true;
        },
        error => {
            this.message =
            (error.response && error.response.data) ||
            error.message ||
            error.toString();
            this.successful = false;
        }
        );
    },
    handleLogin() {
        if (this.user.email && this.user.password) {
          this.$store.dispatch('auth/login', this.user).then(
            () => {
              this.$router.push('/profile');
            },
            error => {
              this.message =
                (error.response && error.response.data) ||
                error.message ||
                error.toString();
            }
          );
        }
    }
  }
};
</script>
<style scoped>
</style>