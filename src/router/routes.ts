export const constantRoute = [
  {
    path: '/login',
    component: () => import('@/views/login/index.vue'),
    name: 'Login',
    meta: {
      name: '登录',
      hidden: true,
      icon: 'Compass',
    },
  },
  {
    path: '/',
    component: () => import('@/layout/index.vue'),
    name: 'layout',
    redirect: '/home',
    children: [
      {
        path: '/home',
        component: () => import('@/views/home/index.vue'),
        meta: {
          name: '首页',
          hidden: false,
          icon: 'HomeFilled',
        },
      },
    ],
    meta: {
      name: '',
      hidden: false,
      icon: 'TurnOff',
    },
  },
  // {
  //   path: '/screen',
  //   component: () => import('@/views/screen/index.vue'),
  //   name: 'Screen',
  //   meta: {
  //     name: '数据大屏',
  //     hidden: false,
  //     icon: 'DataAnalysis',
  //   },
  // },

  {
    path: '/404',
    component: () => {
      return import('@/views/404/index.vue')
    },
    name: '404',
    meta: {
      name: '404',
      hidden: true,
      icon: 'Pointer',
    },
  },
]

export const asyncRoute = [
  {
    path: '/acl',
    component: () => import('@/layout/index.vue'),
    name: 'Acl',
    meta: {
      name: '权限管理',
      hidden: false,
      icon: 'Lock',
    },
    redirect: '/acl/user',
    children: [
      {
        path: '/acl/user',
        name: 'Acl',
        component: () => import('@/views/acl/user/index.vue'),
        meta: {
          name: '用户管理',
          icon: 'User',
          hidden: false,
        },
      },
      {
        path: '/acl/role',
        name: 'Role',
        component: () => import('@/views/acl/role/index.vue'),
        meta: {
          name: '角色管理',
          icon: 'UserFilled',
          hidden: false,
        },
      },
      {
        path: '/acl/permisson',
        name: 'Permisson',
        component: () => import('@/views/acl/permisson/index.vue'),
        meta: {
          name: '菜单管理',
          icon: 'List',
          hidden: false,
        },
      },
    ],
  },
  {
    path: '/product',
    name: 'Product',
    component: () => import('@/layout/index.vue'),
    meta: {
      name: '商品管理',
      hidden: false,
      icon: 'ShoppingCart',
    },
    redirect: '/product/attr',
    children: [
      {
        path: '/product/attr',
        name: 'Attr',
        component: () => import('@/views/product/attr/index.vue'),
        meta: {
          name: '属性管理',
          hidden: false,
          icon: 'Key',
        },
      },
      {
        path: '/product/spu',
        name: 'Spu',
        component: () => import('@/views/product/spu/index.vue'),
        meta: {
          name: 'spu管理',
          hidden: false,
          icon: 'Calendar',
        },
      },
      {
        path: '/product/sku',
        name: 'Sku',
        component: () => import('@/views/product/sku/index.vue'),
        meta: {
          name: 'sku管理',
          hidden: false,
          icon: 'Orange',
        },
      },
    ],
  },
  {
    path: '/orderfrom',
    component: () => import('@/layout/index.vue'),
    name: 'Orderfrom',
    meta: {
      name: '订单管理',
      icon: 'List',
    },
    redirect: '/orderfrom/pending',
    children: [
      {
        path: '/orderfrom/pending',
        component: () => import('@/views/orderfrom/pending/index.vue'),
        name: 'Pending',
        meta: {
          name: '待处理订单',
          icon: 'Clock',
        },
      },
      // {
      //   path: '/orderfrom/shipped',
      //   component: () => import('@/views/orderfrom/shipped/index.vue'),
      //   name: 'Shipped',
      //   meta: {
      //     name: '已发货订单',
      //     icon: 'Box',
      //   },
      // },
      // {
      //   path: '/orderfrom/done',
      //   component: () => import('@/views/orderfrom/done/index.vue'),
      //   name: 'Done',
      //   meta: {
      //     name: '已完成订单',
      //     icon: 'Check',
      //   },
      // },
    ],
  },
]
export const anyRoute = [
  {
    path: '/:pathMatch(.*)*',
    redirect: '/404',
    name: 'ANY',
    meta: {
      name: '任意路由',
      hidden: true,
      icon: 'RefreshRight',
    },
  },
]
