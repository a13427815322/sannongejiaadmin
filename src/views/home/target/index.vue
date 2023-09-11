<template>
  <div style="flex: 1">
    <el-card
      shadow="always"
      style="width: 100%; height: 400px; margin-top: 20px"
    >
      <div style="font-size: 19px; font-weight: bold">本月订单完成量</div>
      <div
        style="
          display: flex;
          width: 100%;
          justify-content: center;
          margin: 10px 0;
        "
      >
        <div
          v-for="item in '4396'"
          style="
            width: 50px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            font-size: 40px;
            color: #099;
            opacity: 0.5;
          "
        >
          {{ item }}
        </div>
      </div>
      <div ref="target" style="width: 100%; height: 375px"></div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import * as echarts from 'echarts'
import { ref, onMounted } from 'vue'
import 'echarts-liquidfill'
let target = ref()

onMounted(async () => {

  let mychart = echarts.init(target.value)
  mychart.setOption({
    title: {
      text: '订单指标完成度',
    },
    series: [
      {
        type: 'liquidFill',
        data: [0.6, 0.5, 0.4, 0.3],
        color: ['#0f0', '#0f1', '#0f2', '#0f3'],
        name: '订单指标完成度',
        outline: {
          show: false,
        },
        itemStyle: {
          opacity: 0.2,
        },
        emphasis: {
          itemStyle: {
            opacity: 0.2,
          },
        },
        label: {
          position: ['50%', '50%'],
          fontSize: 40,
          color: '#0f8',
        },
      },
    ],
    tooltip: {
      show: true,
    },
  })
})

</script>

<style scoped></style>
