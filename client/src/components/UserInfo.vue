<template>
    <div id="user-data" class="flex flex-col w-full h-64 float-left text-xl border-2 rounded border-aqua">
        <div class="font-bold text-xl border-b-2 border-aqua">Account Info</div>
        <div id="user-id" class="text-left"><span class="font-bold ml-4">ID: </span>{{ user.id }}</div>
        <div id="email" class="text-left"><span class="font-bold ml-4">Email: </span>{{ user.email }}</div>
        <div id="points" class="text-left"><span class="font-bold ml-4">Points: </span>{{ user.points }}</div>
    </div>
</template>
<script>
import UserService from '../services/user.service'

export default {
    name: 'UserInfo',
    data() {
        return {
            user: {}
        }
    },
    computed: {
        loggedIn() {
            return this.$store.state.auth.status.loggedIn;
        }
    },
    mounted() {
        if (this.loggedIn) {
            UserService.getUserInfo().then(response => {
                this.user = response.data;
            })
        }
    }
}
</script>
<style scoped>

</style>