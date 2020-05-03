<template>
  <div id="app">
    <Sidenav/>
    <LoginButton/>
    <router-view/>
  </div>
</template>

<script>
//import Navbar from './components/Navbar'
import Sidenav from './components/Sidenav'
import LoginButton from './components/LoginButton'

export default {
  name: 'App',
  components: {
    Sidenav, 
    LoginButton

  }
}
</script>

<style>
#app {
  @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap');
  font-family: 'Roboto', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  background-color: #efefef;
}
</style>
