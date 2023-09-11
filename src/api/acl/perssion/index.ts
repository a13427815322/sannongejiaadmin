import request from '@/utils/require'
import { menuinforesponetype, temaddmenu, Response } from './type'
enum API {
  GETMENUINFO = 'acl/getmenuinfo',
  SETMENUINFO = 'acl/setmenuinfo',
  DELETEMENU = 'acl/deletemenu',
}
export const GetMenuInfo = () => {
  return request.get<any, menuinforesponetype>(API.GETMENUINFO)
}
export const SetMenuInfo = (menu: temaddmenu) => {
  return request.post<any, Response>(API.SETMENUINFO, menu)
}
export const DeleteMenu = (idattr: number[]) => {
  return request.post<any, Response>(API.DELETEMENU, idattr)
}
