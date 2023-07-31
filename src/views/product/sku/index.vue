<template>
  <div>
    <el-upload
      class="avatar-uploader"
      :action="uploadUrl"
      :show-file-list="false"
      :on-success="handleAvatarUpload"
      :before-upload="beforeAvatarUpload"
      name="image"
    >
      <img v-if="imageUrl" :src="imageUrl" class="avatar" />
      <el-icon v-else class="avatar-uploader-icon">
        <Plus />
      </el-icon>
    </el-upload>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const imageUrl = ref('')
const uploadUrl = 'http://localhost:3000/upload'

const beforeAvatarUpload = (file) => {
  // 在这里可以添加一些文件验证的逻辑，例如文件类型、大小的限制
  // 返回 true 表示允许上传，返回 false 则取消上传
  return true
}

const handleAvatarUpload = (response) => {
  console.log(response.data)
  if (response && response.data && response.data.imageUrl) {
    imageUrl.value = response.data.imageUrl
  } else {
    console.error('头像上传失败')
  }
}

const uploadFile = async (file) => {
  const formData = new FormData()
  formData.append('image', file.raw) // 添加 'image' 字段，注意使用 file.raw 来获取原始文件对象
  try {
    const response = await axios.post(uploadUrl, formData)
    return response.data
  } catch (error) {
    console.error('Error uploading image:', error)
    throw error // 抛出错误，以便 Element Plus 的上传组件处理失败情况
  }
}
</script>

<style scoped>
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>
