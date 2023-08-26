<template>
  <div>数据大屏</div>
  <el-button @click="toshouye"></el-button>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router';
const router=useRouter()
const toshouye=()=>{
router.push('/home')
}
</script>

<style scoped></style>
