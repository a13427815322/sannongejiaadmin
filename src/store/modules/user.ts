import { defineStore } from 'pinia'
import { loginForm, loginResponseData, uesrinfoResponse } from '@/api/user/type'
import { reqLogin, reqUserInfo } from '@/api/user'
import { userState } from './types/types'
import { GET_TOKEN, SET_TOKEN, REMOVE_TOKEN } from '@/utils/token'
import { constantRoute } from '@/router/routes'

let useUserStore = defineStore('User', {
  state: (): userState => {
    return {
      token: GET_TOKEN(),
      router: constantRoute,
      username: '',
      avatar: '',
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
      let result: uesrinfoResponse = await reqUserInfo()
      // console.log(result)
      if (result.code === 200) {
        this.username = result.data.user.username
        this.avatar = result.data.user.avatar
      } else {
      }
    },
    async logout() {
      this.token = ''
      this.username = ''
      this.avatar = ''
      await REMOVE_TOKEN()
    },
  },
  getters: {},
})
export default useUserStore
