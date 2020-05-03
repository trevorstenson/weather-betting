<template>
    <div id="navbar">
      <nav>
        <div class="container mx-auto px-6 py-2 flex justify-between items-center">
          <a class="font-bold text-2xl lg:text-4xl" href="#">
            Sample
          </a>
          <div class="hidden lg:block">
            <ul class="inline-flex">
              <li><router-link to='/'><a class="px-4 font-bold" href="#">Home</a></router-link></li>
              <li><router-link to='/route'><a class="px-4 font-bold" href="#">Route</a></router-link></li>
              <li><a class="px-4 font-bold" href="#">Contact</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
#navbar {
  box-shadow: 10px 5px 5px #3d3d3d;
}
</style>