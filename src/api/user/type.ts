export interface loginForm {
  username: string
  password: string
}
interface dataTyoe {
  token?: string
  message?: string
}
export interface loginResponseData {
  code: number
  data: dataTyoe
}
interface userinfo {
  name:string
  userId: number
  avatar: String
  username: String
  password: String
  desc: String
  roles: String[]
  buttons: String[]
  token: String
  routers:string[]
}

export interface uesrinfoResponse {
  code: number
  data: userinfo[]
  message:string
}
