import { createApp } from 'vue'
import App from '@/App.vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import 'virtual:svg-icons-register'
//@ts-ignore
import zhCn from 'element-plus/dist/locale/zh-cn.mjs'
// import SvgIcon from '@component/SvgIcon/index.vue';
const app = createApp(App)
// app.component('SvgIcon',SvgIcon)
import globalComponent from '@/components' 

app.use(globalComponent)
app.use(ElementPlus, {
  locale: zhCn,
})
app.mount('#app')
