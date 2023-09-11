import request from '@/utils/require'
import { orderfromresponetype,orderfromtype } from '../type'
import { Respone } from './type'
enum Api {
  SAVEORDERFROM = 'orderfrom/saveorderfrom',
  DELIVERGOODS = 'orderfrom/delivergoods',
  SEARCHORDERFROMINFO = 'orderfrom/searchorderfrominfo',
}
export const SaveOrderfrom = (orderfrom: orderfromtype) => {
  return request.post<any, Respone>(Api.SAVEORDERFROM, orderfrom)
}
export const DeliverGoods = (idattr: number[]) => {
  return request.post<any, Respone>(Api.DELIVERGOODS, idattr)
}
export const SearchOrderFromInfo = (search: string, status: number) => {
  return request.post<any, orderfromresponetype>(Api.SEARCHORDERFROMINFO, { search, status })
}
