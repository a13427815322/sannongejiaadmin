<template>
  <div>
    <el-card>
      <el-form label-width="110" :model="spudetail" @submit.native.prevent>
        <el-form-item label="SPU名称 :">
          <el-input
            placeholder="请你输入SPU名称"
            v-model="spudetail.spuname"
          ></el-input>
        </el-form-item>
        <el-form-item label="SPU描述 :">
          <el-input
            placeholder="请你输入SPU描述"
            type="textarea"
            v-model="spudetail.description"
          ></el-input>
        </el-form-item>
        <el-form-item label="SPU图片 :">
          <el-upload
            v-model:file-list="fileList"
            :action="uploadUrl"
            list-type="picture-card"
            name="image"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
          >
            <el-icon>
              <Plus />
            </el-icon>
          </el-upload>
          <div></div>
          <el-dialog v-model="dialogVisible">
            <img
              w-full
              :src="dialogImageUrl"
              alt="Preview Image"
              style="width: 100%; height: 100%"
            />
          </el-dialog>
        </el-form-item>
        <el-form-item label="SPU销售属性 :">
          <el-select placeholder="请选择属性" v-model="values">
            <el-option
              v-for="item in SaleAttr"
              :key="item.basesaleattrid"
              :label="item.saleattrname"
              :value="item.basesaleattrid"
            ></el-option>
          </el-select>

          <el-button
            icon="Plus"
            @click="addsaleattrbuite"
            :disabled="values == ''"
          >
            添加属性
          </el-button>
          <el-table border :data="spudetail.spuSaleAttrList">
            <el-table-column label="序号" type="index"></el-table-column>
            <el-table-column
              label="销售属性名字"
              prop="saleattrname"
            ></el-table-column>
            <el-table-column label="销售属性值">
              <template #="{ row, $index }" style="display: flex">
                <div :key="$index" style="display: inline-block">
                  <el-tag
                    style="margin-left: 10px"
                    type="success"
                    size="small"
                    closable
                    v-for="(item, index) in row.saleattrvaluelist"
                    @close="removevalue(index, row)"
                    :key="index"
                  >
                    {{ item }}
                  </el-tag>
                </div>
                <div style="display: inline-block; margin-left: 10px">
                  <el-button
                    v-if="!row.flag"
                    type="success"
                    size="small"
                    @click="addsaleattrbuitevalue(row, $index)"
                    icon="Plus"
                  ></el-button>
                  <el-input
                    v-else
                    v-model="row.saleattr"
                    placeholder=""
                    size="normal"
                    :ref="(vc: any) => (inputArr[$index] = vc)"
                    clearable
                    @blur="saveaddvalue(row)"
                  ></el-input>
                </div>
              </template>
            </el-table-column>
            <el-table-column label="操作">
              <template #="{ row }">
                <el-popconfirm
                  title="确定要删除这个属性值吗?"
                  @confirm="deletevalue(row)"
                  icon="Delete"
                  confirm-button-type="success"
                >
                  <template #reference>
                    <el-button icon="Delete" type="success"></el-button>
                  </template>
                </el-popconfirm>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
        <el-button
          type="success"
          size="default"
          @click="save"
          :disabled="!spudetail.spuSaleAttrList?.length"
        >
          保存
        </el-button>
        <el-button type="info" size="default" @click="exit">取消</el-button>
      </el-form>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, nextTick } from 'vue'
// @ts-ignore
import axios from 'axios'
import { ElMessage, type UploadUserFile } from 'element-plus'
import { spudetaildata } from '@/api/product/type'
import {
  GetSaleattr,
  GeteExistingattribute,
  SetSpuDetail,
  GetSpuImage,
} from '@/api/product/spu'
let $emit = defineEmits(['exit'])
const fileList = ref<UploadUserFile[]>([])
const uploadUrl = 'http://localhost:3000/upload'
import { saleattrListtype, spuSaleAttr, imagetype } from '@/api/product/type'
const dialogImageUrl = ref('')
const dialogVisible = ref(false)
const saleattrList = ref<saleattrListtype[]>([])
let spudetail = ref<spudetaildata>({
  spuname: '',
  id: 0,
  propertyid: 0,
  description: '',
  spuImageList: [],
  spuSaleAttrList: [],
})
let values = ref('')

