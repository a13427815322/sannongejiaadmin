export interface loginForm {
  username: string
  password: string
}
interface dataTyoe {
  token: string
}
export interface loginResponseData {
  code: number
  data: dataTyoe
}
interface userinfo {
  userId: number
  avatar: String
  username: String
  password: String
  desc: String
  roles: String[]
  buttons: String[]
  routes: String[]
  token: String
}
interface user {
  checkUser: userinfo
}
export interface uesrinfoResponse {
  code: number
  data: user
}
