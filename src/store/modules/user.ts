import { defineStore } from 'pinia'
import { loginForm, loginResponseData } from '@/api/user/type'
import { reqLogin } from '@/api/user'
import { userState } from './types/types'
import { GET_TOKEN, SET_TOKEN } from '@/utils/token'
let useUserStore = defineStore('User', {
  state: (): userState => {
    return { token: GET_TOKEN() }
  },
  actions: {
    async userLogin(data: loginForm) {
      // console.log(data)
      let result: loginResponseData = await reqLogin(data)
      console.log(result)
      if (result.code === 200) {
        this.token = result.data.token as string
        SET_TOKEN(result.data.token as string)
        return 'ok'
      } else {
        return Promise.reject(new Error(result.data.message))
      }
    },
  },
  getters: {},
})
export default useUserStore
