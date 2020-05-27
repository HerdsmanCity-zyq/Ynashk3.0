/**分页工具**/
function SamPageHelperCalculate(total, pageSize, pageNumber) {
    var isUseful = 0;
    var unUsefulParam = 0;
    if (isNaN(total)) {
        isUseful++;
        unUsefulParam = 1;
    }
    if (isNaN(pageSize)) {
        isUseful++;
        unUsefulParam = 2;
    }
    if (isNaN(pageNumber)) {
        isUseful++;
        unUsefulParam = 3;
    }
    if (isUseful > 1) {
        console.error("Insufficient paging parameters");
        return;
    }
    var res = [];
    switch (unUsefulParam) {
        case 1:
            total = pageSize * pageNumber;
            break;
        case 2:
            pageSize = Math.ceil(total / pageNumber) == 0 ? 20 : Math.ceil(total / pageNumber);
            break;
        case 3:
            pageNumber = Math.ceil(total / pageSize) == 0 ? 1 : Math.ceil(total / pageSize);
            break;
        default:
            break;
    }
    res.push(total);
    res.push(pageSize);
    res.push(pageNumber);
    return res;
};

var SamPageHelper = {
    appId: "null",
    total: 0,
    pageSize: 20,
    pageNumber: 0,
    currPage: 1,
    link: "null",
    language: "en",
    pageSizeArea: [],
    otherParams: {},
    requestType:"get"
};

