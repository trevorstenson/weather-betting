<template>
    <div class="odds-bar flex flex-row border-b-2 border-t-2 border-carbon text-xs h-full justify-center">
        <div v-if="!empty" :style="{ width: `${100 * this.leftPoints}%` }" class="high flex bg-watermelon w-1/2 justify-between items-center">
            <i class="fas fa-angle-double-up text-lg ml-1"/>
            <div class="mr-2">{{ `${(100 * this.leftPoints).toFixed(0)}%` }}</div>
        </div>
        <div v-if="!empty" :style="{ width: `${100 * this.rightPoints}%` }" class="low flex bg-sky w-1/2 justify-between items-center">
            <div class="ml-2">{{ `${(100 * this.rightPoints).toFixed(0)}%` }}</div>
            <i class="fas fa-angle-double-down text-lg mr-1"/>
        </div>
        <div v-if="empty" class="flex w-full h-full justify-center items-center bg-mustard">
            No bets placed
        </div>
    </div>
</template>
<script>
export default {
    name: 'OddsBar',
    props: {
        leftPoints: Number,
        rightPoints: Number
    },
    data() {
        return {
            empty: false
        }
    },
    mounted() {
        if ((isNaN(this.leftPoints) || this.leftPoints == 0) || (isNaN(this.rightPoints) || this.rightPoints == 0)) {
            this.empty = true;
        }
    }
}
</script>