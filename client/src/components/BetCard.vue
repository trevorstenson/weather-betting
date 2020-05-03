<template>
    <div class="mb-3 h-48 border-2 rounded border-carbon shadow-xl w-full">
        <div class="date float-left items-center flex flex-row justify-center w-1/5 h-full bg-carbon">
            {{ bet.date }}
        </div>
        <div class="bet-info flex flex-row items-center h-full w-auto">
            <div class="location ml-4 mr-8 text-3xl flex items-center w-1/2 h-full">
                {{ bet.location }}
            </div>
            <div class="temps font-bold flex flex-col border-l-2 border-r-2 border-carbon h-full w-1/3 items-center">
                <div class="high text-lg flex items-center h-full w-full justify-center border-b-2 border-carbon">
                    {{ `${bet.high}°F` }}
                </div>
                <div class="low text-lg h-full w-full justify-center flex items-center">
                    {{ `${bet.low}°F` }}
                </div>
            </div>
            <div class="options flex flex-col h-full w-2/5 items-center font-bold text-lg">
                <div class="high flex flex-col h-full w-full">
                    <div @click="handleHighOver(bet)" class="over flex hover:bg-aqua h-full w-full justify-center items-center">
                        {{ `O${bet.high}°F` }}
                    </div>
                    <OddsBar 
                    v-bind:leftPoints="bet.over_high_points/(bet.under_high_points + bet.over_high_points)"
                    v-bind:rightPoints="bet.under_high_points/(bet.under_high_points + bet.over_high_points)"
                    />
                    <div @click="handleHighUnder(bet)" class="under flex border-b-2 border-carbon hover:bg-aqua h-full w-full justify-center items-center">
                        {{ `U${bet.high}°F` }}
                    </div>
                </div>
                <div class="high flex flex-col h-full w-full">
                    <div @click="handleLowOver(bet)" class="over flex h-full hover:bg-aqua w-full justify-center items-center">
                        {{ `O${bet.low}°F` }}
                    </div>
                    <OddsBar 
                    v-bind:leftPoints="bet.over_low_points/(bet.under_low_points + bet.over_low_points)"
                    v-bind:rightPoints="bet.under_low_points/(bet.under_low_points + bet.over_low_points)"
                    />
                    <div @click="handleLowUnder(bet)" class="under flex h-full hover:bg-aqua w-full justify-center items-center">
                        {{ `U${bet.low}°F` }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import OddsBar from './OddsBar'

import { bus } from '../main'

export default {
    name: 'BetCard',
    components: {
        OddsBar
    },
    props: {
        bet: Object
    },
    data() {
        return {
            
        }
    },
    mounted() {

    },
    methods: {
        handleHighOver(bet) {
            bus.$emit('highOver', bet)
        },
        handleHighUnder(bet) {
            bus.$emit('highUnder', bet)
        },
        handleLowOver(bet) {
            bus.$emit('lowOver', bet)
        },
        handleLowUnder(bet) {
            bus.$emit('lowUnder', bet)
        }
    }
}
</script>