<template>
  <div class="box">
     <img src="../../assets/images/error_images/404.png" alt="">
  </div>
  <div @click="goHome" style="color:#07c160;text-decoration: underline;cursor: pointer;">回到首页</div>
</template>

<script setup lang="ts">
import {useRouter} from 'vue-router';
let $router = useRouter();
const goHome = ()=>{
 $router.push('/home')
}
</script>

<style scoped lang="scss">
.box{
width: 100vw;
height: 60vh;
display: flex;
justify-content: center;
img{
  width: 50vw;
  margin: 0 auto;
}

}
div{
  display: flex;
justify-content: center;
  width: 100vw;
  height: 50px;
}
</style>