import { createApp } from 'vue'
import App from '@/App.vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import 'virtual:svg-icons-register'
//@ts-ignore
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
import '@/styles/index.scss'
// import SvgIcon from '@component/SvgIcon/index.vue';
// app.component('SvgIcon',SvgIcon)
import globalComponent from '@/components'
import pinia from './store'
//引入路由
import router from './router'
// import axios from 'axios'
// axios({
//   url: '/api/user/login',
//   method: 'post',
//   data:{
//     username:'admin',
//     password:'111111'
//   }
// })
//测试代码
const app = createApp(App)
app.use(globalComponent)
app.use(router)
app.use(pinia)
app.use(ElementPlus, {
  locale: zhCn,
})
app.mount('#app')
