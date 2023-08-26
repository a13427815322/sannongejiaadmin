import { defineStore } from 'pinia'
import { loginForm, loginResponseData, uesrinfoResponse } from '@/api/user/type'
import { reqLogin, reqUserInfo } from '@/api/user'
import { userState } from './types/types'
import { GET_TOKEN, SET_TOKEN, REMOVE_TOKEN } from '@/utils/token'
import { constantRoute, asyncRoute, anyRoute } from '@/router/routes'
//@ts-expect-error
import cloneDeep from 'lodash/cloneDeep'
import router from '@/router'
import { ro } from 'element-plus/es/locale/index.js'
function filterAsyncRoute(asnycRoute: any, routes: any) {
  return asnycRoute.filter((item: any) => {
    if (routes.includes(item.name)) {
      if (item.children && item.children.length > 0) {
        item.children = filterAsyncRoute(item.children, routes)
      }
      return true
    }
  })
}
let useUserStore = defineStore('User', {
  state: (): userState => {
    return {
      token: GET_TOKEN(),
      router: constantRoute,
      username: '',
      avatar: '',
      dark: false,
      buttons: [],
      userAsyncRoute: [],
    }
  },
  actions: {
    async userLogin(data: loginForm) {
      // console.log(data)
      let result: loginResponseData = await reqLogin(data)
      //console.log(result)
      if (result.code === 200) {
        this.token = result.data.token as string
        SET_TOKEN(result.data.token as string)
        return 'ok'
      } else {
        return Promise.reject(new Error(result.data.message))
      }
    },
    async userinfo() {
      ;[...this.userAsyncRoute].forEach((route: any) => {
        router.removeRoute(route.name)
      })
      this.userAsyncRoute = []
      let result: uesrinfoResponse = await reqUserInfo()
      if (result.code === 200) {
        this.username = result.data[0].name
        this.avatar = result.data[0].avatar
        this.buttons = result.data[0].buttons
        const userAsyncRoute = filterAsyncRoute(
          cloneDeep(asyncRoute),
          result.data[0].routers,
        )
        this.userAsyncRoute = userAsyncRoute
        // //菜单需要的数据整理完毕
        this.router = [...constantRoute, ...userAsyncRoute, ...anyRoute]
        //目前路由器管理的只有常量路由:用户计算完毕异步路由、任意路由动态追加
        ;[...userAsyncRoute, ...anyRoute].forEach((route: any) => {
          router.addRoute(route)
        })
        return 'ok'
      } else {
        return Promise.reject(new Error(result.message))
      }
    },
    async logout() {
      this.token = ''
      this.username = ''
      this.avatar = ''
      this.buttons = []
      this.dark = false
      this.router = cloneDeep(constantRoute)

      await REMOVE_TOKEN()
    },
  },
  getters: {},
})
export default useUserStore
