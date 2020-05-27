//global initialization
function globalInit() {
	setTimeout(function(){showAlertMsg();},100);
}

//check whether error is found in div object "alertMsg"
//if errMsg is exist and contain error message
//then show alert
function showAlertMsg() {
  
  var alertMsg = document.getElementById("alertMsg");
  	 var text = $(alertMsg).text().replace(/^\s*/, "").replace(/\s*$/, "");
	  if (alertMsg != null && !isEmpty(text)) {
	  	 alert($.trim($(alertMsg).text().replace(/\n/g,"").replace(/<\/br>/g,"\r\n")));
	  }
 }
 
 //Change user input character to upper case
function changetoUpperCase(e) {
  if(e.keyCode >=97 && e.keyCode <= 122) {
    e.keyCode -= 32;
  }  
}

//Change user input character to lower case
function changetoLowerCase(e) {
  if(e.keyCode >=65 && e.keyCode <= 90) {
    e.keyCode += 32;
  }  
}
//This is used to filter some characters of XSS attack.
function validateXssVal(value){
	if(value.indexOf('<')>=0||value.indexOf('>')>=0){
		return false;
	}
	return true;
}

//
function clearFormValue(formId){
	$("#"+formId+" input[type='text']").val("");
	$("#"+formId+" input[type='password']").val("");
	$("#"+formId+" textarea").val("");
	$("#"+formId+" select option:first").attr("selected",true);
}
//
/*function setSelectP(selectId,inputId,inputValue){
	if(value!=undefined){
		$.ajax({
		    type:"post",
		    url:"linkageDemoAction.do",
		    data:{"action":"aaa","box":inputValue},
		    dataType:'JSON',
		    success:function(msg){
		    	allData = msg;
		    	document.getElementById(selectId).options.length=0; 
				for (var key in allData.parent){
					document.getElementById(selectId).options.add(new Option(allData.parent[key],key));
				}
		    }
		});
	}else{
		document.getElementById(selectId).options.length=0; 
		for (var key in allData.parent){
			document.getElementById(selectId).options.add(new Option(allData.parent[key],key));
		}
	}
}*/

function tabChanged(currDivId){
	 $(".tab_wrap ul li.selected").toggleClass("selected");
	 $("#"+currDivId).parent("a").parent("li").toggleClass("selected");
	 var id = $("#"+currDivId).attr("id");//.children("a").children("span")
	 $(".tab_panel div.insidePanel").each(function(){
	 	$(this).css("display","none");
	 });
	 $("#div_"+id).css("display","block");
}

$(function(){
	/*$(".tab_wrap ul li").click(function(){
		 
	});*/
	
	$(".menuLeft div").mouseover(function(){
		if($(this).attr("class")!="selectedStyle"){
			 $(this).removeClass("normalStyle");
			 $(this).addClass("hoverStyle");
		}
	});
	
	$(".menuLeft div").mouseout(function(){
		if($(this).attr("class")!="selectedStyle"){
			$(this).removeClass("hoverStyle");
			$(this).addClass("normalStyle");
		}
	});
	
	$(".menuLeft div").click(function(){
		 $(".menuLeft div").each(function(){
		 	if($(this).attr("class")=="selectedStyle"){
		 		$(this).removeClass("selectedStyle");
				$(this).addClass("normalStyle");
		 	}
		 });
		 $(this).removeClass("normalStyle");
		 $(this).removeClass("hoverStyle");
		 $(this).addClass("selectedStyle");
	});
});


//内容过长，用 ...表示
 function OmitText(table){
	 var tableInfo = "";
	 var count = 0;
	 table.each(function() {
	 $(this).find('tr').each(function () {  
	    $(this).find('td').each(function () { 
	          tableInfo = $(this).text().trim();
	          if(getByteLen(tableInfo)){
	              count = 32;
	          }else{
	              count = 20;
	          }
	          if(tableInfo.length>count){
	              $(this).text(tableInfo.substring(0, count)+"...");
	        }
	     });
	   });
    });
 }
 function OmitTextUpgrade(Table,obj){
	 var TRS = Table.find("tr");
	 var TDLength = TRS.eq(0).find("td").length;
	 for(var i=0;i<TRS.length;i++){
		 for(var k=0;k<TDLength;k++){
			if($.isFunction(obj)){
				var count = obj(k+1);
				OmitTextTDUpgrade( TRS.eq(i).find("td:nth-child("+(k+1)+")"),count);
			}else{
				OmitTextTDUpgrade( TRS.eq(i).find("td:nth-child("+(k+1)+")"),obj);
			}
		 }
	 }
 }
 function OmitTextTDUpgrade(TDS,MaxLength){
	 if($.type(MaxLength)!="number") throw "不是 数字";
	 for(var i=0;i<TDS.length;i++){
		 var text = TDS.eq(i).text().trim();
			 TDS.eq(i).text(OmitTextTextUpgrade(text,MaxLength));
	 }
 }
function OmitTextTextUpgrade(TEXT,MaxLength){
	 if($.type(MaxLength)!="number") throw "不是 数字";
	 if(MaxLength<TEXT.length)
		 return TEXT.substring(0,MaxLength)+"...";
	 return TEXT;
}
//得到字符串的字节长度
	function getByteLen(val) {
	    var len_en = 0;
	    var len_cn = 0;
	    for (var i = 0; i < val.length; i++) {
	        if (val[i].match(/[^\x00-\xff]/ig) != null) //全角
	            len_cn += 2;
	        else
	          len_en += 1;
	    };
	    return len_cn>len_en?false:true;
	}
	
    function removeElement(id){
    	if(!!window.ActiveXObject || "ActiveXObject" in window){
    		document.getElementById(""+id).removeNode(true);
    	}else{
    		document.getElementById(""+id).remove();
    	}
    	
    }
    
	function htmlEncode(value){
	    return $('<div/>').text(value).html();
	}

	function htmlDecode(value){
	    return $('<div/>').html(value).text();
	}
	
	
	//格式化数据 
	function fmoney(s, n) {
		s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
		if (isNaN(s) || ((s + "").replace(/\s/g, "")) == "") {
			return "";
		}
		//n = n >= 0 && n <= 20 ? n : 2;
		var l = s.split(".")[0].split("").reverse(), r = s.split(".")[1];
		t = "";
		for (i = 0; i < l.length; i++) {
			t += l[i]+ ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
		}
		return "$" + t.split("").reverse().join("") + "." + r;
	}
	//将字符串  ‘$123,456,789.01’ 装换成 ‘123456789.01’
	function unfmoney(s) {
		var l = 0;
		var w = 0;
		if (s.indexOf("$") > -1) {
			s = s.substr(1);
		}
		if (s.indexOf(".") > -1) {
			var ss = s.split(".");
			l = ss[0].split(",").join("");
			w = ss[1];
		} else {
			l = s.split(",").join("");
			return l;
		}
		return l + "." + w;
	}