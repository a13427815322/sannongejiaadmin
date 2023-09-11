import request from '@/utils/require'
import {skudetailresponetype,Respone}from './type'
enum API {
  GETALLSKUDETAIL = 'product/getallskudetail',
  SkuPutAwayOrPutDown = 'product/skuputaway',
  DELETESKU = 'product/deletesku',
}
export const GetAllSkuDetail = (pageNo: number, pageSize: number) => {
  return request.post<any, skudetailresponetype>(API.GETALLSKUDETAIL, { pageNo, pageSize })
}
export const SkuPutAwayOrPutDown = (skuid: number, putaway: number) => {
  return request.post<any, Respone>(API.SkuPutAwayOrPutDown, { skuid, putaway })
}
export const DeleteSku = (id: number) => {
  return request.post<any, Respone>(API.DELETESKU, { id })
}
