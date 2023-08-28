<template>
  <div>
    <el-card style="margin: 10px 0">
      <el-from
        :inline="true"
        style="
          display: flex;
          justify-content: space-between;
          align-items: center;
        "
      >
        <el-form-item label="用户名">
          <el-input
            placeholder="请输入搜索用户名"
            style="width: 200px"
            v-model="serachvalue"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="success"
            @click="searchuser"
            :disabled="!serachvalue"
          >
            搜索
          </el-button>
          <el-button type="success" @click="resetuser">重置</el-button>
        </el-form-item>
      </el-from>
    </el-card>
    <el-card>
      <el-button type="success" @click="adduser">添加用户</el-button>
      <el-popconfirm
        title="你确认要删除选中的用户吗？"
        confirmButtonText="删除"
        cancelButtonText="取消"
        confirmButtonType="success"
        cancelButtonType="text"
        icon="Delete"
        iconColor="#f90"
        @confirm="deletesomeuser"
        v-has="`btn.User.add`"
      >
        <template #reference>
          <el-button type="success" v-has="`btn.User.remove`">
            批量删除
          </el-button>
        </template>
      </el-popconfirm>

      <el-table
        border
        stripe
        @selection-change=""
        style="margin: 10px 0"
        :data="adminuserinfo"
        ref="reftable"
      >
        <el-table-column type="selection" width="55" />
        <el-table-column type="index" width="50" label="#" />
        <el-table-column label="ID" width="50" prop="userid"></el-table-column>
        <el-table-column label="用户名字" prop="username"></el-table-column>
        <el-table-column label="用户昵称" prop="name"></el-table-column>
        <el-table-column label="用户角色" prop="role"></el-table-column>
        <el-table-column label="操作">
          <template #="{ row }">
            <el-button
              type="success"
              icon="User"
              @click="updateuserrole(row)"
              v-has="`btn.User.assgin`"
            >
              分配角色
            </el-button>
            <el-button
              type="success"
              icon="Edit"
              @click="edituser(row)"
              v-has="`btn.User.update`"
            >
              编辑
            </el-button>
            <el-popconfirm
              title="你确认要删除这个用户吗？"
              confirmButtonText="删除"
              cancelButtonText="取消"
              confirmButtonType="success"
              cancelButtonType="text"
              icon="Delete"
              iconColor="#f90"
              @confirm="deleteuser(row)"
            >
              <template #reference>
                <el-button
                  type="success"
                  icon="Delete"
                  v-has="`btn.User.remove`"
                >
                  删除
                </el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        style="margin-top: 10px"
        @size-change="sizeChange"
        @current-change="getadminuser"
        v-model:currentPage="pageNo"
        :page-sizes="[3, 6, 9]"
        :page-size="pageSize"
        layout=" prev, pager, next, jumper,->, sizes,total"
        :total="total"
      >
        :pager-count="7">
      </el-pagination>
    </el-card>
    <el-drawer title="添加用户" v-model="drawer" size="30%">
      <template #default>
        <el-form ref="formRef" :model="draweruserinfo" :rules="rules">
          <el-form-item label="用户名" label-width="100px" prop="username">
            <el-input
              placeholder="请输入用户名"
              v-model="draweruserinfo.username"
            ></el-input>
          </el-form-item>
          <el-form-item
            label="密码"
            label-width="100px"
            prop="password"
            v-if="draweruserinfo.userid == 0 ? true : false"
          >
            <el-input
              placeholder="请输入密码"
              type="password"
              v-model="draweruserinfo.password"
            ></el-input>
          </el-form-item>
          <el-form-item label="用户昵称" label-width="100px" prop="name">
            <el-input
              placeholder="请输入昵称"
              v-model="draweruserinfo.name"
            ></el-input>
          </el-form-item>
        </el-form>
      </template>
      <template #footer>
        <el-button type="info" @click="qvxiao">取消</el-button>
        <el-button type="success" @click="savefrom">保存</el-button>
      </template>
    </el-drawer>
    <el-drawer title="分配角色" v-model="drawer1" size="30%">
      <el-checkbox
        v-model="checkAll"
        :indeterminate="isIndeterminate"
        @change="handleCheckAllChange"
      >
        全选
      </el-checkbox>
      <el-checkbox-group
        v-model="rolechecked"
        @change="handleCheckedRoleChange"
      >
        <el-checkbox
          v-for="item in role"
          :key="item.id"
          :label="item.rolename"
        ></el-checkbox>
      </el-checkbox-group>
      <template #footer>
        <el-button type="info" @click="drawer1 = false">取消</el-button>
        <el-button type="success" @click="setuserrole">保存</el-button>
      </template>
    </el-drawer>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, reactive, nextTick } from 'vue'
