export interface Respone {
  code: number
  message: string
}

export interface adminuserinforespone extends Respone {
  data: adminuserinfotype[]
  total: number
}
export interface adminuserinfotype {
  userid: number
  username: string
  name: string
  password: string
  avatar: string
  buttons?: string[]
  role?: string[]
  roles: number[]
  routers?: string[]
  token: string
}
export interface draweruserinfotype {
  userid: number
  username: string
  name: string
  password: string
  avatar?: string
  buttons?: string[]
  role?: string[]
  roles?: number[]
  routers?: string[]
  token?: string
}
export interface allroleinfotype extends Respone {
  data: roleinfo[]
}
export interface roleinfo {
  id: number
  rolename: string
}
