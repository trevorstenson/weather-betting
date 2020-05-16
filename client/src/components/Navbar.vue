<template>
    <nav class="bg-dark">
  <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
    <div class="relative flex items-center justify-between h-16">
      <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
        <!-- Mobile menu button-->
        <button class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:bg-gray-700 focus:text-white transition duration-150 ease-in-out" aria-label="Main menu" aria-expanded="false">
          <!-- Icon when menu is closed. -->
          <!-- Menu open: "hidden", Menu closed: "block" -->
          <svg class="block h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
          </svg>
          <!-- Icon when menu is open. -->
          <!-- Menu open: "block", Menu closed: "hidden" -->
          <svg class="hidden h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
          </svg>
        </button>
      </div>
      <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
        <div class="hidden sm:block sm:ml-2">
          <div class="flex text-neutral text-xl">
            <a href="/bets" class="px-3 py-2 rounded-md hover:bg-carbon transition duration-150 ease-in-out">Weather Bets</a>
            <a href="#" class="ml-4 px-3 py-2 rounded-md hover:bg-carbon transition duration-150 ease-in-out">Team</a>
            <a href="#" class="ml-4 px-3 py-2 rounded-md hover:bg-carbon transition duration-150 ease-in-out">Projects</a>
            <a href="#" class="ml-4 px-3 py-2 rounded-md hover:bg-carbon transition duration-150 ease-in-out">Calendar</a>
          </div>
        </div>
      </div>
      <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">

        <!-- Profile dropdown -->
        <div class="ml-3 relative">
          <div>
            <button @click="toggleDropdown" class="flex focus:outline-none transition duration-150 ease-in-out text-neutral" id="user-menu" aria-label="User menu" aria-haspopup="true">
              <i class="fa fa-user-circle fa-2x"></i>
            </button>
          </div>
          <div v-if="this.dropdown" class="bg-neutral origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg">
            <div class="py-1 rounded-md bg-white shadow-xs" role="menu" aria-orientation="vertical" aria-labelledby="user-menu">
              <a href="/profile" class="block px-4 py-2 text-sm leading-5 text-gray-700 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 transition duration-150 ease-in-out">Profile</a>
              <a href="/login" @click="handleLogin()" class="block px-4 py-2 text-sm leading-5 text-gray-700 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 transition duration-150 ease-in-out">{{ loginButtonText }}</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--
    Mobile menu, toggle classes based on menu state.

    Menu open: "block", Menu closed: "hidden"
  -->
  <div class="hidden sm:hidden">
    <div class="px-2 pt-2 pb-3">
      <a href="#" class="block px-3 py-2 rounded-md text-base font-medium text-white bg-gray-900 focus:outline-none focus:text-white focus:bg-gray-700 transition duration-150 ease-in-out">Dashboard</a>
      <a href="#" class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700 transition duration-150 ease-in-out">Team</a>
      <a href="#" class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700 transition duration-150 ease-in-out">Projects</a>
      <a href="#" class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-gray-300 hover:text-white hover:bg-gray-700 focus:outline-none focus:text-white focus:bg-gray-700 transition duration-150 ease-in-out">Calendar</a>
    </div>
  </div>
</nav>
</template>
<script>
export default {
    data() {
      return {
        dropdown: false,
        loginButtonText: 'Login'
      }
    },
    computed: {
        loggedIn() {
            return this.$store.state.auth.status.loggedIn;
        }
    },
    mounted() {
      if (this.loggedIn) {
        this.loginButtonText = 'Logout';
      }
    },
    methods: {
      toggleDropdown() {
        this.dropdown = !this.dropdown
      },
      handleLogin() {
        if (this.loggedIn) {
            this.$store.dispatch('auth/logout');
        }
        this.$router.push('/login').catch(err => {
            this.$router.push({ name: "/refresh" });
            console.log(err)
        });
        }
    }
}
</script>
<style scoped>
#navbar {
  box-shadow: 10px 5px 5px #3d3d3d;
}
</style>