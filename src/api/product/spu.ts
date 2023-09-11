import request from '@/utils/require'
import {skudetailresponetype,imagetype, Respone,spudetailtype ,saleattrListtype, Existingattributeresponetepe} from './type'
enum API {
  GETSPUDETAIL = 'product/getspudetail',
  GETSALEATTR = 'product/getsaleattr',
  GETEXISTINGATTRIBUTE = 'product/getexistingattribute',
  SETSPUDETAIL = 'product/setspudetail',
  GETSPUIMAGE = 'product/getspuimage',
  SETSKUDETAIL = 'product/setskudetail',
  GETSKUDETAIL = 'product/getskudetail',
  DELSPU = 'product/delspu',
}
export const GetSpuDetail = (
  propertyid: number,
  pageNo: number,
  pageSize: number,
) => {
  return request.post<any, spudetailtype>(API.GETSPUDETAIL, {
    propertyid,
    pageNo,
    pageSize,
  })
}
export const GetSaleattr = () => {
  return request.get<any,saleattrListtype[]>(API.GETSALEATTR)
}

export const GeteExistingattribute = (spuid: number) => {
  return request.post<any, Existingattributeresponetepe>(API.GETEXISTINGATTRIBUTE, { spuid })
}
export const SetSpuDetail = (spudetail: any) => {
  return request.post<any, Respone>(API.SETSPUDETAIL, spudetail)
}
export const GetSpuImage = (spuid: number) => {
  return request.post<any, imagetype[]>(API.GETSPUIMAGE, { spuid })
}
export const SetSkuDetail = (skudetail: any) => {
  return request.post<any, Respone>(API.SETSKUDETAIL, skudetail)
}
export const GetSkuDetail = (spuid: number) => {
  return request.post<any, skudetailresponetype>(API.GETSKUDETAIL, { spuid })
}
export const DelSpu = (spuid: number) => {
  return request.post<any, Respone>(API.DELSPU, { spuid })
}
