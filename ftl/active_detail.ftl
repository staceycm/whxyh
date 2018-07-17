<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>活动详情</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">

    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${req.contextPath}/assets/js/base.js"></script>
    <div class="page_bd page-active-detail">
        <div class="bigPic_container">
            <img src='' />
            <div class="bigPic_text_container">
                <p class="bigPic_text">活动名称</p>
                <div class="bigPic_active font15">
                    <div class="bigPic_source"><i class="iconfont">&#xe68f;</i> 活动时间：<span>XXXX</span></div>
                    <div class="bigPic_source"><i class="iconfont">&#xe6c3;</i> 活动地点：<span>XXXX</span></div>
                </div>
            </div>
        </div>
        <div class="weui-panel weui-panel_access active-plan-detail">
            <div class="weui-panel__hd"><h3>活动详情</h3></div>
            <div class="weui-panel__bd">
                <div class="weui-media-box weui-media-box_text">
                    <p class="weui-media-box__desc">报名及限制 : <span>6月18日报名截止，限50人</span></p>
                </div>
                <div class="weui-media-box weui-media-box_text">
                    <p class="weui-media-box__desc">活动联系人：<span>人名，1831384028</span><a href="tel:13764567708" class="tel-btn"><i class="iconfont tel-btn">&#xe7ae;</i></a> </p>
                </div>
                <div class="weui-media-box weui-media-box_text">
                    <p class="weui-media-box__desc">活动简介：<span>活动简介</span></p>
                </div>
            </div>
        </div>
        <div class="weui-panel weui-panel_access weui-media-box_text">
            <div class="weui-panel__hd"><h3>活动安排</h3></div>
            <div class="weui-panel__bd">
                <div class="weui-media-box weui-media-box_text">
                    <!--<p class="weui-media-box__desc">14：00～14：30：<span>集合地签到</span></p>
                    <p class="weui-media-box__desc">14：30～15：00：<span>活动主持人开场，讲述活动背景</span></p>
                    <p class="weui-media-box__desc">15：00～15：30：<span>每个人进行自我介绍</span></p>
                    <p class="weui-media-box__desc">15：30～17：00：<span>老同学团体活动</span></p>
                    <p class="weui-media-box__desc">15：30～17：00：<span>活动流程具体由活动发起人制定，若超过行则可以换行显示</span></p>-->
                </div>
            </div>
        </div>
        <div class="weui-panel weui-panel_access registered-list-wrap">
            <div class="weui-panel__hd"><h3>已报名</h3></div>
            <div class="weui-panel__bd">
                <ul class="registered-list"></ul>
                <div class="registered-more"> 查看全部 </div>
            </div>
        </div>
        <div class="weui-btn-area"><a class="weui-btn weui-btn_primary" href="javascript:;" id="btn_join" data-change="1">我要报名</a></div>
    </div>
    <!--BEGIN toast-->
    <div id="toast" style="display: none;">
      <div class="weui-mask_transparent"></div>
      <div class="weui-toast">
        <i class="weui-icon-success-no-circle weui-icon_toast"></i>
        <p class="weui-toast__content">已完成</p>
      </div>
    </div>
    <!--END toast-->
    <!--BEGIN dlg_alert-->
    <div id="dlg_alert" style="display: none;">
      <div class="weui-mask"></div>
      <div class="weui-dialog">
        <div class="weui-dialog__bd">内容部分。</div>
        <div class="weui-dialog__ft"><a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary" >知道了</a></div>
      </div>
    </div>
    <!--END dlg_alert-->
