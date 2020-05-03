<template>
    <div id="bets" class="flex flex-col w-screen h-screen justify-start bg-neutral">
        <div id="title-bar" class="flex flex-row h-16 justify-center">
        <div id="header" class="flex w-5/6 mt-2 border-b-4 border-watermelon">
            <h1 class="text-4xl font-bold">Upcoming Bets</h1>
        </div>
        </div>
        <div id="data-container" class="flex flex-row w-screen h-screen justify-center">
        <div id="data" class="flex flex-row w-5/6 mt-3 border-4 rounded justify-between border-watermelon">
            <div id="bet-list" class="flex flex-col w-3/5 text-xl ml-4 mt-4">
                <BetCard v-bind:bet="bet" v-for="bet in bets" :key="bet.id"/>
            </div>
            <BetSlip/>
        </div>
        </div>
    </div>
</template>
<script>
import BetsService from '../services/bets.service'
import BetCard from './BetCard'
import BetSlip from './BetSlip'
import { bus } from '../main'

export default {
    name: 'Bets',
    components: {
        BetCard, BetSlip
    },
    data() {
        return {
            bets: []
        }
    },
    created() {
        bus.$on('updateBets', () => {
            console.log('received')
            this.updateBets();
        });
    },
    mounted() {
        this.updateBets();
    },
    methods: {
        updateBets() {
            BetsService.getAllBets().then(
                response => {
                    this.bets = JSON.parse(response.data.bets);
                },
                error => {
                    console.log(error);
                }
            );
        }
    }
}
</script>
<style scoped>
</style>