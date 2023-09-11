import request from '@/utils/require'
import {adminuserinforespone,Respone,draweruserinfotype,allroleinfotype} from './type'
enum API {
  GETADMINUSERINFO = 'acl/getadminuserinfo',
  ADDNEWUSER = 'acl/addnewuser',
  GETALLROLEINFO = 'acl/getallroleinfo',
  SETUSERROLE = 'acl/setuserrole',
  SEARCHUSER = 'acl/searchuser',
  DELETEUSER = 'acl/deleteuser',
}
export const GetAdminUserInfo = (pageNo: number, pageSize: number) => {
  return request.post<any, adminuserinforespone>(API.GETADMINUSERINFO, { pageNo, pageSize })
}
export const SearchUser = (searchvalue: string) => {
  return request.post<any, adminuserinforespone>(API.SEARCHUSER, {
    searchvalue,
  })
}
export const AddNewUser = (user: draweruserinfotype) => {
  return request.post<any, Respone>(API.ADDNEWUSER, user)
}
export const SetUserRole = (userid: number, roles: number[]) => {
  return request.post<any, Respone>(API.SETUSERROLE, { userid, roles })
}
export const DeleteUser = (useridattr: number[]) => {
  return request.post<any, Respone>(API.DELETEUSER, useridattr)
}
export const GetAllRoleInFO = () => {
  return request.get<any, allroleinfotype>(API.GETALLROLEINFO)
}
