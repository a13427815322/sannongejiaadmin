import request from '@/utils/require'
enum API{
    GETMENUINFO='acl/getmenuinfo',
    SETMENUINFO='acl/setmenuinfo',
    DELETEMENU='acl/deletemenu'
}
export const GetMenuInfo=()=>{
  return request.get<any,any>(API.GETMENUINFO)
}
export const SetMenuInfo=(menu:any)=>{
  return request.post<any,any>(API.SETMENUINFO,menu)
}
export const DeleteMenu=(id:number)=>{
  return request.post<any,any>(API.DELETEMENU,{id})
}