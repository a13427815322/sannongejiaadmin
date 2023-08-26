<template>
  <el-button
    icon="Refresh"
    circle
    color="#07c160"
    @click="toRefresh"
  ></el-button>
  <el-button
    icon="FullScreen"
    circle
    color="#07c160"
    @click="fullscrren"
  ></el-button>
  <el-switch
    v-model="dark"
    size="large"
    inline-prompt
    active-icon="Moon" 
    inactive-icon="Sunny"
    active-color="#07c160"
    style="margin-left: 10px;"
    @change="changeDark"
  />
  <img
    :src="String(UserStore.avatar)"
    alt=""
    style="width: 32px; height: 32px; border-radius: 100%; margin: 0 10px"
  />
  <el-dropdown style="margin-right: 10px">
    <div>{{ UserStore.username }}</div>
    <template #dropdown>
      <el-dropdown-menu>
        <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
      </el-dropdown-menu>
    </template>
  </el-dropdown>
</template>

<script setup lang="ts">
import useLayOutSettingStore from '@/store/modules/setting'
import useUserStore from '@/store/modules/user'
import { nextTick ,ref, onMounted} from 'vue'
import { useRouter, useRoute } from 'vue-router'
let dark=ref(false)
const $router = useRouter()
const router = useRoute()
let setting = useLayOutSettingStore()
let UserStore = useUserStore()
onMounted(()=>{
  dark.value=UserStore.dark
  let html = document.documentElement;
  dark.value ? html.className = 'dark' : html.className = '';
})
const toRefresh = () => {
  setting.Refresh = !setting.Refresh
}
const fullscrren = () => {
  let full = document.fullscreenElement
  // console.log(full)

  if (!full) {
    document.documentElement.requestFullscreen()
  } else {
    document.exitFullscreen()
  }
}
const changeDark = () => {
    //获取HTML根节点
    let html = document.documentElement;
    //判断HTML标签是否有类名dark
    UserStore.dark=dark.value
    dark.value ? html.className = 'dark' : html.className = '';
}
const logout = () => {
  UserStore.logout()
  nextTick(() => {
    $router.push({ path: '/login', query: { redirect: router.path } })
  })
}
</script>

<style scoped></style>
