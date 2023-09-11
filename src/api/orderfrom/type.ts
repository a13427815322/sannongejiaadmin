export interface orderfromresponetype{
code:number,
data:orderfromtype[],
message:string,
total:number
}
export interface  orderfromtype{
    adress:string,
    cjtime:string,
    dingdanid:number,
    fahuotime:string|null,
    fukuantime:string,
    phone:string,
    shopcart:shopcarttype[],
    sjr:string,
    status:number,
    _id:string
}
export interface  shopcarttype{
    changpingimg:string
    count:number
    jiage:number
    pinglunzhuantai:number
    shopid:number
    shopname:string
}