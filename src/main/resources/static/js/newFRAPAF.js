//监听framework选项更改版本下拉信息
$('input:radio[name="frameworkId"]').click(function () {
    var i = $('input:radio[name="frameworkId"]:checked').val();
    var va = $('#framework' + i).text();


    setVersions(i);
})
//阻止doc点击事件冒泡
function todownloadFile(){
    window.event.cancelBubble = true;
}
function openPafDoc() {
    $('#PafVsdFile').click();
}
function pafOnChange(Tag) {
    var value1;
    if ($(Tag).val() != "") {
        value1 = $(Tag).val()
        $('#newVisio').val(value1)
    }

}
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


function editFRA(){
    $(".wrapper").addClass('hidden');
    $("#editFRA").addClass('hidden');
}

function CloseversionDiv(){
    $("#versionDiv").addClass("hidden");
}