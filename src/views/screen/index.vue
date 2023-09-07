<template>
  <div class="container">
    <div class="screen" ref="screen">
      <div></div>
      <div></div>
      <!-- <el-button @click="toshouye"></el-button> -->
    </div>
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import { ref, onMounted } from 'vue'
const router = useRouter()
const toshouye = () => {
  router.push('/home')
}
let screen = ref()
onMounted(() => {
  screen.value.style.transform = `scale(${getscale()}) translate(-50%,-50%)`
})
const getscale = (w = 1920, h = 1080) => {
  const ww = window.innerWidth / w
  const wh = window.innerHeight / h
  return ww < wh ? ww : wh
}
window.onresize = () => {
  screen.value.style.transform = `scale(${getscale()}) translate(-50%,-50%)`
}
</script>

<style scoped lang="scss">
.container {
  width: 100vw;
  height: 100vh;

  .screen {
    position: fixed;
    width: 1920px;
    height: 1080px;
    left: 50%;
    top: 50%;
    transform-origin: left top;
  }
}
</style>
