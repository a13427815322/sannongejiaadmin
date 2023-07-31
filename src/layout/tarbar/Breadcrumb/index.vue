<template>
     <el-icon style="margin: 0 10px;" @click="isfold">
        <component :is="setting.Fold ? 'Expand' :'Fold'"></component>
    </el-icon>
    <el-breadcrumb separator-icon="ArrowRight">
    <el-breadcrumb-item v-for="(item,index) in $router.matched" :key="index" v-show="item.meta.name" :to="item.path">
        <el-icon>
            <component :is="item.meta.icon"></component>
        </el-icon>
             {{ item.meta.name }}
    </el-breadcrumb-item>
  
    </el-breadcrumb>
  
</template>

<script setup lang="ts">
import useLayOutSettingStore from '@/store/modules/setting'
import { useRoute } from 'vue-router';
const $router=useRoute()
// console.log($router.matched)
let setting=useLayOutSettingStore()
// console.log(setting)
// import { ref} from 'vue';
// let Fold=ref(false)
const isfold=()=>{
    setting.Fold=! setting.Fold
}
</script>

<style scoped>

</style>