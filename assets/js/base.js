//时间戳转为几周前 几月前等
function getTimer(dateTimeStamp){
    var minute = 1000 * 60;
    var hour = minute * 60;
    var day = hour * 24;
    var week = day * 7;
    var month = day * 30;

    var now = new Date().getTime();//当前的时间戳
    var diffTime = now - dateTimeStamp;
    var result = null;
    var monthC =diffTime/month;
    var weekC =diffTime/(7*day);
    var dayC =diffTime/day;
    var hourC =diffTime/hour;
    var minC =diffTime/minute;

    if(diffTime < 0){
        console.log("返回时间戳不对！");
    }else if(monthC >= 1){
        if(monthC>=12){
            result = formatDateTime(dateTimeStamp)
        }else{
            result = parseInt(monthC) + "月前";
        }
    }else if(weekC >= 1){
        result = parseInt(weekC) + "周前";
    }else if(dayC >= 1){
        result =  parseInt(dayC) + "天前";
    }else if(hourC>= 1){
        result = parseInt(hourC) + "小时前";
    }else if(minC >= 1){
        result = parseInt(minC) + "分钟前";
    }else {
        result = "刚刚";
    }
    return result;
}

//时间戳转换日期 (yyyy-MM-dd HH:mm:ss)
function formatDateTime(timeValue,type) {
    var date = new Date(timeValue);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute = minute < 10 ? ('0' + minute) : minute;
    second = second < 10 ? ('0' + second) : second;
    if(type=='datatime'){
        return y + '-' + m + '-' + d + ' ' + h + ':' + minute;
    }else if(type=='noyear'){
        return m + '月' + d + '日  ' + h + ':' + minute;
    }
    else{
        return y + '-' + m + '-' + d ;
    }
}

//获取url参数
function getRequest() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for(var i = 0; i < strs.length; i ++) {
            theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}


function bb_confirm(title, content, btnLeft, btnRight, fn){
    var $dialog = $('#dlg_confirm');
    $dialog.fadeIn(200);
    $dialog.find('.weui-dialog__title').text(title);
    $dialog.find('.weui-dialog__bd').text(content);
    $dialog.find('.weui-dialog__btn_default').text(btnLeft || "放弃");
    $dialog.find('.weui-dialog__btn_primary').text(btnRight || "确认");
    $dialog.find('.weui-dialog__btn').one('click', function () {
        $dialog.fadeOut(200);
        if($.isFunction(fn)){
            fn($(this).hasClass('weui-dialog__btn_default')?"left":"right");
        }
    });
}

function bb_alert(content, btn, fn){
    var $dialog = $('#dlg_alert');
    $dialog.fadeIn(200);
    $dialog.find('.weui-dialog__bd').text(content);
    $dialog.find('.weui-dialog__btn_primary').text(btn || "知道了");
    $dialog.find('.weui-dialog__btn').one('click', function () {
        $dialog.fadeOut(200);
        if($.isFunction(fn)){
            fn();
        }
    });
}

function bb_toast(content){
    var $toast = $('#toast');
    $toast.find('.weui-toast__content').text(content || "已完成");
    if ($toast.css('display') != 'none') {
        return;
    }
    $toast.fadeIn(100);
    setTimeout(function () {
        $toast.fadeOut(100);
    }, 2000);
}

function getDataArr() {
    // 获取现在的日期
    var oDataArr = [];

    // 这个是获取今天的所有的日期
    var data = new Date();
    var year = data.getFullYear();
    var month = data.getMonth() + 1;
    var datas = data.getDate();

    // 这个是获取明天的日期
    var nextDate = new Date(data.getTime() + 24 * 60 * 60 * 1000);
    var nextyear = nextDate.getFullYear();
    var nextmonth = nextDate.getMonth() + 1;
    var nextdatas = nextDate.getDate();

    // 获取今天以后（1年减-天）的所有日期
    for (var i = 0; i <= 12; i++) {
        // 获取所有的月份
        var oDataMonth = month + i;

        // 获取这个月所有的天数
        var oMonthDate = new Date(year, oDataMonth, 0);
        var oMonth = oMonthDate.getMonth() + 1;
        var oMonthDatas = oMonthDate.getDate();

        // 判断月份
        if (oDataMonth == month) {
            for (var _i = datas; _i < oMonthDatas - datas; _i++) {
                var monthD = new Date(year, oDataMonth, _i);

                if (_i == datas) {
                    oDataArr.push('今天');
                } else if (monthD.getFullYear() == nextyear && monthD.getMonth() == nextmonth && monthD.getDate() == nextdatas) {
                    oDataArr.push('明天');
                } else {
                    oDataArr.push('' + oMonth + '月' + _i + '日');
                }
            }
        } else if (i == 12) {
            // console.log(oMonthDatas - datas);
            if (oMonthDatas - datas == 0) {
                return;
            } else {
                for (var _i2 = 1; _i2 < datas; _i2++) {
                    oDataArr.push('' + oMonth + '月' + _i2 + '日');
                }
            }
        } else {
            for (var _i3 = 1; _i3 <= oMonthDatas; _i3++) {
                var _monthD = new Date(year, oDataMonth, _i3);
                if (_monthD.getFullYear() == nextyear && _monthD.getMonth() == nextmonth && _monthD.getDate() == nextdatas) {
                    oDataArr.push('明天');
                } else {
                    oDataArr.push('' + oMonth + '月' + _i3 + '日');
                }
            }
        }
    }
    // console.log(JSON.stringify(oDataArr));
    return oDataArr;
}
//textarea 赋值后高度自适应
function autoHeight(elem){
    elem.style.height = 'auto';
    elem.scrollTop = 0; //防抖动
    if(elem.scrollHeight==38){//一行文字时
        elem.style.height='20px';
    }else{
        elem.style.height = elem.scrollHeight + 'px';
    }
}

