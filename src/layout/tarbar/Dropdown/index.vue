<template>
    <el-button icon="Refresh" circle color="#07c160" @click="toRefresh"></el-button>
    <el-button icon="FullScreen" circle color="#07c160" @click="fullscrren"></el-button>
    <el-button icon="Setting" circle color="#07c160"></el-button>
    <img :src=" String(UserStore.avatar)" alt="" style="width:32px;height:32px;border-radius:100%;margin:0 10px ">
    <el-dropdown style="margin-right:10px">
        <div>{{UserStore.username}}</div>
        <template #dropdown>
            <el-dropdown-menu>
                <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
        </template>
    </el-dropdown>
</template>

<script setup lang="ts">
import useLayOutSettingStore from '@/store/modules/setting'
import useUserStore from '@/store/modules/user';
import {nextTick} from 'vue';
import { useRouter,useRoute } from 'vue-router'
const $router=useRouter()
const router=useRoute()
let setting=useLayOutSettingStore()
let UserStore=useUserStore()

const toRefresh= ()=>{
  setting.Refresh=!setting.Refresh
}
const fullscrren=()=>{
let full=document.fullscreenElement
// console.log(full)

if(!full){
    document.documentElement.requestFullscreen()
}else{
    document.exitFullscreen()
}
  
}
const logout= ()=>{
  UserStore.logout()
  nextTick(()=>{
    $router.push({path:'/login',query:{redirect:router.path}})
  })

}

</script>

<style scoped></style>