<template>
    <el-select placeholder="请选择产品分类" v-model="value" @change="getplatformattribute" style="margin: 10px auto;"
      :disabled="addvalue">
      <el-option v-for="(item) in AttrStore.propertyList.data" :label="item.name" :key="item.id" :value="item.id" />
    </el-select>
    <!--产品分类选择框 -->
    <el-card shadow="always" :body-style="{ padding: '20px' }" v-if="!addvalue">
      <el-button type="success" style="margin: 10px auto;" icon="Plus" :disabled="!AttrStore.Selectvalue"
        @click="add">新增产品属性</el-button>
      <el-table :data="AttrStore.platformattributeList.data" stripe border="true">
        <el-table-column label="序号" width="100" type="index" />
        <el-table-column label="属性名称" width="100" prop="name" />
        <el-table-column label="属性值">
          <template #="{ row, $index }">
            <el-tag type="success" size="normal" v-for="item in row.value" :key="$index" style="margin-right: 10px;">{{
              item.valuename }}</el-tag>
  
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200">
          <template #="{ row }">
            <el-button icon="Edit" type="success" @click="edit(row)"></el-button>
            <el-popconfirm title="确定要删除这个属性吗?" icon="Delete" confirm-button-type="success" @confirm="delattribute(row.id)">
              <template #reference>
                <el-button icon="Delete" type="success"></el-button>
              </template>
            </el-popconfirm>
  
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <!-- 属性展示页面操作修改和删除 -->
    <el-card shadow="always" :body-style="{ padding: '20px' }" v-if="addvalue">
      <el-from>
        <el-form-item label="属性名称" required>
          <el-input placeholder="请输入属性名称" size="small" style="width: 250px;" v-model="attribute.name"></el-input>
        </el-form-item>
      </el-from>
      <el-button type="success" icon="Plus" :disabled="attribute.name ? false : true" @click="attributeaddvalue">
        添加属性值
      </el-button>
      <el-table :data="attribute.value">
        <el-table-column label="序号" type="index" width="100"></el-table-column>
        <el-table-column label="属性值">
          <template #="{ row, $index }">
  
            <el-input :ref="(vc: any) => inputArr[$index] = vc" v-model="row.valuename" placeholder="请输入属性值"
              @blur="toolook($index, row)" v-if="row.flag"></el-input>
            <div v-if="!row.flag" @click="editvalue(row, $index)">{{ row.valuename }}</div>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200">
          <template #="{ $index }">
            <el-popconfirm title="确定要删除这个属性值吗?" @confirm="delvalue($index)" icon="Delete" confirm-button-type="success">
              <template #reference>
                <el-button icon="Delete" type="success">
                </el-button>
              </template>
            </el-popconfirm>
  
          </template>
        </el-table-column>
      </el-table>
      <div style="margin-top: 10px;">
        <el-button type="success" :disabled="!attribute.value.length" @click="insertattrvute">保存</el-button>
        <el-button type="success" @click="qvxiao">取消</el-button>
      </div>
    </el-card>
    <!-- 属性的添加或修改 -->
  </template>
  
  <script setup lang="ts">
  import { onMounted, onBeforeUnmount } from 'vue';
  import { GetPropertyinfo, Getplatformattribute, Setplatformattribute, Delplatformattribute } from '@/api/product/attr'
  import useAttrStore from '@/store/modules/attr';
  import { ref, reactive, nextTick } from 'vue';
  import { ElMessage } from 'element-plus';
  
  const value = ref()
  // 记录选择了哪个产品分类
  let AttrStore = useAttrStore()
  onMounted(() => {
    getpropertyList()
    // 获取产品分类
  })
 
  const getpropertyList = async () => {
    try {
      const propertyList = await GetPropertyinfo();
      // 调用接口，返回产品分类
      AttrStore.propertyList = propertyList
      // 把propertyList存进pina仓库
      console.log(propertyList);
    } catch (error) {
      console.error('获取属性信息时出错:', error);
    }
  }
  const getplatformattribute = async () => {
    AttrStore.Selectvalue = value.value
    // 获取用户选择的产品分类存入仓库
    try {
      const platformattributeList = await Getplatformattribute(AttrStore.Selectvalue)
      // 调用接口，获取该产品分类中，产品属性和属性值
      AttrStore.platformattributeList = platformattributeList
      // 调回来的产品属性和属性值存入仓库
      console.log(platformattributeList)
    } catch (error) {
      console.error('获取属性信息时出错:', error);
    }
  }
  const addvalue = ref(false)
  const add = () => {
  
    Object.assign(attribute, {
      id: null,
      propertyid: AttrStore.Selectvalue,
      name: '',
      value: [
      ]
    })
    // 数据初始化
    addvalue.value = true
    // 控制是否出现属性值添加或修改界面
  }
  const edit = (row: any) => {
    console.log(row)
    Object.assign(attribute, row)
    addvalue.value = true
    // 控制是否出现属性值添加或修改界面
  }
  const delattribute = async (id: number) => {
    try {
      await Delplatformattribute(id)
      ElMessage({
        type: 'success',
        message: '删除成功'
      })
      getplatformattribute()
    } catch (err: any) {
      // ElMessage({
      //   type:'error',
      //   message:err.message
      // })
      console.log(err)
      getplatformattribute()
    }
  
  
  }
  let attribute: AttributeType = reactive(
    {
      propertyid: AttrStore.Selectvalue,
      name: '',
      value: [
      ]
    }
  )
  let inputArr = ref<any>([]);
  // 存取编辑值的vc
  interface AttributeType {
    id?: number;
    propertyid: number;
    name: string;
    value: { valuename: string; flag: boolean; }[];
  }
  // 规定attribute的数据类型
  const attributeaddvalue = () => {
    attribute.value.push({ valuename: '', flag: true })
    nextTick(() => {
      inputArr.value[attribute.value.length - 1].focus();
    })
  }
  
  const toolook = ($index: number, row: any) => {
    // 在失去焦点的情况下检查数据
    //非法情况1
    if (row.valuename.trim() == '') {
      //删除调用对应属性值为空的元素
      attribute.value.splice($index, 1);
      //提示信息
      ElMessage({
        type: 'error',
        message: '属性值不能为空'
      })
      return;
    }
    //非法情况2
    let repeat = attribute.value.find((item) => {
      if (item != row) {
        return item.valuename === row.valuename;
      }
    });
    // 把除去自身的在attrbute用过滤器过滤有没有一样的属性值找出重复的
    if (repeat) {
      //将重复的属性值从数组当中干掉
      attribute.value.splice($index, 1);
      //提示信息
      ElMessage({
        type: 'error',
        message: '属性值不能重复'
      })
      return;
    }
    //相应的属性值对象flag:变为false,展示div
    row.flag = false;
  }
  const editvalue = (row: any, $index: number) => {
    row.flag = true
    nextTick(() => {
      inputArr.value[$index].focus();
    })
  }
  
  const delvalue = async ($index: number) => {
    try {
      await attribute.value.splice($index, 1);
      ElMessage({
        type: 'success',
        message: '删除成功'
      })
    } catch (err: any) {
      ElMessage({
        type: 'error',
        message: err.message
      })
    }
  
    // 删除值
  }
  const insertattrvute = async () => {
    try {
      await Setplatformattribute(attribute)
      // 保存值
      ElMessage({
        type: 'success',
        message: '保存成功'
      })
      addvalue.value = false
      getplatformattribute()
      // 重新获得属性更新数据
    } catch (error: any) {
      ElMessage({
        type: 'error',
        message: error.message
      })
      addvalue.value = false
    }
  
  }
  const qvxiao = () => {
    addvalue.value = false
    getplatformattribute()
    //取消保存，更新数据，防止弱拷贝
  }
  
  
  onBeforeUnmount(() => {
    //清空仓库的数据
    AttrStore.$reset();
  })
  </script>
  
  
  <style scoped></style>
  