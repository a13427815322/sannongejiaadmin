<template>
  <div class="box">
    <h1>我是app根组件{{ str }}</h1>
    <el-button type="primary" size="default" :icon="Plus">主要按钮</el-button>
    <el-button type="primary" size="default" :icon="Edit">编辑按钮</el-button>
    
  </div>
</template>

<script setup lang="ts">
const str = '我爱你中国'
import{Plus,Edit} from'@element-plus/icons-vue'
</script>

<style scoped lang='scss'>
.box{
    width: 600px;
    height: 400px;
     background-color: black;
    h1{
        color:white
    }
}
</style>