import {
  GetAdminUserInfo,
  AddNewUser,
  GetAllRoleInFO,
  SetUserRole,
  SearchUser,
  DeleteUser,
} from '@/api/acl/user'
import { ElMessage } from 'element-plus'
import useLayOutSettingStore from '@/store/modules/setting'
let setting = useLayOutSettingStore()
let pageNo = ref(1)
let pageSize = ref(3)
let total = ref(0)
let drawer = ref(false)
let drawer1 = ref(false)
let draweruserinfo = reactive({
  userid: 0,
  username: '',
  name: '',
  password: '',
})
const reftable = ref()
let userid = ref(0)
onMounted(() => {
  getadminuser()
})
let adminuserinfo = ref([])
let serachvalue = ref('')
const getadminuser = async (paper = 1) => {
  pageNo.value = paper
  const result = await GetAdminUserInfo(pageNo.value, pageSize.value)
  if (result.code == 200) {
    adminuserinfo.value = result.data
    total.value = result.total
  }
}
const sizeChange = (val: number) => {
  pageSize.value = val
  getadminuser()
}
const adduser = () => {
  drawer.value = true
  Object.assign(draweruserinfo, {
    userid: 0,
    username: '',
    name: '',
    password: '',
  })
  nextTick(() => {
    formRef.value.clearValidate('username')
    formRef.value.clearValidate('name')
    formRef.value.clearValidate('password')
  })
}
let formRef = ref()
const validatorUsername = (rule: any, value: any, callBack: any) => {
  //用户名字|昵称,长度至少五位
  if (value.trim().length >= 5) {
    callBack()
  } else {
    callBack(new Error('用户名字至少五位'))
  }
}
const validatorpassword = (rule: any, value: any, callBack: any) => {
  //昵称,长度至少五位
  if (value.trim().length >= 5) {
    callBack()
  } else {
    callBack(new Error('密码至少五位'))
  }
}
const validatorname = (rule: any, value: any, callBack: any) => {
  //用户名字|昵称,长度至少五位
  if (value.trim().length > 0) {
    callBack()
  } else {
    callBack(new Error('请输入用户昵称'))
  }
}
const rules = {
  //用户名字
  username: [{ required: true, trigger: 'blur', validator: validatorUsername }],
  //用户昵称
  name: [{ required: true, trigger: 'blur', validator: validatorname }],
  //用户的密码
  password: [{ required: true, trigger: 'blur', validator: validatorpassword }],
}
const savefrom = async () => {
  await formRef.value.validate()
  const result = await AddNewUser(draweruserinfo)
  if (result.code == 200) {
    drawer.value = false
    ElMessage({
      type: 'success',
      message: result.message,
    })
    // if(draweruserinfo.userid==0){
    //   getadminuser()
    // }else{
    //   getadminuser(pageNo.value)
    // }
    //旧方案，增加回到第一页，修改停留在此页，但会出现修改自身数据不会退出的bug
    window.location.reload()
    //刷新页面，要不改自身数据会处于登录状态而token已经改变
  } else if (result.code == 500) {
    drawer.value = false
    ElMessage({
      type: 'error',
      message: result.message,
    })
    getadminuser()
  }
}
const qvxiao = () => {
  drawer.value = false
}
const edituser = (row: any) => {
  Object.assign(draweruserinfo, row)
  drawer.value = true
  nextTick(() => {
    formRef.value.clearValidate('username')
    formRef.value.clearValidate('name')
    formRef.value.clearValidate('password')
  })
}
const checkAll = ref(false)
const isIndeterminate = ref(false)
const rolechecked = ref()
const role = ref<any>([])
const updateuserrole = async (row: any) => {
  console.log(row)
  userid.value = row.userid
  if (row.roles) {
    rolechecked.value = row.role
  } else {
    rolechecked.value = []
  }
  const result = await GetAllRoleInFO()
  if (result.code == 200) {
    role.value = result.data
    checkAll.value = false
    drawer1.value = true
    const rolelength = role.value.filter((attr: any) => {
      return rolechecked.value.find((item: number) => {
        return attr.rolename == item
      })
    })

    if (rolelength.length == 0) {
      isIndeterminate.value = false
    } else if (rolelength.length == role.value.length) {
      isIndeterminate.value = false
      checkAll.value = true
    } else {
      isIndeterminate.value = true
    }
  }
}

const handleCheckAllChange = () => {
  const attr = role.value.map((item: any) => {
    return item.rolename
  })
  rolechecked.value = rolechecked.value.length != attr.length ? attr : []
  isIndeterminate.value = false
}
const handleCheckedRoleChange = (value: string[]) => {
  const checkedCount = value.length
  checkAll.value = checkedCount === role.value.length
  isIndeterminate.value = checkedCount > 0 && checkedCount < role.value.length
}
const setuserrole = async () => {
  const attr = role.value.filter((item: any) => {
    return rolechecked.value.find((element: string) => {
      return element == item.rolename
    })
  })
  const rolesvalue = attr.map((item: any) => {
    return item.id
  })
  const result = await SetUserRole(userid.value, rolesvalue)
  if (result.code == 200) {
    drawer1.value = false
    ElMessage({
      type: 'success',
      message: '分配角色成功',
    })
    window.location.reload()
  }
}
const searchuser = async () => {
  const result = await SearchUser(
    pageNo.value,
    pageSize.value,
    serachvalue.value,
  )
  if (result.code == 200) {
    adminuserinfo.value = result.data
    total.value = result.total
    serachvalue.value = ''
  }
}
const resetuser = () => {
  setting.Refresh = !setting.Refresh
}
const deletesomeuser = async () => {
  let useridattr = reftable.value.getSelectionRows()
  useridattr = useridattr.map((item: any) => {
    return item.userid
  })
  const result = await DeleteUser(useridattr)
  if (result.code == 200) {
    ElMessage({ type: 'success', message: '删除成功' })
    window.location.reload()
  }
}
const deleteuser = async (row: any) => {
  const useridattr = [row.userid]
  const result = await DeleteUser(useridattr)
  if (result.code == 200) {
    ElMessage({ type: 'success', message: result.message })
    window.location.reload()
  } else if (result.code == 500) {
    ElMessage({ type: 'error', message: result.message })
    window.location.reload()
  }
}
</script>

<style scoped></style>
