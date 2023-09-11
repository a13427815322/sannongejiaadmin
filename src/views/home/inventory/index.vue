<template>
  <div>
    <el-card
      shadow="always"
      style="width: 100%; height: 400px; margin-top: 20px"
    >
      <div ref="inventory" style="width: 100%; height: 375px"></div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { GetKunchun } from '@/api/home'
import * as echarts from 'echarts'
import { ref, onMounted } from 'vue'
import {kunchun} from '@/api/home/type'
let inventory = ref()
onMounted(async () => {
  await getkuchun()
  let mychart = echarts.init(inventory.value)
  mychart.setOption({
    color: ['#0d9'],
    title: {
      text: '库存数量',
    },
    tooltip: {},
    xAxis: {
      data: skunameattr.value,
      nameTextStyle: {
        width: '10px',
        color: '#f5f5f5',
        overflow: 'none',
      },
      axisLabel: {
        interval: 0,
        show: true,
        formatter: function (value: string) {
          var ret = '' //拼接加\n返回的类目项
          var maxLength = 5 //每项显示文字个数
          var valLength = value.length //X轴类目项的文字个数
          var rowN = Math.ceil(valLength / maxLength) //类目项需要换行的行数
          if (rowN > 1) {
            //如果类目项的文字大于5,
            for (var i = 0; i < rowN; i++) {
              var temp = '' //每次截取的字符串
              var start = i * maxLength //开始截取的位置
              var end = start + maxLength //结束截取的位置
              //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
              temp = value.substring(start, end) + '\n'
              ret += temp //凭借最终的字符串
            }
            return ret
          } else {
            return value
          }
        },
      },
      axisTick: {
        show: false,
      },
    },
    yAxis: {
      splitLine: {
        show: true,
        lineStyle: {
          type: 'dashed',
        },
      },
    },

    series: [
      {
        name: '库存',
        type: 'bar',
        data: kunchunattr.value,
        barWidth: '25%',
      },
    ],
  })
})
let skunameattr = ref<string[]>([])
let kunchunattr = ref<number[]>([])
const getkuchun = async () => {
  const result = await GetKunchun()
  if (result.code == 200) {
    skunameattr.value = result.data.map((item: kunchun) => {
      return item.skuname
    })
    kunchunattr.value = result.data.map((item: kunchun) => {
      return item.skucount
    })
  }
}
</script>

<style scoped></style>
