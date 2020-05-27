/*********************************************

  Replace '_' character to SPACE and

  replace the characters to lower case except

  the first character of string

*********************************************/

// IEMRABS: To check whether the email address contains @
function isValidEmail(s){
		var v_email = trim(s);
		
		if (v_email != ""){
			if (v_email.indexOf("@") == -1 || v_email.indexOf("@") == 0)
				return false;
			else if(v_email.indexOf(".") == -1 || v_email.indexOf(".") == v_email.length - 1)
				return false;
			else {
				if (v_email.substring(v_email.indexOf("@"), v_email.length).length==0)
					return false;
				else 
					return true;
			}
		}
		else
			return true;
	}	
//IEMRABS: To check the color value is valid
function isValidColor(s){
		var v_color = trim(s);
		var myRegExp =  /^#[0-9a-fA-F]{6}$/;
	    return (v_color==null) || (myRegExp.test(v_color));
	}


//IEMRABS: To check the acknowledgement code value is valid
function isValidAcknowledgementCode(s){
		var v_acknowledgementcode = trim(s);
		var myRegExp =  /^([0-9]{15})$/;
	    return myRegExp.test(v_acknowledgementcode);
	}	

//IEMRABS: To check the color value is valid
function isValidHKID(s){
		var v_hkid = trim(s);
		var myRegExp =  /^([a-zA-Z]{1,2})([0-9]{4})$/;
	    return myRegExp.test(v_hkid);
	}	
// IEMRABS: Check the string is NULL or not
function isEmpty(s) {
	var inputValue = trim(s);

	return ((s == null) || (inputValue.length == 0))

}
//IEMRABS: Check day
function isDay(year,month,day){
	if(!isNaN(day)){
		if(day<1||day>31){
			return false;
		}
		if((month==4||month==6||month==9||month==11)&&day==31){
			return false;
		}
		if(month==2){
			var isleap = (year%4==0&&(year%100!=0||year%400==0));
			if(day>29){
				return false;
			}
			if((day==29)&&(!isleap)){
				return false;
			}
		}
		return true;
	}else{
		return false;
	}
}


//IEMRABS: Check month
function isMonth(sText) {
	if(!isNaN(sText)&&sText.length==1){
		if(sText!="0")
			return true;
	}
	 var reg = /^0[1-9]|1[0-2]$/;
	 return ((sText==null) || (!isNaN(sText) && reg.test(sText)));
}

//IEMRABS: Check year
function isYear(sText) {
	if(sText.charAt(0)=="0")
		return false;
	 var reg = /^\d{4}$/;
	 return ((sText==null) || (!isNaN(sText) && reg.test(sText)));
}

// IEMRABS: Check postive integer with two decimal point
function isPositiveFloat2DP(sText) {
    var myRegExp = /^((\d+(\.\d{1,2})?)|((\d*\.)?\d{1,2}))$/;
    return ((sText==null) || (!isNaN(sText) && myRegExp.test(sText)));
}


// IEMRABS: Check the value is positive or negative integer
function IsInteger(sText) {

   var ValidChars = "0123456789-";
   var IsNumber=true;
   var Char;

   for (var i = 0; i < sText.length && IsNumber == true; i++)  {

      Char = sText.charAt(i);

      if (ValidChars.indexOf(Char) == -1)
         {
         IsNumber = false;
         }

      if (Char == "-" && i != 0)
         {
         IsNumber = false;
         }

   }

   return IsNumber;
}

//IEMRABS: Check the value is positive integer only ,and isn't 0

function isIntWithout0(sText) {
	// var reg = "^[0-9]*[1-9][0-9]*$";
	// return ((sText==null) || (!isNaN(sText) && reg.test(sText)));
	var flag = IsInt(sText);
	if(flag) {
		var Char;
		var flg=true;
		var number=0;
		for (var i = 0; i < sText.length&&flag; i++)  {
		      Char = sText.charAt(i);
		      if ("0"==Char) {
		    	  number+=1;
		      }else{
		    	  flg=false; 
		      }
		 }
		//alert(number);
		if(sText.length==number) {
			flag = false;
		}
	}
	return flag;
}

// IEMRABS: Check the value is positive integer only
function IsInt(sText) {

   var ValidChars = "0123456789";
   var IsNumber=true;
   var Char;

   for (var i = 0; i < sText.length && IsNumber == true; i++)  {

      Char = sText.charAt(i);

      if (ValidChars.indexOf(Char) == -1)
         {
         IsNumber = false;
         }
   }

   return IsNumber;
}

