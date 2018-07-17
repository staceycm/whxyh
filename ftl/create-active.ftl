<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
	charset="utf-8">
<title>${title}</title>
<link rel="stylesheet" type="text/css"
	href="${req.contextPath}/assets/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="${req.contextPath}/assets/css/weui.css">
<link rel="stylesheet" type="text/css"
	href="${req.contextPath}/assets/css/w-reset.css">
<link rel="stylesheet" type="text/css"
	href="${req.contextPath}/assets/font/iconfont.css">
<link rel="stylesheet" type="text/css"
	href="${req.contextPath}/assets/plugin/mobileSelect/mobileSelect.css">

<script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
<script
	src="${req.contextPath}/assets/plugin/mobileSelect/mobileSelect.min.js"></script>
<script src="${req.contextPath}/assets/js/base.js"></script>
</head>
<body>
	<!--BEGIN dlg_confirm-->
	<div id="dlg_confirm" style="display: none;">
		<div class="weui-mask"></div>
		<div class="weui-dialog">
			<div class="weui-dialog__hd">
				<strong class="weui-dialog__title">弹窗标题</strong>
			</div>
			<div class="weui-dialog__bd">弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内</div>
			<div class="weui-dialog__ft">
				<a href="javascript:;"
					class="weui-dialog__btn weui-dialog__btn_default">辅助操作</a> <a
					href="javascript:;"
					class="weui-dialog__btn weui-dialog__btn_primary">主操作</a>
			</div>
		</div>
	</div>
	<!--END dlg_confirm-->
	<!--BEGIN dlg_alert-->
	<div id="dlg_alert" style="display: none;">
		<div class="weui-mask"></div>
		<div class="weui-dialog">
			<div class="weui-dialog__bd">内容部分。</div>
			<div class="weui-dialog__ft">
				<a href="javascript:;"
					class="weui-dialog__btn weui-dialog__btn_primary">知道了</a>
			</div>
		</div>
	</div>
	<!--END dlg_alert-->

	<!--BEGIN toast-->
	<div id="toast" style="display: none;">
		<div class="weui-mask_transparent"></div>
		<div class="weui-toast">
			<i class="weui-icon-success-no-circle weui-icon_toast"></i>
			<p class="weui-toast__content">已完成</p>
		</div>
	</div>
	<!--END toast-->
	<div id="container">
		<div class="page_bd page-create-active">
			<div class="active-cover" style="margin-top: 1px;">
				<input type="text" value="点击设置活动名称" name="name" class="act-name">
				<span class="choosefile-click">编辑封面</span>
				<form id="uploadForm">
					<input type="text" name="filename" value=""
						style="opacity: 0; position: absolute; display: none"> <input
						id="choosefile-img" class="choosefile-up" name="file" type="file"
						style="opacity: 0; position: absolute; display: none">
				</form>
			</div>
			<form id="form" method="post">
				<div class="weui-cells weui-cells_form">
					<div class="weui-cell">
						<div class="weui-cell__hd">
							<label class="weui-label">活动时间</label>
						</div>
						<div class="weui-cell__bd">
							<input name="actTime" id="actTime" type="text" value=""
								class="weui-input" placeholder="请选择"> <input
								name="actStrTime" id="actStrTime" type="hidden" value=""
								class="weui-input" placeholder="请选择"> <input
								name="actEndTime" id="actEndTime" type="hidden" value=""
								class="weui-input" placeholder="请选择"> <i
								class="select-icon"></i>
						</div>
					</div>
					<div class="weui-cell">
						<div class="weui-cell__hd">
							<label class="weui-label">报名时间</label>
						</div>
						<div class="weui-cell__bd">
							<input name="regTime" id="regTime" type="text" value=""
								class="weui-input" placeholder="请选择"> <input
								name="regStrTime" id="regStrTime" type="hidden" value=""
								class="weui-input" placeholder="请选择"> <input
								name="regExpTime" id="regExpTime" type="hidden" value=""
								class="weui-input" placeholder="请选择"> <i
								class="select-icon"></i>
						</div>
					</div>
					<div class="weui-cell">
						<div class="weui-cell__hd">
							<label class="weui-label">限制人数</label>
						</div>
						<div class="weui-cell__bd">
							<input name="limitNum" type="number" value="" class="weui-input"
								placeholder="请输入数字">
						</div>
					</div>
					<div class="weui-cell">
						<div class="weui-cell__hd">
							<label class="weui-label">活动地址</label>
						</div>
						<div class="weui-cell__bd">
							<input name="actAddr" value="" class="weui-input"
								placeholder="请填写活动地址">
						</div>
					</div>
					<div class="weui-cell">
						<div class="weui-cell__hd">
							<label class="weui-label">活动联系人</label>
						</div>
						<div class="weui-cell__bd">
							<input name="act_linkman" value="" class="weui-input"
								placeholder="请填写活动联系人">
						</div>
					</div>
					<div class="weui-cell">
						<div class="weui-cell__hd">
							<label class="weui-label">联系人电话</label>
						</div>
						<div class="weui-cell__bd">
							<input value="" name="contact_cell" class="weui-input" type="tel"
								placeholder="请填写联系人电话">
						</div>
					</div>
					<div class="weui-cell weui-cell-flex-start">
						<div class="weui-cell__hd">
							<label class="weui-label">活动简介</label>
						</div>
						<div class="weui-cell__bd">
							<textarea name="act_abstract" class="weui-textarea"
								placeholder="请填写活动简介" rows="4"></textarea>
						</div>
					</div>
					<div class="weui-cell weui-cell-flex-start">
						<div class="weui-cell__hd">
							<label class="weui-label">活动安排</label>
						</div>
						<div class="weui-cell__bd">
							<textarea name="act_plan" class="weui-textarea"
								placeholder="如 14:00~14:30 集合地点签到" rows="4"></textarea>
						</div>
					</div>
					<div class="weui-cell weui-cell-flex-start">
						<div class="weui-cell__hd">
							<label class="weui-label">活动分会</label>
						</div>
						<div class="weui-cell__bd">
							<textarea readonly="readonly" name="ts_fhId"
								class="weui-textarea" id="ts_fhId" placeholder="请选择"
								style="width: 90%"></textarea>
							<i class="select-icon"></i>
						</div>
					</div>
				</div>
				<div class="weui-btn-area">
					<a class="weui-btn weui-btn_lose" href="javascript:;"
						id="btn_cancel">取消</a> <a class="weui-btn weui-btn_primary"
						href="javascript:;" id="btn_pub">发布</a>
				</div>
			</form>
		</div>
	</div>
	<div class="fh-modal">
		<ul class="fh-modal-list"></ul>
		<a class="weui-btn weui-btn_primary" href="javascript:;"
			id="btn_fh_pub">确定</a>
	</div>
