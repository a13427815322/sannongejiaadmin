<template>
  <router-view class="view" v-slot="{ Component }" :key="$route.fullPath">
    <transition name="fade" mode="out-in">
      <component :is="Component" v-if="isrefresh" />
    </transition>
  </router-view>
</template>

<script setup lang="ts">
import useLayOutSettingStore from '@/store/modules/setting'
import { watch, ref, nextTick } from 'vue'


let isrefresh = ref(true)
let setting = useLayOutSettingStore()
watch(
  () => setting.Refresh,
  () => {
    isrefresh.value = false
      nextTick(() => {
      isrefresh.value = true
    })
  },
)
</script>

<style scoped>
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
  transform: scale(0);
}

.fade-enter-to,
.fade-leave-from {
  opacity: 1;
  transform: scale(1);
}

.fade-enter-active,
.fade-leave-active {
  transition: 0.5s ease;
}
</style>
