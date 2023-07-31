import { defineStore } from 'pinia'
let useLayOutSettingStore = defineStore('Setting', {
    state: () => {
      return {
       Fold:false,
       Refresh:false,
      }
    },
    actions: {
     
    },
    getters: {},
  })
  export default useLayOutSettingStore
  