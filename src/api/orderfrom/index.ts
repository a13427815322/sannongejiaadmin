import request from '@/utils/require'
import { orderfromresponetype } from './type'
enum Api {
  GETORDERFROM = 'orderfrom/getorderfrom',
}
export const GetOrderfrom = (
  pageNo: number,
  pageSize: number,
  status: number,
) => {
  return request.post<any, orderfromresponetype>(Api.GETORDERFROM, {
    pageNo,
    pageSize,
    status,
  })
}
