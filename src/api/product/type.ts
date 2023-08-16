export interface spudetailtype {
  code: number
  data: spudetaildata
  message: string
}
export interface spudetaildata {
  description: string
  id: number
  propertyid: number
  spuname: string
  spuImageList?: spuimage[]
  spuSaleAttrList?: spuSaleAttr[]
}
interface spuSaleAttr {
  id: number
  spuid: number
  basesaleattrid: number
  saleattrname: string
  saleattrvaluelist: string[]
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
interface skusaleattrvalue {
  id: number
  saleattrname: string
}
interface skuplatformattribute {
  id: number
  platformattrname: string
}
