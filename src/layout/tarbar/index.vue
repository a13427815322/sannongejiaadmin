<template>
  <div class="tarbar_container">
    <div class="tarbar_left">
      <Breadcrumb class="Breadcrumb"></Breadcrumb>
    </div>
    <div class="tarbar_right">
      <Dropdown></Dropdown>
    </div>
  </div>
</template>

<script setup lang="ts">
import Breadcrumb from './Breadcrumb/index.vue'
import Dropdown from './Dropdown/index.vue'
</script>

<style scoped lang="scss">
.tarbar_container {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;

  .tarbar_left {
    display: flex;
  }

  .tarbar_right {
    display: flex;
    align-items: center;
  }
}
</style>
