<template>
    <button v-on:click="handleClick" class="float-right mr-8 font-bold py-2 px-4 border-2 border-carbon hover:bg-aqua rounded">
        {{ buttonText }}
    </button>
</template>
<script>
export default {
    name: 'LoginButton',
    data() {
        return {
            buttonText: 'Login',
        }
    },
    computed: {
        loggedIn() {
            return this.$store.state.auth.status.loggedIn;
        }
    },
    mounted() {
        if (this.loggedIn) {
            this.buttonText = 'Logout';
        }
    },
    methods: {
        handleClick() {
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

</style>