<template>
    <div id="bet-slip" class="mt-4 mr-4 w-1/3 border-4 rounded border-aqua shadow-xl">
        <div class="flex text-xl justify-start font-bold m-auto border-b-2 border-aqua w-11/12">Bet Slip</div>
        <div class="flex flex-col mt-3 items-center">
            <div v-for="bet in bets" :key="bet.idx" class="flex flex-row w-11/12 h-16 border-2 rounded border-carbon mb-3 justify-start shadow-xl">
                <div class="flex flex-col justify-center px-2 border-r-2 border-carbon w-1/3 text-sm">
                    <div class="h-1/2 font-bold">
                        {{ bet.location }}
                    </div>
                    <div class="h-1/2">
                        {{ bet.date }}
                    </div>
                </div>
                <div class="flex border-r-2 border-carbon w-1/3 justify-center items-center text-lg font-bold">
                    {{ bet.info }}
                </div>
                <div class="flex w-2/3 justify-around items-center text-xl">
                    <input type="text" v-model="bet.betAmount" placeholder="Amount" class=" text-center border-2 rounded border-carbon outline-none w-1/2"/>
                    <div v-on:click="removeBet(bet.idx)" class="w-8 h-8 border-2 border-carbon rounded text-watermelon hover:text-sky hover:bg-watermelon">
                        <i class="fas fa-times"/>
                    </div>
                </div>
            </div>
            <div v-if="this.bets.length > 0" class="w-11/12 border-t-2 border-carbon py-2 mt-3">
                <button @click="submitBets()" class="bg-mustard w-full text-xl border-2 border-carbon font-bold py-4 rounded hover:shadow-2xl shadow-xl mt-4">
                    Place Bets
                </button>
            </div>
        </div>
        
    </div> 
</template>
<script>
import { bus } from '../main'
import { betTypes } from '../lib/betType'
import BetsService from '../services/bets.service'
// import UserService from '../services/user.service'

export default {
    name: 'BetSlip',
    data() {
        return {
            bets: [],
            count: 0,
            points: 0
        }
    },
    created() {
        bus.$on('highOver', bet => {
            this.handleNewHighOverBet(bet)
        });

        bus.$on('highUnder', bet => {
            this.handleNewHighUnderBet(bet)
        });

        bus.$on('lowOver', bet => {
            this.handleNewLowOverBet(bet)
        });

        bus.$on('lowUnder', bet => {
            this.handleNewLowUnderBet(bet)
        });
    },
    mounted() {
        this.points = JSON.parse(localStorage.getItem('user')).points;
    },
    computed: {
        submittable() {
            return this.bets.length > 0
                && this.bets.every(bet => {
                    return 'betAmount' in bet;
                });
        }
    },
    methods: {
        submitBets() {
            if (this.submittable) {
                console.log('submittable')
                BetsService.submitBets(this.bets).then(response => {
                    console.log(response.status)
                    if (response.status == 200) {
                        console.log('successful bet')
                        this.bets = []
                        // UserService.updateUserInfo();
                        bus.$emit('updateBets');
                    } else {
                        console.log(response)
                    }
                }).catch(e => {
                    console.log(e)
                })
            } else {
                console.log('aww')
            }
        },
        removeBet(idx) {
            this.bets = this.bets.filter(bet => {
                return bet.idx !== idx;
            });
        },
        getBetInfo(bet) {
            let dir = '';
            let temp = 0;
            switch (bet.type) {
                case betTypes.OVERHIGH:
                    dir = 'O';
                    temp = bet.high;
                    break;
                case betTypes.UNDERHIGH:
                    dir = 'U';
                    temp = bet.high;
                    break;
                case betTypes.OVERLOW:
                    dir = 'O';
                    temp = bet.low;
                    break;
                case betTypes.UNDERLOW:
                    dir = 'U';
                    temp = bet.low;
                    break;
            }
            return dir + temp + '°F';
        },
        handleNewHighOverBet(bet) {
            bet.type = betTypes.OVERHIGH;
            this.handleBet(bet);
        },
        handleNewHighUnderBet(bet) {
            bet.type = betTypes.UNDERHIGH;
            this.handleBet(bet);
        },
        handleNewLowOverBet(bet) {
            bet.type = betTypes.OVERLOW;
            this.handleBet(bet);
        },
        handleNewLowUnderBet(bet) {
            bet.type = betTypes.UNDERLOW;
            this.handleBet(bet);
        },
        handleBet(bet) {
            bet.idx = this.count;
            bet.info = this.getBetInfo(bet);
            let copiedBet = JSON.parse(JSON.stringify(bet));
            this.bets.push(copiedBet);
            this.count++;
        }
    }
}
</script>
<style scoped>

</style>