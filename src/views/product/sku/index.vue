<template>
  <div>
    <el-card>
      <el-table border :data="skudetail">
        <el-table-column label="序号" type="index" width="80"></el-table-column>
        <el-table-column
          label="名称"
          prop="skuname"
          width="150"
          show-overflow-tooltip="true"
        ></el-table-column>
        <el-table-column
          label="描述"
          width="150"
          prop="skudescription"
          show-overflow-tooltip="true"
        ></el-table-column>
        <el-table-column label="图片" width="150">
          <template #="{ row }">
            <img
              :src="row.skuimage"
              style="width: 100px; height: 100px"
              alt=""
            />
          </template>
        </el-table-column>
        <el-table-column
          label="重量"
          width="150"
          prop="weight"
        ></el-table-column>
        <el-table-column label="价格" width="150">
          <template #="{ row }">￥{{ row.price }}</template>
        </el-table-column>
        <el-table-column
          label="数量"
          width="150"
          prop="skucount"
        ></el-table-column>
        <el-table-column label="操作" width="300" fixed="right">
          <template #="{ row }">
            <el-button
              :type="row.putaway == 0 ? 'success' : 'warning'"
              @click="showupdown(row)"
              :icon="row.putaway == 0 ? 'Top' : 'Bottom'"
              :title="row.putaway == 0 ? '上架' : '下架'"
            ></el-button>
            <el-button
              type="success"
              @click="
                ElMessage({ type: 'info', message: '该功能还在开发，敬请期待' })
              "
              icon="Edit"
              title="编辑SKU"
            ></el-button>
            <el-button
              type="success"
              @click="lookskuinfo(row)"
              icon="InfoFilled"
              title="SKU信息"
            ></el-button>
            <el-button
              type="success"
              @click="delsku(row.id)"
              icon="Delete"
              title="删除SKU"
            ></el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        v-model:currentPage="pageNo"
        :page-sizes="[3, 6, 10, 15]"
        :page-size="pageSize"
        layout="prev, pager, next, jumper,->,sizes,total"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="getallskudetail"
      />
    </el-card>
    <el-drawer show-close v-model="drawer" title="查看商品的详情">
      <el-row style="margin-top: 5px">
        <el-col :span="10" style="margin-top: 5px">名称:</el-col>
        <el-col :span="14" style="margin-top: 5px">
          {{ skuinfo.skuname }}
        </el-col>
      </el-row>
      <el-row style="margin-top: 5px">
        <el-col :span="10" style="margin-top: 5px">描述:</el-col>
        <el-col :span="14" style="margin-top: 5px">
          {{ skuinfo.skudescription }}
        </el-col>
      </el-row>
      <el-row style="margin-top: 5px">
        <el-col :span="10" style="margin-top: 5px">价格:</el-col>
        <el-col :span="14" style="margin-top: 5px">{{ skuinfo.price }}</el-col>
      </el-row>
      <el-row style="margin-top: 5px">
        <el-col :span="10" style="margin-top: 5px">数量:</el-col>
        <el-col :span="14" style="margin-top: 5px">
          {{ skuinfo.skucount }}
        </el-col>
      </el-row>
      <el-row style="margin-top: 5px">
        <el-col :span="10" style="margin-top: 5px">平台属性:</el-col>
        <el-col :span="14">
          <el-tag
            style="margin: 5px"
            type="success"
            v-for="item in skuinfo.skuplatformattributeList"
            :key="item.id"
          >
            {{ item.platformattrname }}
          </el-tag>
        </el-col>
      </el-row>
      <el-row style="margin-top: 5px">
        <el-col :span="10" style="margin-top: 5px">销售属性:</el-col>
        <el-col :span="14">
          <el-tag
            style="margin: 5px"
            type="success"
            v-for="item in skuinfo.skusaleattrvalueList"
            :key="item.id"
          >
            {{ item.saleattrname }}
          </el-tag>
        </el-col>
      </el-row>
      <el-row style="margin-top: 5px">
        <el-col :span="10" style="margin-top: 5px">商品图片:</el-col>
        <el-col :span="14" style="margin-top: 5px">
          <img :src="skuinfo.skuimage" style="width: 100%" />
        </el-col>
      </el-row>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import {
  GetAllSkuDetail,
  SkuPutAwayOrPutDown,
  DeleteSku,
} from '@/api/product/sku'
import { ElMessage } from 'element-plus'
import { ref, onMounted } from 'vue'
let pageNo = ref(1)
let pageSize = ref(6)
let skudetail: any = ref([])
let total = ref()
onMounted(() => {
  getallskudetail()
})
const getallskudetail = async (paper = 1) => {
  pageNo.value = paper
  const result = await GetAllSkuDetail(pageNo.value, pageSize.value)
  if (result.code == 200) {
    skudetail.value = result.data
    total.value = result.total
  } else {
    ElMessage({
      type: 'error',
      message: '获取sku失败',
    })
  }
}
const handleSizeChange = (val: number) => {
  pageSize.value = val
  getallskudetail()
}
const showupdown = async (row: any) => {
  let putaway = Number(!row.putaway)
  let result = await SkuPutAwayOrPutDown(row.id, putaway)
  if (result.code == 200) {
    row.putaway = putaway
    ElMessage({
      type: 'success',
      message: result.message,
    })
  }
}
const drawer = ref(false)
const skuinfo = ref<any>({})
const lookskuinfo = (row: any) => {
  drawer.value = true
  console.log(row)
  skuinfo.value = row
}
const delsku = async (id: number) => {
  const result = await DeleteSku(id)
  if (result.code == 200) {
    ElMessage({
      type: 'success',
      message: '删除SKU成功',
    })
    getallskudetail(
      skudetail.value.length > 1 ? pageNo.value : pageNo.value - 1,
    )
  }
}
</script>

<style scoped></style>
