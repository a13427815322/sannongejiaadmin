<template>
  <div>
    <Propertyselect :addvalue="addvalue"></Propertyselect>
    <template v-if="addvalue == 0">
      <el-card>
        <el-button
          icon="Plus"
          type="success"
          style="margin: 10px 0"
          @click="addspu"
          :disabled="!AttrStore.Selectvalue"
          v-has="`btn.Spu.add`"
        >
          添加SPU
        </el-button>
        <el-table border :data="spudetail" style="margin: 10px 0">
          <el-table-column
            label="序号"
            width="80"
            type="index"
          ></el-table-column>
          <el-table-column label="SPU名称" prop="spuname"></el-table-column>
          <el-table-column label="SPU描述" prop="description"></el-table-column>
          <el-table-column label="SPU操作">
            <template #="{ row }">
              <el-button
                icon="Plus"
                color="#07c160"
                title="增加sku"
                @click="addsku(row)"
                v-has="`btn.Spu.addsku`"
              ></el-button>
              <el-button
                icon="Edit"
                color="#07c160"
                title="编辑spu"
                v-has="`btn.Spu.update`"
                @click="editspu(row)"
              ></el-button>
              <el-button
                icon="View"
                color="#07c160"
                title="查看sku"
                v-has="`btn.Spu.skus`"
                @click="tolooksku(row)"
              ></el-button>
              <el-popconfirm
                title="确定要删除这个属性值吗?"
                @confirm="deletespu(row.id)"
                icon="Delete"
              >
                <template #reference>
                  <el-button
                    icon="Delete"
                    color="#07c160"
                    title="删除spu"
                    v-has="`btn.Spu.delete`"
                  ></el-button>
                </template>
              </el-popconfirm>
            </template>
          </el-table-column>
        </el-table>
        <el-pagination
          layout="prev, pager, next, jumper,->,sizes,total"
          @current-change="handleCurrentChange"
          @size-change="handleSizeChange"
          :page-sizes="[3, 6, 9]"
          :total="total"
          :page-size="pageSize"
          v-model:current-page="pageNo"
        />
      </el-card>
    </template>
    <spufrom ref="spu" v-if="addvalue === 1" @exit="updateaddvalue"></spufrom>
    <skufrom ref="sku" v-if="addvalue === 2" @exit="updateaddvalue"></skufrom>
    <el-dialog title="SKU详情" v-model="lookskudetail" width="50%">
      <el-table border stripe :data="skudetail">
        <el-table-column label="SKU名称" prop="skuname"></el-table-column>
        <el-table-column label="SKU价格">
          <template #="{ row }">￥{{ row.price }}</template>
        </el-table-column>
        <el-table-column label="SKU重量" prop="weight"></el-table-column>
        <el-table-column label="SKU图片">
          <template #="{ row }">
            <img :src="row.skuimage" style="width: 100px; height: 100px" />
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, nextTick, onBeforeUnmount, reactive } from 'vue'
import useAttrStore from '@/store/modules/attr'
import { GetSpuDetail, GetSkuDetail, DelSpu } from '@/api/product/spu'
import { skudetailtype, spudetaildata } from '@/api/product/type'
import { ElMessage } from 'element-plus'
import spufrom from './spufrom.vue'
import skufrom from './skufrom.vue'
const AttrStore = useAttrStore()
let addvalue = ref(0)
let spudetail = ref<spudetaildata[]>([])
watch(
  () => AttrStore.Selectvalue,
  () => {
    spudetail.value = []
    // console.log(AttrStore.Selectvalue)
    getspudetail()
  },
)
const total = ref(0)
const getspudetail = async (pager = 1) => {
  try {
    pageNo.value = pager
    let result = await GetSpuDetail(
      AttrStore.Selectvalue,
      pageNo.value,
      pageSize.value,
    )
    if (result.data) {
      spudetail.value = result.data
      total.value = result.data[0].total_count as number
    } else {
      total.value = 0
    }
  } catch (err: any) {
    ElMessage({
      type: 'error',
      message: err.message,
    })
  }
}
let pageNo = ref(1)
let pageSize = ref(3)
const handleSizeChange = (val: number) => {
  pageSize.value = val
  getspudetail()
}
const handleCurrentChange = (val: number) => {
  pageNo.value = val
  getspudetail(pageNo.value)
}
let spu = ref()
const addspu = () => {
  addvalue.value = 1
  nextTick(() => {
    // console.log(spu.value)
    spu.value.getaddinfo(AttrStore.Selectvalue)
  })
}
const updateaddvalue = () => {
  addvalue.value = 0
  getspudetail(pageNo.value)
}
const editspu = (row: spudetaildata) => {
  addvalue.value = 1
  nextTick(() => {
    // console.log(spu.value)
    spu.value.geteditinfo(row)
  })
}
const sku = ref()
const addsku = (row: spudetaildata) => {
  addvalue.value = 2
  nextTick(() => {
    sku.value.getskuinfo(AttrStore.Selectvalue, row.id)
  })
}
let lookskudetail = ref(false)
let skudetail = reactive<skudetailtype[]>([])
const tolooksku = async (row: spudetaildata) => {
  const result = await GetSkuDetail(row.id)
  skudetail = result.data
  nextTick(() => {
    lookskudetail.value = true
  })
}
const deletespu = async (spuid: number) => {
  const result = await DelSpu(spuid)
  if (result.code == 200) {
    ElMessage({
      type: 'success',
      message: '删除成功',
    })
    getspudetail(spudetail.value.length > 1 ? pageNo.value : pageNo.value - 1)
  }
}
onBeforeUnmount(() => {
  //清空仓库的数据
  AttrStore.$reset()
})
</script>

<style scoped></style>
