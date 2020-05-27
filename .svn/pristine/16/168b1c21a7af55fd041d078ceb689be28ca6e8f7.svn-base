var Showbo={author:'showbo',homepage:'http://www.lenomC100.com'};
//是否为ie浏览器
Showbo.IsIE=!!document.all;
//ie浏览器版本
Showbo.IEVersion=(function(){if(!Showbo.IsIE)return -1;try{return parseFloat(/msie ([\d\.]+)/i.exec(navigator.userAgent)[1]);}catch(e){return -1;}})();
//按id获取对象
Showbo.$=function(Id,isFrame){var o;if("string"==typeof(Id))o= document.getElementById(Id);else if("object"==typeof(Id))o= Id;else return null;return isFrame?(Showbo.IsIE?frames[Id]:o.contentWindow):o;}
//按标签名称获取对象
//页面的高和宽******************************
Showbo.isStrict=document.compatMode == "CSS1Compat";
Showbo.BodyScale={x:0,y:0,tx:0,ty:0};//（x，y）：当前的浏览器容器大小  （tx，ty）：总的页面滚动宽度和高度
Showbo.getClientHeight=function(){/*if(Showbo.IsIE)*/return Showbo.isStrict ? document.documentElement.clientHeight :document.body.clientHeight;/*else return self.innerHeight;*/}
Showbo.getScrollHeight=function(){var h=!Showbo.isStrict?document.body.scrollHeight:document.documentElement.scrollHeight;return Math.max(h,this.getClientHeight());}
Showbo.getHeight=function(full){return full?this.getScrollHeight():this.getClientHeight();}
Showbo.getClientWidth=function(){/*if(Showbo.IsIE)*/return Showbo.isStrict?document.documentElement.clientWidth:document.body.clientWidth;/*else return self.innerWidth;*/}
Showbo.getScrollWidth=function(){var w=!Showbo.isStrict?document.body.scrollWidth:document.documentElement.scrollWidth;return Math.max(w,this.getClientWidth());}
Showbo.getWidth=function(full){return full?this.getScrollWidth():this.getClientWidth();}
Showbo.initBodyScale=function(){Showbo.BodyScale.x=Showbo.getWidth(false);Showbo.BodyScale.y=Showbo.getHeight(false);Showbo.BodyScale.tx=Showbo.getWidth(true);Showbo.BodyScale.ty=Showbo.getHeight(true);}
//页面的高和宽******************************
Showbo.Msg={
    INFO:'info',
    ERROR:'error',
    WARNING:'warning',
    IsInit:false,
    timer:null,
    dvTitle:null,
    dvCT:null,
    dvBottom:null,
    dvBtns:null,
    lightBox:null,
    dvMsgBox:null,
    defaultWidth:500,
    moveProcessbar:function(){
        var o=Showbo.$('dvProcessbar'),w=o.style.width;
        if(w=='')w=20;
        else{
            w=parseInt(w)+20;
            if(w>100)w=0;
        }
        o.style.width=w+'%';
    },
    InitMsg:function(width){
        //ie下不按照添加事件的循序来执行，所以要注意在调用alert等方法时要检测是否已经初始化IsInit=true
        var ifStr='<iframe src="javascript:false" mce_src="javascript:false" style="position:absolute; visibility:inherit; top:0px;left:0px;width:100%; height:100%; z-index:-1;'
            +'filter=\'progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)\';"></iframe>',
            html='<div class="top_tit"><div class="title" id="dvMsgTitle"></div></div>'+
                '<div class="body"><div class="ct" id="dvMsgCT"></div></div>'+
                '<div class="bottom" id="dvMsgBottom"><div class="abtn" id="dvMsgBtns"></div></div>';
        this.dvMsgBox=document.createElement("div");
        this.dvMsgBox.id="dvMsgBox";
        this.dvMsgBox.innerHTML+=html;
        document.body.appendChild(this.dvMsgBox);
        this.lightBox=document.createElement("div");
        this.lightBox.id="ShowBolightBox";
        document.body.appendChild(this.lightBox);
        if(Showbo.IsIE&&Showbo.IEVersion<7){//加iframe层修正ie6下无法遮盖住select的问题
            this.lightBox.innerHTML+=ifStr;
            this.dvMsgBox.innerHTML+=ifStr;
        }
        this.dvBottom=Showbo.$('dvMsgBottom');
        this.dvBtns=Showbo.$('dvMsgBtns');
        this.dvCT=Showbo.$('dvMsgCT');
        this.dvTitle=Showbo.$('dvMsgTitle');
        this.IsInit=true;
    },
    checkDOMLast:function(){//此方法非常关键，要不无法显示弹出窗口。两个对象dvMsgBox和lightBox必须处在body的最后两个节点内
        if(document.body.lastChild!=this.lightBox){
            document.body.appendChild(this.dvMsgBox);
            document.body.appendChild(this.lightBox);
        }
    },
    createBtn:function(p,v,fn){
        var btn=document.createElement("input");
        btn.type="button";
        btn.className='abtn';
        btn.value=v;
        btn.id="confirmbtnId";
        btn.onmouseover=function(){this.className='btnfocus';}
        btn.onmouseout=function(){this.className='abtn';}
        btn.onclick=function(){
            Showbo.Msg.hide();
            if(fn)fn(p);
        }
        return btn;
    },
    alert:function(msg,fn){
        /**
         * msg為需要顯示的信息
         */
        msg = msg.replace(/\n/g,"<br>")
        this.show({buttons:{yes:'確認'},msg:msg,fn:fn});
    },
    confirm:function(msg,til,fn,fn2){
        /**
         * msg：需要提示的信息
         * til：confirm的標題
         * fn：回調函數1 -- 點擊按鈕 ‘是’ 時執行
         * fn2：回調函數2 -- 點擊按鈕 ‘不是’ 是執行
         */
        msg = msg.replace(/\n/g,"<br>")
        //fn为回调函数，参数和show方法的一致
        this.show({buttons:{yes:'是',no:'否'},msg:msg,title:til,fn:fn,fn2:fn2});
    },
    prompt:function(labelWord,defaultValue,txtId,fn){
        if(!labelWord)labelWord='请输入：';
        if(!defaultValue)defaultValue="";
        if(!txtId)txtId="msg_txtInput";
        this.show({title:'输入提示',msg:labelWord+'<input type="text" id="'+txtId+'" style="width:100px" value="'+defaultValue+'"/>',buttons:{yes:'是',no:'不是'},fn:fn});
    },
    wait:function(msg,title){
        if(!msg)msg='正在处理..';
        this.show({title:title,msg:msg,wait:true});
    },
    show:function(cfg){
        //cfg:{title:'',msg:'',wait:true,icon:'默认为信息',buttons:{yes:'',no:''},fn:function(btn){回调函数,btn为点击的按钮，可以为yes，no},width:显示层的宽}
        //如果是等待则wait后面的配置不需要了。。
        if(!cfg)throw("没有指定配置文件！");
        //添加窗体大小改变监听
        if(Showbo.IsIE)window.attachEvent("onresize",this.onResize);
        else  window.addEventListener("resize",this.onResize,false);

        if(!this.IsInit)this.InitMsg();//初始化dom对象
        else this.checkDOMLast();//检查是否在最后

        //检查是否要指定宽，默认为300
        if(cfg.width)this.defaultWidth=cfg.width;
        this.dvMsgBox.style.width=this.defaultWidth+'px';
        //可以直接使用show方法停止为进度条的窗口
        if(this.timer){clearInterval(this.timer);this.timer=null;}
        this.dvTitle.innerHTML='';
        if(cfg.title)this.dvTitle.innerHTML=cfg.title;
        this.dvCT.innerHTML='';
        if(cfg.wait){
            if(cfg.msg)this.dvCT.innerHTML=cfg.msg;
            this.dvCT.innerHTML+='<div class="pro"><div class="bg" id="dvProcessbar"></div></div>';
            this.dvBtns.innerHTML='';
            this.dvBottom.style.height='10px';
            this.timer=setInterval(function(){Showbo.Msg.moveProcessbar();},1000);
        }
        else{
            //if(!cfg.icon)cfg.icon=Showbo.Msg.INFO;
            if(!cfg.buttons||(!cfg.buttons.yes&&!cfg.buttons.no)){
                cfg.buttons={yes:'是'};
            }
            if(cfg.icon)this.dvCT.innerHTML='<div class="icon '+cfg.icon+'"></div>';
            if(cfg.msg)this.dvCT.innerHTML+=cfg.msg+'<div class="clear"></div>';
            this.dvBottom.style.height='45px';
            this.dvBtns.innerHTML='';
            if(cfg.buttons.yes){
                this.dvBtns.appendChild(this.createBtn('yes',cfg.buttons.yes,cfg.fn));
                if(cfg.buttons.no)this.dvBtns.appendChild(document.createTextNode('　'));
            }
            if(cfg.buttons.no)this.dvBtns.appendChild(this.createBtn('no',cfg.buttons.no,cfg.fn2));


        }
        Showbo.initBodyScale();
        this.dvMsgBox.style.display='block';
        this.lightBox.style.display='block';
        this.onResize(false);

        $('#confirmbtnId').focus();
    },
    hide:function(){
        this.dvMsgBox.style.display='none';
        this.lightBox.style.display='none';
        if(this.timer){clearInterval(this.timer);this.timer=null;}
        if(Showbo.IsIE)window.detachEvent('onresize',this.onResize);
        else window.removeEventListener('resize',this.onResize,false);
    },
    onResize:function(isResize){
        if(isResize)Showbo.initBodyScale();
        Showbo.Msg.lightBox.style.width=Showbo.BodyScale.tx+'px';
        Showbo.Msg.lightBox.style.height=Showbo.BodyScale.ty+'px';
        Showbo.Msg.dvMsgBox.style.top=240+'px';
        Showbo.Msg.dvMsgBox.style.left=Math.floor((Showbo.BodyScale.x-Showbo.Msg.dvMsgBox.offsetWidth)/2)+'px';
    },
    openDiv:function (divId) {
        $("#"+divId).css("display","block");
    },
    closeDiv:function (divId) {
        $("#"+divId).css("display","none");
    }

}