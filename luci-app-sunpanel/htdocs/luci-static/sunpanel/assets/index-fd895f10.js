import{f as x,bl as N,bB as S,bn as k,r as d,aX as B,b4 as s,a$ as t,b2 as a,aW as $,b3 as n,b0 as m,b1 as _,bt as C,ac as P,bC as U,bo as V,bA as I}from"./index-7e19b821.js";import{l as T}from"./index-8f0537f1.js";import{S as p}from"./index-c238f14b.js";import{b as A,l as K,d as j,a as c,N as h}from"./index-2b595d91.js";import{N as z}from"./GradientText-44d798c5.js";import"./_plugin-vue_export-helper-c27b6911.js";const F={class:"login-container"},L={class:"mb-5 flex items-center justify-end"},M={class:"mr-2"},D={class:"min-w-[100px]"},E={class:"login-title"},G=n("div",{class:"flex justify-center text-slate-300"},[m(" Powered By "),n("a",{href:"https://github.com/hslr-s/sun-panel",target:"_blank",class:"ml-[5px] text-slate-500"},"Sun-Panel")],-1),R=x({__name:"index",setup(H){const f=N(),g=S(),b=k(),r=d(!1),i=d(g.language),o=d({username:"",password:""}),y=async()=>{r.value=!0;try{const e=await T(o.value);e.code===0?(f.setToken(e.data.token),f.setUserInfo(e.data),setTimeout(()=>{b.success(`Hi ${e.data.name},${V("login.welcomeMessage")}`),r.value=!1,I.push({path:"/"})},500)):r.value=!1}catch(e){r.value=!1,console.log(e)}};function v(){y()}function w(e){i.value=e,g.setLanguage(e)}return(e,l)=>($(),B("div",F,[s(a(U),{class:"login-card",style:{"border-radius":"20px"}},{default:t(()=>[n("div",L,[n("div",M,[s(a(p),{icon:"ion-language",style:{width:"20",height:"20"}})]),n("div",D,[s(a(A),{value:i.value,"onUpdate:value":l[0]||(l[0]=u=>i.value=u),size:"small",options:a(K),onUpdateValue:w},null,8,["value","options"])])]),n("div",E,[s(a(z),{size:30,type:"success",class:"!font-bold"},{default:t(()=>[m(_(e.$t("common.appName")),1)]),_:1})]),s(a(j),{model:o.value,"label-width":"100px",onKeydown:C(v,["enter"])},{default:t(()=>[s(a(c),null,{default:t(()=>[s(a(h),{value:o.value.username,"onUpdate:value":l[1]||(l[1]=u=>o.value.username=u),placeholder:e.$t("login.usernamePlaceholder")},{prefix:t(()=>[s(a(p),{icon:"ph:user-bold"})]),_:1},8,["value","placeholder"])]),_:1}),s(a(c),null,{default:t(()=>[s(a(h),{value:o.value.password,"onUpdate:value":l[2]||(l[2]=u=>o.value.password=u),type:"password",placeholder:e.$t("login.passwordPlaceholder")},{prefix:t(()=>[s(a(p),{icon:"mdi:password-outline"})]),_:1},8,["value","placeholder"])]),_:1}),s(a(c),{style:{"margin-top":"10px"}},{default:t(()=>[s(a(P),{type:"primary",block:"",loading:r.value,onClick:v},{default:t(()=>[m(_(e.$t("login.loginButton")),1)]),_:1},8,["loading"])]),_:1}),G]),_:1},8,["model","onKeydown"])]),_:1})]))}});export{R as default};
