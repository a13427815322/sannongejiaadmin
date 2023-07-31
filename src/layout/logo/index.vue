<template>
    <div class="logo_box">
        <svg-icon :name="setting.logoname" :fill="setting.logocolor" class="logo_icon"></svg-icon>
        <div v-if="!Setting.Fold" >{{setting.title}}</div>
    </div>
</template>

<script setup lang="ts">
import {setting} from '@/setting.ts'
import useLayOutSettingStore from '@/store/modules/setting'
let Setting=useLayOutSettingStore()
</script>

<style scoped lang="scss">
.logo_box{
    display: flex;
    width: 100%;
    height: $logo_height;
    padding: 10px;
    white-space: nowrap;
    .logo_icon{
        margin-right: 10px;
    }
    div{
      line-height:$logo_height;
      font-weight: 500;
        color: #ffffff;
        font-size: 19px;
    }
}
</style>