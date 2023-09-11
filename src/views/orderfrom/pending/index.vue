<template>
  <div>
    <SearchBox @searchinfo="SearchOrderfrom"></SearchBox>
    <el-card>
      <el-popconfirm
        title="你是否要批量发货？"
        confirmButtonText="发货"
        cancelButtonText="取消"
        confirmButtonType="success"
        cancelButtonType="text"
        icon="Van"
        iconColor="#07c160"
        @confirm="batchdelivery"
      >
        <template #reference>
          <el-button
            v-has="`btn.pending.driver`"
            type="success"
            style="margin-bottom: 10px"
          >
            批量发货
          </el-button>
        </template>
      </el-popconfirm>

      <el-table
        ref="reftable"
        border
        :data="dingdandetail"
        style="margin-bottom: 10px"
      >
        <el-table-column type="selection"></el-table-column>
        <el-table-column type="index" label="#"></el-table-column>
        <el-table-column label="订单号" prop="dingdanid"></el-table-column>
        <el-table-column label="用户id" prop="_id"></el-table-column>
        <el-table-column label="商品信息">
          <template #="{ row }">
            <div v-for="item in row.shopcart">
              {{ item.shopname }}x{{ item.count }}
            </div>
          </template>
        </el-table-column>
        <el-table-column label="付款时间">
          <template #="{ row }">
            {{ proxy?.$dayjs(row.fukuantime).format('YY-MM-DD HH:mm:ss') }}
          </template>
        </el-table-column>
        <el-table-column label="收货人" prop="sjr"></el-table-column>
        <el-table-column label="收货地址" prop="adress"></el-table-column>
        <el-table-column label="手机号" prop="phone"></el-table-column>
        <el-table-column label="操作" fixed="right" width="200px">
          <template #="{ row }">
            <el-popconfirm
              title="你是否要发货？"
              confirmButtonText="发货"
              cancelButtonText="取消"
              confirmButtonType="success"
              cancelButtonType="text"
              icon="Van"
              iconColor="#07c160"
              @confirm="delivergoods([row.dingdanid])"
            >
              <template #reference>
                <el-button
                  v-has="`btn.pending.driver`"
                  title="发货"
                  icon="Van"
                  type="success"
                ></el-button>
              </template>
            </el-popconfirm>
            <el-button
              v-has="`btn.pending.update`"
              title="编辑"
              icon="Edit"
              type="success"
              @click="updateorderfrom(row)"
            ></el-button>
            <el-button
              title="查看详情"
              @click="lookoutdetail(row)"
              icon="InfoFilled"
              type="success"
            ></el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        @size-change="sizeChange"
        @current-change="getdingdandetail"
        v-model:currentPage="pageNO"
        :page-sizes="[3, 6, 9]"
        :page-size="pageSize"
        layout=" prev, pager, next, jumper,->,sizes, total"
        :total="total"
        v-if="!(dingdandetail.length > pageSize)"
      ></el-pagination>
    </el-card>
    <el-drawer v-model="drawer" title="修改订单信息">
      <template #default>
        <el-form label-width="100px" @submit.native.prevent>
          <el-form-item label="订单id：">
            <el-input v-model="temdrawer.dingdanid" :disabled="true"></el-input>
          </el-form-item>
          <el-form-item label="商品信息：">
            <el-tag
              style="margin-top: 5px; margin-right: 5px"
              v-for="item in temdrawer.shopcart"
              type="success"
            >
              {{ item.shopname }}x{{ item.count }}
            </el-tag>
          </el-form-item>
          <el-form-item label="收货人：">
            <el-input v-model="temdrawer.sjr"></el-input>
          </el-form-item>
          <el-form-item label="收货地址：">
            <el-input v-model="temdrawer.adress"></el-input>
          </el-form-item>
          <el-form-item label="手机号：">
            <el-input v-model="temdrawer.phone"></el-input>
          </el-form-item>
        </el-form>
      </template>
      <template #footer>
        <el-button type="info" @click="drawer = false">取消</el-button>
        <el-button type="success" @click="saveorderfrom">保存</el-button>
      </template>
    </el-drawer>
    <el-drawer v-model="drawer1" title="订单详情">
      <template #default>
        <el-row>
          <el-col :span="4">订单号：</el-col>
          <el-col :span="20">{{ temdrawer.dingdanid }}</el-col>
        </el-row>
        <el-row>
          <el-col :span="4">用户id：</el-col>
          <el-col :span="20">{{ temdrawer._id }}</el-col>
        </el-row>
        <el-row>
          <el-col :span="4">付款时间：</el-col>
          <el-col :span="20">
            {{
              proxy?.$dayjs(temdrawer.fukuantime).format('YY-MM-DD HH:mm:ss')
            }}
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="4">收货人：</el-col>
          <el-col :span="20">{{ temdrawer.sjr }}</el-col>
        </el-row>
        <el-row>
          <el-col :span="4">收货地址：</el-col>
          <el-col :span="20">{{ temdrawer.adress }}</el-col>
        </el-row>
        <el-row>
          <el-col :span="4">商品信息：</el-col>
          <el-tag
            style="margin: 5px 5px 0px 0"
            v-for="(item, index) in temdrawer.shopcart"
            type="success"
            @click="toimg(index)"
          >
            {{ item.shopname }}x{{ item.count }}
          </el-tag>
        </el-row>
        <el-carousel
          ref="refcarousel"
          :interval="4000"
          type="card"
          height="200px"
        >
          <el-carousel-item v-for="item in temdrawer.shopcart" :key="item">
            <img :src="item.changpingimg" />
          </el-carousel-item>
        </el-carousel>
      </template>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import SearchBox from '../seachbox/index.vue'
