<template>
  <div>
    <el-card shadow="always">
      <el-form label-width="100px" size="normal" :model="skudetail"  @submit.native.prevent>
        <el-form-item label="SKU名称">
          <el-input
            placeholder="请输入SKU名称"
            v-model="skudetail.skuname"
          ></el-input>
        </el-form-item>
        <el-form-item label="价格">
          <el-input
            type="number"
            placeholder="请输入SKU价格"
            v-model="skudetail.price"
          ></el-input>
        </el-form-item>
        <el-form-item label="重量">
          <el-input
            placeholder="请输入SKU重量"
            v-model="skudetail.weight"
          ></el-input>
        </el-form-item>
        <el-form-item label="SKU描述">
          <el-input
            type="textarea"
            placeholder="请输入SKU描述"
            v-model="skudetail.skudescription"
          ></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input
            type="number"
            placeholder="请输入SKU数量"
            v-model="skudetail.skucount"
          ></el-input>
        </el-form-item>
        <el-form-item label="平台属性" size="normal">
          <div v-for="item in platformattributList">
            {{ item.name }}
            <el-select v-model="item.platformattributidandvalue">
              <el-option
                v-for="item1 in item.value"
                :label="item1.valuename"
                :value="`${item.id}:${item1.valuename}`"
              ></el-option>
            </el-select>
          </div>
        </el-form-item>
        <el-form-item label="销售属性" size="normal">
          <div v-for="item in ExistingattributeList">
            {{ item.saleattrname }}
            <el-select v-model="item.platformattributidandvalue">
              <el-option
                v-for="item1 in item.saleattrvaluelist"
                :label="item1"
                :value="`${item.id}:${item1}`"
              ></el-option>
            </el-select>
          </div>
        </el-form-item>
        <el-form-item label="图片名称" size="normal">
          <el-table
            border
            stripe
            :data="SpuImageList"
            @select="setectiondefaultimg"
            ref="table"
            :header-cell-class-name="cellClass"
          >
            <el-table-column type="selection" width="55" />
            <el-table-column label="图片" width="200">
              <template #="{ row }">
                <img :src="row.imgurl" class="spuimg" />
              </template>
            </el-table-column>
            <el-table-column label="名称" prop="imagename" />
            <el-table-column label="操作">
              <template #="{ row }">
                <el-button type="success" @click="setdefaultimg(row)">
                  设置为默认图片
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
        <el-form-item label="" size="normal">
          <el-button type="success" @click="setskuindfo">保存</el-button>
          <el-button type="info" @click="exit">取消</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { skuplatformattribute,skusaleattrvalue,imagetype,skudetailtype,spuSaleAttr,platformattributedatatype } from '@/api/product/type'

import {
  GeteExistingattribute,
  GetSpuImage,
  SetSkuDetail,
} from '@/api/product/spu'
import { Getplatformattribute } from '@/api/product/attr'
import { ElMessage } from 'element-plus'
const $emit = defineEmits(['exit'])
const skudetail = reactive<skudetailtype>({
  spuid: '',
  skuname: '',
  price: '',
  weight: '',
  skudescription: '',
  skucount: '',
  skusaleattrvalueList: [],
  skuplatformattributeList: [],
  skuimage: '',
})
const exit = () => {
  $emit('exit')
}
let ExistingattributeList= ref<spuSaleAttr[]>([])
let platformattributList= ref<platformattributedatatype[]>([])
let SpuImageList = ref<imagetype[]>([])
const getskuinfo = async (Selectvalue: number, spuid: number) => {
  // console.log(Selectvalue,spuid)
  const result1 = await GeteExistingattribute(spuid)
  const result2 = await Getplatformattribute(Selectvalue)
  const result3 = await GetSpuImage(spuid)
  skudetail.spuid = spuid
  ExistingattributeList.value = result1.data
  platformattributList.value = result2.data
  SpuImageList.value = result3
}
const table = ref()
const setdefaultimg = (row: imagetype) => {
  SpuImageList.value.forEach((item:imagetype) => {
    table.value.toggleRowSelection(item, false)
  })
  //选中的图片才勾选
  table.value.toggleRowSelection(row, true)
  skudetail.skuimage = row.imgurl
}
const setectiondefaultimg = (row:imagetype[], selection: imagetype) => {
  if (row.length > 1) {
    row = row.filter((item:imagetype) => {
      return item.id == selection.id
    })
    SpuImageList.value.forEach((item: imagetype) => {
      table.value.toggleRowSelection(item, false)
    })
    //选中的图片才勾选
    table.value.toggleRowSelection(selection, true)
    skudetail.skuimage = selection.imgurl
  } else if (row.length == 0) {
    skudetail.skuimage = ''
  } else {
    skudetail.skuimage = selection.imgurl
  }
}
const cellClass = (row: any) => {
  if (row.columnIndex === 0) {
    return 'disabledCheck'
  }
}
const setskuindfo = async () => {
  let attribute = ExistingattributeList.value.filter((item: spuSaleAttr) => {
    return item.hasOwnProperty('platformattributidandvalue')
  })
  let platformattribut = platformattributList.value.filter((item: platformattributedatatype) => {
    return item.hasOwnProperty('platformattributidandvalue')
  })
  skudetail.skusaleattrvalueList = attribute.reduce((prev: skusaleattrvalue[], next:any) => {
    let [id, saleattrname] = next.platformattributidandvalue.split(':')
    prev.push({
      id,
      saleattrname,
    })
    return prev
  }, [])
  skudetail.skuplatformattributeList = platformattribut.reduce(
    (prev:skuplatformattribute[], next: any) => {
      let [id, platformattrname] = next.platformattributidandvalue.split(':')
      prev.push({
        id,
        platformattrname,
      })
      return prev
    },
    [],
  )

  const result = await SetSkuDetail(skudetail)
  console.log(result)
  if (result.code == 200) {
    ElMessage({
      type: 'success',
      message: '添加sku成功',
    })
  } else {
    ElMessage({
      type: 'error',
      message: '添加sku失败',
    })
  }
  $emit('exit')
}
defineExpose({ getskuinfo })
</script>

<style scoped lang="scss">
.spuimg {
  width: 100px;
  height: 100px;
  margin-left: 38px;
}

::v-deep .el-table .disabledCheck .cell .el-checkbox__inner {
  display: none !important;
}

::v-deep .el-table .disabledCheck .cell::before {
  content: '选择';
  text-align: center;
  line-height: 37px;
}
</style>
