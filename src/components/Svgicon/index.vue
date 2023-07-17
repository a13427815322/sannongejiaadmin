<template>
    <div>
         <!-- fill可以调颜色 -->
        <svg :style="{width,height}">
      <use :xlink:href="prefix+name" :fill="fill">
      </use>
    </svg>
    
    </div>
</template>

<script setup lang="ts">
defineProps({
    prefix:{
        type:String,
        default:'#icon-'
    },
    name:String,
    fill:{
        type:String,
        default:'#333333'
    },
    width: {
        type:String,
        default:'48px'
},
height:{
    type:String,
        default:'48px'
}
})
</script>

<style scoped>

</style>