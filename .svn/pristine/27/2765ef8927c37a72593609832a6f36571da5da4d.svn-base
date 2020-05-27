//监听framework选项更改版本下拉信息
$('input:radio[name="frameworkId"]').click(function () {
    var i = $('input:radio[name="frameworkId"]:checked').val();
    var va = $('#framework' + i).text();


    setVersions(i);
})

/**
 *
 * */
function changCustomer(){
    var selectValue = $("#newPafProject").val()
    if (selectValue !== "0"){
        var info = $("#newPafProject").find("option:selected").attr("info");
        if (info != undefined){
            var jsonObj = JSON.parse(info);

            $("#customerName").val(jsonObj.customerName);
            $("#newPafCustomer").val(jsonObj.customerId);
        }
    }else{
        $("#customerName").val('');
        $("#newPafCustomer").val('');
    }

}

//获取详情信息赋值
function changPageValue(data,attachmentData,visioName){

    $("#newPafNo").val(data.pafId);
    $('input:radio[name="frameworkId"][value="'+data.frameworkId+'"]').attr("checked","checked");
    $('#versionsId').val(data.versionsId);
    $('#newPafName').val(data.pafNameChi);
    $('#newPafEnName').val(data.pafName);
    $('#newPafBpwinNo').val(data.bpwinNo);
    $('#newPafRemarks').val(data.pafRemarksId);
    $('#pafStatus').val(data.pafStatusVo.statusNameChi);
    $("#SA").val(data.sa);
    if (visioName != undefined){
        $('#newPafDocument').val(visioName.visioName);
    }

    $('input:radio[name="isPublic"][value="'+data.isPublic+'"]').attr("checked","checked");
    $('#newPafProject').find("option[value="+data.projectId+"]").attr("selected",true);
    $('#newPafProject').trigger("onchange");

    if (attachmentData != undefined){
        tablePlan.toShowData("table_tbody",attachmentData,tablePlan.tab_TR);
    }
}



//阻止doc点击事件冒泡
function todownloadFile(){
    window.event.cancelBubble = true;


}



//监听vsd下载按钮事件
$('#downVsd').click(function () {
    var pafId = $('#newPafNo').val();
    var frameworkId = $('input:radio[name="frameworkId"]:checked').val();
    var versionsId = $('#versionsId').val();

    var jsondata = {
        "pafId": pafId,
        "frameworkId": frameworkId,
        "versionsId": versionsId
    }
    var downUrl = '${basePath}newPAF.do?action=downloadFile&pafId=' + pafId
        + '&frameworkId=' + frameworkId + '&versionsId=' + versionsId;
    $.ajax({
        url: "${basePath}newPAF.do?action=checkDownload",
        dataType: "json",//预期服务器返回的类型c
        type: 'post',
        contentType: "application/json",
        data: JSON.stringify(jsondata),
        success: function (data) {
            if (data.code == 200) {


                $('#downVsd2').attr('href', downUrl);
                $('#downVsd2')[0].click();
            } else {
                alert(data.msg);
            }

        },
        error: function () {

        }
    });
})

//version联动事件
function setVersions(i) {

    $.ajax({
        url: "${basePath}newPAF.do?action=getFrameworkVersion",
        dataType: "json",//预期服务器返回的类型c
        type: 'post',
        contentType: "application/json",
        data: JSON.stringify({"frameworkId": i}),
        success: function (data) {
            var html;
            if (data.data.length > 0) {

                for (var j = 0; j < data.data.length; j++) {
                    var h ;
                    if (j == (data.data.length - 1)){
                        h = "<option value='" + data.data[j].versionsId + "' selected>" + data.data[j].versionsNum + "</option>";
                    } else {
                        h= "<option value='" + data.data[j].versionsId + "' >" + data.data[j].versionsNum + "</option>";
                    }
                    html = html + h;
                }

            }
            $('#versionsId option').remove();
            if (html != undefined) {
                $('#versionsId').append(html);
            }

        },
        error: function () {

        }
    });

}


function openPafDoc() {
    $('#PafVsdFile').click();
}

function pafOnChange(Tag) {
    var value1;
    if ($(Tag).val() != "") {
        value1 = $(Tag).val()
        $('#newPafDocument').val(value1)
    }

}
//监听vsd文档上传按钮点击事件，上传vsd
$('#newPafUploadVsd').click(
    function () {
        var formData = new FormData();
        var file = $('#PafVsdFile').get(0).files[0];
        var pafId = $('#newPafNo').val();
        var frameworkId = $('input:radio[name="frameworkId"]:checked').val();
        var versionsId = $('#versionsId').val();
        formData.append("visioFile", file);
        formData.append("versionsId", versionsId);
        formData.append("frameworkId", frameworkId);
        formData.append("pafId", pafId);

        if ("undefined" != typeof(file) && file != null && file != "") {
            $.ajax({
                url: '${basePath}newPAF.do?action=uploadPafVsb',
                type: 'POST',
                data: formData,
                cache: false,
                contentType: false, //不设置内容类型
                processData: false, //不处理数据
                success: function (data) {
                    if (data.code === 200) {
                        $('#newPafDocument').val(data.data);
                        $('#PafVsdFile').val('')
                        alert(data.msg);

                    } else {
                        alert(data.msg);
                    }
                },
                error: function () {

                }
            })
        } else {
            alert("请选择上传文件")
        }
    }
);

//保存visio 文档按钮
function saveVisioDocument() {
}

function updatePafStatus(){

}

function validateUpload() {
    var message = "";
    $("#file_tab").find("tr:not(:last)").each(function () {

        if (isEmpty($(this).find("input[name *='doc_name']").val())) {
            message += "文件名稱不能為空!\n";
        }
        if (isEmpty($(this).find("input[name *='doc_desc']").val())) {
            message += "內容描述不能為空!\n";
        }
        if (message != "") {
            return false;
        }

    })
    return message;
}
