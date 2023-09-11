export interface Respone{
  code:number
  message:string
}
export interface propertydatatype extends Respone{
  data:propertytype[]
}
export interface propertytype{
  id:number,
  name:string
}
export interface platformattributetype extends Respone{
  data:platformattributedatatype[]
}
export interface platformattributedatatype {
  id:number
  name:string
  propertyid:number
  value:valuetype[]
  platformattributidandvalue?:string
}
export interface valuetype{
  flag:boolean
  valuename:string
}
export interface imagetype{
  id:number
  spuid:number
  imagename:string
  imgurl:string
}
export interface spudetailtype {
  code: number
  data: spudetaildata[]
  message: string
}
export interface saleattrListtype{
  basesaleattrid: number
  saleattrname: string
}
export interface Existingattributeresponetepe extends Respone{
data:spuSaleAttr[]
}
export interface spudetaildata {
  description: string
  id: number
  propertyid: number
  spuname: string
  spuImageList?: spuimage[]
  spuSaleAttrList?: spuSaleAttr[]
  total_count?:number
}
export interface spuSaleAttr {
  id?: number
  spuid?: number
  basesaleattrid: number
  saleattrname?: string
  saleattrvaluelist: string[]
  flag?:boolean
  platformattributidandvalue?:string
  saleattr:string
}
interface spuimage {
  id?: number
  spuid?: number
  imagename: string
  imgurl: string
}
export interface skudetailtype {
  spuid: number | string
  skuname: string
  price: number | string
  weight: string | number
  skudescription: string
  skucount: number | string
  skusaleattrvalueList: skusaleattrvalue[]
  skuplatformattributeList: skuplatformattribute[]
  skuimage: string
}
export interface skudetailresponetype extends Respone{
  data:skudetailtype[]
  total?:number
}
export interface skusaleattrvalue {
  id: number
  saleattrname: string
}

export interface skuplatformattribute {
  id: number
  platformattrname: string
}
