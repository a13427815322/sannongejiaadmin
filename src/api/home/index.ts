import request from '@/utils/require'

enum Api{
    GETKUNCHUN='home/getkuchun'
}
export const GetKunchun=()=>{
    return request.get<any,any>(Api.GETKUNCHUN)
}