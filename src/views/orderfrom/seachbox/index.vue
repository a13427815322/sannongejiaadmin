<template>
  <div>
    <el-card style="margin: 10px 0">
      <el-form :inline="true" class="searchbox" @submit.native.prevent >
        <el-form-item label="搜索">
          <el-input
            v-model="search"
            placeholder="请输入订单号或收货人或收货地址或用户id或手机号"
            style="width: 500px"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="success"
            @click="searchorderfrom"
            :disabled="!search"
          >
            搜索
          </el-button>
          <el-button type="success" @click="setting.Refresh = !setting.Refresh">
            重置
          </el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import useLayOutSettingStore from '@/store/modules/setting'
let search = ref('')
let setting = useLayOutSettingStore()
const $emit = defineEmits(['searchinfo'])
const searchorderfrom = () => {
  $emit('searchinfo', search.value)
  search.value = ''
}
</script>

<style scoped lang="scss">
.searchbox {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
</style>
