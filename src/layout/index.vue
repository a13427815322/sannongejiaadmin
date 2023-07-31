<template>
  <div class="layout_container">
    <div class="layout_menu" :class="{ fold: setting.Fold ? true : false }">
      <!-- logo -->
      <logo></logo>
      <el-scrollbar class="scrollbar">
        <el-menu
          background-color="#1E1E1E"
          text-color="#ffffff"
          active-text-color="#07c160"
          :collapse="setting.Fold"
          :default-active="router.fullPath"
        >
          <layoutmenu :menulist="menulist"></layoutmenu>
        </el-menu>
      </el-scrollbar>
    </div>
    <div class="layout_tarbar" :class="{ fold: setting.Fold ? true : false }">
      <Tarbar></Tarbar>
    </div>
    <div class="layout_content" :class="{ fold: setting.Fold ? true : false }">
      <Content></Content>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useRoute } from 'vue-router'
import useLayOutSettingStore from '@/store/modules/setting'
import Content from './content/index.vue'
const router = useRoute()
// console.log(router.fullPath)
let setting = useLayOutSettingStore()
import logo from './logo/index.vue'
import layoutmenu from './menu/index.vue'
import useUserSrore from '@/store/modules/user'
import Tarbar from './tarbar/index.vue'
const menulist = useUserSrore().router
</script>

<style scoped lang="scss">
.layout_container {
  width: 100%;
  height: 100vh;

  .layout_menu {
    width: $layout_menu_width;
    height: 100vh;
    background: $layout_menu_background;
    transition: 0.3s ease;
    &.fold {
      width: 60px;
    }
    .scrollbar {
      margin-top: 20px;
      height: calc(100vh - $logo_height - 20px);

      .el-menu {
        border-right: none;
      }
    }
  }

  .layout_tarbar {
    width: calc(100% - $layout_menu_width);
    height: $layout_tabar_height;
    background-color: $layout_tabar_background;
    position: fixed;
    top: 0;
    left: $layout_menu_width;
    color: #333333;
    transition: 0.3s ease;
    &.fold {
      width: calc(100% - 60px);
      left: 60px;
    }
  }

  .layout_content {
    width: calc(100% - $layout_menu_width);
    height: calc(100vh - $layout_tabar_height);
    position: absolute;
    top: $layout_tabar_height;
    left: $layout_menu_width;
    background-color: $layout_content_background;
    padding: 20px;
    overflow: auto;
    color: #333333;
    transition: 0.3s ease;
    &.fold {
      width: calc(100% - 60px);
      left: 60px;
    }
  }
}
</style>
