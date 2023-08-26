<template>
  <div>
    <el-card shadow="always" style="margin:10px 0;">
      <el-form :inline="true" style="display: flex;justify-content: space-between;align-items: center">
        <el-form-item label="角色搜索">
          <el-input placeholder="请输入想搜索的角色" style="width: 200px;" v-model="searchrolevalue"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="success" @click="searchrole" :disabled="!searchrolevalue">搜索</el-button>
          <el-button type="success" @click="resetrole">重置</el-button>
        </el-form-item>
      </el-form>

    </el-card>
    <el-card shadow="always">
      <el-button type="success" icon="Plus" @click=addrole()>添加角色</el-button>
      <el-table border style="margin: 10px 0;" :data="roledetail">
        <el-table-column type="index" label="#" width="100" />
        <el-table-column width="100" label="ID" prop="id" />
        <el-table-column label="角色名称" prop="rolename" />
        <el-table-column fixed="right" label="操作" width="325px">
          <template #="{ row }">
            <el-button type="success" icon="User" @click="givepower(row)">分配权限</el-button>
            <el-button type="success" icon="Edit" @click="editrole(row)">编辑</el-button>
            <el-popconfirm title="你确定要删除这个角色吗？" confirmButtonText="删除" cancelButtonText="取消" confirmButtonType="success"
              cancelButtonType="text" icon="Delete" iconColor="#f90" @confirm="deleterole(row)" >
              <template #reference><el-button type="success" icon="Delete">删除</el-button>
              </template>
              </el-popconfirm>


          </template>
        </el-table-column>
      </el-table>
      <el-pagination @size-change="sizeChange" @current-change="getroleinfo" v-model:currentPage="pageNo"
        :page-sizes="[3, 6, 9]" :page-size="pageSize" layout=" prev, pager, next, jumper,->,sizes,total" :total="total">
      </el-pagination>
    </el-card>
    <el-dialog :title="addrolevalue.id == 0 ? '添加角色' : '更新角色'" v-model="dialog" width="30%">
      <el-form :model="addrolevalue" ref="RefFrom" :rules="rules">
        <el-form-item label="角色" prop="rolename">
          <el-input placeholder="请输入角色名称" v-model="addrolevalue.rolename"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span>
          <el-button type="info" @click="dialog = false">取消</el-button>
          <el-button type="success" @click="saverole">确认</el-button>
        </span>
      </template>
    </el-dialog>
    <el-drawer v-model="drawer" title="分配菜单与按钮的权限">
      <el-tree ref="tree" :data="powerdetail" show-checkbox node-key="id" :props="defaultProps"
        :default-checked-keys="defaultchek" />
      <template #footer>
        <el-button type="info" @click="drawer = false">取消</el-button>
        <el-button type="success" @click="savepower">保存</el-button>
      </template>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, nextTick } from 'vue';
import { GetRoleInfo, SetRole, GetRolePower, SetRolePower, SearchRole ,DeleteRole} from '@/api/acl/role'
import { ElMessage } from 'element-plus';
import useLayOutSettingStore from '@/store/modules/setting'
let setting = useLayOutSettingStore()
let pageNo = ref(1)
let pageSize = ref(3)
let roledetail = ref([])
let total = ref(0)
let dialog = ref(false)
let RefFrom = ref()
let addrolevalue = ref({
  id: 0,
  rolename: ''
})
let drawer = ref(false)
const tree = ref()
const lookrolename = (rule: any, value: any, callback: any) => {
  if ((value.trim()).length >= 2) {
    callback()
  } else {
    callback(new Error('角色名称至少为两位'))
  }
}
const rules = {
  rolename: [{ required: true, trigger: 'blur', validator: lookrolename }],
}

const getroleinfo = async (paper = 1) => {
  pageNo.value = paper
  const result = await GetRoleInfo(pageNo.value, pageSize.value)
  if (result.code == 200) {
    roledetail.value = result.data
    total.value = result.total
  }
}
const addrole = () => {
  Object.assign(addrolevalue.value, {
    id: 0,
    rolename: ''
  })
  dialog.value = true
  nextTick(() => {
    RefFrom.value.clearValidate('rolename')
  })

}
const saverole = async () => {
  await RefFrom.value.validate()
  const result = await SetRole(addrolevalue.value)
  if (result.code == 200) {
    dialog.value = false
    ElMessage({
      type: 'success',
      message: result.message
    })
    if (addrolevalue.value.id) {
      getroleinfo(pageNo.value)
    } else {
      getroleinfo()
    }
  } else if (result.code == 500) {
    dialog.value = false
    ElMessage({
      type: 'error',
      message: result.message
    })
    if (addrolevalue.value.id) {
      getroleinfo(pageNo.value)
    } else {
      getroleinfo()
    }
  }
}
const sizeChange = (val: number) => {
  pageSize.value = val
  getroleinfo()
}
const editrole = (row: any) => {
  Object.assign(addrolevalue.value, {
    id: row.id,
    rolename: row.rolename
  })
  dialog.value = true
  nextTick(() => {
    RefFrom.value.clearValidate('rolename')
  })
}
let powerdetail = ref()
const defaultProps = {
  children: 'children',
  label: 'name',
}
let defaultchek = ref([])
let roleid = ref(0)
const givepower = async (row: any) => {
  defaultchek.value = []
  roleid.value = row.id
  const result = await GetRolePower(row.id)
  if (result.code == 200) {
    powerdetail.value = result.data
    defaultchek.value = filterSelectArr(powerdetail.value, []);
  }
  nextTick(() => {
    drawer.value = true
  })

}
const filterSelectArr = (powerdetail: any, defaultchek: any) => {
  powerdetail.forEach((item: any) => {
    if (item.select && item.level == 4) {
      defaultchek.push(item.id);
    }
    if (item.children && item.children.length > 0) {
      filterSelectArr(item.children, defaultchek);
    }
  })
  return defaultchek
}
const savepower = async () => {
  let arr = tree.value.getCheckedKeys();
  //半选的ID
  let arr1 = tree.value.getHalfCheckedKeys();
  let permissionId = arr.concat(arr1);
  const result = await SetRolePower(roleid.value, permissionId)
  if (result.code == 200) {
    drawer.value = false
    ElMessage({
      type: 'success',
      message: '分配权限成功'
    })
    window.location.reload()
  }
}
let searchrolevalue = ref('')
const searchrole = async () => {
  const result = await SearchRole(pageNo.value, pageSize.value, searchrolevalue.value)
  if (result.code == 200) {
    roledetail.value = result.data
    total.value = result.total
    searchrolevalue.value = ''

  }
}
const resetrole = () => {
  setting.Refresh = !setting.Refresh
}
const deleterole=async(row:any)=>{
 
  const result = await DeleteRole( row.id)
  if (result.code == 200) {
    ElMessage({ type: 'success', message: result.message })
    window.location.reload()
  }else if(result.code==500){
    ElMessage({ type: 'error', message: result.message })
    window.location.reload()
}
}
onMounted(() => {
  getroleinfo()

})
</script>

<style scoped></style>
