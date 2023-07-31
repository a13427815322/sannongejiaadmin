import router from "@/router";
import nprogress from 'nprogress'
import 'nprogress/nprogress.css'
import useUserStore from "./store/modules/user";
import pinia from "./store";
import { setting } from "./setting";
nprogress.configure({ showSpinner: false });
let Userstore = useUserStore(pinia)

//前置守卫
router.beforeEach(async (to, from, next) => {
    document.title=`${setting.title} - ${to.meta.name}`
    // console.log(to,from,next)
    nprogress.start();
   
    console.log(Userstore.token)
    if (Userstore.token) {
        if (to.path == '/login') {
            next({ path: '/' })
        }
        else {
            if (Userstore.username) {
                next()
            }
            else {
                try {
                    await Userstore.userinfo()
                    next();
                } catch (error) {

                }
            }

        }
    }else{
        if(to.path=='/login'){next()}else(
            next({path:'/login',query:{redirect:to.path}})
        )
        
    }
})
//后置守卫
router.afterEach((to, from) => {
    nprogress.done();
})