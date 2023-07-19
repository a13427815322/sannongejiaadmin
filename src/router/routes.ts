export const constantRoute = [
    {
        path: '/login',
        component: () => {
           return import('@/views/login/index.vue')
        },
        name: 'login'
    },
    {
        path: '/',
        component: () => {
            return import('@/views/home/index.vue')
        },
        name: 'home'
    },
    {
        path: '/404',
        component: () => {
            return  import('@/views/404/index.vue')
        },
        name: '404'
    },
    {
        path: '/:pathMatch(.*)*',
        redirect: '/404',
        name: 'ANY'
    },
]
