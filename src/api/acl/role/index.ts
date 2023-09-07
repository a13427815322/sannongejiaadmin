import request from '@/utils/require'
enum API {
  GETROLEINFO = 'acl/getroleinfo',
  SETROLE = 'acl/setrole',
  GETROLEPOWER = 'acl/getrolepower',
  SETROLEPOWER = 'acl/setrolepower',
  SEARCHROLE = 'acl/searchrole',
  DELETEROLE = 'acl/deleterole',
}
export const GetRoleInfo = (pageNo: number, pageSize: number) => {
  return request.post<any, any>(API.GETROLEINFO, { pageNo, pageSize })
}
export const SetRole = (addrolevalue: any) => {
  return request.post<any, any>(API.SETROLE, addrolevalue)
}
export const GetRolePower = (id: number) => {
  return request.post<any, any>(API.GETROLEPOWER, { id })
}
export const SetRolePower = (id: number, permission: any) => {
  return request.post<any, any>(API.SETROLEPOWER, { id, permission })
}
export const SearchRole = (

  searchvalue: string,
) => {
  return request.post<any, any>(API.SEARCHROLE, {
    searchvalue,
  })
}
export const DeleteRole = (id: number) => {
  return request.post<any, any>(API.DELETEROLE, { id })
}
