<template>
    <div id="dashboard" class="flex flex-col w-screen h-screen justify-start bg-neutral">
        <div id="title-bar" class="flex flex-row h-16 justify-center">
        <div id="header" class="flex w-5/6 mt-2 border-b-2 border-watermelon">
            <h1 class="text-4xl font-bold">My Dashboard</h1>
        </div>
        </div>
        <div id="data-container" class="flex flex-row w-screen h-screen justify-center">
            <div id="data" class="flex w-5/6 mt-3">
                <div class="flex flex-col w-5/12">
                    <UserInfo/>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import UserInfo from './UserInfo'

export default {
    name: 'Profile',
    components: {
        UserInfo
    }
}
</script>
<style scoped>

</style>