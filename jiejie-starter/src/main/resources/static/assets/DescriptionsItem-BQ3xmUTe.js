import{bQ as q,aw as K,R as g,K as t,L as _,T as M,M as V,a4 as k,a5 as F,a2 as G,an as Q,ao as U,aN as J,bV as X,ch as Y,dm as Z,a9 as B}from"./index-x8R6Lp9Z.js";import{c as P,i as ee,j as E,l as c,o as oe,w as O,r as te,t as H}from"./vue-vendor-CP69822o.js";import{g as re}from"./Space-C3Mq2MVb.js";function D(o,e="default",l=[]){const{children:d}=o;if(d!==null&&typeof d=="object"&&!Array.isArray(d)){const i=d[e];if(typeof i=="function")return i()}return l}function ne(o,e){const l=ee(q,null);return P(()=>o.hljs||(l==null?void 0:l.mergedHljsRef.value))}function le(o){const{textColor2:e,fontSize:l,fontWeightStrong:d,textColor3:i}=o;return{textColor:e,fontSize:l,fontWeightStrong:d,"mono-3":"#a0a1a7","hue-1":"#0184bb","hue-2":"#4078f2","hue-3":"#a626a4","hue-4":"#50a14f","hue-5":"#e45649","hue-5-2":"#c91243","hue-6":"#986801","hue-6-2":"#c18401",lineNumberTextColor:i}}const se={name:"Code",common:K,self:le},ie=g([t("code",`
 font-size: var(--n-font-size);
 font-family: var(--n-font-family);
 `,[_("show-line-numbers",`
 display: flex;
 `),M("line-numbers",`
 user-select: none;
 padding-right: 12px;
 text-align: right;
 transition: color .3s var(--n-bezier);
 color: var(--n-line-number-text-color);
 `),_("word-wrap",[g("pre",`
 white-space: pre-wrap;
 word-break: break-all;
 `)]),g("pre",`
 margin: 0;
 line-height: inherit;
 font-size: inherit;
 font-family: inherit;
 `),g("[class^=hljs]",`
 color: var(--n-text-color);
 transition: 
 color .3s var(--n-bezier),
 background-color .3s var(--n-bezier);
 `)]),({props:o})=>{const e=`${o.bPrefix}code`;return[`${e} .hljs-comment,
 ${e} .hljs-quote {
 color: var(--n-mono-3);
 font-style: italic;
 }`,`${e} .hljs-doctag,
 ${e} .hljs-keyword,
 ${e} .hljs-formula {
 color: var(--n-hue-3);
 }`,`${e} .hljs-section,
 ${e} .hljs-name,
 ${e} .hljs-selector-tag,
 ${e} .hljs-deletion,
 ${e} .hljs-subst {
 color: var(--n-hue-5);
 }`,`${e} .hljs-literal {
 color: var(--n-hue-1);
 }`,`${e} .hljs-string,
 ${e} .hljs-regexp,
 ${e} .hljs-addition,
 ${e} .hljs-attribute,
 ${e} .hljs-meta-string {
 color: var(--n-hue-4);
 }`,`${e} .hljs-built_in,
 ${e} .hljs-class .hljs-title {
 color: var(--n-hue-6-2);
 }`,`${e} .hljs-attr,
 ${e} .hljs-variable,
 ${e} .hljs-template-variable,
 ${e} .hljs-type,
 ${e} .hljs-selector-class,
 ${e} .hljs-selector-attr,
 ${e} .hljs-selector-pseudo,
 ${e} .hljs-number {
 color: var(--n-hue-6);
 }`,`${e} .hljs-symbol,
 ${e} .hljs-bullet,
 ${e} .hljs-link,
 ${e} .hljs-meta,
 ${e} .hljs-selector-id,
 ${e} .hljs-title {
 color: var(--n-hue-2);
 }`,`${e} .hljs-emphasis {
 font-style: italic;
 }`,`${e} .hljs-strong {
 font-weight: var(--n-font-weight-strong);
 }`,`${e} .hljs-link {
 text-decoration: underline;
 }`]}]),ae=Object.assign(Object.assign({},k.props),{language:String,code:{type:String,default:""},trim:{type:Boolean,default:!0},hljs:Object,uri:Boolean,inline:Boolean,wordWrap:Boolean,showLineNumbers:Boolean,internalFontSize:Number,internalNoHighlight:Boolean}),me=E({name:"Code",props:ae,setup(o,{slots:e}){const{internalNoHighlight:l}=o,{mergedClsPrefixRef:d,inlineThemeDisabled:i}=V(),a=te(null),m=l?{value:void 0}:ne(o),C=(n,h,b)=>{const{value:u}=m;return!u||!(n&&u.getLanguage(n))?null:u.highlight(b?h.trim():h,{language:n}).value},y=P(()=>o.inline||o.wordWrap?!1:o.showLineNumbers),w=()=>{if(e.default)return;const{value:n}=a;if(!n)return;const{language:h}=o,b=o.uri?window.decodeURIComponent(o.code):o.code;if(h){const p=C(h,b,o.trim);if(p!==null){if(o.inline)n.innerHTML=p;else{const r=n.querySelector(".__code__");r&&n.removeChild(r);const v=document.createElement("pre");v.className="__code__",v.innerHTML=p,n.appendChild(v)}return}}if(o.inline){n.textContent=b;return}const u=n.querySelector(".__code__");if(u)u.textContent=b;else{const p=document.createElement("pre");p.className="__code__",p.textContent=b,n.innerHTML="",n.appendChild(p)}};oe(w),O(H(o,"language"),w),O(H(o,"code"),w),l||O(m,w);const L=k("Code","-code",ie,se,o,d),s=P(()=>{const{common:{cubicBezierEaseInOut:n,fontFamilyMono:h},self:{textColor:b,fontSize:u,fontWeightStrong:p,lineNumberTextColor:r,"mono-3":v,"hue-1":T,"hue-2":$,"hue-3":j,"hue-4":S,"hue-5":z,"hue-5-2":x,"hue-6":R,"hue-6-2":I}}=L.value,{internalFontSize:N}=o;return{"--n-font-size":N?`${N}px`:u,"--n-font-family":h,"--n-font-weight-strong":p,"--n-bezier":n,"--n-text-color":b,"--n-mono-3":v,"--n-hue-1":T,"--n-hue-2":$,"--n-hue-3":j,"--n-hue-4":S,"--n-hue-5":z,"--n-hue-5-2":x,"--n-hue-6":R,"--n-hue-6-2":I,"--n-line-number-text-color":r}}),f=i?F("code",P(()=>`${o.internalFontSize||"a"}`),s,o):void 0;return{mergedClsPrefix:d,codeRef:a,mergedShowLineNumbers:y,lineNumbers:P(()=>{let n=1;const h=[];let b=!1;for(const u of o.code)u===`
`?(b=!0,h.push(n++)):b=!1;return b||h.push(n++),h.join(`
`)}),cssVars:i?void 0:s,themeClass:f==null?void 0:f.themeClass,onRender:f==null?void 0:f.onRender}},render(){var o,e;const{mergedClsPrefix:l,wordWrap:d,mergedShowLineNumbers:i,onRender:a}=this;return a==null||a(),c("code",{class:[`${l}-code`,this.themeClass,d&&`${l}-code--word-wrap`,i&&`${l}-code--show-line-numbers`],style:this.cssVars,ref:"codeRef"},i?c("pre",{class:`${l}-code__line-numbers`},this.lineNumbers):null,(e=(o=this.$slots).default)===null||e===void 0?void 0:e.call(o))}}),ce=g([t("descriptions",{fontSize:"var(--n-font-size)"},[t("descriptions-separator",`
 display: inline-block;
 margin: 0 8px 0 2px;
 `),t("descriptions-table-wrapper",[t("descriptions-table",[t("descriptions-table-row",[t("descriptions-table-header",{padding:"var(--n-th-padding)"}),t("descriptions-table-content",{padding:"var(--n-td-padding)"})])])]),G("bordered",[t("descriptions-table-wrapper",[t("descriptions-table",[t("descriptions-table-row",[g("&:last-child",[t("descriptions-table-content",{paddingBottom:0})])])])])]),_("left-label-placement",[t("descriptions-table-content",[g("> *",{verticalAlign:"top"})])]),_("left-label-align",[g("th",{textAlign:"left"})]),_("center-label-align",[g("th",{textAlign:"center"})]),_("right-label-align",[g("th",{textAlign:"right"})]),_("bordered",[t("descriptions-table-wrapper",`
 border-radius: var(--n-border-radius);
 overflow: hidden;
 background: var(--n-merged-td-color);
 border: 1px solid var(--n-merged-border-color);
 `,[t("descriptions-table",[t("descriptions-table-row",[g("&:not(:last-child)",[t("descriptions-table-content",{borderBottom:"1px solid var(--n-merged-border-color)"}),t("descriptions-table-header",{borderBottom:"1px solid var(--n-merged-border-color)"})]),t("descriptions-table-header",`
 font-weight: 400;
 background-clip: padding-box;
 background-color: var(--n-merged-th-color);
 `,[g("&:not(:last-child)",{borderRight:"1px solid var(--n-merged-border-color)"})]),t("descriptions-table-content",[g("&:not(:last-child)",{borderRight:"1px solid var(--n-merged-border-color)"})])])])])]),t("descriptions-header",`
 font-weight: var(--n-th-font-weight);
 font-size: 18px;
 transition: color .3s var(--n-bezier);
 line-height: var(--n-line-height);
 margin-bottom: 16px;
 color: var(--n-title-text-color);
 `),t("descriptions-table-wrapper",`
 transition:
 background-color .3s var(--n-bezier),
 border-color .3s var(--n-bezier);
 `,[t("descriptions-table",`
 width: 100%;
 border-collapse: separate;
 border-spacing: 0;
 box-sizing: border-box;
 `,[t("descriptions-table-row",`
 box-sizing: border-box;
 transition: border-color .3s var(--n-bezier);
 `,[t("descriptions-table-header",`
 font-weight: var(--n-th-font-weight);
 line-height: var(--n-line-height);
 display: table-cell;
 box-sizing: border-box;
 color: var(--n-th-text-color);
 transition:
 color .3s var(--n-bezier),
 background-color .3s var(--n-bezier),
 border-color .3s var(--n-bezier);
 `),t("descriptions-table-content",`
 vertical-align: top;
 line-height: var(--n-line-height);
 display: table-cell;
 box-sizing: border-box;
 color: var(--n-td-text-color);
 transition:
 color .3s var(--n-bezier),
 background-color .3s var(--n-bezier),
 border-color .3s var(--n-bezier);
 `,[M("content",`
 transition: color .3s var(--n-bezier);
 display: inline-block;
 color: var(--n-td-text-color);
 `)]),M("label",`
 font-weight: var(--n-th-font-weight);
 transition: color .3s var(--n-bezier);
 display: inline-block;
 margin-right: 14px;
 color: var(--n-th-text-color);
 `)])])])]),t("descriptions-table-wrapper",`
 --n-merged-th-color: var(--n-th-color);
 --n-merged-td-color: var(--n-td-color);
 --n-merged-border-color: var(--n-border-color);
 `),Q(t("descriptions-table-wrapper",`
 --n-merged-th-color: var(--n-th-color-modal);
 --n-merged-td-color: var(--n-td-color-modal);
 --n-merged-border-color: var(--n-border-color-modal);
 `)),U(t("descriptions-table-wrapper",`
 --n-merged-th-color: var(--n-th-color-popover);
 --n-merged-td-color: var(--n-td-color-popover);
 --n-merged-border-color: var(--n-border-color-popover);
 `))]),W="DESCRIPTION_ITEM_FLAG";function de(o){return typeof o=="object"&&o&&!Array.isArray(o)?o.type&&o.type[W]:!1}const he=Object.assign(Object.assign({},k.props),{title:String,column:{type:Number,default:3},columns:Number,labelPlacement:{type:String,default:"top"},labelAlign:{type:String,default:"left"},separator:{type:String,default:":"},size:{type:String,default:"medium"},bordered:Boolean,labelClass:String,labelStyle:[Object,String],contentClass:String,contentStyle:[Object,String]}),fe=E({name:"Descriptions",props:he,slots:Object,setup(o){const{mergedClsPrefixRef:e,inlineThemeDisabled:l}=V(o),d=k("Descriptions","-descriptions",ce,Z,o,e),i=P(()=>{const{size:m,bordered:C}=o,{common:{cubicBezierEaseInOut:y},self:{titleTextColor:w,thColor:L,thColorModal:s,thColorPopover:f,thTextColor:n,thFontWeight:h,tdTextColor:b,tdColor:u,tdColorModal:p,tdColorPopover:r,borderColor:v,borderColorModal:T,borderColorPopover:$,borderRadius:j,lineHeight:S,[B("fontSize",m)]:z,[B(C?"thPaddingBordered":"thPadding",m)]:x,[B(C?"tdPaddingBordered":"tdPadding",m)]:R}}=d.value;return{"--n-title-text-color":w,"--n-th-padding":x,"--n-td-padding":R,"--n-font-size":z,"--n-bezier":y,"--n-th-font-weight":h,"--n-line-height":S,"--n-th-text-color":n,"--n-td-text-color":b,"--n-th-color":L,"--n-th-color-modal":s,"--n-th-color-popover":f,"--n-td-color":u,"--n-td-color-modal":p,"--n-td-color-popover":r,"--n-border-radius":j,"--n-border-color":v,"--n-border-color-modal":T,"--n-border-color-popover":$}}),a=l?F("descriptions",P(()=>{let m="";const{size:C,bordered:y}=o;return y&&(m+="a"),m+=C[0],m}),i,o):void 0;return{mergedClsPrefix:e,cssVars:l?void 0:i,themeClass:a==null?void 0:a.themeClass,onRender:a==null?void 0:a.onRender,compitableColumn:Y(o,["columns","column"]),inlineThemeDisabled:l}},render(){const o=this.$slots.default,e=o?J(o()):[];e.length;const{contentClass:l,labelClass:d,compitableColumn:i,labelPlacement:a,labelAlign:m,size:C,bordered:y,title:w,cssVars:L,mergedClsPrefix:s,separator:f,onRender:n}=this;n==null||n();const h=e.filter(r=>de(r)),b={span:0,row:[],secondRow:[],rows:[]},p=h.reduce((r,v,T)=>{const $=v.props||{},j=h.length-1===T,S=["label"in $?$.label:D(v,"label")],z=[D(v)],x=$.span||1,R=r.span;r.span+=x;const I=$.labelStyle||$["label-style"]||this.labelStyle,N=$.contentStyle||$["content-style"]||this.contentStyle;if(a==="left")y?r.row.push(c("th",{class:[`${s}-descriptions-table-header`,d],colspan:1,style:I},S),c("td",{class:[`${s}-descriptions-table-content`,l],colspan:j?(i-R)*2+1:x*2-1,style:N},z)):r.row.push(c("td",{class:`${s}-descriptions-table-content`,colspan:j?(i-R)*2:x*2},c("span",{class:[`${s}-descriptions-table-content__label`,d],style:I},[...S,f&&c("span",{class:`${s}-descriptions-separator`},f)]),c("span",{class:[`${s}-descriptions-table-content__content`,l],style:N},z)));else{const A=j?(i-R)*2:x*2;r.row.push(c("th",{class:[`${s}-descriptions-table-header`,d],colspan:A,style:I},S)),r.secondRow.push(c("td",{class:[`${s}-descriptions-table-content`,l],colspan:A,style:N},z))}return(r.span>=i||j)&&(r.span=0,r.row.length&&(r.rows.push(r.row),r.row=[]),a!=="left"&&r.secondRow.length&&(r.rows.push(r.secondRow),r.secondRow=[])),r},b).rows.map(r=>c("tr",{class:`${s}-descriptions-table-row`},r));return c("div",{style:L,class:[`${s}-descriptions`,this.themeClass,`${s}-descriptions--${a}-label-placement`,`${s}-descriptions--${m}-label-align`,`${s}-descriptions--${C}-size`,y&&`${s}-descriptions--bordered`]},w||this.$slots.header?c("div",{class:`${s}-descriptions-header`},w||re(this,"header")):null,c("div",{class:`${s}-descriptions-table-wrapper`},c("table",{class:`${s}-descriptions-table`},c("tbody",null,a==="top"&&c("tr",{class:`${s}-descriptions-table-row`,style:{visibility:"collapse"}},X(i*2,c("td",null))),p))))}}),be={label:String,span:{type:Number,default:1},labelClass:String,labelStyle:[Object,String],contentClass:String,contentStyle:[Object,String]},ve=E({name:"DescriptionsItem",[W]:!0,props:be,slots:Object,render(){return null}});export{me as N,fe as a,ve as b,se as c,ae as d,be as e,he as f,ne as u};
