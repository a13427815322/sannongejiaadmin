import request from '@/utils/require'
import { platformattribute } from '@/store/modules/types/types'
import { propertydatatype, platformattributetype } from './type'
enum API {
  GETPROPERTYINFO_URL = 'product/getpropertyinfo',
  GETPLATFORMATTRIBUTE = 'product/getplatformattribute',
  SETPLATFORMATTRIBUTE = 'product/setplatformattribute',
  DELPLATFORMATTRIBUTE = 'product/delplatformattribute',
}
export const GetPropertyinfo = () => {
  return request.get<any, propertydatatype>(API.GETPROPERTYINFO_URL)
}
export const Getplatformattribute = (id: number) => {
  return request.post<any, platformattributetype>(API.GETPLATFORMATTRIBUTE, {
    id,
  })
}
export const Setplatformattribute = (attribute: platformattribute) => {
  return request.post<any, any>(API.SETPLATFORMATTRIBUTE, attribute)
}
export const Delplatformattribute = (id: number) => {
  return request.post<any, any>(API.DELPLATFORMATTRIBUTE, { id })
}