</body>
<script>
$(function(){
    var actText='',regText='', fhData={};
    var obj = {
              name:""    ,// 活动名称
              limitNum:"" ,//活动限制人数
              act_plan:"" ,//    活动计划     中间用“|”分割
              img_url:"" ,//图片链接
              actAddr:"" ,// 活动地点
              contact_cell:"" ,// 联系电话
              act_abstract:"" ,//活动简介
              act_linkman:"" ,// 活动联系人
              regExpTime:"" ,//  活动报名截止时间  linux时间戳
              regStrTime:"" ,//  活动报名开始时间  linux时间戳
              actStrTime:"" ,//  活动开始时间      linux时间戳
              actEndTime:"" ,//  活动结束时间      linux时间戳
              ts_fhId:''//活动分会 id字符串 逗号分隔
          }
    var role='total' ;//total总分会管理员 part 分会管理员 请用el表达式替换
    var type='${type}';//publish 或者是 edit 用el表达式替换
    var colArr=['#f5b8b8','#ff9393','#85aff0','#b9d784','#ffc549',
                      '#f0a786','#89c9fe','#bfa0ee','#e5c144','#75cc81',
                      '#5bd0d5','#ff9157','#4eb3f1','#ff8e85','#e0ce9d',
                      '#ffb8eb','#9dc4ff','#8fdc6b','#f5b8b8','#ff9393',
                      '#85aff0','#b9d784','#ffc549','#f0a786','#89c9fe',
                      '#bfa0ee','#e5c144','#75cc81','#5bd0d5','#ff9157',
                      '#4eb3f1','#ff8e85','#e0ce9d','#ffb8eb','#9dc4ff','#8fdc6b']

    //所有分会列表获取
    function getFenHui(){
          var fhUrl = '${req.contextPath}/we/admin/getCha'
          if(type=='edit'){fhUrl='${req.contextPath}/we/admin/getCha?act_id=${actId}'}//用el替换
          var fhIdStr='';//发布页面的活动分会默认值
          var fhHtml='',clickHtml='';
          $.ajax({url:fhUrl,type:'post',success:
               function(d){
                    if(d.code==0){
                        d.data.forEach(function(item,idx){
                            var firstLeter = item.jc_name.substr(0,1);
                            var className='',checked=""
                            fhData[item.id]={};
                            fhData[item.id].id=item.id;
                            fhData[item.id].jc_name= item.jc_name;
                            fhData[item.id].firstLeter= firstLeter;
                            fhData[item.id].checkboxed=item.checkboxed;   //有无被选中状态  0 未被选中 1 默认选中 2人为选中
                            if(item.checkboxed==1){
                                fhIdStr+=item.id+',';
                                if(role=='part'){
                                    className='default';//分会管理员默认的活动分会 不可移除 总会管理员默认全部分会 可移除 但至少选择一个
                                    clickHtml = 'onclick="return false;"'
                                }
                                checked="checked"
                            }else if(item.checkboxed==2){
                                checked="checked"
                            }
                            fhHtml+='<li >'+
                                     '    <div class="tool-checkbox '+className+'">\n'+
                                     '        <span>\n'+
                                     '            <input type="checkbox" name="fh-item" id="'+item.id+'" data-fhid="'+item.id+'" class="input-checkbox" '+clickHtml+' '+checked+' >\n'+
                                     '            <label for="'+item.id+'"></label>\n'+
                                     '        </span>\n'+
                                     '        <span class="first-word" style="background: '+colArr[idx]+'">'+firstLeter+'</span>\n'+
                                     '        <span>'+item.jc_name+'</span>\n'+
                                     '    </div>\n'+
                                     '</li>';
                        })
                        $('.fh-modal-list').append(fhHtml);
                        console.log(fhData);
                        fhIdStr = fhIdStr.substring(0,fhIdStr.length-1);//生成默认的ts_fhId字符串 用，分割
                        console.log(fhIdStr);
                        if(type=='publish'){//如果是发布状态 直接拼默认选中的分会
                            obj.ts_fhId=fhIdStr;
                            $('textarea[name="ts_fhId"]').val(getFhName(fhIdStr));
                            autoHeight(document.getElementById('ts_fhId'))//每次赋值都重新计算容器高度
                        }
                        init();
                    }
               }})
    }
    //页面初始化
    function init(){
         initDate();
         if(type=='edit'){
             //编辑情况获取活动详情
             var detailUrl = '${req.contextPath}/we/act/details_json?act_id=${actId}';//请用el替换
             obj.id ='${actId}';//请用el替换
             $.ajax({url:detailUrl,type:'post',success:function(d){
                 if(d.code==0){
                     obj=d.data;
                     fillHtml();
                 }
             }})
         }
     }

    // 将分会ID串变成分会名称串
    function getFhName(str){
        var arr = str.split(',');
        var result=''
        arr.forEach(function(item,idx){
            result+=fhData[item].jc_name+' ,'
        })
        result = result.substring(0,result.length-1);
        return result;
     }
    //初始化日期选择器
    function initDate(){
             var dArr = getDataArr();
             var hArr = ['0点','1点','2点','3点','4点','5点','6点','7点','8点','9点','10点','11点','12点','13点','14点','15点','16点','17点','18点','19点','20点','21点','22点','23点'];
             var mArr = ['00分','10分','20分','30分','40分','50分'];
             var actStrSelect = new MobileSelect({
                 trigger: '#actTime',
                 title: '活动开始时间',
                 ensureBtnText:'下一步',
                 wheels: [{data: dArr},{data: hArr},{data: mArr}],
                 position:[0, 0, 0],
                 callback:function(indexArr, data){
                     obj.actStrTime = getTimeStamp(data);
                     $('#actStrTime').val(obj.actStrTime);
                     actText=formatDateTime(obj.actStrTime,'noyear');
                     $('#actTime').val(actText);
                     $('#actEndTime').trigger('click');
                 }
             });
             var actEndSelect = new MobileSelect({
                 trigger: '#actEndTime',
                 title: '活动结束时间',
                 wheels: [{data: dArr},{data: hArr},{data: mArr}],
                 position:[0, 0, 0],
                 callback:function(indexArr, data){
                     obj.actEndTime = getTimeStamp(data);
                     if(obj.actEndTime<=obj.actStrTime){
                         bb_alert('活动开始时间不能晚于结束时间','知道了',function(){
                              actText='';obj.actStrTime='';obj.actEndTime='';
                              $('#actTime').val(actText).trigger('click');
                         });
                     }else{
                          actText=actText + ' ~ '+ formatDateTime(obj.actEndTime,'noyear');
                          $('#actTime').val(actText);
                          $('#actEndTime').val(obj.actEndTime);
                     }
                 }
             });
             var regStrSelect = new MobileSelect({
                 trigger: '#regTime',
                 title: '报名开始时间',
                 ensureBtnText:'下一步',
                 wheels: [{data: dArr},{data: hArr},{data: mArr}],
                 position:[0, 0, 0],
                 callback:function(indexArr, data){
                     obj.regStrTime = getTimeStamp(data);
                     $('#regStrTime').val(obj.regStrTime);
                     regText=formatDateTime(obj.regStrTime,'noyear');
                     $('#regTime').val(regText);
                     $('#regExpTime').trigger('click');
                 }
             });
             var regEndSelect = new MobileSelect({
                 trigger: '#regExpTime',
                 title: '报名结束时间',
                 wheels: [{data: dArr},{data: hArr},{data: mArr}],
                 position:[0, 0, 0],
                 callback:function(indexArr, data){
                    obj.regExpTime = getTimeStamp(data);
                    if(obj.regExpTime<=obj.regStrTime){
                         bb_alert('报名开始时间不能晚于结束时间','知道了',function(){
                              regText='';obj.regExpTime='';obj.regStrTime='';
                              $('#regTime').val(regText).trigger('click')
                         });
                    }else{
                          regText=regText + ' ~ '+ formatDateTime(obj.regExpTime,'noyear');
                           $('#regTime').val(regText);
                           $('#regExpTime').val(obj.regExpTime);
                    }

                 }
             });

             $("#actTime").focus(function(){
                     document.activeElement.blur();
                 });
             $("#regTime").focus(function(){
                     document.activeElement.blur();
                 });
             
         }
    //填充编辑接口返回数据
    function fillHtml(){
        for(var key in obj){
            if(key=='img_url'){
                $('.active-cover').css('background-image','url('+obj.img_url+')');
            }else if(key=='ts_fhId'){
                $('textarea[name="ts_fhId"]').val(getFhName(obj.ts_fhId));
                autoHeight(document.getElementById('ts_fhId'))//每次赋值都重新计算容器高度
            }else{
                $('[name='+key+']').val(obj[key]);
            }
        }
        $('#actTime').val(formatDateTime(obj.actEndTime,'noyear')+' ~ '+formatDateTime(obj.actEndTime,'noyear'));
        $('#regTime').val(formatDateTime(obj.regStrTime,'noyear')+' ~ '+formatDateTime(obj.regExpTime,'noyear'));
    }
    //点击设置活动名称
    $('.act-name').on('click',function(){
        if($(this).val()=="点击设置活动名称"){
            $(this).val('');
        }
    })
    //点击选择分会
    $('#ts_fhId').on('click',function(){
        $('.fh-modal').show();
        document.title='选择分会';
    });
    //确认选择分会
    $('#btn_fh_pub').on('click',function(){
        var str = ''
        if($(":checkbox[name='fh-item']:checked").length==0){
            bb_alert('至少选择一个分会');
            return
        }else{
            $(":checkbox[name='fh-item']:checked").each(function(idx,item){
                str+=$(this).data('fhid')+','
            })
            obj.ts_fhId=str.substring(0,str.length-1);
            $('textarea[name="ts_fhId"]').val(getFhName(obj.ts_fhId));
            $('.fh-modal').hide();
            document.title='新建活动'
            autoHeight(document.getElementById('ts_fhId'))//每次赋值都重新计算容器高度
        }
    })
    //上传封面
    var fileUrl = 'https://api.botbrain.ai/upload/v1/JRVPRMIT9P/cloud/stream/image/single';
    $('.choosefile-click').on('click',function(){
        $('#choosefile-img').val('');
            $("#choosefile-img").click();
            $("#choosefile-img").unbind("change");
            $("#choosefile-img").on("change", function () {
               // var file = document.getElementById("choosefile-img").files[0];
               // var url = URL.createObjectURL(file); 创建图片本地url
               var formData = new FormData($("#uploadForm")[0]);
               $.ajax({
                   url:fileUrl,
                   type:'POST',
                   data:formData,
                   async:false,
                   cache:false,
                   contentType:false,
                   processData:false,
                   success:function(data){
                       console.log(data)
                       if(data.code==0){
                           $('.active-cover').css('background-image','url('+data.data+')');
                           obj.img_url= data.data
                       }else{
                           bb_alert(data.msg);
                       }
                   }
               });
            });
    })
    //发布验证
    $('#btn_pub').on('click',function(){
        var checks = {
            name:'活动名称',
            img_url:'图片链接', //比较特殊 name值强制为file
            actStrTime:'活动开始时间',
            actEndTime:'活动结束时间',
            regStrTime:'报名开始时间',
            regExpTime:'报名截止时间',
            limitNum:'活动限制人数',
            actAddr: '活动地点',
            act_linkman:'活动联系人',
            contact_cell:'联系电话',
            act_abstract:'活动简介',
            act_plan:'活动安排'
        }
        for(var key in checks){
          if(type=='publish'&&key=='img_url'&& obj.img_url==''){
                bb_alert('背景图片不能为空');
                return
            }
            if($('[name='+key+']').val()==''){//未输入情况下
                bb_alert(checks[key]+'不能为空');
                return
            }else{//输入情况下
                var val = $('[name='+key+']').val();
                if(key=='name'){
                    if(val=='点击设置活动名称'){
                         bb_alert('请设置活动名称');
                         return
                    }
                }
                // if(key=='contact_cell'){  可以是座机
                //     if(!(/^1[34578]\d{9}$/.test(val))){
                //         bb_alert("手机号码填写不正确！");
                //         return
                //     }
                // }
                if(key=='ts_fhId'||key=='img_url'){
                    //不做任何赋值 编辑时已经赋值
                }else{
                     obj[key]=$('[name='+key+']').val(); //其余选项都取当前输入框的value
                }
            }
        }
        console.log(obj);
        if(type=='publish'){
            postUrl='${req.contextPath}/we/act/add_new'
        }else{
            postUrl = '${req.contextPath}/we/act/update_act?act_id=${actId}'
        }
        $.post(postUrl, obj,function(d){
            if(d.code==0){
               bb_toast(d.msg);
               window.location.href = '${req.contextPath}/we/h5/admin/actmanage';
            }else{
                bb_alert(d.msg);
            }
         });
    })
    //页面入口
    getFenHui()

    //日期转时间戳
    function getTimeStamp(arr){//["今天", "1点", "00分"] ["7月10日", "4点", "40分"] 格式
        var dataStr=['','',''];
        //获取今天年月日
        var data = new Date();
        var year = data.getFullYear();
        var month = data.getMonth() + 1;
        var datas = data.getDate();

        if(arr[0]=='今天'){
            dataStr[0]= year + '-' + addZero(month) + '-' + addZero(datas)
        }else if(arr[0]=='明天'){
            var nextDate = new Date(data.getTime() + 24 * 60 * 60 * 1000);
            var nextyear = nextDate.getFullYear();
            var nextmonth = nextDate.getMonth() + 1;
            var nextdatas = nextDate.getDate();
            dataStr[0]= nextyear + '-' + addZero(nextmonth) + '-' + addZero(nextdatas)
        }else{
            var splitArr = arr[0].split('月');
            var y;
            var m = splitArr[0];
            var d = splitArr[1].split('日')[0];
            if(parseInt(m)<parseInt(month)){//获得月份小于当前月 则为去年
                y=parseInt(year)-1;
            }else if(parseInt(m)==parseInt(month)){ // 获得月份为本月
                if(parseInt(d)<parseInt(datas)){//获得日小于当日 则为去年
                    y=parseInt(year)-1;
                }else{//否则为今年
                    y=year
                }
            }else{//获得月份大月本月 肯定为今年
                y=year
            }
            dataStr[0]= y + '-' + addZero(m)+ '-' + addZero(d)
        }
        dataStr[1]=arr[1].split('点')[0];
        dataStr[2]=arr[2].split('分')[0];
        var dataResult = dataStr[0]+' '+dataStr[1]+':'+dataStr[2]+':00'
        dataResult=dataResult.replace(new RegExp(/-/gm) ,"/"); 　　//将所有的'-'转为'/'即可
        var getDate = new Date(dataResult);
        return  Date.parse(getDate);
    }
    function addZero(s){
        if(parseInt(s)<10){
            s='0'+s;
        }
        return s
    }
})
</script>
</html>