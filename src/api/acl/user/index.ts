import request from '@/utils/require'
enum API {
  GETADMINUSERINFO = 'acl/getadminuserinfo',
  ADDNEWUSER = 'acl/addnewuser',
  GETALLROLEINFO = 'acl/getallroleinfo',
  SETUSERROLE = 'acl/setuserrole',
  SEARCHUSER = 'acl/searchuser',
  DELETEUSER = 'acl/deleteuser',
}
export const GetAdminUserInfo = (pageNo: number, pageSize: number) => {
  return request.post<any, any>(API.GETADMINUSERINFO, { pageNo, pageSize })
}
export const SearchUser = (searchvalue: string) => {
  return request.post<any, any>(API.SEARCHUSER, {
    searchvalue,
  })
}
export const AddNewUser = (user: any) => {
  return request.post<any, any>(API.ADDNEWUSER, user)
}
export const SetUserRole = (userid: number, roles: number[]) => {
  return request.post<any, any>(API.SETUSERROLE, { userid, roles })
}
export const DeleteUser = (useridattr: number[]) => {
  return request.post<any, any>(API.DELETEUSER, useridattr)
}
export const GetAllRoleInFO = () => {
  return request.get<any, any>(API.GETALLROLEINFO)
}
