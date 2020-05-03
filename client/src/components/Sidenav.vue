<template>
  <div id="sidenav">
    <sidebar-menu :menu="menu" :collapsed="true" :showchild="false">
    </sidebar-menu>
  </div>
</template>

<script>
export default {
    data() {
        return {
            menu: [
                {
                    header: true,
                    title: 'Main Navigation',
                    hiddenOnCollapse: true
                },
                {
                    href: '/profile',
                    title: 'Profile',
                    icon: 'fa fa-user',
                    child: [
                        {
                            href: '/profile/history',
                            title: 'Bet History',
                            icon: 'fa fa-history'
                        }
                    ]
                },
                {
                    href: '/bets',
                    title: 'Betting Options',
                    icon: 'fa fa-cloud-sun-rain',
                    child: [
                        {
                            href: '/bets/temperature',
                            title: 'Temperature',
                            icon: 'fa fa-temperature-high'
                        },
                        {
                            href: '/bets/precipitation',
                            title: 'Precipitation',
                            icon: 'fa fa-tint'
                        }
                    ]
                },
                {
                    href: '/charts',
                    title: 'Charts',
                    icon: 'fa fa-chart-area',
                    child: [
                        {
                            href: '/charts/sublink',
                            title: 'Sub Link'
                        }
                    ]
                },
                {
                    title: 'Login'
                    
                }
            ]
        }
    }
}
</script>

<style>

</style>
