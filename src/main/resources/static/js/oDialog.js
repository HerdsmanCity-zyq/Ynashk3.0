function Dialog() {
    var d = this.dialog = Dialog.prototype;
    
    d.Popup = null;

    //初始化
    d.init = function () {
        //執行頁面消息監聽事件
        if (!d.isModalDialog()) {
            d.addEventListener();
        }
    };

    /**
     * 後台系統彈窗
     * @param {String}      url             窗口地址
     * @param {Int}         width           窗口寬度
     * @param {Int}         height          窗口高度
     * @param {Boolean}     bScroll         窗口是否允許滾動條
     * @param {Function}    evt[可選]       窗口返回數據回調函數
     */
    d.show = function (url, width, height, bScroll, evt) {
        d.DialogCompleteEventName = evt;
        
        var scroll = (bScroll == false) ? "no" : "yes";
        var left = (window.screen.width - width) / 2;
        var top = (window.screen.height - height) / 2;

        if (d.isModalDialog()) {
            var returnValue = window.showModalDialog(url, '', 'dialogWidth:' + width + 'px;dialogHeight:' + height + 'px;dialogLeft:' + left + 'px;dialogTop:' + top + 'px;status:yes;edge:Sunken;scroll:' + scroll + ';help:no;resizable:no;');
            if (returnValue == null) {
                returnValue = window.returnValue;
            }
            window.returnValue = null;
            d.callback(returnValue);
        } else {
            if (d.Popup != null) {
                d.Popup.close();
            }
                        
            d.Popup = window.open(url, '', 'height=' + height + ',width=' + width + ',top=' + top + ',left=' + left + ',directories=no,toolbar=no,menubar=no,copyhistory=no,scrollbars=' + scroll + ',resizable=no,location=no,status=yes');
            if (d.Popup != null) {
                d.Popup.focus();
                //发送消息
                setTimeout(function () {
                    d.Popup.postMessage("", location.href.substring(0, location.href.lastIndexOf("/")));
                }, 600);
            }
        }
    };

    //子頁面處理完成后向父級頁面提交返回值
    d.sendMessage = function (returnValue) {
        console.info(returnValue);
        if (!d.isModalDialog() && window.opener != null) {
            window.opener.postMessage(returnValue,location.href.substring(0, location.href.lastIndexOf("/")));
        } else {
            window.returnValue = returnValue;
            if (window.opener != null) {
                window.opener.returnValue = returnValue;
            }
        }
        window.close();
    };
    //執行回調函數
    d.callback = function (returnValue) {
        if (typeof d.DialogCompleteEventName == "function") {
            d.DialogCompleteEventName(returnValue);
        }
    };

    //是否存在模态窗口
    d.isModalDialog = function () {
        if (typeof window.showModalDialog == "undefined") {
            return false;
        } else {
            return true;
        }
    };

    //定義頁面消息監聽事件
    d.addEventListener = function () {
        function onMessage() {
            d.callback(event.data);
        }
        if (typeof window.addEventListener != 'undefined') {
            window.addEventListener('message', onMessage, false);
        } else if (typeof window.attachEvent != 'undefined') {
            window.attachEvent('onmessage', onMessage);
        }
    };

    d.init();
}

var oDialog = new Dialog();