import { RouteRecordRaw } from 'vue-router'
export interface userState {
  token: string | null
  router: RouteRecordRaw[]
  username: String
  avatar: String
  dark:boolean
  buttons:String[]
  userAsyncRoute:string[]
}
export interface attrState {
  propertyList: propertylist
  Selectvalue: number
  platformattributeList: platformattributeList
}
interface propertylist {
  code?: number
  data?: property[]
  message?: string
}
interface property {
  id: number
  name: string
}
interface platformattributeList {
  code?: number
  data?: platformattribute
  message?: string
}
export interface platformattribute {
  id?: number
  propertyid: number
  name: string
  value: attributevalue[]
}
interface attributevalue {
  valuename: string
  flag: boolean
}
