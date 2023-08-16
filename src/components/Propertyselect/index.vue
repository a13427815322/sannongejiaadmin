<template>
  <div>
    <el-select
      placeholder="请选择产品分类"
      :disabled="addvalue == 0 ? false : true"
      v-model="value"
      style="margin: 10px auto"
      @change="getplatformattribute"
    >
      <el-option
        v-for="item in AttrStore.propertyList.data"
        :label="item.name"
        :key="item.id"
        :value="item.id"
      ></el-option>
    </el-select>
  </div>
</template>

<script setup lang="ts">
import { GetPropertyinfo } from '@/api/product/attr'
import { onMounted, ref } from 'vue'
import useAttrStore from '@/store/modules/attr'
defineProps(['addvalue'])
const value = ref()
// 记录选择了哪个产品分类
let AttrStore = useAttrStore()
onMounted(() => {
  getpropertyList()
})
const getpropertyList = async () => {
  try {
    const propertyList = await GetPropertyinfo()
    // 调用接口，返回产品分类
    AttrStore.propertyList = propertyList
    // 把propertyList存进pina仓库
    console.log(propertyList)
  } catch (error) {
    console.error('获取属性信息时出错:', error)
  }
}
const getplatformattribute = () => {
  AttrStore.Selectvalue = value.value
  // 获取用户选择的产品分类存入仓库
}
</script>

<style scoped></style>