SamPageHelper.resetNumber = function (total, pageSize, pageCurr, pageNumber) {
    var totalNode = document.getElementById("sam-data-total");
    var percentagePageNode = document.getElementById("sam-data-page-percentage");
    var pageSizeSelectNode = document.getElementById("sam-selected-page-size");

    totalNode.innerText = total;
    percentagePageNode.innerText = pageCurr + "/" + pageNumber;
    var pageArea = this.pageSizeArea;
    for (var i in pageArea) {
        if (pageSize == pageArea[i]) {
            pageSizeSelectNode.selectedIndex = i;
        }
    }
};
SamPageHelper.international = {en: {all: "all of",barRecord: "records",jumpTo: "jump to",page: "page",perPage: "per page",row: "rows"},zh_cn: {all: "共", barRecord: "条记录", jumpTo: "跳至", page: "页", perPage: "每页", row: "行"},zh_tw: {all: "共", barRecord: "條記錄", jumpTo: "跳至", page: "頁", perPage: "每頁", row: "行"}};
SamPageHelper.selectedLanguage = function (msg, lan) {
    if (typeof lan == "undefined" || lan == null) lan = this.language;
    lan = lan.toLowerCase();
    var res = this.international[lan][msg];
    if (res == null) {
        return msg;
    } else {
        return res
    }
};
SamPageHelper.generatePaginationBar = function () {
    var pNode = document.getElementById(this.appId);
    if (typeof pNode == "undefined" || pNode == null) {
        console.error("not have this node：" + this.appId);
        return;
    }
    var str1 = '<div style="height:32px;margin-top:15px;margin-bottom: 15px;">\n' +
        '       <span>' + this.selectedLanguage("all") + '</span>\n' +
        '       <span id="sam-data-total">' + this.total + '</span>\n' +
        '       <span style="margin-right:12px;">' + this.selectedLanguage("barRecord") + '&nbsp;</span>';
    var str2, str3, str4, str5, str6, str7;
    if (this.currPage == 1) {
        str2 = '<span><img id="sam-first-icon" src="' + this.basePath + '/samPageHelper/icon/first-disable.png" style="cursor: pointer;width:16px;height: 16px;" /></span>\n' +
            '    <span ><img id="sam-pre-icon" src="' + this.basePath + '/samPageHelper/icon/pre-disable.png" style="cursor: pointer;width:16px;height: 16px;" /></span>';
    } else {
        str2 = '<span><img id="sam-first-icon" src="' + this.basePath + '/samPageHelper/icon/first.png" style="cursor: pointer;width:16px;height: 16px;" /></span>\n' +
            '    <span ><img id="sam-pre-icon" src="' + this.basePath + '/samPageHelper/icon/pre.png" style="cursor: pointer;width:16px;height: 16px;" /></span>';
    }
    str3 = '<span id="sam-data-page-percentage" style="margin-left:14px;margin-right:14px;">' + this.currPage + '/' + this.pageNumber + '</span>';
    if (this.currPage == this.pageNumber) {
        str4 = '<span><img id="sam-next-icon" src="' + this.basePath + '/samPageHelper/icon/next-disable.png" style="cursor: pointer;width:16px;height: 16px;" /></span>\n' +
            '  <span><img id="sam-last-icon" src="' + this.basePath + '/samPageHelper/icon/last-disable.png" style="cursor: pointer;width:16px;height: 16px;" /></span>';
    } else {
        str4 = '<span><img id="sam-next-icon" src="' + this.basePath + '/samPageHelper/icon/next.png" style="cursor: pointer;width:16px;height: 16px;" /></span>\n' +
            '  <span><img id="sam-last-icon" src="' + this.basePath + '/samPageHelper/icon/last.png" style="cursor: pointer;width:16px;height: 16px;" /></span>';
    }
    str5 = '<span style="padding-left:12px;">' + this.selectedLanguage("jumpTo") + '</span>\n' +
        '  <input type="text" name="sam-jump-page" id="sam-jump-page"  style="width:36px;"/>\n' +
        '  <span>' + this.selectedLanguage("page") + '</span>\n' +
        '  <span>&nbsp;&nbsp;' + this.selectedLanguage("perPage") + '&nbsp;</span>';
    var selectOption = "";
    for (var i in this.pageSizeArea) {
        if (this.pageSize == this.pageSizeArea[i]) {
            selectOption += '<option value="' + this.pageSizeArea[i] + '" selected="true">' + this.pageSizeArea[i] + '</option>';
        } else {
            selectOption += '<option value="' + this.pageSizeArea[i] + '">' + this.pageSizeArea[i] + '</option>';
        }
    }
    str6 = '<select id="sam-selected-page-size" style="width:58px;">' + selectOption + '</select>';
    str7 = '<span>&nbsp;' + this.selectedLanguage("row") + '</span></div>';
    pNode.innerHTML = str1 + str2 + str3 + str4 + str5 + str6 + str7;
};
SamPageHelper.addListener = function (that) {
    var firstIconNode = document.getElementById("sam-first-icon");
    var preIconNode = document.getElementById("sam-pre-icon");
    var nextIconNode = document.getElementById("sam-next-icon");
    var lastIconNode = document.getElementById("sam-last-icon");
    var jumpInputNode = document.getElementById("sam-jump-page");
    var selectNode = document.getElementById("sam-selected-page-size");
    firstIconNode.addEventListener("click", function (e) {
        if (that.currPage > 1) {
            that.currPage = 1;
            firstIconNode.src = that.basePath + "/samPageHelper/icon/first-disable.png";
            preIconNode.src = that.basePath + "/samPageHelper/icon/pre-disable.png";
            if (that.pageNumber > 1 && lastIconNode.getAttribute("src").lastIndexOf("disable.png") != -1) {
                lastIconNode.src = that.basePath + "/samPageHelper/icon/last.png";
                nextIconNode.src = that.basePath + "/samPageHelper/icon/next.png";
            }
            that.sendRequest();
        }
        e.preventDefault();
    });
    preIconNode.addEventListener("click", function (e) {
        if (that.currPage > 1) {
            that.currPage--;
            if (that.currPage == 1) {
                firstIconNode.src = that.basePath + "/samPageHelper/icon/first-disable.png";
                preIconNode.src = that.basePath + "/samPageHelper/icon/pre-disable.png";
            }
            if (that.pageNumber > 1 && lastIconNode.getAttribute("src").lastIndexOf("disable.png") != -1) {
                lastIconNode.src = that.basePath + "/samPageHelper/icon/last.png";
                nextIconNode.src = that.basePath + "/samPageHelper/icon/next.png";
            }
            that.sendRequest();
        }
        e.preventDefault();
    });
    nextIconNode.addEventListener("click", function (e) {
        if (that.currPage < that.pageNumber) {
            that.currPage++;
            if (that.currPage == that.pageNumber) {
                lastIconNode.src = that.basePath + "/samPageHelper/icon/last-disable.png";
                nextIconNode.src = that.basePath + "/samPageHelper/icon/next-disable.png";
            }
            if (that.pageNumber > 1 && firstIconNode.getAttribute("src").lastIndexOf("disable.png") != -1) {
                firstIconNode.src = that.basePath + "/samPageHelper/icon/first.png";
                preIconNode.src = that.basePath + "/samPageHelper/icon/pre.png";
            }
            that.sendRequest();
        }
        e.preventDefault();
    });
    lastIconNode.addEventListener("click", function (e) {
        if (that.currPage < that.pageNumber) {
            that.currPage = that.pageNumber;
            lastIconNode.src = that.basePath + "/samPageHelper/icon/last-disable.png";
            nextIconNode.src = that.basePath + "/samPageHelper/icon/next-disable.png";
            if (that.pageNumber > 1 && firstIconNode.getAttribute("src").lastIndexOf("disable.png") != -1) {
                firstIconNode.src = that.basePath + "/samPageHelper/icon/first.png";
                preIconNode.src = that.basePath + "/samPageHelper/icon/pre.png";
            }
            that.sendRequest();
        }
        e.preventDefault();
    });
    jumpInputNode.addEventListener("keyup", function (e) {
        if (e.key == "Enter") {
            var num = e.target.value;
            if (!isNaN(num)) {
                if (num < 1 || num > that.pageNumber) {
                    console.log("input value is out of page number!");
                    return;
                }
                that.currPage = num;
                that.sendRequest();
            }
        }
        e.preventDefault();
    });
    selectNode.addEventListener("change", function (e) {
        that.pageSize = e.target.value;
        that.pageNumber = "un";
        that.pageCalculate();
        if(that.currPage > that.pageNumber){
            that.currPage = 1;
        }
        that.sendRequest();
    });
};
SamPageHelper.sendRequest = function () {
    if(typeof this.requestType=="undefined"||this.requestType.toLowerCase()=="get"){
        this.samGet();
    }else if(this.requestType.toLowerCase() == "post"){
        this.samPost();
    }
};
SamPageHelper.pageCalculate = function () {
    var res = SamPageHelperCalculate(this.total, this.pageSize, this.pageNumber);
    this.total = res[0];
    this.pageSize = res[1];
    this.pageNumber = res[2];
};
SamPageHelper.samGet = function(){
    var params = "?pageSize=" + this.pageSize + "&pageNo=" + this.currPage;
    if (typeof this.otherParams != "undefined" || this.otherParams != null) {
        for (var i in this.otherParams) {
            params += "&" + i + "=" + this.otherParams[x];
        }
    }
    window.location.href = this.link + params;
};
SamPageHelper.samPost = function() {
    var params;
    if (typeof this.otherParams != "undefined" || this.otherParams != null){
        params = this.otherParams;
        params.pageSize = this.pageSize;
        params.pageNo = this.currPage;
    }else{
        params = {pageSize:this.pageSize,pageNo:this.currPage};
    }
    var temp_form = document.createElement("form");
    temp_form .action = this.link;
    temp_form .target = "_self";
    temp_form .method = "post";
    temp_form .style.display = "none";
    for (var x in params) {
        var opt = document.createElement("input");
        opt.name = x;
        opt.value = params[x];
        temp_form .appendChild(opt);
    }
    document.body.appendChild(temp_form);
    temp_form .submit();
};
SamPageHelper.execute = function (option) {
    this.basePath = typeof option.basePath == "undefined" || option.basePath == null ? null : option.basePath;
    this.appId = typeof option.appId == "undefined" ? null : option.appId;
    if (this.basePath == null) {
        console.error("basePath param can not be null！");
        return;
    }
    if (this.appId == null) {
        console.error("appId param can not be null! ");
        return;
    }
    this.total = typeof option.total == "undefined" ? 0 : option.total;
    this.currPage = typeof option.currPage == "undefined" ? 1 : option.currPage;
    this.pageSize = typeof option.pageSize == "undefined" ? 20 : option.pageSize;
    this.pageNumber = typeof option.pageNumber == "undefined" ? "un" : option.pageNumber;
    this.link = typeof option.link == "undefined" ? null : option.link;
    this.language = typeof option.language == "undefined" ? "en" : option.language;
    this.pageSizeArea = typeof option.pageSizeArea == "undefined" ? [1, 2, 3, 4, 5, 10, 20, 30] : option.pageSizeArea;
    this.otherParams = option.otherParams;
    this.requestType = option.requestType;
    this.pageCalculate();
    this.generatePaginationBar();
    this.addListener(this);
    this.resetNumber(this.total, this.pageSize, this.currPage, this.pageNumber);
};

/**
 * use this method to paging
 * @param option
 */
function pageHelper(option) {
    SamPageHelper.execute(option);
}