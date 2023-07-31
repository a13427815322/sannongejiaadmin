<template>
  <div style="background-color: red; height: 100vh">
    <h1>我是{{ a }}</h1>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
const a = ref('首页')
</script>

<style scoped></style>
