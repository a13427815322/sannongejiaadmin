<template>
  <div>
   <SearchBox @searchinfo="SearchOrderfrom"></SearchBox>
   <el-card>
    1111
   </el-card>
  </div>
</template>

<script setup lang="ts">
import  SearchBox from '../seachbox/index.vue'
const SearchOrderfrom=(search:string)=>{
console.log(search,5)
}

</script>

<style scoped lang="scss">

</style>
