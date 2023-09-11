import { menuinforespone } from '../perssion/type'
export interface Response {
  code: number
  message: string
}
export interface roleinforesponetype extends Response {
  data: roleinfo[]
  total: number
}
export interface roleinfo {
  id: number
  permission: number[]
  rolename: string
}
export interface addrolevaluetype {
  id: number
  rolename: string
}
export interface rolepowerresponetype extends Response {
  data: menuinforespone[]
}