</body>
<script>
 $(function(){
      var actId='${actId}'
     //获取活动详情
     function getActDetail(){
         var detailUrl = '${req.contextPath}/we/act/details_json?act_id='+actId;
         $.ajax({url:detailUrl,type:'post',success:function(d){
             console.log(d);
             //活动开始时间-活动截止时间
             if(d.code==0){
                 var start = formatDateTime(d.data.actStrTime,'noyear'),end = formatDateTime(d.data.actEndTime,'noyear')
                 $('.bigPic_container img').prop('src',d.data.img_url);
                 $('.bigPic_text').html(d.data.name);
                 $('.bigPic_active .bigPic_source').eq(0).find('span').html(start+' ~ '+end);
                 $('.bigPic_active .bigPic_source').eq(1).find('span').html(d.data.actAddr);
                 //报名截止时间及时间限制
                 var astrictHtml=formatDateTime(d.data.regExpTime)+'报名截止，限制'+d.data.limitNum+' 人';
                 $('.active-plan-detail .weui-media-box__desc').eq(0).find('span').html(astrictHtml);
                 $('.active-plan-detail .weui-media-box__desc').eq(1).find('span').html(d.data.act_linkman+','+d.data.contact_cell);
                 $('.active-plan-detail .weui-media-box__desc').eq(1).find('a').prop('href','tel:'+d.data.contact_cell);
                 $('.active-plan-detail .weui-media-box__desc').eq(2).find('span').html(d.data.act_abstract);
                 //活动列表
                 var listHtml='<p class="weui-media-box__desc">'+d.data.act_plan+'</p>';
                 $('.weui-media-box_text .weui-media-box').append(listHtml);
                 var timestamp = (new Date()).valueOf();
                 if(d.data.regExpTime<=timestamp){//报名时间已经过了 自定义属性change变为0 表示文案不再可调整
                    $('#btn_join').addClass('weui-btn_lose').data('change',0).html('报名已截止');
                    //已报名列表 如果已经过了报名截止时间 则不需要显示列表
                    $('.registered-list-wrap').hide()
                 }else{
                    getRegList(1)//第一次请求
                 }
             }
         }})
     }
     function getRegList(st){
         var listUrl='${req.contextPath}/we/act/act_persons?start='+st+'&act_id='+actId;
        $.ajax({url:listUrl,type:'post',success:function(d){
            console.log(d);
            var listHtml=''
            if(d.code==0){
                d.data.per_list.forEach(function(item,idx){
                    var headImg=item.sex=='女'?"${req.contextPath}/assets/img/f-user.png":"${req.contextPath}/assets/img/m-user.png";
                           if(item.headImgUrl && item.headImgUrl!==""){
                                    headImg=item.headImgUrl
                                }
                    listHtml+='<li><a href="javascript:;"><img src="'+headImg+'" alt=""><span>'+item.name+'</span></a></li>';
                })
                $('.registered-list').append(listHtml);
                if(d.data.num>=d.data.limitNum){//满额
                    if($('#btn_join').data('change')==1){//如果报名时间截止（change为0） 则不改变文案
                        $('#btn_join').addClass('weui-btn_lose').html('活动人员已满额');
                    }
                }
                if(st==1){//第一次请求
                    if(d.data.num<d.data.limitNum && d.data.num<=12){ //未满额且已报名数据不足12条
                        $('.registered-more').addClass('registered-all').html('没有更多数据了')
                    }
                    if(d.data.num==0){//无人报名
                        listHtml='<li><a href="javascript:;"><img src="${req.contextPath}/assets/img/null.png" alt=""><span>暂无人报名</span></a></li>';
                        $('.registered-list').append(listHtml);
                    }
                }else{//第二次请求 请求全部剩余数据
                    $('.registered-more').addClass('registered-all').html('没有更多数据了')
                }

            }
        }})
     }
     $('.registered-more').on('click',function(){
         if($(this).is('.registered-all')){//如果已经是没有更多数据了 则直接返回
             return false
         }else{
             getRegList(2)
         }
     })
    $('#btn_join').on('click',function(){
        if($(this).html()=='我要报名'){
            var joinUrl = '${req.contextPath}/we/act/reg';
            $.post(joinUrl, { act_id: actId },function(data){
                if(data.code==0){
                      bb_toast(data.msg)
                }else{
                      bb_alert(data.msg);
                }
           });
        }
    })
    getActDetail();
 })
</script>
</html>