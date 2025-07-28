/*! For license information please see room-card-minimalist.js.LICENSE.txt */
(()=>{"use strict";const t=globalThis,e=t.ShadowRoot&&(void 0===t.ShadyCSS||t.ShadyCSS.nativeShadow)&&"adoptedStyleSheets"in Document.prototype&&"replace"in CSSStyleSheet.prototype,o=Symbol(),i=new WeakMap;class s{constructor(t,e,i){if(this._$cssResult$=!0,i!==o)throw Error("CSSResult is not constructable. Use `unsafeCSS` or `css` instead.");this.cssText=t,this.t=e}get styleSheet(){let t=this.o;const o=this.t;if(e&&void 0===t){const e=void 0!==o&&1===o.length;e&&(t=i.get(o)),void 0===t&&((this.o=t=new CSSStyleSheet).replaceSync(this.cssText),e&&i.set(o,t))}return t}toString(){return this.cssText}}const r=(t,...e)=>{const i=1===t.length?t[0]:e.reduce((e,o,i)=>e+(t=>{if(!0===t._$cssResult$)return t.cssText;if("number"==typeof t)return t;throw Error("Value passed to 'css' function must be a 'css' function result: "+t+". Use 'unsafeCSS' to pass non-literal values, but take care to ensure page security.")})(o)+t[i+1],t[0]);return new s(i,t,o)},n=(o,i)=>{if(e)o.adoptedStyleSheets=i.map(t=>t instanceof CSSStyleSheet?t:t.styleSheet);else for(const e of i){const i=document.createElement("style"),s=t.litNonce;void 0!==s&&i.setAttribute("nonce",s),i.textContent=e.cssText,o.appendChild(i)}},a=e?t=>t:t=>t instanceof CSSStyleSheet?(t=>{let e="";for(const o of t.cssRules)e+=o.cssText;return(t=>new s("string"==typeof t?t:t+"",void 0,o))(e)})(t):t,{is:l,defineProperty:c,getOwnPropertyDescriptor:h,getOwnPropertyNames:d,getOwnPropertySymbols:p,getPrototypeOf:_}=Object,u=globalThis,m=u.trustedTypes,g=m?m.emptyScript:"",f=u.reactiveElementPolyfillSupport,b=(t,e)=>t,y={toAttribute(t,e){switch(e){case Boolean:t=t?g:null;break;case Object:case Array:t=null==t?t:JSON.stringify(t)}return t},fromAttribute(t,e){let o=t;switch(e){case Boolean:o=null!==t;break;case Number:o=null===t?null:Number(t);break;case Object:case Array:try{o=JSON.parse(t)}catch(t){o=null}}return o}},v=(t,e)=>!l(t,e),$={attribute:!0,type:String,converter:y,reflect:!1,useDefault:!1,hasChanged:v};Symbol.metadata??=Symbol("metadata"),u.litPropertyMetadata??=new WeakMap;class x extends HTMLElement{static addInitializer(t){this._$Ei(),(this.l??=[]).push(t)}static get observedAttributes(){return this.finalize(),this._$Eh&&[...this._$Eh.keys()]}static createProperty(t,e=$){if(e.state&&(e.attribute=!1),this._$Ei(),this.prototype.hasOwnProperty(t)&&((e=Object.create(e)).wrapped=!0),this.elementProperties.set(t,e),!e.noAccessor){const o=Symbol(),i=this.getPropertyDescriptor(t,o,e);void 0!==i&&c(this.prototype,t,i)}}static getPropertyDescriptor(t,e,o){const{get:i,set:s}=h(this.prototype,t)??{get(){return this[e]},set(t){this[e]=t}};return{get:i,set(e){const r=i?.call(this);s?.call(this,e),this.requestUpdate(t,r,o)},configurable:!0,enumerable:!0}}static getPropertyOptions(t){return this.elementProperties.get(t)??$}static _$Ei(){if(this.hasOwnProperty(b("elementProperties")))return;const t=_(this);t.finalize(),void 0!==t.l&&(this.l=[...t.l]),this.elementProperties=new Map(t.elementProperties)}static finalize(){if(this.hasOwnProperty(b("finalized")))return;if(this.finalized=!0,this._$Ei(),this.hasOwnProperty(b("properties"))){const t=this.properties,e=[...d(t),...p(t)];for(const o of e)this.createProperty(o,t[o])}const t=this[Symbol.metadata];if(null!==t){const e=litPropertyMetadata.get(t);if(void 0!==e)for(const[t,o]of e)this.elementProperties.set(t,o)}this._$Eh=new Map;for(const[t,e]of this.elementProperties){const o=this._$Eu(t,e);void 0!==o&&this._$Eh.set(o,t)}this.elementStyles=this.finalizeStyles(this.styles)}static finalizeStyles(t){const e=[];if(Array.isArray(t)){const o=new Set(t.flat(1/0).reverse());for(const t of o)e.unshift(a(t))}else void 0!==t&&e.push(a(t));return e}static _$Eu(t,e){const o=e.attribute;return!1===o?void 0:"string"==typeof o?o:"string"==typeof t?t.toLowerCase():void 0}constructor(){super(),this._$Ep=void 0,this.isUpdatePending=!1,this.hasUpdated=!1,this._$Em=null,this._$Ev()}_$Ev(){this._$ES=new Promise(t=>this.enableUpdating=t),this._$AL=new Map,this._$E_(),this.requestUpdate(),this.constructor.l?.forEach(t=>t(this))}addController(t){(this._$EO??=new Set).add(t),void 0!==this.renderRoot&&this.isConnected&&t.hostConnected?.()}removeController(t){this._$EO?.delete(t)}_$E_(){const t=new Map,e=this.constructor.elementProperties;for(const o of e.keys())this.hasOwnProperty(o)&&(t.set(o,this[o]),delete this[o]);t.size>0&&(this._$Ep=t)}createRenderRoot(){const t=this.shadowRoot??this.attachShadow(this.constructor.shadowRootOptions);return n(t,this.constructor.elementStyles),t}connectedCallback(){this.renderRoot??=this.createRenderRoot(),this.enableUpdating(!0),this._$EO?.forEach(t=>t.hostConnected?.())}enableUpdating(t){}disconnectedCallback(){this._$EO?.forEach(t=>t.hostDisconnected?.())}attributeChangedCallback(t,e,o){this._$AK(t,o)}_$ET(t,e){const o=this.constructor.elementProperties.get(t),i=this.constructor._$Eu(t,o);if(void 0!==i&&!0===o.reflect){const s=(void 0!==o.converter?.toAttribute?o.converter:y).toAttribute(e,o.type);this._$Em=t,null==s?this.removeAttribute(i):this.setAttribute(i,s),this._$Em=null}}_$AK(t,e){const o=this.constructor,i=o._$Eh.get(t);if(void 0!==i&&this._$Em!==i){const t=o.getPropertyOptions(i),s="function"==typeof t.converter?{fromAttribute:t.converter}:void 0!==t.converter?.fromAttribute?t.converter:y;this._$Em=i;const r=s.fromAttribute(e,t.type);this[i]=r??this._$Ej?.get(i)??r,this._$Em=null}}requestUpdate(t,e,o){if(void 0!==t){const i=this.constructor,s=this[t];if(o??=i.getPropertyOptions(t),!((o.hasChanged??v)(s,e)||o.useDefault&&o.reflect&&s===this._$Ej?.get(t)&&!this.hasAttribute(i._$Eu(t,o))))return;this.C(t,e,o)}!1===this.isUpdatePending&&(this._$ES=this._$EP())}C(t,e,{useDefault:o,reflect:i,wrapped:s},r){o&&!(this._$Ej??=new Map).has(t)&&(this._$Ej.set(t,r??e??this[t]),!0!==s||void 0!==r)||(this._$AL.has(t)||(this.hasUpdated||o||(e=void 0),this._$AL.set(t,e)),!0===i&&this._$Em!==t&&(this._$Eq??=new Set).add(t))}async _$EP(){this.isUpdatePending=!0;try{await this._$ES}catch(t){Promise.reject(t)}const t=this.scheduleUpdate();return null!=t&&await t,!this.isUpdatePending}scheduleUpdate(){return this.performUpdate()}performUpdate(){if(!this.isUpdatePending)return;if(!this.hasUpdated){if(this.renderRoot??=this.createRenderRoot(),this._$Ep){for(const[t,e]of this._$Ep)this[t]=e;this._$Ep=void 0}const t=this.constructor.elementProperties;if(t.size>0)for(const[e,o]of t){const{wrapped:t}=o,i=this[e];!0!==t||this._$AL.has(e)||void 0===i||this.C(e,void 0,o,i)}}let t=!1;const e=this._$AL;try{t=this.shouldUpdate(e),t?(this.willUpdate(e),this._$EO?.forEach(t=>t.hostUpdate?.()),this.update(e)):this._$EM()}catch(e){throw t=!1,this._$EM(),e}t&&this._$AE(e)}willUpdate(t){}_$AE(t){this._$EO?.forEach(t=>t.hostUpdated?.()),this.hasUpdated||(this.hasUpdated=!0,this.firstUpdated(t)),this.updated(t)}_$EM(){this._$AL=new Map,this.isUpdatePending=!1}get updateComplete(){return this.getUpdateComplete()}getUpdateComplete(){return this._$ES}shouldUpdate(t){return!0}update(t){this._$Eq&&=this._$Eq.forEach(t=>this._$ET(t,this[t])),this._$EM()}updated(t){}firstUpdated(t){}}x.elementStyles=[],x.shadowRootOptions={mode:"open"},x[b("elementProperties")]=new Map,x[b("finalized")]=new Map,f?.({ReactiveElement:x}),(u.reactiveElementVersions??=[]).push("2.1.1");const w=globalThis,A=w.trustedTypes,E=A?A.createPolicy("lit-html",{createHTML:t=>t}):void 0,C="$lit$",k=`lit$${Math.random().toFixed(9).slice(2)}$`,S="?"+k,T=`<${S}>`,H=document,M=()=>H.createComment(""),R=t=>null===t||"object"!=typeof t&&"function"!=typeof t,P=Array.isArray,O="[ \t\n\f\r]",z=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,U=/-->/g,I=/>/g,N=RegExp(`>|${O}(?:([^\\s"'>=/]+)(${O}*=${O}*(?:[^ \t\n\f\r"'\`<>=]|("|')|))|$)`,"g"),L=/'/g,D=/"/g,j=/^(?:script|style|textarea|title)$/i,B=t=>(e,...o)=>({_$litType$:t,strings:e,values:o}),V=B(1),q=(B(2),B(3),Symbol.for("lit-noChange")),W=Symbol.for("lit-nothing"),F=new WeakMap,K=H.createTreeWalker(H,129);function Y(t,e){if(!P(t)||!t.hasOwnProperty("raw"))throw Error("invalid template strings array");return void 0!==E?E.createHTML(e):e}const G=(t,e)=>{const o=t.length-1,i=[];let s,r=2===e?"<svg>":3===e?"<math>":"",n=z;for(let e=0;e<o;e++){const o=t[e];let a,l,c=-1,h=0;for(;h<o.length&&(n.lastIndex=h,l=n.exec(o),null!==l);)h=n.lastIndex,n===z?"!--"===l[1]?n=U:void 0!==l[1]?n=I:void 0!==l[2]?(j.test(l[2])&&(s=RegExp("</"+l[2],"g")),n=N):void 0!==l[3]&&(n=N):n===N?">"===l[0]?(n=s??z,c=-1):void 0===l[1]?c=-2:(c=n.lastIndex-l[2].length,a=l[1],n=void 0===l[3]?N:'"'===l[3]?D:L):n===D||n===L?n=N:n===U||n===I?n=z:(n=N,s=void 0);const d=n===N&&t[e+1].startsWith("/>")?" ":"";r+=n===z?o+T:c>=0?(i.push(a),o.slice(0,c)+C+o.slice(c)+k+d):o+k+(-2===c?e:d)}return[Y(t,r+(t[o]||"<?>")+(2===e?"</svg>":3===e?"</math>":"")),i]};class J{constructor({strings:t,_$litType$:e},o){let i;this.parts=[];let s=0,r=0;const n=t.length-1,a=this.parts,[l,c]=G(t,e);if(this.el=J.createElement(l,o),K.currentNode=this.el.content,2===e||3===e){const t=this.el.content.firstChild;t.replaceWith(...t.childNodes)}for(;null!==(i=K.nextNode())&&a.length<n;){if(1===i.nodeType){if(i.hasAttributes())for(const t of i.getAttributeNames())if(t.endsWith(C)){const e=c[r++],o=i.getAttribute(t).split(k),n=/([.?@])?(.*)/.exec(e);a.push({type:1,index:s,name:n[2],strings:o,ctor:"."===n[1]?et:"?"===n[1]?ot:"@"===n[1]?it:tt}),i.removeAttribute(t)}else t.startsWith(k)&&(a.push({type:6,index:s}),i.removeAttribute(t));if(j.test(i.tagName)){const t=i.textContent.split(k),e=t.length-1;if(e>0){i.textContent=A?A.emptyScript:"";for(let o=0;o<e;o++)i.append(t[o],M()),K.nextNode(),a.push({type:2,index:++s});i.append(t[e],M())}}}else if(8===i.nodeType)if(i.data===S)a.push({type:2,index:s});else{let t=-1;for(;-1!==(t=i.data.indexOf(k,t+1));)a.push({type:7,index:s}),t+=k.length-1}s++}}static createElement(t,e){const o=H.createElement("template");return o.innerHTML=t,o}}function Z(t,e,o=t,i){if(e===q)return e;let s=void 0!==i?o._$Co?.[i]:o._$Cl;const r=R(e)?void 0:e._$litDirective$;return s?.constructor!==r&&(s?._$AO?.(!1),void 0===r?s=void 0:(s=new r(t),s._$AT(t,o,i)),void 0!==i?(o._$Co??=[])[i]=s:o._$Cl=s),void 0!==s&&(e=Z(t,s._$AS(t,e.values),s,i)),e}class Q{constructor(t,e){this._$AV=[],this._$AN=void 0,this._$AD=t,this._$AM=e}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}u(t){const{el:{content:e},parts:o}=this._$AD,i=(t?.creationScope??H).importNode(e,!0);K.currentNode=i;let s=K.nextNode(),r=0,n=0,a=o[0];for(;void 0!==a;){if(r===a.index){let e;2===a.type?e=new X(s,s.nextSibling,this,t):1===a.type?e=new a.ctor(s,a.name,a.strings,this,t):6===a.type&&(e=new st(s,this,t)),this._$AV.push(e),a=o[++n]}r!==a?.index&&(s=K.nextNode(),r++)}return K.currentNode=H,i}p(t){let e=0;for(const o of this._$AV)void 0!==o&&(void 0!==o.strings?(o._$AI(t,o,e),e+=o.strings.length-2):o._$AI(t[e])),e++}}class X{get _$AU(){return this._$AM?._$AU??this._$Cv}constructor(t,e,o,i){this.type=2,this._$AH=W,this._$AN=void 0,this._$AA=t,this._$AB=e,this._$AM=o,this.options=i,this._$Cv=i?.isConnected??!0}get parentNode(){let t=this._$AA.parentNode;const e=this._$AM;return void 0!==e&&11===t?.nodeType&&(t=e.parentNode),t}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(t,e=this){t=Z(this,t,e),R(t)?t===W||null==t||""===t?(this._$AH!==W&&this._$AR(),this._$AH=W):t!==this._$AH&&t!==q&&this._(t):void 0!==t._$litType$?this.$(t):void 0!==t.nodeType?this.T(t):(t=>P(t)||"function"==typeof t?.[Symbol.iterator])(t)?this.k(t):this._(t)}O(t){return this._$AA.parentNode.insertBefore(t,this._$AB)}T(t){this._$AH!==t&&(this._$AR(),this._$AH=this.O(t))}_(t){this._$AH!==W&&R(this._$AH)?this._$AA.nextSibling.data=t:this.T(H.createTextNode(t)),this._$AH=t}$(t){const{values:e,_$litType$:o}=t,i="number"==typeof o?this._$AC(t):(void 0===o.el&&(o.el=J.createElement(Y(o.h,o.h[0]),this.options)),o);if(this._$AH?._$AD===i)this._$AH.p(e);else{const t=new Q(i,this),o=t.u(this.options);t.p(e),this.T(o),this._$AH=t}}_$AC(t){let e=F.get(t.strings);return void 0===e&&F.set(t.strings,e=new J(t)),e}k(t){P(this._$AH)||(this._$AH=[],this._$AR());const e=this._$AH;let o,i=0;for(const s of t)i===e.length?e.push(o=new X(this.O(M()),this.O(M()),this,this.options)):o=e[i],o._$AI(s),i++;i<e.length&&(this._$AR(o&&o._$AB.nextSibling,i),e.length=i)}_$AR(t=this._$AA.nextSibling,e){for(this._$AP?.(!1,!0,e);t!==this._$AB;){const e=t.nextSibling;t.remove(),t=e}}setConnected(t){void 0===this._$AM&&(this._$Cv=t,this._$AP?.(t))}}class tt{get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}constructor(t,e,o,i,s){this.type=1,this._$AH=W,this._$AN=void 0,this.element=t,this.name=e,this._$AM=i,this.options=s,o.length>2||""!==o[0]||""!==o[1]?(this._$AH=Array(o.length-1).fill(new String),this.strings=o):this._$AH=W}_$AI(t,e=this,o,i){const s=this.strings;let r=!1;if(void 0===s)t=Z(this,t,e,0),r=!R(t)||t!==this._$AH&&t!==q,r&&(this._$AH=t);else{const i=t;let n,a;for(t=s[0],n=0;n<s.length-1;n++)a=Z(this,i[o+n],e,n),a===q&&(a=this._$AH[n]),r||=!R(a)||a!==this._$AH[n],a===W?t=W:t!==W&&(t+=(a??"")+s[n+1]),this._$AH[n]=a}r&&!i&&this.j(t)}j(t){t===W?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,t??"")}}class et extends tt{constructor(){super(...arguments),this.type=3}j(t){this.element[this.name]=t===W?void 0:t}}class ot extends tt{constructor(){super(...arguments),this.type=4}j(t){this.element.toggleAttribute(this.name,!!t&&t!==W)}}class it extends tt{constructor(t,e,o,i,s){super(t,e,o,i,s),this.type=5}_$AI(t,e=this){if((t=Z(this,t,e,0)??W)===q)return;const o=this._$AH,i=t===W&&o!==W||t.capture!==o.capture||t.once!==o.once||t.passive!==o.passive,s=t!==W&&(o===W||i);i&&this.element.removeEventListener(this.name,this,o),s&&this.element.addEventListener(this.name,this,t),this._$AH=t}handleEvent(t){"function"==typeof this._$AH?this._$AH.call(this.options?.host??this.element,t):this._$AH.handleEvent(t)}}class st{constructor(t,e,o){this.element=t,this.type=6,this._$AN=void 0,this._$AM=e,this.options=o}get _$AU(){return this._$AM._$AU}_$AI(t){Z(this,t)}}const rt=w.litHtmlPolyfillSupport;rt?.(J,X),(w.litHtmlVersions??=[]).push("3.3.1");const nt=globalThis;class at extends x{constructor(){super(...arguments),this.renderOptions={host:this},this._$Do=void 0}createRenderRoot(){const t=super.createRenderRoot();return this.renderOptions.renderBefore??=t.firstChild,t}update(t){const e=this.render();this.hasUpdated||(this.renderOptions.isConnected=this.isConnected),super.update(t),this._$Do=((t,e,o)=>{const i=o?.renderBefore??e;let s=i._$litPart$;if(void 0===s){const t=o?.renderBefore??null;i._$litPart$=s=new X(e.insertBefore(M(),t),t,void 0,o??{})}return s._$AI(t),s})(e,this.renderRoot,this.renderOptions)}connectedCallback(){super.connectedCallback(),this._$Do?.setConnected(!0)}disconnectedCallback(){super.disconnectedCallback(),this._$Do?.setConnected(!1)}render(){return q}}at._$litElement$=!0,at.finalized=!0,nt.litElementHydrateSupport?.({LitElement:at});const lt=nt.litElementPolyfillSupport;lt?.({LitElement:at}),(nt.litElementVersions??=[]).push("4.2.1");const ct=[{label:"Blue",value:"blue"},{label:"Light Blue",value:"lightblue"},{label:"Red",value:"red"},{label:"Green",value:"green"},{label:"Light Green",value:"lightgreen"},{label:"Yellow",value:"yellow"},{label:"Purple",value:"purple"},{label:"Orange",value:"orange"},{label:"Pink",value:"pink"},{label:"Grey",value:"grey"},{label:"Teal",value:"teal"},{label:"Indigo",value:"indigo"}];customElements.define("room-card-minimalist-editor",class extends at{setConfig(t){this._config=t,this._currentTab=0}static get properties(){return{hass:{attribute:!1},_config:{state:!0}}}_deleteStateEntity(t){this._config&&(this._config.entities.splice(t,1),this.dispatchEvent(new CustomEvent("config-changed",{detail:{config:this._config}})))}_moveStateEntity(t,e){this._config&&([this._config.entities[t],this._config.entities[t+e]]=[this._config.entities[t+e],this._config.entities[t]],this.dispatchEvent(new CustomEvent("config-changed",{detail:{config:this._config}})))}_addEntityState(){this._config&&(this._config.entities.push({type:"template"}),this.dispatchEvent(new CustomEvent("config-changed",{detail:{config:this._config}})))}_valueChanged(t){if(!this._config||!this.hass)return;const e=new CustomEvent("config-changed",{detail:{config:t.detail.value},bubbles:!0,composed:!0});this.dispatchEvent(e)}_valueChangedEntity(t,e){if(!this._config||!this.hass)return;const o=[...this._config.entities];o[t]=e.detail.value,this._config.entities=o;const i=new CustomEvent("config-changed",{detail:{config:this._config},bubbles:!0,composed:!0});this.dispatchEvent(i)}_getEntitySchema(t){let e=[{name:"type",label:"State Type",selector:{select:{multiple:!1,mode:"dropdown",options:[{label:"Entity",value:"entity"},{label:"Template",value:"template"}]}}},{type:"grid",name:"",schema:[{name:"icon",label:"Icon On",required:!0,selector:{icon:{}},context:{icon_entity:"entity"}},{name:"icon_off",label:"Icon Off",selector:{icon:{}},context:{icon_entity:"entity"}}]},..."entity"===t.type&&this._isClimateEntity(t)?[]:[{type:"grid",name:"",schema:[{name:"color_on",label:"Color On",selector:{text:{}}},{name:"color_off",label:"Color Off",selector:{text:{}}}]},{type:"grid",name:"",schema:[{name:"template_on",label:"Template On",selector:{select:{multiple:!1,mode:"dropdown",options:ct}}},{name:"template_off",label:"Template Off",selector:{select:{multiple:!1,mode:"dropdown",options:ct}}}]},{type:"grid",name:"",schema:[{name:"background_color_on",label:"Background Color On",selector:{text:{}}},{name:"background_color_off",label:"Background Color Off",selector:{text:{}}}]}],{type:"grid",name:"",schema:[{name:"tap_action",label:"Tap Action",selector:{"ui-action":{}}},{name:"hold_action",label:"Hold Action",selector:{"ui-action":{}}}]},...this._isLightEntity(t)?[{name:"use_light_color",label:"Use Light Color as icon and background color",selector:{boolean:{}}}]:[]];const o=[{name:"entity",label:"Entity",required:!0,selector:{entity:{}}},...this._isClimateEntity(t)?this._getClimateEntitySchema(t):[{name:"on_state",label:"On State",required:!0,selector:{text:{}}}]];return"template"===t.type&&e.push({name:"condition",label:"Template Condition",required:!0,selector:{template:{}}}),"entity"===t.type&&e.push(...o),[{type:"expandable",expanded:"template"==t.type&&null==t.condition||"entity"==t.type&&null==t.entity,name:"",title:`State: ${t.type}`,schema:e}]}_renderEntities(){return void 0===this._config.entities&&(this._config.entities=[]),V`
			${this._config.entities?.map((t,e)=>V`
					<div class="box">
						<div class="toolbar">
							<mwc-icon-button
								.disabled=${0===e}
								@click=${()=>this._moveStateEntity(e,-1)}
							>
								<ha-icon .icon=${"mdi:arrow-up"}></ha-icon>
							</mwc-icon-button>
							<mwc-icon-button
								.disabled=${e===this._config.entities.length-1}
								@click=${()=>this._moveStateEntity(e,1)}
							>
								<ha-icon .icon=${"mdi:arrow-down"}></ha-icon>
							</mwc-icon-button>
							<mwc-icon-button @click=${()=>this._deleteStateEntity(e)}>
								<ha-icon .icon=${"mdi:close"}></ha-icon>
							</mwc-icon-button>

							<ha-form
								.hass=${this.hass}
								.schema=${this._getEntitySchema(t)}
								.data=${t}
								.computeLabel=${t=>t.label??t.name}
								@value-changed=${t=>this._valueChangedEntity(e,t)}
							></ha-form>
						</div>
					</div>
				`)}
		`}render(){return V`
			<ha-form
				.hass=${this.hass}
				.data=${this._config}
				.schema=${[{name:"name",label:"Name",required:!0,selector:{text:{}}},{name:"icon",label:"Icon",required:!0,selector:{icon:{}},context:{icon_entity:"entity"}},{name:"card_template",label:"Card Color Template",selector:{select:{multiple:!1,mode:"dropdown",options:ct}}},{name:"tap_action",label:"Tap Action",selector:{"ui-action":{}}},{name:"hold_action",label:"Hold Action",selector:{"ui-action":{}}},{name:"icon_color",label:"Icon Color - gets overwritten when using card color template",selector:{template:{}}},{name:"secondary",label:"Secondary Info",selector:{template:{}}},{name:"secondary_color",label:"Secondary Info Color",selector:{template:{}}},{name:"show_background_circle",label:"Show Background Circle behind card icon",selector:{boolean:!0}},{name:"background_circle_color",label:"Background Circle Color - empty for template color",selector:{template:{}}},{name:"entities_reverse_order",label:"Entities from bottom to top",selector:{boolean:{}}},{name:"use_template_color_for_title",label:"Use template color for Name",selector:{boolean:{}}},{name:"use_template_color_for_secondary",label:"Use template color for secondary info",selector:{boolean:{}}}]}
				.computeLabel=${t=>t.label??t.name}
				@value-changed=${this._valueChanged}
			></ha-form>

			<div style="display: flex;justify-content: space-between; margin-top: 20px;">
				<p>States</p>
				<mwc-button style="margin-top: 5px;" @click=${this._addEntityState}>
					<ha-icon .icon=${"mdi:plus"}></ha-icon>Add State
				</mwc-button>
			</div>

			${this._renderEntities()}
		`}_isLightEntity(t){return!(!t||!t.entity)&&(!!t.entity.startsWith("light.")||!!(this.hass&&this.hass.states&&this.hass.states[t.entity])&&this.hass.states[t.entity].entity_id.startsWith("light."))}_isClimateEntity(t){return!(!t||!t.entity)&&(!!t.entity.startsWith("climate.")||!!(this.hass&&this.hass.states&&this.hass.states[t.entity])&&this.hass.states[t.entity].entity_id.startsWith("climate."))}_getClimateHvacModes(t){if(!this._isClimateEntity(t)||!this.hass||!this.hass.states)return[];const e=this.hass.states[t.entity];return e&&e.attributes&&e.attributes.hvac_modes?e.attributes.hvac_modes:[]}_getClimateEntitySchema(t){const e=this._getClimateHvacModes(t);if(0===e.length)return[{name:"on_state",label:"On State",required:!0,selector:{text:{}}}];const o=[];return e.forEach(t=>{const e=t.charAt(0).toUpperCase()+t.slice(1).replace("_"," ");o.push({type:"expandable",expanded:!1,name:"",title:`${e} Mode`,schema:[{type:"grid",name:"",schema:[{name:`color_${t}`,label:`Color for ${e}`,selector:{text:{}}},{name:`background_color_${t}`,label:`Background Color for ${e}`,selector:{text:{}}}]},{type:"grid",name:"",schema:[{name:`template_${t}`,label:`Template for ${e}`,selector:{select:{multiple:!1,mode:"dropdown",options:ct}}}]}]})}),o}}),window.customCards=window.customCards||[],window.customCards.push({type:"room-card-minimalist",name:"Room Card Minimalist",preview:!0,description:"Display the state of a room at a glance - in UI Lovelace Minimalist style",documentationURL:"https://github.com/unbekannt3/room-card-minimalist"});const ht={blue:{icon_color:"rgba(var(--color-blue, 61, 90, 254),1)",background_color:"rgba(var(--color-blue, 61, 90, 254), 0.2)",text_color:"rgba(var(--color-blue-text, 61, 90, 254),1)"},lightblue:{icon_color:"rgba(var(--color-lightblue, 3, 169, 244),1)",background_color:"rgba(var(--color-lightblue, 3, 169, 244), 0.2)",text_color:"rgba(var(--color-lightblue-text, 3, 169, 244),1)"},red:{icon_color:"rgba(var(--color-red, 245, 68, 54),1)",background_color:"rgba(var(--color-red, 245, 68, 54), 0.2)",text_color:"rgba(var(--color-red-text, 245, 68, 54),1)"},green:{icon_color:"rgba(var(--color-green, 1, 200, 82),1)",background_color:"rgba(var(--color-green, 1, 200, 82), 0.2)",text_color:"rgba(var(--color-green-text, 1, 200, 82),1)"},lightgreen:{icon_color:"rgba(var(--color-lightgreen, 139, 195, 74),1)",background_color:"rgba(var(--color-lightgreen, 139, 195, 74), 0.2)",text_color:"rgba(var(--color-lightgreen-text, 139, 195, 74),1)"},yellow:{icon_color:"rgba(var(--color-yellow, 255, 145, 1),1)",background_color:"rgba(var(--color-yellow, 255, 145, 1), 0.2)",text_color:"rgba(var(--color-yellow-text, 255, 145, 1),1)"},purple:{icon_color:"rgba(var(--color-purple, 102, 31, 255),1)",background_color:"rgba(var(--color-purple, 102, 31, 255), 0.2)",text_color:"rgba(var(--color-purple-text, 102, 31, 255),1)"},orange:{icon_color:"rgba(var(--color-orange, 255, 87, 34),1)",background_color:"rgba(var(--color-orange, 255, 87, 34), 0.2)",text_color:"rgba(var(--color-orange-text, 255, 87, 34),1)"},pink:{icon_color:"rgba(var(--color-pink, 233, 30, 99),1)",background_color:"rgba(var(--color-pink, 233, 30, 99), 0.2)",text_color:"rgba(var(--color-pink-text, 233, 30, 99),1)"},grey:{icon_color:"rgba(var(--color-grey, 158, 158, 158),1)",background_color:"rgba(var(--color-grey, 158, 158, 158), 0.2)",text_color:"rgba(var(--color-grey-text, 158, 158, 158),1)"},teal:{icon_color:"rgba(var(--color-teal, 0, 150, 136),1)",background_color:"rgba(var(--color-teal, 0, 150, 136), 0.2)",text_color:"rgba(var(--color-teal-text, 0, 150, 136),1)"},indigo:{icon_color:"rgba(var(--color-indigo, 63, 81, 181),1)",background_color:"rgba(var(--color-indigo, 63, 81, 181), 0.2)",text_color:"rgba(var(--color-indigo-text, 63, 81, 181),1)"}};customElements.define("room-card-minimalist",class extends at{getCardSize(){return 2}static get properties(){return{hass:{attribute:!1},_config:{state:!0},_templateResults:{state:!0},_unsubRenderTemplates:{state:!0}}}constructor(){super(),this._templateResults={},this._unsubRenderTemplates=new Map,this._holdTimeout=null,this._holdFired=!1}setConfig(t){if(this._tryDisconnect(),!t.name)throw new Error("You need to define a name for the room");if(!t.icon)throw new Error("You need to define an Icon for the room");this._config={secondary:"",secondary_color:"var(--secondary-text-color)",entities:[],show_background_circle:!0,background_circle_color:"var(--accent-color)",entities_reverse_order:!1,use_template_color_for_title:!1,use_template_color_for_secondary:!1,...t}}updated(t){super.updated(t),this._config&&this.hass&&this._tryConnect(this._config.secondary)}connectedCallback(){super.connectedCallback(),this._tryConnect(this._config.secondary)}disconnectedCallback(){this._tryDisconnect()}static getConfigElement(){return document.createElement("room-card-minimalist-editor")}static getStubConfig(){return{name:"Living Room",icon:"mdi:sofa",card_template:"blue_no_state",secondary:"22.5°C",entities:[{type:"template",icon:"mdi:ceiling-light",icon_off:"mdi:ceiling-light-outline",condition:"Lights On",template_on:"yellow"},{type:"template",icon:"mdi:motion-sensor",icon_off:"mdi:motion-sensor-off",condition:"Motion",template_on:"green"},{type:"template",icon:"mdi:radiator",icon_off:"mdi:radiator-disabled",condition:"",template_off:"red"}]}}_applyCardTemplate(){if(this._config.card_template&&ht[this._config.card_template]){const t=ht[this._config.card_template];return{background_circle_color:t.background_color,icon_color:t.icon_color,text_color:t.text_color}}return{background_circle_color:this._config.background_circle_color||"var(--accent-color)",icon_color:this._config.icon_color||"rgb(var(--rgb-white))",text_color:"var(--primary-text-color)"}}render(){const t=this._getValueRawOrTemplate(this._config.secondary),e=this._getValueRawOrTemplate(this._config.secondary_color);let o=this._config.entities.slice(0,4);this._config.entities_reverse_order&&(o=[...o].reverse());const{background_circle_color:i,icon_color:s,text_color:r}=this._applyCardTemplate(),n=this._config.use_template_color_for_title?this._getValueRawOrTemplate(r):"var(--primary-text-color)",a=this._config.use_template_color_for_secondary?this._getValueRawOrTemplate(r):e;return V`
			<ha-card
				@click=${t=>this._handleCardClick(t)}
				@mousedown=${t=>this._handleCardMouseDown(t)}
				@mouseup=${t=>this._handleCardMouseUp(t)}
				@mouseleave=${t=>this._handleCardMouseLeave(t)}
				@touchstart=${t=>this._handleCardTouchStart(t)}
				@touchend=${t=>this._handleCardTouchEnd(t)}
				@contextmenu=${t=>this._handleCardContextMenu(t)}
				.config=${this._config}
				tabindex="0"
			>
				<div class="container">
					<div class="content-main">
						<div class="text-content">
							<span class="primary" style="color: ${n}"
								>${this._config.name}</span
							>
							${t?V`<span
										class="secondary"
										style="color: ${a}"
										>${t}</span
								  >`:""}
						</div>

						<div class="icon-container">
							${!1!==this._config.show_background_circle?V`
										<div
											class="icon-background"
											style="background-color: ${this._getValueRawOrTemplate(i)}"
										></div>
								  `:""}
							<div
								class="icon"
								style="--icon-color: ${this._getValueRawOrTemplate(s)};"
							>
								<ha-icon .icon=${this._config.icon} />
							</div>
						</div>
					</div>

					<div class="content-right">
						<div
							class="states ${this._config.entities_reverse_order?"reverse-order":""}"
						>
							${o.map(t=>this._getItemHTML(t))}
						</div>
					</div>
				</div>
			</ha-card>
		`}_isClimateEntity(t){return t&&t.startsWith("climate.")}_applyTemplates(t,e,o=null){if(this._isClimateEntity(t.entity)&&o){const e=t[`template_${o}`],i=t[`color_${o}`],s=t[`background_color_${o}`];let r={icon_color:"var(--primary-text-color)",background_color:"var(--secondary-background-color)",text_color:"var(--primary-text-color)"};return e&&ht[e]&&(r={...r,...ht[e]}),i&&(r.icon_color=i),s&&(r.background_color=s),r}const i="on"===e?t.template_on||t.templates_on:t.template_off||t.templates_off;let s={icon_color:"var(--primary-text-color)",background_color:"var(--secondary-background-color)",text_color:"var(--primary-text-color)"};return i&&(Array.isArray(i)?i:[i]).forEach(t=>{ht[t]&&(s={...s,...ht[t]})}),"on"===e?(t.color_on&&(s.icon_color=t.color_on),t.background_color_on&&(s.background_color=t.background_color_on)):(t.color_off&&(s.icon_color=t.color_off),t.background_color_off&&(s.background_color=t.background_color_off)),s}_handleCardClick(t){this._holdFired?this._holdFired=!1:(t.stopPropagation(),this._fireHassAction(this._config,"tap"))}_handleCardMouseDown(t){0===t.button&&(t.target.closest(".state-item")||this._startHoldTimer(()=>this._fireHassAction(this._config,"hold")))}_handleCardMouseUp(){this._clearHoldTimer()}_handleCardMouseLeave(){this._clearHoldTimer()}_handleCardTouchStart(t){t.target.closest(".state-item")||this._startHoldTimer(()=>this._fireHassAction(this._config,"hold"))}_handleCardTouchEnd(){this._clearHoldTimer()}_handleCardContextMenu(t){t.preventDefault(),t.stopPropagation(),this._fireHassAction(this._config,"hold")}_handleItemClick(t,e){this._holdFired?this._holdFired=!1:(t.stopPropagation(),this._fireHassAction(e,"tap"))}_handleItemMouseDown(t,e){0===t.button&&(t.stopPropagation(),this._startHoldTimer(()=>this._fireHassAction(e,"hold")))}_handleItemMouseUp(){this._clearHoldTimer()}_handleItemMouseLeave(){this._clearHoldTimer()}_handleItemTouchStart(t,e){t.stopPropagation(),this._startHoldTimer(()=>this._fireHassAction(e,"hold"))}_handleItemTouchEnd(){this._clearHoldTimer()}_handleItemContextMenu(t,e){t.preventDefault(),t.stopPropagation(),this._fireHassAction(e,"hold")}_startHoldTimer(t){this._clearHoldTimer(),this._holdFired=!1,this._holdTimeout=setTimeout(()=>{this._holdFired=!0,t()},500)}_clearHoldTimer(){this._holdTimeout&&(clearTimeout(this._holdTimeout),this._holdTimeout=null)}_fireHassAction(t,e){const o=new Event("hass-action",{bubbles:!0,composed:!0}),i={entity:t.entity,tap_action:t.tap_action||this._getDefaultAction(t),hold_action:t.hold_action,double_tap_action:t.double_tap_action};o.detail={config:i,action:e},this.dispatchEvent(o)}_getDefaultAction(t){if(!t.type)return t.tap_action||{action:"more-info"};if("entity"===t.type&&t.entity){const e=t.entity.split(".")[0];if(["light","switch","fan","automation","script","input_boolean"].includes(e))return{action:"call-service",service:e+".toggle",target:{entity_id:t.entity}}}return{action:"more-info"}}_getItemHTML(t){let e="",o=!1,i=null;if("entity"===t.type)if(e=this._getValue(t.entity),this._isClimateEntity(t.entity)){const e=this.hass.states[t.entity];e&&e.state&&(i=e.state,o="off"!==i)}else o=e==t.on_state;else{if("template"!=t.type)return V`<span class="invalid-entity">invalid type</span>`;e=this._getValue(t.condition),o=""!=e}const{icon_color:s,background_color:r}=this._applyTemplates(t,o?"on":"off",i);let n,a=s,l=r;if(t.use_light_color&&o&&"entity"===t.type){const e=this.hass.states[t.entity];if(e&&e.attributes.rgb_color){const[t,o,i]=e.attributes.rgb_color;a=`rgb(${t}, ${o}, ${i})`,l=`rgba(${t}, ${o}, ${i}, 0.2)`}}return n=this._isClimateEntity(t.entity)&&i?"off"===i&&t.icon_off?t.icon_off:t.icon:o?t.icon:t.icon_off?t.icon_off:t.icon,V`
			<ha-card
				@click=${e=>this._handleItemClick(e,t)}
				@mousedown=${e=>this._handleItemMouseDown(e,t)}
				@mouseup=${e=>this._handleItemMouseUp(e,t)}
				@mouseleave=${e=>this._handleItemMouseLeave(e,t)}
				@touchstart=${e=>this._handleItemTouchStart(e,t)}
				@touchend=${e=>this._handleItemTouchEnd(e,t)}
				@contextmenu=${e=>this._handleItemContextMenu(e,t)}
				.config=${t}
				tabindex="0"
				class="state-item"
				style="background-color: ${l}"
			>
				<ha-icon
					class="state-icon ${o?"on":"off"}"
					.icon=${n}
					style="color: ${a}"
				/>
			</ha-card>
		`}_isTemplate(t){return t?.includes("{")}_getValue(t){return this._isTemplate(t)&&this._tryConnect(t),this._isTemplate(t)?this._templateResults[t]?.result?.toString():this.hass.states[t]?.state}_getValueRawOrTemplate(t){return this._isTemplate(t)&&this._tryConnect(t),this._isTemplate(t)?this._templateResults[t]?.result?.toString():t}async _tryDisconnect(){for(const t in this._templateResults)this._tryDisconnectKey(t)}async _tryDisconnectKey(t){const e=this._unsubRenderTemplates.get(t);if(e)try{(await e)(),this._unsubRenderTemplates.delete(t)}catch(t){if("not_found"!==t.code&&"template_error"!==t.code)throw t}}async _tryConnect(t){if(void 0===this._unsubRenderTemplates.get(t)&&this.hass&&this._config&&this._isTemplate(t))try{const e=this._subscribeRenderTemplate(this.hass.connection,e=>{this._templateResults={...this._templateResults,[t]:e}},{template:t??"",variables:{config:this._config,user:this.hass.user?.name,entity:this.hass.states[this._config.entity]},strict:!0});this._unsubRenderTemplates.set(t,e),await e}catch(e){this._unsubRenderTemplates.delete(t)}}async _subscribeRenderTemplate(t,e,o){return t.subscribeMessage(t=>e(t),{type:"render_template",...o})}forwardHaptic(t){this._fireEvent(this,"haptic",t)}_fireEvent(t,e,o,i){i=i||{},o=null==o?{}:o;const s=new Event(e,{bubbles:void 0===i.bubbles||i.bubbles,cancelable:Boolean(i.cancelable),composed:void 0===i.composed||i.composed});return s.detail=o,t.dispatchEvent(s),s}static get styles(){return r`
			:host {
				--main-color: rgb(var(--rgb-grey));
				--icon-size: 80px;
				--icon-background-size: 175px;
				--state-icon-size: 1.8rem;
				--state-item-size: 45px;
				--card-primary-font-size: 18px;
				--card-primary-font-weight: 600;
				--card-primary-line-height: 1.3;
				--card-secondary-font-weight: 400;
				--card-secondary-font-size: 14px;
				--card-secondary-line-height: 1.2;
				--spacing: 8px;
				--border-radius: 12px;
				--state-border-radius: 50%;

				/* Home Assistant card defaults */
				box-sizing: border-box;
				border-radius: var(--ha-card-border-radius, 12px);
				border-width: var(--ha-card-border-width, 1px);
				border-style: solid;
				border-color: var(
					--ha-card-border-color,
					var(--divider-color, #e0e0e0)
				);

				/* Card shadows */
				box-shadow: var(
					--ha-card-box-shadow,
					var(--material-shadow-elevation-2)
				);
				transition: box-shadow 0.3s ease;
			}

			:host:hover {
				box-shadow: var(--material-shadow-elevation-4);
			}

			ha-card {
				border-radius: inherit;
				background: var(--card-background-color);
				overflow: hidden;
				position: relative;
				z-index: 1;
				border: none;
				width: 100%;
				height: 100%;
				box-shadow: none;
			}

			ha-card:hover {
				cursor: pointer;
			}

			.container {
				display: flex;
				align-items: stretch;
				justify-content: space-between;
				padding: 16px 8px 16px 16px;
				height: 204px; /* 236px - 32px padding = 204px */
				position: relative;
				z-index: 2;
				/* Ensure background circle can overflow */
				overflow: visible;
			}

			.content-main {
				display: flex;
				flex-direction: column;
				justify-content: space-between;
				flex: 1;
				min-width: 0;
				gap: 12px;
			}

			.text-content {
				display: flex;
				flex-direction: column;
				justify-content: flex-start;
				min-width: 0;
				align-self: flex-start;
			}

			.icon-container {
				position: relative;
				display: flex;
				align-items: center;
				justify-content: center;
				flex-shrink: 0;
				align-self: flex-start;
				width: var(--icon-size);
				height: var(--icon-size);
				/* Allow background circle to overflow */
				overflow: visible;
			}

			.icon-background {
				position: absolute;
				/* Position the large circle to overflow bottom-left */
				top: calc(var(--icon-size) / 2 - var(--icon-background-size) / 2);
				left: calc(var(--icon-size) / 2 - var(--icon-background-size) / 2);
				width: var(--icon-background-size);
				height: var(--icon-background-size);
				border-radius: 50%;
				opacity: 0.2;
				z-index: 1;
			}

			.icon {
				position: relative;
				z-index: 2;
				display: flex;
				align-items: center;
				justify-content: center;
				width: var(--icon-size);
				height: var(--icon-size);
			}

			.icon ha-icon {
				--mdc-icon-size: var(--icon-size);
				color: var(--icon-color);
				filter: drop-shadow(0 1px 2px rgba(0, 0, 0, 0.1));
			}

			.primary {
				font-weight: var(--card-primary-font-weight);
				font-size: var(--card-primary-font-size);
				line-height: var(--card-primary-line-height);
				color: var(--primary-text-color);
				text-overflow: ellipsis;
				overflow: hidden;
				white-space: nowrap;
				margin-bottom: 6px;
			}

			.secondary {
				font-weight: var(--card-secondary-font-weight);
				font-size: var(--card-secondary-font-size);
				line-height: var(--card-secondary-line-height);
				color: var(--secondary-text-color);
				text-overflow: ellipsis;
				overflow: hidden;
				white-space: nowrap;
			}

			.content-right {
				display: flex;
				align-items: center;
				flex-shrink: 0;
			}

			.states {
				display: flex;
				flex-direction: column;
				gap: 12px;
				align-items: center;
				height: 236px;
				justify-content: flex-start;
				padding-top: 20px;
			}

			.states.reverse-order {
				flex-direction: column-reverse;
				padding-bottom: 20px;
				padding-top: 0;
			}

			.state-item {
				display: flex;
				align-items: center;
				justify-content: center;
				width: var(--state-item-size);
				height: var(--state-item-size);
				border-radius: var(--state-border-radius);
				transition: all 0.2s ease;
				position: relative;
				z-index: 1;
				border: none;
			}

			.state-item:hover {
				box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
			}

			.state-icon {
				--mdc-icon-size: var(--state-icon-size);
				transition: color 0.2s ease;
				color: var(--primary-text-color);
			}

			.state-icon.on {
				color: var(--primary-color);
			}

			.state-icon.off {
				color: var(--secondary-text-color);
			}

			.invalid-entity {
				color: var(--error-color);
				font-size: 10px;
				text-align: center;
			}

			/* Material-You Theme Compatibility */
			@media (prefers-color-scheme: dark) {
				ha-card {
					background: var(
						--card-background-color,
						var(--ha-card-background, #1f1f1f)
					);
				}

				.icon-background {
					opacity: 0.3;
				}
			}

			/* Responsive adjustments */
			@media (max-width: 768px) {
				.container {
					padding: 12px 6px 12px 12px;
					height: 176px; /* 200px - 24px padding = 176px */
				}

				.states {
					height: 176px;
					padding-top: 0;
					gap: 8px;
				}

				.states.reverse-order {
					padding-top: 0;
					padding-bottom: 0;
				}

				:host {
					--icon-size: 60px;
					--icon-background-size: 140px;
					--state-item-size: 38px;
					--state-icon-size: 1.4rem;
				}
			}
		`}}),console.log("%c RoomCardMinimalist %c 1.0.2","color: white; background: #039be5; font-weight: 700;","color: #039be5; background: white; font-weight: 700;")})();