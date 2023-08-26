<template>
  <div>
    <el-card>
    <div class="box">
      <img :src="(userStore.avatar as string)" alt="" class="avatar">
      <div class="bottom">
        <h3 class="title">{{gettime() }}好呀  {{ userStore.username }}</h3>
        <p class="subtitle">三农E家后台管理系统</p>
      </div>
    </div>
  </el-card>
<img src="@/assets/images/homebackground.png" class="homebackground" />
</div>
</template>

<script setup lang="ts">
import { gettime} from '@/utils/time';
//引入用户相关的仓库,获取当前用户的头像、昵称
import useUserStore from '@/store/modules/user';
//获取存储用户信息的仓库对象
let userStore = useUserStore();

</script>

<style scoped lang="scss">
.box {
  display: flex;

  .avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
  }

  .bottom {
    margin-left: 20px;

    .title {
      font-size: 30px;
      font-weight: 900;
      margin-bottom: 30px;
    }

    .subtitle {
      font-style: italic;
      color: skyblue;
    }
  }
}
.homebackground{
  width: 30vw;
  margin: 10px auto;
  display: flex;

}
</style>