const handlePictureCardPreview = (file: any) => {
  dialogImageUrl.value = file.url
  //对话框弹出来
  dialogVisible.value = true
}
//照片墙删除文件钩子
const handleRemove = (uploadFile: any, uploadFiles: any) => {
  console.log(uploadFile, uploadFiles)
}
const getsaleattrList = async () => {
  const result = await GetSaleattr()
  // console.log(result)
  saleattrList.value = result
}
const getaddinfo = (Selectvalue: number) => {
  spudetail.value.propertyid = Selectvalue
  getsaleattrList()
}
const geteditinfo = async (val: spudetaildata) => {
  spudetail.value = val
  // console.log(spudetail.value)
  getsaleattrList()
  getexistingattribute(spudetail.value.id)
}
const getexistingattribute = async (id: number) => {
  const result = await GeteExistingattribute(id)
  console.log(result)
  if (result.hasOwnProperty('data')) {
    spudetail.value.spuSaleAttrList = result.data
    spudetail.value.spuSaleAttrList?.forEach((item: spuSaleAttr) => {
      item.saleattr = ''
      item.flag = false
    })
    console.log(spudetail.value)
  }
  const result1 = await GetSpuImage(id)

  fileList.value = result1.map((item: imagetype) => {
    return {
      name: item.imagename,
      url: item.imgurl,
      id: item.id,
    }
  })
  console.log(fileList.value)
}
const exit = () => {
  $emit('exit')
}
const SaleAttr = computed(() =>
  saleattrList.value.filter((saleattr: saleattrListtype) => {
    // console.log(saleattr.basesaleattrid)
    return !spudetail.value.spuSaleAttrList?.find((spuSaleAttrlist) => {
      // console.log(spuSaleAttrlist.basesaleattrid)
      return spuSaleAttrlist.basesaleattrid == saleattr.basesaleattrid
    })
  }),
)
const removevalue = (index: number, row: spuSaleAttr) => {
  row.saleattrvaluelist.splice(index, 1)
}
const addsaleattrbuite = () => {
  SaleAttr.value.find((attr: saleattrListtype) => {
    return attr.basesaleattrid == Number(values.value)
  })
  if (spudetail.value.spuSaleAttrList) {
    spudetail.value.spuSaleAttrList?.push(
      SaleAttr.value.find((attr: saleattrListtype) => {
        return attr.basesaleattrid == Number(values.value)
      }) as spuSaleAttr,
    )
    values.value = ''
  } else {
    console.log(SaleAttr.value)
    spudetail.value.spuSaleAttrList = [
      SaleAttr.value.find((attr: saleattrListtype) => {
        return attr.basesaleattrid == Number(values.value)
      }) as spuSaleAttr,
    ]
    values.value = ''
  }
}
const deletevalue = (row: spuSaleAttr) => {
  console.log(row.basesaleattrid)
  spudetail.value.spuSaleAttrList = spudetail.value.spuSaleAttrList?.filter(
    (attrlist) => {
      return attrlist.basesaleattrid != row.basesaleattrid
    },
  )
}
const addsaleattrbuitevalue = (row: spuSaleAttr, $index: number) => {
  row.flag = true
  row.saleattr = ''
  nextTick(() => {
    inputArr.value[$index].focus()
  })
}
const saveaddvalue = (row: spuSaleAttr) => {
  if (row.saleattr.trim()) {
    if (row.saleattrvaluelist) {
      row.saleattrvaluelist.push(row.saleattr)
    } else {
      row.saleattrvaluelist = [row.saleattr]
    }
  } else {
    ElMessage({
      type: 'error',
      message: '属性值不能为空',
    })
  }
  row.flag = false
}
const save = async () => {
  const result: any = ref([])
  fileList.value.forEach((item: any) => {
    if (result.value.length == 0) {
      if (item.id) {
        result.value = [
          {
            id: item.id,
            spuid: spudetail.value.id,
            imagename: item.name,
            imgurl: item.url,
          },
        ]
      } else {
        result.value = [
          {
            spuid: spudetail.value.id,
            imagename: item.name,
            imgurl: item.response.data.imageUrl,
          },
        ]
      }
    } else {
      if (item.id) {
        result.value.push({
          id: item.id,
          spuid: spudetail.value.id,
          imagename: item.name,
          imgurl: item.url,
        })
      } else {
        result.value.push({
          spuid: spudetail.value.id,
          imagename: item.name,
          imgurl: item.response.data.imageUrl,
        })
      }
    }
  })
  spudetail.value.spuImageList = result.value
  //图片数据处理
  const result1 = await SetSpuDetail(spudetail.value)
  if (result1.code == 200) {
    ElMessage({
      type: 'success',
      message: `${result1.message}`,
    })
  } else {
  }
  $emit('exit')
}
let inputArr = ref<any>([])
defineExpose({ getaddinfo, geteditinfo })
</script>

<style scoped></style>
