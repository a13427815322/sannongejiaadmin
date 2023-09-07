<template>
    <div style="flex:1;margin-left:5%">
        <el-card shadow="always" style="width:100%; height:400px;margin-top: 20px;"  >
      <div ref="monthsale" style="width: 100%;height:375px; "></div>
    </el-card>
    </div>
</template>

<script setup lang="ts">
import * as echarts from 'echarts'
import { ref, onMounted } from 'vue';
let monthsale = ref()
onMounted(async () => {
  let mychart = echarts.init(monthsale.value)
  mychart.setOption({
    color: ['#0d9'],
    title: {
      text: '月度销售额趋势图'
    },
    tooltip: {},
    xAxis: {
      data: ['壹月','贰月','叁月','肆月','伍月','陆月','柒月','捌月','玖月','拾月','拾壹月','拾贰月',],
      nameTextStyle: {
        width: '10px',
        color: '#f5f5f5',
        overflow: 'none'
      },
      axisLabel: {
        interval: 0,
        show: true,
        formatter: function (value: any) {
          var ret = "";//拼接加\n返回的类目项  
          var maxLength = 5;//每项显示文字个数  
          var valLength = value.length;//X轴类目项的文字个数  
          var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数  
          if (rowN > 1)//如果类目项的文字大于5,  
          {
            for (var i = 0; i < rowN; i++) {
              var temp = "";//每次截取的字符串  
              var start = i * maxLength;//开始截取的位置  
              var end = start + maxLength;//结束截取的位置  
              //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧  
              temp = value.substring(start, end) + "\n";
              ret += temp; //凭借最终的字符串  
            }
            return ret;
          }
          else {
            return value;
          }
        }
      },
      axisTick: {
        show: false
      }
    },
    yAxis: {
      splitLine: {
        show: true,
        lineStyle: {
          type: 'dashed'
        }
      },
    },

    series: [{
      name: '库存',
      type: 'line',
      data:[2934, 4201, 1765, 3189, 4500, 2578, 3823, 2110, 1367, 4956, 3642, 1234],
      barWidth: '25%',
    }]
  })
})
let skunameattr = ref([])
let kunchunattr = ref([])

</script>

<style scoped>

</style>