var reg=/^\d+$/;
/* heat text validation */
function isNum(heatid){
	
	var heat=document.getElementById(heatid);	 
		if(!reg.test(heat.value) && heat.value.length!=0){
			heat.value=""; 	     	     	
	     	return false;	     	
		}
		return true;	
}

// IEMRABS: Check the value is number
function isNumber(sText) {
   var ValidChars = "0123456789";	// LOK MODIFY
   var IsNum=true;
   var Char;

   for (var i = 0; i < sText.length && IsNum == true; i++)  {
      	Char = sText.charAt(i);

		if (ValidChars.indexOf(Char) == -1)	{
			IsNum = false;
		}
   	}

   return IsNum;

}

// IEMRABS: Check the value is valid string or not
function isChar(sText) {

   var myRegExp = /^[\w\'\~\!\@\$\^\&\*\(\)\+\-\=\[\]\{\}\:\;\<\>\,\.\/\?\s]*$/; //'regular expression pattern
   return myRegExp.test(sText); //return false if not match the pattern

}

//Check password
function checkPw(sText) {

	   var myRegExp = /^([A-Za-z@$%!()-_]+)\w*\d+\w*([A-Za-z@$%!()-_]+)$/; //'regular expression pattern
	   return myRegExp.test(sText); //return false if not match the pattern

}

function isConsecutive(sText){
	var i;
	for (i = 2; i < sText.length; i++){
		if(sText.charAt(i).charCodeAt() == (sText.charAt(i-1).charCodeAt())
				&& sText.charAt(i).charCodeAt() == (sText.charAt(i-2).charCodeAt())){
			return false;
		}
	}
	return true;
}

// Check date function depends on function "checkDateFormat"
// dateValue : the name of the date field being checked
// created by ivy
function isDate(dateValue)
{

    dateValue = trim(dateValue);
    
    //if (dateFormat.toUpperCase() == "DD/MM/YYYY" )
    	reg = /^[\d]{2}\/[\d]{2}\/[1-9]{1}[\d]{3}$/g ;
    //else
    //	reg = /^[\d]{1,2}\/[\d]{1,2}\/[1-9]{1}[\d]{3}$/g ;

    if (checkDateFormat(dateValue)){
      return true;
    }else {
      return false;
    }
}

function isDatetime(dateValue)
{

    dateValue = trim(dateValue);
    
    //if (dateFormat.toUpperCase() == "DD/MM/YYYY" )
    	reg = /^[\d]{2}\/[\d]{2}\/[1-9]{1}[\d]{3}$/g ;
    //else
    //	reg = /^[\d]{1,2}\/[\d]{1,2}\/[1-9]{1}[\d]{3}$/g ;

    if (checkDateFormat(dateValue)){
      return true;
    }else {
      return false;
    }
}

// SIRS: check if the format of the input date is the same as "dateFormat"
// inputDate : the name of the date field being checked
// created by ivy
function checkDateFormat(inputDate, reg){
	var i, chr;
	var day, mth, yr;
	var pos1, pos2;

// LOK DELETE
  if(isEmpty(inputDate))
    return true;
// LOK DELETE

	inputDate = inputDate.toString()

	if (inputDate.search(reg) >= 0 ) {
    pos1 = 2;
    pos2 = 5;
	} else
		return false;

		//if (dateFormat.toUpperCase() == "DD/MM/YYYY")
		//{
		  var s = inputDate.split(/\//);
			day = s[0];
			mth = s[1];
			yr = s[2];
		//}
		// other date format will be added here

		if (Number(mth)==1 || Number(mth)==3 || Number(mth)==5 || Number(mth)==7 || Number(mth)==8 || Number(mth)==10 || Number(mth)==12){
			if (Number(day) > 31 || Number(day) < 1)
				return false;
		}else if (Number(mth)==4 || Number(mth)==6 || Number(mth)==9 || Number(mth)==11){
			if (Number(day) > 30 || Number(day) < 1)
				return false;
		}else if (Number(mth)==2){
			if ((Number(yr) % 4) == 0) {
				if (Number(day) > 29 || Number(day) < 1)
					return false;
			}else{
				if (Number(day) > 28 || Number(day) < 1)
					return false;
			}
		}else{
			return false;
		}

	return true;
}


// SIRS: Trim space at the start and end of text
function trim(s) {

  while (s.substring(0,1) == ' ') {

    s = s.substring(1,s.length);

  }

  while (s.substring(s.length-1,s.length) == ' ') {

    s = s.substring(0,s.length-1);

  }

  return s;

}

//function ReloadParent(){

//	window.opener.document.location.reload();

//}

// IEMRABS: check if start date <= end date
function isValidDateRange(startDate, endDate) {
  if (isEmpty(startDate) || isEmpty(endDate))
    return true;

  var s = startDate.split(/\//);
  var day = s[0];
  var mth = s[1]-1;
  var yr = s[2];
  var dStartDate = new Date(yr, mth, day);

  s = endDate.split(/\//);
  day = s[0];
  mth = s[1]-1;
  yr = s[2];
  var dEndDate = new Date(yr, mth, day);

  if (dStartDate > dEndDate)
    return false;
  else
    return true;
}

//ASA: check if start date < end date by Anfield
function isSmallerDate(startDate, endDate) {
  if (isEmpty(startDate) || isEmpty(endDate))
    return true;

  var s = startDate.split(/\//);
  var day = s[0];
  var mth = s[1]-1;
  var yr = s[2];
  var dStartDate = new Date(yr, mth, day);

  s = endDate.split(/\//);
  day = s[0];
  mth = s[1]-1;
  yr = s[2];
  var dEndDate = new Date(yr, mth, day);

  if (dStartDate >= dEndDate)
    return false;
  else 
    return true;
}

// IEMRABS check for hkid
function validateHkid(hkid)
{
  hkid = trim(hkid).toUpperCase();

  //Removing embedded blanks
  //hkid = hkid.replace(/\s/gi, "");

  var l = hkid.length;
  var sHkid = "";

  //if length < 8 or > 9 return invalid
  if (l < 8 || l > 9) return false;

  //Checking for two alpha characters if length = 9
  if (hkid.substr(0,1).charCodeAt(0) < 65 || hkid.substr(0,1).charCodeAt(0) > 90)
    return false;

  if (l == 9) {
//    if (hkid.substr(1,1).charCodeAt(0) < 65 || hkid.substr(1,1).charCodeAt(0) >= 90)
    if (hkid.substr(1,1).charCodeAt(0) < 65 || hkid.substr(1,1).charCodeAt(0) > 90)
      return false;
  }

  //finding the position value of the first two alphabetic characters
  var sFirstStr=hkid.substr(0,1);
  var sSecondStr=hkid.substr(1,1);

  var iFirstChar = sFirstStr.charCodeAt(0) - 55
  var iSecondChar = sSecondStr.charCodeAt(0) - 55
  var iSum = 0;
  var iDigit = 0;
  var iPos = 0;

  if (l < 9) {
    iSum = iSum + 9*36;
    iSum = iSum + 8 *  iFirstChar;
    iPos = 1;
  } else if (l >= 9) {
    iSum = iSum + 9 * iFirstChar;
    iSum = iSum + 8 * iSecondChar;
    iPos = 2;
  }

  //finding the position for the other digits
  while (iPos<l-1) {
    //iDigit = eval(hkid.substr(iPos, 1));
    iDigit = parseInt(hkid.substr(iPos, 1),10);
    iSum = iSum + iDigit * (l - iPos);
    iPos++;
  }

  //Finding the remainder (modulo 11)
  var iRemain = 11 - iSum%11;

  var sCheckDigit="";

  if (iRemain < 10)
    sCheckDigit = iRemain.toString();
  else if (iRemain == 10)
    sCheckDigit = "A";
  else if (iRemain == 11)
    sCheckDigit = "0";

  //checking if the calculated check digit equal to last digit entered
  if (hkid.substr(l-1, 1) != sCheckDigit)
    //Invalid HKId
    return false;
  else
    //Valid HKID
    return true;

  return true;
}


// IEMRABS check for hkid
function validateHkidForCG(hkid, hkid_ind)
{
  hkid = trim(hkid).toUpperCase();

  //Removing embedded blanks
  //hkid = hkid.replace(/\s/gi, "");

  var l = hkid.length;
  var sHkid = "";
   // if length > 6 return invalid
   if (l > 6){
      //alert("1");
      return false;
   }
   //if hkid_ind != Y and length of hkid != 5 return invalid
   if (hkid_ind != 'Y')
   { 
       if (l != 5){
        //alert("2");
        return false;
       } 
   }
   //Checking for two alpha characters if length = 6 and hkid_ind = Y
   if (hkid_ind == 'Y')
  {
         //if hkid_ind = Y and length of hkid < 5 return invalid
         if (l < 5){ 
         // alert("3");
          return false;
         }     
         if (hkid.substr(0,1).charCodeAt(0) < 65 || hkid.substr(0,1).charCodeAt(0) > 90) {
            //alert("4");
            return false;
         }     
         if (l == 6) {
             if (hkid.substr(1,1).charCodeAt(0) < 65 || hkid.substr(1,1).charCodeAt(0) > 90) {
               //alert("5");
               return false;
             }  
             var temp = hkid.substr(2, 4);
             //alert("l == 6");
             //alert(temp);
             for (i = 0; i < temp.length; i++)
             {
                 // Check that current character is number
                 var c = temp.charAt(i);
                 if (!isDigit(c)) {
                   //alert("6");
                   return false;
                 }  
             }
             
        }
        if (l == 5) {
             var temp = hkid.substr(1, 4);
             //alert("l == 5");
             //alert(temp);
             for (i = 0; i < temp.length; i++)
             {
                 // Check that current character is number
                 var c = temp.charAt(i);
                 if (!isDigit(c)) {
                   //alert("7");
                   return false;
                 }  
             }
        }
        
           
       
  }
  return true;

}

// IEMRABS: Check the value is a valid time (eg.23:59)
function isTime(sText) {
   var s = sText.split(":");
   if (s.length!=2)return false;
   if (!IsInt(s[0]) ||!IsInt(s[1]) )return false;
   if (s[0]>23) return false;
   if (s[1]>59) return false;
   return true;
}

// added by Polly 22/04/2004
// check if employee over specified age
function isValidAge(date, age) {
   if (date == null) return true;
   if (isDate(date)==false) return false;

   var s = date.split(/\//);
   var day = s[0];
   var mth = s[1];
   var yr = s[2];

   yr = eval(s[2])+age;
   mth = eval(s[1])-1;
   var today = new Date();
   var dob = new Date(yr,mth,day);

   if (dob > today)
      return false;
   else
      return true;

   return true;
}

// IEMRABS: Returns true if character c is an English letter
// (A .. Z, a..z).
//
// NOTE: Need i18n version to support European characters.
// This could be tricky due to different character
// sets and orderings for various languages and platforms.
function isLetter (c)
{   return ( ((c >= "a") && (c <= "z")) || ((c >= "A") && (c <= "Z")) )
}

// IEMRABS: Returns true if character c is a space
function isSpace (c)
{   return (c == " ")
}

// IEMRABS: Returns true if character c is a digit
// (0 .. 9).
function isDigit (c)
{   return ((c >= "0") && (c <= "9"))
}

// SIRS: isAlphanumeric (STRING s [, BOOLEAN emptyOK])
//
// Returns true if string s is English letters
// (A .. Z, a..z) and numbers only.
//
// For explanation of optional argument emptyOK,
// see comments of function isInteger.
//
// NOTE: Need i18n version to support European characters.
// This could be tricky due to different character
// sets and orderings for various languages and platforms.
var defaultEmptyOK = false
function isAlphanumeric (s)

{   var i;

    if (isEmpty(s))
       if (isAlphanumeric.arguments.length == 1) return defaultEmptyOK;
       else return (isAlphanumeric.arguments[1] == true);

    // Search through string's characters one by one
    // until we find a non-alphanumeric character.
    // When we do, return false; if we don't, return true.

    for (i = 0; i < s.length; i++)
    {
        // Check that current character is number or letter or space.
        var c = s.charAt(i);

        if (! (isLetter(c) || isDigit(c) || isSpace(c) || isChar(s)) )
        return false;
    }

    // All characters are numbers or letters.
    return true;
}

// IEMRABS: Check carriage return key pressed
function isEnterPressed(e)
{
    var lvReturn = false;
  	if(e.keyCode == 13)
      lvReturn = true;
	return lvReturn;
}

// IEMRABS: Check text is a postive integer, a number value
function isPositiveInt(sText)
{
    if(!IsInteger(sText) || isNaN(parseInt(sText)) || parseInt(sText)<0)
    {
        return false;
    }
    return true;
}

// IEMRABS: Check text is longer than the specific maximum length
function isTextTooLong(sText, maxLen)
{
    var dataLength = sText.length;

    if(dataLength > maxLen)
    {
        return true;
    }
    return false;
}

// IEMRABS: Check positive Integer 
//only postive integer return true
//zero=1 mean not include zero
//zero!=1 mean include zero
function isPosIntByRegExp(inputValue, zero) {
  if (isNaN(inputValue))
    return false;
  inputValue = inputValue.toString()
  // check the input pattern
  if (zero != 1){
      if (inputValue == 0)
        return true;
      else {
              reg = /^[1-9][0-9]*$/g ;
              if (inputValue.search(reg) < 0 ) 
                return false;
              if (zero == 1)
                if (inputValue == 0)
                  return false;
              return true;        
          }
  } else {
            reg = /^[1-9][0-9]*$/g ;
            if (inputValue.search(reg) < 0 ) 
              return false;
            if (zero == 1)
              if (inputValue == 0)
                return false;
            return true;        
        }
}

// IEMRABS: Check positive number 
//postive integer return true
//postive float return true
//zero return true
function isPosFloatByRegExp(inputValue) {
  inputValue = trim(inputValue.toString());
  
  if (inputValue == "")
    return true;
  // check the input pattern
 // reg = /^[\d]{0,2}\.{0,1}[\d]$/ ;
 
 // Check Numeric Input
  reg = /^-{0,1}\d*\.{0,1}\d+$/;  
	if (inputValue.search(reg) < 0 ) 
      return false ;
      
 reg = /^[\d]{0,7}.{0,1}[\d]{0,2}$/g ;
	if (inputValue.search(reg) < 0 )   
    return false;  
  else
  {
    if (parseFloat(inputValue)>=10000000)
      return false
    else
      return true;
  }
}

/* IEMRABS [Polly Sze] : validate string length in utf8 format
 * pStr: string OBJECT to be validate
 * pLen: max length
 * pFieldName: field name uses in alert msg
 */
function validateLength(pStrObj, pLen, pFieldName) {
  if (getUTF8Len(pStrObj.value) > pLen) {
    alert("Too long '" + pFieldName + "' . Limit: " + pLen + " char(s). (Each chinese counts for 2 chars.)");
    pStrObj.focus();
    return false;
  }
  return true;
}

function checkLen(obj, maxlength)
{
	if (obj.value.length > maxlength)
		obj.value = obj.value.substring(0,maxlength);
}

function checkIllegalChar(value){
	var reg = />|<|%/i;
	value = $.trim(value);
	if(reg.test(value)){
		return true;//exist illegal char
	}else{
		return false;//pass validation
	}
}
//liu.dun start
//IEMRABS: To check the color value is valid
function isAlphabet(s){
		var v_hkid = trim(s);
		var myRegExp =  /^([a-zA-Z]+)$/;
	    return myRegExp.test(v_hkid);
	}
//end		

//Guochao.Jiang start

///暂存在浏览器 JSON
var JSONWidth={};

/**
* 
* @param path
* 		image url
*/
function getImage(path){
	if(JSONWidth[path] == undefined || JSONWidth[path] == null){
		JSONWidth[path]={"width":-1,"height":-1,image:new Image()};
	}
	var data = new Date();
	for(var JSONObject in JSONWidth){
		//防止缓存
		JSONWidth[JSONObject].image.src = path+"?"+data.getTime();
	}
}
/**
*  Get photo size
*/
function getWidthAndHeight(){
	for(var path in JSONWidth){
		var JSONObjectPath = JSONWidth[path];
		JSONObjectPath.width = JSONObjectPath.image.width;
		JSONObjectPath.height = JSONObjectPath.image.height;
		JSONWidth[path] = JSONObjectPath;
	}
}

/**
*  validate Image
* @param path
* 		image url 
* @param isThumbail
* 		Whether for thumbnails 	true false
* @param Name
* 		Prompt the text frame's name
* @returns
* 		Verify the image size ,Through the is “”
*/
function validateImage(path,isThumbail,Name){
	var WidAndHei = JSONWidth[path];
	if(isThumbail){
		if(WidAndHei.width==-1 && WidAndHei.height==-1){
			message = "";
		}else{
			if(WidAndHei.width==270 && WidAndHei.height==270){
				message="";
			}else{
				message = Name+"： <s:text name='brndingMaintenance.forUploadMedia.vaildateImagesize'/>\r\t";
			}
		}
	}else{
		if(WidAndHei.width==-1 && WidAndHei.height==-1){
			message = "";
		}else{
			if(WidAndHei.width==600 && WidAndHei.height==300){
				message = "";
			}else{
				message = Name+"： <s:text name='brndingMaintenance.forUploadMedia.vaildateImagesize'/>\r\t";
			}
		}
	}
  return message;
}

/**
* 
* @param callback
* 		 function name
*/
function getImageValidate(callback){
	window.setInterval(callback, 100);
	window.setInterval(getWidthAndHeight, 200);
}
//檢查英文和數字混合
function checkItemEng(s){
    var numExp = /^[0-9]+$/;
    if (numExp.test(s)) {
        return true;
    }
    var myRegExp =  /^[a-zA-z0-9][\sa-zA-z0-9]+$/;
    return myRegExp.test(s);
}


function checkChinese(val) {
    var rule = /[\u4e00-\u9fa5]+/;
    return !rule.test(val);
}

//可以英文和數字混合
function checkNumEnglish(val){
    var rule = /^[A-Za-z0-9]*$/;
    return rule.test(val);
}
