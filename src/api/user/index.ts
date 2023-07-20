import request from '@/utils/require'
import type { loginForm, loginResponseData, uesrinfoResponse } from './type'
enum API {
  LOGIN_URL = 'user/login',
  USERINFO_URL = 'user/info',
}
export const reqLogin = (data: loginForm) => {
 return request.post<any, loginResponseData>(API.LOGIN_URL, data)
}
export const reqUserInfo = () => {
  return request.get<any, uesrinfoResponse>(API.USERINFO_URL)
}
