(function($){
	var W = window;
	var D = document;
	var Y = {};

	Y.isIE6 = !window.XMLHttpRequest;

	/*
		slide function
	*/
	Y.slide = function(ctn,ctrl,cfg){
		var defaults  = {
				effect : 'fade',
				speed : 500,
				pauseTime :5000,
				auto : true,
				curCls : 'current',
				event : 'mouseover',
				btnLeft : '',
				btnRight : ''
		};
		var slideCtrl = $(ctrl).children();
		var slideCtn = $(ctn).children();
		var slideCon = $(ctn);
		var cfg = $.extend({},defaults,cfg);
		var slideW = slideCtn.eq(0).width();
		var slideH = slideCtn.eq(0).height();
		var len = slideCtn.length;
		var autoPlay;
		var autoTimer;
		var curIdx = 0;

		if(len < 2){ 
			return false;
		};

		if(cfg.effect =='scrollX'){
			slideCon.width(slideW*len);
		}
		else if(cfg.effect =='scrollY'){
			slideCon.height(slideH*len);
		}

		var slideEffect = {
			fade : function(idx){
				slideCtrl.eq(idx).addClass(cfg.curCls).siblings().removeClass(cfg.curCls);
				slideCtn.eq(idx).addClass(cfg.curCls).stop().animate({opacity:1},cfg.speed).siblings().stop().animate({opacity:0},cfg.speed).removeClass(cfg.curCls);
			},
			
			scrollX : function(idx){
				slideCtrl.eq(idx).addClass(cfg.curCls).siblings().removeClass(cfg.curCls);
				slideCon.stop().animate({left:(-slideW*idx)},cfg.speed);
			},
			
			scrollY : function(idx){
				slideCtrl.eq(idx).addClass(cfg.curCls).siblings().removeClass(cfg.curCls);
				slideCon.stop().animate({top:(-slideH*idx)},cfg.speed);
			}
		}
		

		$.each(slideCtrl,function(idx){
			$(this).bind(cfg.event,function(){
				curIdx = idx;
				slideEffect[cfg.effect](idx);
			})
		});

		autoPlay = function(){
			slideEffect[cfg.effect](curIdx);
			curIdx++;
			curIdx = (curIdx < slideCtn.length) ? curIdx : 0;
		}
		if(cfg.auto){
			autoTimer = setInterval(autoPlay,cfg.pauseTime)
		}
		slideCtn.hover(function(){
			if(autoTimer){
				clearInterval(autoTimer);
			}
		},function(){
			if(cfg.auto){
				autoTimer = setInterval(autoPlay,cfg.pauseTime)
			}
		});
		if (cfg.btnLeft && cfg.btnRight)
		{
			$(cfg.btnLeft).click(function(){
				slideEffect[cfg.effect](curIdx);
				curIdx--;
				curIdx = (curIdx < 0) ? slideCtn.length-1 : 0;		
			});
			$(cfg.btnRight).click(function(){
				slideEffect[cfg.effect](curIdx);
				curIdx++;
				curIdx = (curIdx < slideCtn.length) ? curIdx : 0;		
			});
		}
	};

	/*
		tab function
	*/
	Y.tab = function(ctn,ctrl,cfg){
		var defaults = {
			cls : 'current',
			event : 'mouseover'
		}
		var tabCtn = $(ctn).children();
		var tabCtrl = $(ctrl).children();
		var cfg = $.extend({},defaults,cfg);

		$.each(tabCtrl,function(idx){
			$(this).bind(cfg.event,function(){
				$.each(tabCtrl,function(_idx){_idx==idx ? $(this).addClass(cfg.cls) : $(this).removeClass(cfg.cls);});
				$.each(tabCtn,function(_idx){_idx==idx ? $(this).show() : $(this).hide();});
			})
		});
	};

	/*
	slow tab function
	*/
	Y.tab_delay = function(ctn,ctrl,cfg){
		var defaults = {
			cls : 'current',
			speedTime :500
		}
		var tabCtn = $(ctn).children();
		var tabCtrl = $(ctrl).children();
		var cfg = $.extend({},defaults,cfg);

		$.each(tabCtrl,function(idx){
			$(this).hover(function () {
				var timeoutId = setTimeout(function() {
					$.each(tabCtrl,function(_idx){
						_idx==idx ? $(this).addClass(cfg.cls) : $(this).removeClass(cfg.cls);
					});
					$.each(tabCtn,function(_idx){
						_idx==idx ? $(this).show() : $(this).hide();
					});
				}, cfg.speedTime);
				$(this).data('timeId', timeoutId);				
			},
			function () {
				clearTimeout($(this).data('timeId'));
			})
		});
	};

	/*
		textSlide
	*/
	Y.textSlide = function(tag,cfg){
		var defaults  = {
			speed : 500,
			pauseTime :4000
		};
		var cfg = $.extend({},defaults,cfg);
		var slideWrap = $(tag);
		var slideCtn = slideWrap.children();
		var slideHeight = slideCtn.eq(0).outerHeight();
		var len = slideCtn.length;

		if(len < 2){
			return false;
		}

		var slidePlay = function(){
			slideWrap.animate({top:-slideHeight},cfg.speed,function(){
				slideWrap.find(':first').appendTo(slideWrap);
				slideWrap.css({top:0});
			})
		};

		var autoPlay = setInterval(slidePlay,cfg.pauseTime);

		slideCtn.hover(function(){
			clearInterval(autoPlay);
		},function(){
			autoPlay = setInterval(slidePlay,cfg.pauseTime);
		});

	};

	/*
		popup function
	*/
	Y.Popup = function(options){
			var defaults = {
				title : 'title',
				content : {},
				width : '400',
				height : '',
				movable : true,
				zIndex : 1000,
				maskOpacity : 0.2,
				escKeyClose : true,
				onOpen : false,
				onClose : false,
				buttons : []
			}
			this.options = $.extend({},defaults,options);
			this.status;
			this.onOpen = typeof(this.options.onOpen) === 'function' ? this.options.onOpen : false;
			this.onClose = typeof(this.options.onClose) === 'function' ? this.options.onClose : false;
			this.init();
			
			!Y.Popup._collection ? Y.Popup._collection = [this] : Y.Popup._collection.push(this);
			
	}

	Y.Popup._createMask = function(){
		var that = this;
		if(!this.mask){
			this.mask = $('<div />');
			this.mask.attr('class','mod_popup_mask').css({
				position : Y.isIE6 ? 'absolute' : 'fixed',
				top : 0,
				left : 0,
				width : '100%',
				height : Y.isIE6 ? Math.max($(window).height(),$('body').height()) : '100%',
				backgroundColor : '#000',
				opacity : 0.2,
				zIndex : 990
			});

			this.mask.appendTo('body');
			if(Y.isIE6){
				$('<iframe />').css({width:'100%',height:'100%',opacity:0}).appendTo(this.mask);
				$(window).bind('resize',function(){
						that._IE6MaskAdjust();
				});
			}
		}
		else{
			this.mask.show();
		}
	};

	Y.Popup._IE6MaskAdjust = function(){
		this.mask.css({height:Math.max($(window).height(),$('body').height()),width:Math.max($(window).width(),$('body').width())});
	};

	Y.Popup.closeAll = function(){
		try {
			for(var i=Y.Popup._collection.length-1; i>=0; i--){
				Y.Popup._collection[i].close();
			}
		}catch(e){}
	}
	

	//Popup.prototype
	Y.Popup.prototype = {
		init : function(){
			var that = this;
			this._showPopup();
			this.status = 1;
			this.popCloseBtn.bind('click',function(e){
				that.close();
				e.preventDefault();
			});

			$(window).bind('resize scroll',function(){
				that._recenter();
			});

			$(document).bind('keydown',function(e){
				var key = e.keyCode;
				if (that.options.escKeyClose && key === 27) {
					that.close();
					e.preventDefault();
				}
			});

			if(this.options.movable){
				this._dragEventBind();
			}
			
			if(this.options.buttons.length != 0){
				this._buttonsEventBind();
			}

			if(this.onOpen){this.onOpen();}
		},

		_showPopup : function(){
			Y.Popup._createMask();
			this.popContainer = $('<div />').attr('class','mod_popup_container').css({
				position:'absolute',
				top: $(window).height() > this.options.height ? $(window).scrollTop()+($(window).height()-this.options.height)/2 : $(window).scrollTop(),
				left:'50%',
				width:this.options.width,
				//height:this.options.height,
				backgroundColor:'#fff',
				zIndex:this.options.zIndex,
				marginLeft:-(this.options.width/2)
			});


			this.popHd = $('<div />').attr({'class':'mod_popup_hd'}).append(
				this.popTitle = $('<h3 />').html(this.options.title),
				this.popCloseBtn = $('<a />').attr({'href': 'javascript:void(0);', 'class': 'close_btn'})
			);

			this.popBd = $('<div />').attr({'class':'mod_popup_bd'}).css({height:this.options.height});

			if(this.options.content){
				if(this.options.content.html){
					this.popTargetCtn = this.options.content.html;
				}
				else if(this.options.content.inline){
					this.popTargetCtn = $(this.options.content.inline).children();
					this.popTargetCtnOrigin = $(this.options.content.inline);
				}
				else if(this.options.content.iframe){
					this.popTargetCtn = $('<iframe />').attr({'src':this.options.content.iframe, 'frameBorder':0,'width':'100%','height':'100%'});
				}
				this.popBd.append(this.popTargetCtn);
			}

			if(this.options.buttons.length != 0){
				this.popFt = $('<div />').attr({'class':'mod_popup_ft'});
				for(var i = 0,len = this.options.buttons.length ; i < len ; i++){
						this.popFt.append($('<a href="javascript:;" class="pop_btn '+(this.options.buttons[i].extraClass ? this.options.buttons[i].extraClass : '')+'"><span>'+this.options.buttons[i].name+'</span></a>'));
				}
			}

			this.popContainer.append(this.popHd,this.popBd,this.popFt).appendTo('body');

		},


		_buttonsEventBind : function(){
			var that = this;
			var buttons = this.popFt.children();
			var handle;
			for(i=0, len = buttons.length ; i < len ; i++){
				handle = (typeof(this.options.buttons[i].handle) === 'function') ? this.options.buttons[i].handle : function(){that.close()};
				$(buttons[i]).bind('click',handle);
			}
		},

		_recenter : function(){
			if($(window).height() < this.popContainer.outerHeight()) {return false;};
			this.popContainer.css({
					top: $(window).scrollTop()+($(window).height()-this.popContainer.outerHeight())/2
			});
		},
		
		_dragEventBind: function(){
			var posX,posY;
			var that = this;
			this.popHd.css({'cursor':'move','-moz-user-select':'none','-webkit-user-select':'none'})
			.bind('selectstart',function(){
				return false;
			});
			this.popHd.find('h3').bind('mousedown',function(e){
				posX = e.pageX;
				posY = e.pageY;
				that.dragActive = true;
			});

			$(document).bind('mousemove',function(e){
				
				if(that.dragActive){
					var popX = that.popContainer.offset().left;
					var popY = that.popContainer.offset().top;
					that.popContainer.css({
						left : (that.popContainer.position().left + e.pageX - posX),
						top : (that.popContainer.position().top + e.pageY - posY)
					});
					posX = e.pageX ;
					posY = e.pageY ;
					
				}
			})
			.bind('mouseup',function(){
				that.dragActive = false;
			});
		},

		close : function(){
			var that = this;
			if(this.popTargetCtnOrigin){
				this.popTargetCtn.appendTo(this.popTargetCtnOrigin);
			}
			$(window).unbind('resize scroll',function(){
				that._recenter();
			});
			this.popContainer.fadeOut(50).remove();
			this.status = 0;
			if(this.onClose){
				this.onClose();
			}

			for(var i=Y.Popup._collection.length-1; i>=0; i--){
				if(!Y.Popup._collection[i].status){
					Y.Popup._collection.splice(i,1);
				}
			}

			if(Y.Popup._collection.length != 0){return false;}
			Y.Popup.mask.fadeOut(50);

		}

	};



	/*
		productPop function
	*/
	Y.productPop = function(el,type){
		var el,w,h,title,href;
		el = $(el);
		title = el.attr('title');
		href  = el.attr('href');
		if(type == 'try' && typeof(YS_LOGIN_INFO) !== 'undefined'){
			W.open(href);
			return false;
		}
		switch(type){
			case 'intention' :
				w = 650;
				h = 650;
				break;
			case 'try' :
				w = 500;
				h = 560;
				break;
			case 'buy' :
				w = 500;
				h = 500;
				break;
			default :
				w = 500;
				h = 500;
				break;
		}
		el.blur();
		new Y.Popup({title:title,content:{'iframe' : href},width:w,height:h});
	};

	/*
		openVideo function
	*/
	Y.openVideo = function(el,w,h){
		var el,w,h,title,href;
		el = $(el);
		title = el.attr('title');
		href  = el.attr('href');
		new Y.Popup({title:title,content:{'iframe' : href},width:w,height:h,movable:false});
		el.blur();
	};

	Y.openIM = function(){
			var url = "http://im.youshang.com/live800/chatClient/chatbox.jsp?companyID=10001&configID=11&enterurl="+encodeURIComponent("http://www.youshang.com/saas/");
			window.open(url,'chatbox73303','toolbar=0,scrollbars=0,location=0,height=450,width=577');
	};

	/*
		cookie
	*/
	Y.cookie = {
			set : function(key,val,h){
				if (h) {
					var date = new Date();
					date.setTime(date.getTime() + (h * 60 * 60 * 1000));
					var expires = "; expires=" + date.toGMTString();
				} else {
					var expires = '';
				}
				D.cookie = key + '=' + val + expires + "; path=/";
			},
			
			get : function(key){
					var n = key + '=';
					var ca = D.cookie.split(';');
					for (var i = 0; i < ca.length; i++) {
						var c = ca[i];
						while (c.charAt(0) == ' '){
							c = c.substring(1, c.length);
						}
						if (c.indexOf(n) == 0) {
							return c.substring(n.length, c.length);
						}
					}
					return null;
			},

			remove: function(key){
				this.set(key, '', -1);
			}
	}

	/*
		presale consult
	*/
	Y.createPresaleConsult = function(){
		var cls = 'presale_consult', hide_cls = 'presale_hide';
		var style = [
			'.', cls, ' .btn,.', cls, ' .way a,.', cls, ' .way span{background:url("http://images.youshang.com/resources/portal/v10/images/product/consult_spr.png") no-repeat;}',
			'.', cls, '{position:fixed;right:0;top:200px;box-shadow:-1px 0 2px rgba(0,0,0,0.19);}',
			'.', cls, ' .btn{display:block;width:100px;height:19px;background-position:-294px -78px;line-height:200px;overflow:hidden;}',
			'.', cls, ' .way{border-left:1px solid #c8d2d6;border-right:1px solid #c8d2d6;}',
			'.', cls, ' .way a,.', cls, ' .way span{display:block;width:98px;height:90px;border-bottom:1px solid #c8d2d6;line-height:200px;overflow:hidden;}',
			'.', cls, ' .way .qq{background-position:0 -90px;}',
			'.', cls, ' .way .phone{background-position:-98px -90px;}',
			'.', cls, ' .way .online{background-position:-196px -90px;}',
			'.', cls, ' .way :hover.qq{background-position:0 0;}',
			'.', cls, ' .way :hover.online{background-position:-196px 0;}',
			'.', hide_cls, '{box-shadow:none;}',
			'.', hide_cls, ' .btn{width:22px;height:78px;background-position:-294px 0;}',
			'.', hide_cls, ' .way{display:none;}'
		].join('');
		var html = [
			'<div class="', cls, '">',
				'<a href="#" class="btn" title="隐藏售前咨询">售前咨询</a>',
				'<div class="way">',
					'<a href="http://sighttp.qq.com/authd?IDKEY=21bd508186e515c15f00223f7b3700ea3c098156340443a1" class="qq" onclick="if(\'undefined\'!=typeof pageTracker){pageTracker._trackPageview(\'/product_presale_qq\');}" target="_blank">QQ鍞墠鍜ㄨ</a>',
					'<span class="phone">电话售前咨询4008-800-898</span>',
					'<a href="#" class="online" onclick="if(\'undefined\'!=typeof pageTracker){pageTracker._trackPageview(\'/website_presale_online\');}">鍦ㄧ嚎鍞墠鍜ㄨ</a>',
				'</div>',
			'</div>'
		].join('');
		$('<style type="text/css">' + style + '</style>').appendTo($('body'));
		$('body').append(html);

		//绑定事件
		var presale = $('.' + cls), btn = presale.find('.btn'), online = presale.find('.online');
		//展开/隐藏
		btn.toggle(function(){
			presale.addClass(hide_cls);
			return false;
		},function(){
			presale.removeClass(hide_cls);
			return false;
		});
		//在线售前咨询
		online.click(function(){
			Y.openIM();
			return false;
		});
		
		if(Y.isIE6){
			presale.css({'position' : 'absolute'});
			var top = parseInt(presale.css('top')), sty = presale[0].style, html = $('html')[0];
			html.style.backgroundImage = 'url(about:blank)';
			html.style.backgroundAttachment = 'fixed';
			sty.setExpression('top', 'eval((document.documentElement || document.body).scrollTop + ' + top + ') + "px"');
		}
	}

	W.YSL = Y;
})(jQuery);

