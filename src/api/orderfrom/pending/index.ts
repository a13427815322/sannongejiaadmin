import request from '@/utils/require'
enum Api {
  SAVEORDERFROM = 'orderfrom/saveorderfrom',
  DELIVERGOODS = 'orderfrom/delivergoods',
  SEARCHORDERFROMINFO = 'orderfrom/searchorderfrominfo',
}
export const SaveOrderfrom = (orderfrom: any) => {
  return request.post<any, any>(Api.SAVEORDERFROM, orderfrom)
}
export const DeliverGoods = (idattr: number[]) => {
  return request.post<any, any>(Api.DELIVERGOODS, idattr)
}
export const SearchOrderFromInfo = (search: string, status: number) => {
  return request.post<any, any>(Api.SEARCHORDERFROMINFO, { search, status })
}
