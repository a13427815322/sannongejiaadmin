import { defineStore } from "pinia";
import { attrState } from "./types/types";
let useAttrStore=defineStore('Attr',{
    state:():attrState=>{
        return{
            propertyList:{},
            Selectvalue:0,
            platformattributeList:{},

        }
    },
    actions:{

    },
    getters:{}
})
export default useAttrStore