import request from '@/utils/require'
import { roleinforesponetype,Response,addrolevaluetype ,rolepowerresponetype} from './type'
enum API {
  GETROLEINFO = 'acl/getroleinfo',
  SETROLE = 'acl/setrole',
  GETROLEPOWER = 'acl/getrolepower',
  SETROLEPOWER = 'acl/setrolepower',
  SEARCHROLE = 'acl/searchrole',
  DELETEROLE = 'acl/deleterole',
}
export const GetRoleInfo = (pageNo: number, pageSize: number) => {
  return request.post<any, roleinforesponetype>(API.GETROLEINFO, { pageNo, pageSize })
}
export const SetRole = (addrolevalue: addrolevaluetype) => {
  return request.post<any, Response>(API.SETROLE, addrolevalue)
}
export const GetRolePower = (id: number) => {
  return request.post<any, rolepowerresponetype>(API.GETROLEPOWER, { id })
}
export const SetRolePower = (id: number, permission:number) => {
  return request.post<any, Response>(API.SETROLEPOWER, { id, permission })
}
export const SearchRole = (searchvalue: string) => {
  return request.post<any, roleinforesponetype>(API.SEARCHROLE, {
    searchvalue,
  })
}
export const DeleteRole = (id: number) => {
  return request.post<any,Response>(API.DELETEROLE, { id })
}