function closeMincartMsgContainer(){
	$(".car_p_wrap").hide();
}

//鍒囨崲css鏍峰紡椋庢牸
(function($)
{
	$(document).ready(function() {
		$('.styleswitch').click(function()
		{
			switchStylestyle(this.getAttribute("rel"));
			return false;
		});
		var c = readCookie('style');
		if (c) switchStylestyle(c);
	});
	function switchStylestyle(styleName)
	{
		$('link[@rel*=style][title]').each(function(i) 
		{
			this.disabled = true;
			if (this.getAttribute('title') == styleName) this.disabled = false;
		});
		createCookie('style', styleName, 365);
	}
})(jQuery);


function createCookie(name,value,days)
{
	if (days)
	{
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}
function readCookie(name)
{
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++)
	{
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}
function eraseCookie(name)
{
	createCookie(name,"",-1);
}
// /cookie functions



    window.onload = function ()  
    {  
         var oWin = document.getElementById("drag");  
         var bDrag = false;  
         var disX = disY = 0;  
         oWin.onmousedown = function (event){    
              bDrag = true;  
              disX = event.clientX - oWin.offsetLeft;  
              disY = event.clientY - oWin.offsetTop;    
              return false  
             };  
     document.onmousemove = function (event){  
              if (!bDrag)  
               return;  
              var iL = event.clientX - disX;  
              var iT = event.clientY - disY;  
                
              var maxL = document.documentElement.clientWidth - oWin.offsetWidth;  
              var maxT = document.documentElement.clientHeight - oWin.offsetHeight;    
              iL = iL < 0 ? 0 : iL;  
              iL = iL > maxL ? maxL : iL;     
              iT = iT < 0 ? 0 : iT;  
              iT = iT > maxT ? maxT : iT;  
                
              oWin.style.marginTop = oWin.style.marginLeft = 0;  
              oWin.style.left = iL + "px";  
              oWin.style.top = iT + "px";    
              return false  
             };  
     document.onmouseup = function (){  
          bDrag = false;      
         };  
    };

/*搜索下拉提示*/
var proposals = ['a1','a2','a3','a4','b1','b2','b3','b4','c1','c2','c3','c4','d1','d2','d3','d4','e1','e2','e3','e4','f1','f2','f3','f4'];
$(document).ready(function(){
	$('#search-form').autocomplete({
		hints: proposals,
		width: 100,
		height: 25,
		onSubmit: function(text){
			$('#message').html('Selected: <b>' + text + '</b>');			
		}
	});
});
(function($) {
	$.fn.autocomplete = function(params) {
		//Selections
		var currentSelection = -1;
		var currentProposals = [];
		//Default parameters
		params = $.extend({
			hints: [],
			placeholder: 'Search',
			width: 200,
			height: 16,
			showButton: true,
			buttonText: '',
			onSubmit: function(text){},
			onBlur: function(){}
		}, params);
		//Build messagess
		this.each(function() {
			//Container
			var searchContainer = $('<div></div>')
				.addClass('autocomplete-container')
				//.css('height', params.height * 2);					
			//Text input		
			var input = $('<input type="text" autocomplete="off" name="query">')
				.attr('placeholder', params.placeholder)
				.addClass('autocomplete-input')
				.css({
					'width' : params.width,
					'height' : params.height
				});		
			if(params.showButton){
				input.css('border-radius', '3px 0 0 3px');
			}
			//Proposals
			var proposals = $('<div></div>')
				.addClass('proposal-box')
				.css('width', params.width + 30)
				.css('top', input.height() + 2);
			var proposalList = $('<ul></ul>')
				.addClass('proposal-list');
			proposals.append(proposalList);			
			input.keydown(function(e) {
				switch(e.which) {
					case 38: // Up arrow
					e.preventDefault();
					$('ul.proposal-list li').removeClass('selected');
					if((currentSelection - 1) >= 0){
						currentSelection--;
						$( "ul.proposal-list li:eq(" + currentSelection + ")" )
							.addClass('selected');
					} else {
						currentSelection = -1;
					}
					break;
					case 40: // Down arrow
					e.preventDefault();
					if((currentSelection + 1) < currentProposals.length){
						$('ul.proposal-list li').removeClass('selected');
						currentSelection++;
						$( "ul.proposal-list li:eq(" + currentSelection + ")" )
							.addClass('selected');
					}
					break;
					case 13: // Enter
						if(currentSelection > -1){
							var text = $( "ul.proposal-list li:eq(" + currentSelection + ")" ).html();
							input.val(text);
						}
						currentSelection = -1;
						proposalList.empty();
						params.onSubmit(input.val());
						break;
					case 27: // Esc button
						currentSelection = -1;
						proposalList.empty();
						input.val('');
						break;
				}
			});				
			input.bind("change paste keyup", function(e){
				if(e.which != 13 && e.which != 27 
						&& e.which != 38 && e.which != 40){				
					currentProposals = [];
					currentSelection = -1;
					proposalList.empty();
					if(input.val() != ''){
						var word = "^" + input.val() + ".*";
						proposalList.empty();
						for(var test in params.hints){
							if(params.hints[test].match(word)){
								currentProposals.push(params.hints[test]);	
								var element = $('<li></li>')
									.html(params.hints[test])
									.addClass('proposal')
									.click(function(){
										input.val($(this).html());
										proposalList.empty();
										params.onSubmit(input.val());
									})
									.mouseenter(function() {
										$(this).addClass('selected');
									})
									.mouseleave(function() {
										$(this).removeClass('selected');
									});
								proposalList.append(element);
							}
						}
					}
				}
			});			
			input.blur(function(e){
				currentSelection = -1;
				//proposalList.empty();
				params.onBlur();
			});			
			searchContainer.append(input);
			searchContainer.append(proposals);					
			if(params.showButton){
				//Search button
				var button = $('<span></span>')
					.addClass('autocomplete-button')
					.html(params.buttonText)
					.css({
						'height': params.height + 1,
						'line-height': params.height + 1 + 'px'
					})
					.click(function(){
						proposalList.empty();
						params.onSubmit(input.val());
					});
				searchContainer.append(button);	
			}
			$(this).append(searchContainer);	
			
			if(params.showButton){
				//Width fix
				searchContainer.css('width', params.width + button.width() + 10);
			}
		});
		return this;
	};
})(jQuery);























