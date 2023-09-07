import request from '@/utils/require'
enum Api {
  GETORDERFROM = 'orderfrom/getorderfrom',
}
export const GetOrderfrom = (
  pageNo: number,
  pageSize: number,
  status: number,
) => {
  return request.post<any, any>(Api.GETORDERFROM, { pageNo, pageSize, status })
}
