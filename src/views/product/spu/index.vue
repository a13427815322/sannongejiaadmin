<template>
  <div>
    <input type="file" ref="img" />
    <button @click="uploadImage">上传图片</button>
    <img :src="imageurl" />
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import axios from 'axios'
let img = ref()
let imageurl = ref('')
const uploadImage = async (): Promise<void> => {
  const target = img.value
  // console.log(target)
  const file = target.files?.[0]

  if (file) {
    const formData = new FormData()
    formData.append('image', file)

    try {
      const response = await axios.post(
        'http://localhost:3000/upload',
        formData,
        {
          headers: { 'Content-Type': 'multipart/form-data' },
        },
      )
      console.log('Image uploaded successfully!', response)
      imageurl.value = response.data.data.imageUrl
      console.log(imageurl)
    } catch (error) {
      console.error('Error uploading image:', error)
    }
  }
}
</script>
