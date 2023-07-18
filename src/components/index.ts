import SvgIcon from '@/components/Svgicon/index.vue'
const allGloablComponent: any = { SvgIcon }

export default {
  install(app: any) {
    Object.keys(allGloablComponent).forEach((key) => {
      app.component(key, allGloablComponent[key])
    })
  },
}
