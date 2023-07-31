//进行axios的二次封装
import axios from 'axios'
import { ElMessage } from 'element-plus'
import useUserStore from '@/store/modules/user';

//creat创建实例、
let request = axios.create({
  baseURL: import.meta.env.VITE_APP_BASE_API,
  timeout: 50000,
})
request.interceptors.request.use((config) => {
  let UserStore=useUserStore()

  //headers请求头,公共参数
  if(UserStore.token){
  config.headers.token=UserStore.token
}
return config
})
request.interceptors.response.use(
  (response) => {
    return response.data
  },
  (error) => {
    //定义一个变量存储网络错误信息
    let message = ''
    let status = error.response.status
    switch (status) {
      case 401:
        message = 'TOKEN过期'
        break
      case 403:
        message = '无权访问'
        break
      case 404:
        message = '请求地址错误'
        break
      case 500:
        message = '服务器出现问题'
        break
      default:
        message = '网络出现问题'
        break
    }
    ElMessage({
      type: 'error',
      message,
    })
    return Promise.reject(error)
  },
)
export default request
