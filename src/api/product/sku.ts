import request from '@/utils/require'
enum API {
  GETALLSKUDETAIL = 'product/getallskudetail',
  SkuPutAwayOrPutDown = 'product/skuputaway',
  DELETESKU = 'product/deletesku',
}
export const GetAllSkuDetail = (pageNo: number, pageSize: number) => {
  return request.post<any, any>(API.GETALLSKUDETAIL, { pageNo, pageSize })
}
export const SkuPutAwayOrPutDown = (skuid: number, putaway: number) => {
  return request.post<any, any>(API.SkuPutAwayOrPutDown, { skuid, putaway })
}
export const DeleteSku = (id: number) => {
  return request.post<any, any>(API.DELETESKU, { id })
}
