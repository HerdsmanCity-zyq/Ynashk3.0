function showSelectItem(id){
	$("#box"+id).val($("#"+id+" option:selected").text());
}
//设置第一个下拉框

var allData ;
function setSelectP(value,dropdownId,el){
	showAllItems(dropdownId,el);
	var selectID = $(el).parent().find("select");
	if(value!=undefined&&value!=null&&value.trim()!=""){
		$(el).parent().find("div").css("display","block");
		selectID.empty();
		
		selectID.html(allData[dropdownId]);
		var options = new Array();
		var newOptions = new Array();
		selectID.find("option").each(function(i){
			options[i] = new Option($(this).text(),$(this).val());
		});
		var testOption ="";
		selectID.find("option").each(function(){
			if($(this).text().toUpperCase().indexOf(value.trim().toUpperCase())>=0){
				if($(this).attr("info") == undefined){
					testOption += "<option value=\"" + $(this).val() + "\">" + $(this).text() + "</option>";
				}else{
					var re = new RegExp("\"", "g");
					var str = $(this).attr("info");
					str  = str.replace(re, "'");
					testOption += "<option value=\""+$(this).val() +"\" info=\""+str+"\">" + $(this).text() + "</option>";
				}
			}
		});
		selectID.html(testOption);
		
		$(el).parent().find("div").css("display","none");
	}else{
		selectID.html(allData[dropdownId]);
	}
}

function selectDefault(value,dropdownId,el){
	if($.trim(value)==''||value.length==0){
		var boxID = $(el);
		var selectID = $(el).parent().find("select");
		
		selectID.html(allData[dropdownId]);
		selectID.find("option:first").attr("selected",true);
		boxID.val(selectID.find("option:selected").text());
	}
}


var isFocus = false;
function showAllItems(id,el){
	var boxID = $(el);
	var selectID = $(el).parent().find("select");
	//selectID.focus();
	boxID.on("blur",function(){isFocus=false;});
	boxID.on("focus",function(){isFocus=true;});
	boxID.on("keydown",function(){
		var keyCode = event.keyCode?event.keyCode:event.which?event.which :event.charCode;
		//window.console.info(keyCode+"  ??");
		if(keyCode==40){
			var _value = selectID.find("option").eq(0).attr("value");
			selectID.val(_value);
			showAllItems(id,el);
			selectID.focus();
		}
	});
	
	
	if((selectID.val()==0) && ((selectID.val()+"").indexOf(" ")>-1)&&isFocus){
		boxID.val("");
	}
	selectID.attr("multiple","multiple");
	var selectStyle = selectID.attr("DIYSelectWidth");
	selectID.attr("style","border:1px solid #ccc; display:block; height:250px; margin-top:24px; position:absolute; z-index:999; background:#fff; width:"+selectStyle);
	selectID.bind("keydown",function(){
		var keyCode = event.keyCode?event.keyCode:event.which?event.which :event.charCode;
	 	if(keyCode == 13){
	 		var text = selectID.children("option[value='"+$("#"+id).val()+"']").text();
	 		//window.console.info(text+" -- ");
	 		selectID.val(selectID.val());
	 		boxID.val(text);
	 		hideAllItems(id,el);
	 	}
	});
	
	selectID.bind("click",function(){
	 	hideAllItems(id,el);
	});
}

function hideAllItems(id,el){
	var selectID = $(el).parent().find("select");
	selectID.removeAttr("multiple");
	selectID.attr("style","display:none;height:30px;line-height:30px;");
	selectID.unbind("keydown");
	//selectID.unbind("click");
}

function showOrhide(id,el){
	if($(el).parent().parent().find("select").css("display")=="none"){
		showAllItems(id,$(el).parent());
		//$(el).parents("div").eq(0).find("select").focus();
	}else{
		$("#box"+id).blur();
		 hideAllItems(id,$(el).parent());
	}
}

/**
 *	下拉编辑框
 */
function changeInputBox(el){
   $(el).parent().find("input").val($(el).find("option:selected").text());
   var keyCode = event.keyCode?event.keyCode:event.which?event.which :event.charCode;
   if(keyCode ==13){
		$(el).attr("style","display:none;height:30px;line-height:30px;");
	}
}

$(function(){
	 allData = {"doctor_Code":$("#doctor_Code").html(),"department_Code":$("#department_Code").html(),"diagnosis_code":$("#diagnosis_code").html()};
	$("#boxdoctor_Code").val($("#doctor_Code").find("option:selected").text());
	$("#boxdepartment_Code").val($("#department_Code").find("option:selected").text());
	$("#boxdiagnosis_code").val($("#diagnosis_code").find("option:selected").text());
});