import {
  ref,
  onMounted,
  getCurrentInstance,
  ComponentInternalInstance,
} from 'vue'
import { GetOrderfrom } from '@/api/orderfrom'
import {
  SaveOrderfrom,
  DeliverGoods,
  SearchOrderFromInfo,
} from '@/api/orderfrom/pending'
import { ElMessage } from 'element-plus'
import { orderfromtype } from '@/api/orderfrom/type'
let reftable = ref()
const { proxy } = getCurrentInstance() as ComponentInternalInstance
let pageNO = ref(1)
let pageSize = ref(3)
let dingdandetail = ref<orderfromtype[]>([])
let total = ref(0)
let drawer = ref(false)
let temdrawer = ref<orderfromtype>({
  adress: '',
  cjtime: '',
  dingdanid: 0,
  fahuotime: '',
  fukuantime: '',
  phone: '',
  shopcart: [],
  sjr: '',
  status: 0,
  _id: '',
})
let drawer1 = ref(false)
const getdingdandetail = async (paper = 1) => {
  pageNO.value = paper
  const result = await GetOrderfrom(pageNO.value, pageSize.value, 2)
  if (result.code == 200) {
    dingdandetail.value = result.data
    total.value = result.total
  } else {
    ElMessage({
      type: 'error',
      message: '获取数据失败',
    })
  }
}
onMounted(() => {
  getdingdandetail()
})
const SearchOrderfrom = async (search: string) => {
  const result = await SearchOrderFromInfo(search, 2)
  if (result.code == 200) {
    dingdandetail.value = result.data
    total.value = result.total
  }
}
const sizeChange = (val: number) => {
  pageSize.value = val
  getdingdandetail()
}
const updateorderfrom = (row: orderfromtype) => {
  Object.assign(temdrawer.value, row)
  drawer.value = true
}
const saveorderfrom = async () => {
  const result = await SaveOrderfrom(temdrawer.value)
  if (result.code == 200) {
    ElMessage({
      type: 'success',
      message: '修改订单信息成功',
    })
    drawer.value = false
    getdingdandetail(pageNO.value)
  }
}
const batchdelivery = () => {
  const a = reftable.value.getSelectionRows()
  const idattr = a.map((item: orderfromtype) => {
    return item.dingdanid
  })
  if (idattr.length > 0) {
    delivergoods(idattr)
  } else {
    ElMessage({
      type: 'error',
      message: '请选择要批量发货的订单',
    })
  }
}

const delivergoods = async (idattr: number[]) => {
  const result = await DeliverGoods(idattr)
  if (result.code == 200) {
    ElMessage({
      type: 'success',
      message: '发货成功',
    })
    if (dingdandetail.value.length > idattr.length) {
      getdingdandetail(pageNO.value)
    } else {
      getdingdandetail()
    }
  }
}
const lookoutdetail = (row: orderfromtype) => {
  Object.assign(temdrawer.value, row)
  drawer1.value = true
}
let refcarousel = ref()
const toimg = (index: number) => {
  refcarousel.value.setActiveItem(index)
}
</script>

<style scoped lang="scss">
.el-carousel__item img {
  color: #475669;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
  width: 100%;
  height: 100%;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.el-row {
  margin-top: 10px;

  .el-col {
    line-height: 34px;
  }

  .el-tag {
    cursor: pointer;
  }
}
</style>
