import SvgIcon from '@/components/Svgicon/index.vue'
import Propertyselect from '@/components/Propertyselect/index.vue'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

const allGloablComponent: any = { SvgIcon, Propertyselect }

export default {
  install(app: any) {
    Object.keys(allGloablComponent).forEach((key) => {
      app.component(key, allGloablComponent[key])
    })
    for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
      app.component(key, component)
    }
  },
}
