<template>
  <template v-for="item in menulist" key="item.path">
    <template v-if="!item.children">
      <el-menu-item
        v-if="!item.meta.hidden"
        :index="item.path"
        @click="toconnent"
      >
        <el-icon>
          <component :is="item.meta.icon"></component>
        </el-icon>
        <template #title>
          {{ item.meta.name }}
        </template>
      </el-menu-item>
    </template>
    <template v-if="item.children && item.children.length == 1">
      <el-menu-item
        @click="toconnent"
        v-if="!item.children[0].meta.hidden"
        :index="item.children[0].path"
      >
        <el-icon>
          <component :is="item.children[0].meta.icon"></component>
        </el-icon>
        <template #title>
          {{ item.children[0].meta.name }}
        </template>
      </el-menu-item>
    </template>
    <el-sub-menu
      v-if="item.children && item.children.length > 1"
      :index="item.path"
    >
      <template #title>
        <el-icon>
          <component :is="item.meta.icon"></component>
        </el-icon>
        <span class="fistmeau_name">{{ item.meta.name }}</span>
      </template>
      <Menu :menulist="item.children"></Menu>
    </el-sub-menu>
  </template>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
defineProps(['menulist'])
const router = useRouter()
const toconnent = (vc: any) => {
  // console.log(vc.index)
  router.push(vc.index)
}
</script>

<script lang="ts">
export default {
  name: 'Menu',
}
</script>
<style scoped lang="scss">
.fistmeau_name {
  color: #ffffff;
}
</style>
