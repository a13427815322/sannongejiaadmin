import request from '@/utils/require'
import { kunchuntype } from './type'
enum Api {
  GETKUNCHUN = 'home/getkuchun',
}
export const GetKunchun = () => {
  return request.get<any, kunchuntype>(Api.GETKUNCHUN)
}
