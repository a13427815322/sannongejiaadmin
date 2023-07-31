import { RouteRecordRaw } from 'vue-router'
export interface userState {
  token: string | null
  router: RouteRecordRaw[]
  username: String
  avatar: String
}
