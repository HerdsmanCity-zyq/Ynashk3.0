(function(window){
	var $control=function(dataType,beforeFunction,afterFunction){
			$control.bind.init(dataType,beforeFunction,afterFunction);
    		var source = $("<div hiddensource style='display: none;'></div>").append($("[data-type='"+ dataType +"'] [data-type='"+ $control.bind.dataType.source+"']").clone().removeAttr("data-type"));
    		$("[data-type='"+ dataType +"']").append(source);
	};
	$control.bind = $control.prototype={
    					aop:{after:{},before:{}},
			    		arg0:{},
						dataType:{select:"selected",add:"add",source:"source",up:"up",down:"down",left:"left",right:"right",upTop:"upTop",downbotton:"downbotton",search:"search",item:"item"},
						up:function(tag,parent,selecteds){
							for(var i=0;i<selecteds.length;i++)
								selecteds.eq(i).prev().before(selecteds.eq(i));
						},
						down:function(tag,parent,selecteds){
							for(var i=0;i<selecteds.length;i++)
								selecteds.eq(i).next().after(selecteds.eq(i));
						},
						//添加进add 先判断是否存在 如果不存在 进行添加  最后选中add下的该元素  
						left:function(tag,parent,selecteds){
							var left   = parent.find("[data-type='"+ this.dataType.add +"']"),
							    uniqueAttr = "data-"+this.dataType.item;
						    var  unique   = selecteds.eq(0).attr(uniqueAttr);
								for(var i=0;i<selecteds.length;i++){
									 var count = left.find("["+ uniqueAttr +"='"+ selecteds.eq(i).attr(uniqueAttr) +"']").length;
									 if(count>0) continue ;
									 left.append(selecteds.eq(i).clone());
									 selecteds.eq(i).click();
								}
								for(var k in this.arg0){
									this.init(this.arg0[k]);
								}
								     left.find("["+ uniqueAttr +"='"+unique +"']").click();
						},
						//添加进source 先判断是否存在 如果不存在 进行添加  最后选中source下的该元素  并删除add 下载的该元素
						right:function(tag,parent,selecteds){
							var source   = parent.find("[data-type='"+ this.dataType.source +"']"),
								add      = parent.find("[data-type='"+ this.dataType.add +"']"),
							    uniqueAttr = "data-"+this.dataType.item;
								for(var i=0;i<selecteds.length;i++){
									var unique = selecteds.eq(i).attr(uniqueAttr);
									var count = source.find("["+uniqueAttr+"='"+unique +"']").length;
									if(count<1)
										source.append(selecteds.eq(i));
									add.find("["+uniqueAttr+"='"+unique +"']").remove();
									source.find("["+uniqueAttr+"='"+unique +"']").click();
								}
								for(var k in this.arg0){
									this.init(this.arg0[k]);
								}
						},
						upTop:function(tag,parent,selecteds){ 			selecteds.prevAll().eq(selecteds.prevAll().length-1).before(selecteds);    			},
						downbotton:function(tag,parent,selecteds){		selecteds.nextAll().eq(selecteds.nextAll().length-1).after(selecteds); },
						//先删除source下面的所有子元素 然后在添加  因为新添加的元素无法监听 所有重新调用init 方法
						search:function(tag,parent,selecteds){
							var val = tag.val()+"",
								source = parent.find("[data-type='"+ this.dataType.source+"']"),
							    hideSource = parent.find("[hiddensource] [data-type='"+ this.dataType.item+"']");
								source.find("[data-type='"+ this.dataType.item+"']").remove();
								for(var i=0;i<hideSource.length;i++){
									if(val!="" && (hideSource.eq(i).text()+"").indexOf(val)==-1)  continue ;
									source.append(hideSource.eq(i).clone());
								}
								for(var k in this.arg0){
									this.init(this.arg0[k]);
								}
						},
					 item:function(tag,parent,selecteds){
							var select = tag.attr("data-select");
								//去除选中的
								selecteds.removeAttr("data-select");			selecteds.removeClass("selected");
								if(select!=undefined){
									tag.removeAttr("data-select");									tag.removeClass("selected");
								}else{//选中该元素
									tag.attr("data-select",this.dataType.select);					tag.addClass("selected");
								}
						
						},
					init:function(dataType,beforeFunction,afterFunction){
						this.arg0[dataType]=dataType;
						if(this.aop.before[this.defaultBeforeFunction+""+dataType]==undefined)		
								this.aop.before[this.defaultBeforeFunction+""+dataType]=this.defaultBeforeFunction;//添加前置通知	默认
						if(this.aop.after[this.defaultAfterFunction+""+dataType]==undefined) 	
							this.aop.after[this.defaultAfterFunction+""+dataType]=this.defaultAfterFunction;//添加后置通知 默认
						if(beforeFunction!=undefined && this.aop.before[beforeFunction+""+dataType]==undefined)	
							this.aop.before[beforeFunction+""+dataType]=beforeFunction;//添加前置通知 作为参数传入
						if(afterFunction!=undefined  && this.aop.after[afterFunction+""+dataType]==undefined)		
							this.aop.after[afterFunction+""+dataType]=afterFunction;//添加后置通知 作为参数传入
						$("[data-type='"+ dataType +"']").find("[data-type]").off("click keyup");
			    		$("[data-type='"+ dataType +"']").find("[data-type]").on("click keyup",function(){
			    			var Tag = $(this), Function = Tag.attr("data-type"),
		    				parent  = Tag.parents("[data-type='"+ dataType +"']").eq(0),
		    				selecteds = parent.find("[data-select='selected']");
		    			if(Function == undefined || !$.isFunction($control.bind[Function])) return ;
			    				for(var k in $control.bind.aop.before)
				    			 	if(k.indexOf(dataType)!=-1 && $.isFunction($control.bind.aop.before[k])) $control.bind.aop.before[k](Tag,parent,selecteds,Function); //调用前置通知
	    					$control.bind[Function](Tag,parent,selecteds);
			    				for(var k in $control.bind.aop.after)
				    			 	if(k.indexOf(dataType)!=-1 && $.isFunction($control.bind.aop.after[k])) $control.bind.aop.after[k](Tag,parent,selecteds,Function);//调用后置通知
			    		});
					},
					getJSON:function(){
						var datas={};
						for(var k in this.arg0){
							var items = $("[data-type='"+ this.arg0[k] +"'] [data-type='"+ this.dataType.add +"'] [data-type='"+ this.dataType.item +"']");
							if(items.length>0){
								datas[k]=[];
								for(var i=0;i<items.length;i++){
									datas[k].push(items.eq(i).attr("data-"+this.dataType.item));
								}
							}
						}
						return datas;
					},
					getSerialize:function(){
						var datas = this.getJSON(),	dataStr="";
						for(var k in datas)
							dataStr+=k+"="+datas[k].join(",")+"&";
						return dataStr.substring(0, dataStr.length-1);
					},
					defaultBeforeFunction:function(Tag,parent,selecteds,Function){ },
					defaultAfterFunction:function(Tag,parent,selecteds,Function){  }
			};
		window.control = $control;
//	--------------------------------------------------------------------------------------------------
		String.prototype.contains=function(str){return this.indexOf(str) > -1};
		String.prototype.startsWith=function(str){return this.indexOf(str)==0};
		String.prototype.endsWith=function(str){
			var arg0 = this.split(""),
				arg1 = str.split("");
			arg0.reverse();
			arg1.reverse();
			return arg0.join("").indexOf(arg1.join(""))==0;
		};
		
		function $TabTogglerHelp(tags,selected){
			return $TabTogglerHelp.bind.init(tags,selected);
		}
		$TabTogglerHelp.bind = $TabTogglerHelp.prototype={
			tags:undefined,//".tab_cut_tit ul li"
			selected:undefined,//".select" or [class*='select']
			commonsMessage:{isContinue:true},
			filter:[],
			controller:[],
			interceptor:[],
			init:function(tags,selected){
				this.setTags(tags);
				this.setSelected(selected);
				if(tags!=undefined && selected!=undefined){
					this.run();
				}
			},
			run:function(){this.bind();},
			setFilter:function(FunctionFilter){
					this.setFunction(FunctionFilter,this.filter);
			},
			setInterceptor:function(FunctionInterceptor){
				this.setFunction(FunctionInterceptor,this.interceptor);
			},
			setController:function(FunctionController){
				this.setFunction(FunctionController,this.controller);
			},
			setFunction:function(Function,functionContainer){
				if($.isFunction(Function)){
						functionContainer.push(Function);
					}
			},
			setTags:function(tags){this.tags = tags;},
			setSelected:function(selected){this.selected = selected; },
			bind:function(){
				$(this.tags).on("click",function(){$TabTogglerHelp.bind.defaultAction($(this));});
			},
			resetCommonMessage:function(){
				for(var k in this.commonsMessage)
					this.commonsMessage[k]=undefined;
				this.commonsMessage.isContinue = true;
			},
			defaultAction:function($click){
				var before = $(this.tags+this.selected);//eg : .tab_cut_tit ul li.select
				var after = $click;
				this.resetCommonMessage();
				this.foreachFunction(this.filter,before,after);
				this.foreachFunction(this.interceptor,before,after);
				this.foreachFunction(this.controller,before,after);
				this.defaultControler(after,before);
			},
			selectedIsClass:function(){
				return this.selected.contains("class") || this.selected.indexOf(".")==0;
			},
			getClass:function(){
				if(this.selected.indexOf(".")==0) return this.selected.substring(1,this.selected.length);
				else if(this.selected.contains("class")) return this.selected.substring(this.selected.indexOf("='")+2,this.selected.indexOf("']"));
				return undefined;
			},
			getAttrAndValue:function(){
				var map={attr:undefined,value:undefined};
				if(this.selected.indexOf("[")==0){
					var k = this.selected.substring(1,this.selected.length-1);
					map.attr = k.split("=")[0];
					map.value = k.split("=")[1];
					map.value = map.value.substring(1,map.value.length-1);
				}
				return map;
			},
			defaultControler:function($after,$before){
				if(!this.commonsMessage.isContinue) return ;
				if(this.selectedIsClass()){
					$(this.tags).removeClass(this.getClass());
					$after.addClass(this.getClass());
				}else{
					var attrAndValue = this.getAttrAndValue();
					$(this.tags).removeAttr(attrAndValue.attr);
					$after.attr(attrAndValue.attr,attrAndValue.value);
				}
				var beforeDivId = "div_"+($before.find("span").attr("id"));
				var afterDivId  = "div_"+($after.find("span").attr("id"));
				$("#"+beforeDivId).hide();
				$("#"+afterDivId).show();
				
			},
			foreachFunction:function(Functions,before,after){
				for(var k =0 ;k < Functions.length;k++){
					if(!this.commonsMessage.isContinue) break ;
					var returnValue = Functions[k](before,after,this.commonsMessage);
					if($.type(returnValue)=="boolean") this.commonsMessage.isContinue = returnValue;
				}
			}
		};
		window.TabToggler = $TabTogglerHelp;
		
		
		
		//////////////////////////////////////////////////////////////////////头像
		function Picture_Avatar(options,call){
			 return  Picture_Avatar.bind.init(options,call);
		}
		Picture_Avatar.bind = Picture_Avatar.prototype={
			//defaultOptions:{id:undefined,chiName:undefined,coordinate:undefined,link:undefined,callFunction:undefined,pictureUrl:undefined}, //各类参数
			defaultOptions:{callFunction:undefined,coordinate:undefined,chiName:undefined,id:undefined,link:undefined,pictureUrl:undefined}, //各类参数
			move:true,
			Images:undefined,
			Draggabilly:undefined,
			PictureAcatarPeg:$("#Picture_Acatar_Peg"),
			Picture_Avatar_imageShow:$("#Picture_Avatar_imageShow"),
			chiName:$("#Picture_Avatar_chiname"),
			init:function(option,call){
				if(this.Draggabilly!=undefined)
					this.Draggabilly.draggabilly('destroy');
				this.initOptions(option);
				$("#Picture_Avatar_imageShow").removeAttr("style");
				if(this.defaultOptions.link!=undefined && this.defaultOptions.coordinate!=undefined)
				  $("#Picture_Avatar_imageShow").attr("style",this.defaultOptions.coordinate);
				  
				this.PictureAcatarPeg			=		$("#Picture_Acatar_Peg");
				this.Picture_Avatar_imageShow	=		$("#Picture_Avatar_imageShow");
				this.chiName					=		$("#Picture_Avatar_chiname");
				
				
				this.initDraggabilly();
				this.setImage();
				
					
				
				this.setInformation();
				this.Picture_Acatar_Peg();
				this.onFileChange();
				this.Close();
			},
			initOptions:function(option){
				this.move		=		true;
			    this.Images		=		undefined;
				this.Draggabilly=		undefined;
				this.PictureAcatarPeg	=	undefined	;
				this.Picture_Avatar_imageShow = undefined;
				this.chiName			=	undefined;
				
				for(var k in this.defaultOptions)
    	  	   	  this.defaultOptions[k]=undefined;
				for(var k in option){
					this.defaultOptions[k] = option[k];
				}
			},
			setInformation:function(){
				this.chiName.text(this.defaultOptions.chiName); //显示中文名字
				$("#Picture_Avatar_FormID [name='id']").val(this.defaultOptions.id);
			},
			setImage:function(link){
				 if(link !=undefined){
					 this.defaultOptions.link = link.replace("//","\\");
				 } 
				 var pricture = this.defaultOptions.pictureUrl+"\showImageDiaLog.do?action=showImageDiaLog&filename=";
				 this.Picture_Avatar_imageShow.attr("src",pricture+this.defaultOptions.link);
	 			 this.Images = this.defaultOptions.link; //在 关闭 方法中调用
	 			 
			},
			initDraggabilly:function(){
				 this.Draggabilly = this.Picture_Avatar_imageShow.draggabilly();
	   			 this.Draggabilly.on("dragMove",this.onDragMove);
			},
			onDragMove:function (instance,event,pointer){
				  /* var $Image = this.Picture_Avatar_imageShow;
				       left = $Image.offset().left,
				       top  = $Image.offset().top,
				       width = Images.width,
				       height = Images.height;
				    var parent = $Image.parent("div");
				        parWidth  = (parent.css("width")+"").replace("px",""),
				        parHeight  = (parent.css("height")+"").replace("px","");
				      if( parseInt(left) > 0 ||(width-parWidth)<Math.abs(left) ){
				    	 // Draggabilly.draggabilly("disable");
				    	//  $Image.css("left","0px");
				      }
				      if(parseInt(top)>0 || (height-parHeight)<Math.abs(top)){
				    	//  Draggabilly.draggabilly("disable");
				    	 // $Image.css("top","0px");
	      				}*/
			},
			ImageChageCall:function(url){
				this.setImage(url);
			},
			Picture_Acatar_Peg:function(){//订住
				$this = this;
				this.PictureAcatarPeg.off("click");
				this.PictureAcatarPeg.on("click",function(){
			    	if($this.move){
			    		$this.Draggabilly.draggabilly("disable");
			    		var left = ($this.Picture_Avatar_imageShow.css("left")+"").replace("px", "");
			    		var top = ($this.Picture_Avatar_imageShow.css("top")+"").replace("px", "");
			    		if(parseInt(left)>0){
			    			left=0;
			    		}
			    		if(parseInt(top)>0){
			    			top=0;
			    		}
			    		var coordinate = "left:"+left+"px;top:"+top+"px;";
			    		$this.defaultOptions.coordinate = coordinate;
			    		$this.move = false;
			    	}else{
			    		$this.Draggabilly.draggabilly("enable");
			    		$this.move = true;
			    	}
				});
			},
			onFileChange:function(){
				var $Picture_Acater = this;
				$("#Picture_Avatar_FormID [type='file']").off("change");
			    $("#Picture_Avatar_FormID [type='file']").on("change",function(){
			       $Picture_Acater.fileChange($Picture_Acater);
			    });
			},
			fileChange:function($Picture_Acater){//更新文件
				   $.ajax({
					   url:"showImageDiaLog.do",
					   type:"POST",
					   contentType:false,
					   processData: false,
					   cache: false,
					   data:new FormData($("#Picture_Avatar_FormID")[0]),
					   success:function(message){ 
						   if(message.indexOf($Picture_Acater.defaultOptions.id)>-1){
						   	   $Picture_Acater.ImageChageCall(message);
							   $Picture_Acater.Picture_Avatar_imageShow.css({"left":"0px","top":"0px"});
						   }else{
							   alert("更新失败！");
						   }
					   },
					   error:function(message)  {
						   alert("更新失败！ ");
					   }
				   });
			},
    	  Close:function(){//返回
    	  	   $("#Picture_Avatar_FormID").siblings("[close]").off("click");
    	  	   var $Picture_Avatar = this;
    	  	   $("#Picture_Avatar_FormID").siblings("[close]").on("click",function(){
	    	  	   var data = $Picture_Avatar.Draggabilly.data('draggabilly');
				   var coordinate = $Picture_Avatar.defaultOptions.coordinate; //"left:"+$("#imageShow").css("left")+";top:"+$("#imageShow").css("top")+";";
				   var url = $Picture_Avatar.Images;
				   url = (url+"").replace(/\\/g,"/");
				   // return coordinate;
				   var resultMap = {"coordinate":coordinate,"url":url};
				   //this.callFunction(resultMap);
			   		if($.isFunction($Picture_Avatar.defaultOptions.callFunction))
			   			$Picture_Avatar.defaultOptions.callFunction(JSON.stringify(resultMap));
    	  	   });
    	  	  // this.Picture_Avatar_imageShow.attr("style",this.defaultOptions.coordinate);
    	  	  //  for(var k in this.defaultOptions)
    	  	   // this.defaultOptions[k]=undefined;
		   }
		}
		window.Picture_Avatar = Picture_Avatar;
})(this);