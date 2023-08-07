import request from '@/utils/require'
import {platformattribute} from '@/store/modules/types/types'
enum API {
    GETPROPERTYINFO_URL = 'product/getpropertyinfo',
    GETPLATFORMATTRIBUTE='product/getplatformattribute',
    SETPLATFORMATTRIBUTE='product/setplatformattribute',
    DELPLATFORMATTRIBUTE='product/delplatformattribute'
  }
export const GetPropertyinfo=()=>{
    return request.get<any,any>(API.GETPROPERTYINFO_URL)
}
export const Getplatformattribute=(id:number)=>{
  return request.post<any,any>(API.GETPLATFORMATTRIBUTE,{id})
}
export const Setplatformattribute=(attribute:platformattribute)=>{
  return request.post<any,any>(API.SETPLATFORMATTRIBUTE,attribute)
}
export const Delplatformattribute=(id:number)=>{
  return request.post<any,any>(API.DELPLATFORMATTRIBUTE,{id})
}