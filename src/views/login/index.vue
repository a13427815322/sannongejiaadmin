<template>
  <div class="login_containter">
    <el-row :gutter="0">
      <el-col :span="12" :xs="0"></el-col>
      <el-col :span="12" :xs="24">
        <el-form
          class="login_from"
          :model="user"
          :rules="rules"
          ref="loginFroms"
        >
          <h1>HELLO</h1>
          <h2>欢迎来到三农e家</h2>
          <el-form-item prop="username">
            <el-input v-model="user.username" :prefix-icon="User"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input
              v-model="user.password"
              :prefix-icon="Lock"
              show-password="true"
            ></el-input>
          </el-form-item>
          <el-form-item>
            <el-button
              :loading="lodaing"
              type="success"
              class="login_btn"
              @click="login"
            >
              登录
            </el-button>
          </el-form-item>
        </el-form>
      </el-col>
    </el-row>
  </div>
</template>

<script setup lang="ts">
import { User, Lock } from '@element-plus/icons-vue'
import { reactive, ref } from 'vue'
import useUserSrore from '@/store/modules/user'
import { ElNotification } from 'element-plus'
import router from '@/router'
import { gettime } from '@/utils/time'
import { useRoute } from 'vue-router'
const $router = useRoute()
//console.log($router)
let user = reactive({ username: '', password: '' })
let userStore = useUserSrore()
let lodaing = ref(false)
let loginFroms = ref()
const rules = {
  username: [
    { required: true, min: 5, message: '用户名长度至少为5', trigger: 'change' },
    { max: 10, message: '用户名长度至多为10', trigger: 'change' },
  ],
  password: [
    { required: true, min: 5, message: '密码长度至少为5', trigger: 'change' },
    { max: 15, message: '密码长度至多为15', trigger: 'change' },
  ],
}
const login = async () => {
  await loginFroms.value.validate()
  lodaing.value = true
  try {
    await userStore.userLogin(user)
    await userStore.userinfo()
    if ($router.query) {
      let redirect: any = $router.query.redirect
      if (redirect) {
        const routess = router.getRoutes()
        console.log(routess)
        const isroute = routess.find((item) => {
          console.log(item.path, redirect)
          console.log(item.path == redirect)
          return item.path == redirect
        })
        console.log(isroute)
        if (isroute) {
          console.log(1)
          router.push({ path: redirect || '/' })
        } else {
          router.push('/404')
        }
      } else {
        router.push({ path: '/' })
      }
    } else {
      router.push('/')
    }

    lodaing.value = false
    ElNotification({
      type: 'success',
      message: '欢迎回来',
      title: `HI,${gettime()}好`,
    })
  } catch (error) {
    lodaing.value = false
    ElNotification({
      type: 'error',
      message: (error as Error).message,
    })
  }
}
</script>

<style scoped lang="scss">
.login_containter {
  width: 100%;
  height: 100vh;
  background: url('@/assets/images/background.jpg') no-repeat;
  background-size: cover;

  h1 {
    color: white;
    font-size: 40px;
  }

  h2 {
    color: white;
    font-size: 20px;
    margin: 20px 0;
  }

  .login_from {
    width: 80%;
    position: relative;
    top: 30vh;
    background: url('@/assets/images/login_form.png');
    padding: 40px;
    border-radius: 20px;

    .login_btn {
      width: 100%;
    }
  }
}
</style>
