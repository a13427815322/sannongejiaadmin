<template>
  <div>
    <el-table :data="perssioninfo" border row-key="id">
      <el-table-column prop="name" label="名称"></el-table-column>
      <el-table-column prop="code" label="权限值"></el-table-column>
      <el-table-column label="操作">
        <template #="{ row }">
          <el-button
            type="success"
            @click="addmenu(row)"
            v-if="row.level < 3"
            v-has="`btn.Permission.add`"
          >
            添加菜单
          </el-button>
          <el-button
            type="success"
            @click="addmenu(row)"
            v-has="`btn.Permission.add`"
            v-else
            :disabled="row.level == 4"
          >
            添加功能
          </el-button>
          <el-button
            type="success"
            @click="editmenu(row)"
            :disabled="row.level == 1"
            v-has="`btn.Permission.update`"
          >
            编辑
          </el-button>
          <el-popconfirm
            :title="`你确定要删除${row.name}?`"
            confirmButtonText="删除"
            cancelButtonText="取消"
            confirmButtonType="success"
            cancelButtonType="text"
            icon="Delete"
            iconColor="#f90"
            @confirm="deletemenu(row)"
          >
            <template #reference>
              <el-button
                type="success"
                @click=""
                v-has="`btn.Permission.remove`"
                :disabled="row.level == 1"
              >
                删除
              </el-button>
              >
            </template>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog v-model="dialog">
      <el-form>
        <el-form-item label="名称">
          <el-input
            v-model="temaddmenu.name"
            placeholder="请输入名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="权限">
          <el-input
            v-model="temaddmenu.code"
            placeholder="请输入名称"
          ></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button type="info" @click="dialog = false">取消</el-button>
        <el-button type="success" @click="savemenuinfo">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { GetMenuInfo, SetMenuInfo, DeleteMenu } from '@/api/acl/perssion'
import { ElMessage } from 'element-plus'
import { da } from 'element-plus/es/locale/index.js'
let perssioninfo = ref([])
onMounted(() => {
  getmenuinfo()
})
const getmenuinfo = async () => {
  const result = await GetMenuInfo()
  if (result.code == 200) {
    perssioninfo.value = result.data
  }
}
let temaddmenu = ref({
  id: 0,
  pid: 0,
  name: '',
  code: '',
})
let dialog = ref(false)
const addmenu = (row: any) => {
  Object.assign(temaddmenu.value, {
    id: 0,
    pid: row.id,
    name: '',
    code: '',
    level: row.level,
  })
  dialog.value = true
}
const editmenu = (row: any) => {
  Object.assign(temaddmenu.value, {
    id: row.id,
    pid: row.pid,
    name: row.name,
    code: row.code,
  })
  dialog.value = true
}
const savemenuinfo = async () => {
  const result = await SetMenuInfo(temaddmenu.value)
  if (result.code == 200) {
    dialog.value = false
    ElMessage({
      type: 'success',
      message: result.message,
    })
    getmenuinfo()
  }
}
const getmenuid = (data: any, result: any) => {
  result.push(data.id)
  if (data.children && data.children.length != 0) {
    data.children.forEach((item: any) => {
      getmenuid(item, result)
    })
  }
  return result
}
const deletemenu = async (row: any) => {
  console.log(row)
  const idattr = getmenuid(row, [])
  // console.log(idattr)
  const result = await DeleteMenu(idattr)
  if (result.code == 200) {
    ElMessage({
      type: 'success',
      message: '删除成功',
    })
    getmenuinfo()
  } else {
    ElMessage({
      type: 'success',
      message: '删除失败',
    })
    getmenuinfo()
  }
}
</script>

<style scoped></style>
