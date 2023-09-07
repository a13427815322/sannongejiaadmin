<template>
  <div>
    <el-card>
      <div class="box">
        <img src="@/assets/images/homebackground.png" class="avatar" />
        <div class="bottom">
          <h3 class="title">{{ gettime() }}好呀 {{ userStore.username }}</h3>
          <p class="subtitle">三农E家后台管理系统</p>
        </div>
      </div>
      <hr style="opacity: 0.2" />
      <div class="tongjibox">
        <div class="sale">
          <svg-icon class="svg" name="sale" fill="#07c160"></svg-icon>
          <div class="shujvbox">
            <div class="shujvtitle">总销售额</div>
            <div class="shujvdetail">
              <span class="count">5000</span>
              <div class="ge">元</div>
            </div>
          </div>
        </div>
        <div class="shop">
          <svg-icon class="svg" name="shop" fill="#07c160"></svg-icon>
          <div class="shujvbox">
            <div class="shujvtitle">在销产品</div>
            <div class="shujvdetail">
              <span class="count">22</span>
              <div class="ge">个</div>
            </div>
          </div>
        </div>
        <div class="orderfrom">
          <svg-icon class="svg" name="orderfrom" fill="#07c160"></svg-icon>
          <div class="shujvbox">
            <div class="shujvtitle">日新增订单</div>
            <div class="shujvdetail">
              <span class="count">22</span>
              <div class="ge">个</div>
            </div>
          </div>
        </div>
        <div class="addthing">
          <svg-icon class="svg" name="addthing" fill="#07c160"></svg-icon>
          <div class="shujvbox">
            <div class="shujvtitle">较昨日新增</div>
            <div class="shujvdetail">
              <span class="count">2.45%</span>
              <div class="ge">
                <svg
                  style="
                    width: 35px;
                    height: 35px;
                    margin-top: -10px;
                    margin-left: -10px;
                  "
                >
                  <use xlink:href="#icon-up"></use>
                </svg>
              </div>
            </div>
          </div>
        </div>
      </div>
    </el-card>
    <inventory></inventory>
    <div class="targetbox">
      <target></target>
      <monthsale></monthsale>
    </div>
  </div>
</template>

<script setup lang="ts">
import { gettime } from '@/utils/time'
//引入用户相关的仓库,获取当前用户的头像、昵称
import useUserStore from '@/store/modules/user'
//获取存储用户信息的仓库对象
let userStore = useUserStore()
import inventory from './inventory/index.vue'
import target from './target/index.vue'
import monthsale from './monthsale/index.vue'
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
    margin: 20px;

    .title {
      font-size: 30px;
      font-weight: bold;
      margin-bottom: 15px;
    }

    .subtitle {
      color: #333333;
    }
  }
}

.homebackground {
  width: 30vw;
  margin: 10px auto;
  display: flex;
}

.tongjibox {
  display: flex;

  .sale,
  .shop,
  .orderfrom,
  .addthing {
    display: flex;
    flex: 1;
    margin: 10px;

    .svg {
      margin: 10px;
      background-color: #f5f5f5;
      padding: 10px;
      border-radius: 50%;
    }

    .shujvbox {
      display: flex;
      flex-direction: column;
      margin-left: 10px;

      .shujvtitle {
        margin-top: 20px;
        flex: 1;
      }

      .shujvdetail {
        flex: 1;
        display: flex;

        .count {
          font-size: 30px;
        }

        .ge {
          margin-left: 10px;
          color: #8a8989;
        }
      }
    }
  }
}
.targetbox {
  width: 100%;
  display: flex;
}
</style>
