<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>分会简介</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/plugin/swiper/swiper-4.3.3.min.css">

    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${req.contextPath}/assets/plugin/swiper/swiper-4.3.3.min.js"></script>
    <script src="${req.contextPath}/assets/js/base.js"></script>
    <div class="page_bd page-fh-intro">
        <div class="swiper-container">
            <div class="swiper-wrapper"></div>
            <div class="swiper-pagination"></div>
        </div>
        <div class="fh-word">
            <h3>老校友会</h3>
            <p>分会简介分会简介分会简介分会简介分会简介分会简介分会简介</p>
            <button class="act-btn">加入分会</button>
        </div>
        <div class="active-panel" style="height: auto;display: block;">
            <h4>分会活动</h4>
            <div class="active-detail"></div>
        </div>
        <div class="home-share">
            <a href=""><i class="iconfont">&#xe77d;</i></a>
        </div>
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
        <div class="weui-dialog__ft"><a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">知道了</a></div>
      </div>
    </div>
    <!--END dlg_alert-->
    <!--BEGIN dlg_confirm-->
    <div id="dlg_confirm" style="display: none;">
      <div class="weui-mask"></div>
      <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">弹窗标题</strong></div>
        <div class="weui-dialog__bd">弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内</div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default">辅助操作</a>
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">主操作</a>
        </div>
      </div>
    </div>
    <!--END dlg_confirm-->
<script>
 $(function(){
     var storage={start:1,all:false}
	   var id = ${id};
     //轮播图获取
     function getLunbo(){
         var fhLunboUrl = 'https://api.botbrain.ai/rec/v1/JRVPRMIT9P/feed?uid=pic&column_id='+id+'&ct=0';
         $.getJSON(fhLunboUrl,{},function(d){
             var swiperHtml=''
             d.data.banner.forEach(function(item,idx){
                 if(item.linkUrl==''){
                     swiperHtml+='<div class="swiper-slide"><a href="javascript:volid(0);"><img src="'+item.url+'" alt="'+item.title+'"></a></div>'
                 }else{
                     swiperHtml+='<div class="swiper-slide"><a href="'+item.linkUrl+'"><img src="'+item.url+'" alt="'+item.title+'"></a></div>'
                 }
             })
             $('.swiper-wrapper').append(swiperHtml);
             var mySwiper = new Swiper ('.swiper-container', {
                  loop: true,
                  autoplay: true,//可选选项，自动滑动
                  // 如果需要分页器
                  pagination: {
                    el: '.swiper-pagination'
                  }
            });
         })
     }
     //分会简介获取
     function getIntro(){
         var introUrl = '${req.contextPath}/we/cap/details?id='+id;
         $.ajax({url:introUrl,type:'post',success:function(d){
             console.log(d);
             $('.fh-word h3').html(d.data.fh_name);
             $('.fh-word p').html(d.data.fh_abstract.replace(/(\r\n)|(\n)/g,'<br>'));
             //判断加入或退出
             $('.fh-word .act-btn').data('state',d.data.state)
             if(d.data.state==1){//已加入分会
                // $('.fh-word .act-btn').hide();
                $('.fh-word .act-btn').addClass('used').html('已加入分会');
             }else if(d.data.state==2){//已加入分会三个月
                $('.fh-word .act-btn').html('退出分会');
             }//0为未加入分会 什么也不需要做
         }})
     }

     //活动列表获取
     function getActive(){
         var activeUrl = '${req.contextPath}/we/act/fh_list?start='+storage.start+'&fh_id='+id;
         var activeHtml ='';
         $.ajax({url:activeUrl,type:'post',dataType:"jsonp",success:function(d){
             d.data.data.map(function(item,idx){
                   var start = formatDateTime(item.actStrTime,'datatime'),end = formatDateTime(item.actEndTime,'datatime');
                   activeHtml = $('<div class="bigPic_container feed-detail-container">'+
                            '<a href="${req.contextPath}/we/h5/act/index?actId='+item.id+'"><img src='+item.img_url+' /></a>'+
                            '<p class="bigPic_text font15">'+item.name+'</p>'+
                            '<div class="bigPic_active font12">'+
                            '<div class="bigPic_source"><i class="iconfont">&#xe68f;</i> 活动时间：'+start+'~'+end+'</div>'+
                            '<div class="bigPic_source"><i class="iconfont">&#xe6c3;</i> 活动地点：'+item.actAddr+'</div>'+
                            '</div></div>');
                   $('.active-detail').append(activeHtml);
             })
             if(d.data.data.length<10){
                  storage.all=true;//已经全部加载完
                  if(d.data.data.length==0&&storage.start==1){//第一次加载且数据为空时
                      activeHtml = $('<div class="bigPic_container feed-detail-container no-content">'+
                               '<img src="${req.contextPath}/assets/img/null.png" />'+
                               '<div class="bigPic_active font12">'+
                               '<div class="bigPic_source" style="text-align: center">暂无活动~</div>'+
                               '</div></div>');
                      $('.active-detail').append(activeHtml);
                  }
             }
         }})
     }
     getLunbo();
     getIntro();
     getActive();
     // 加入或者退出分会
     $('.act-btn').on('click',function(e){
          var state = $(e.target).data('state');
          var actUrl
          if(state==0){//未加入分会
               actUrl = '${req.contextPath}/we/cap/add'
               $.post(actUrl, { fh_id: id },function(data){
                      if(data.code==0){
                            bb_toast('加入成功')
                            // $('.fh-word .act-btn').data('state',1).hide();
                            $('.fh-word .act-btn').data('state',1).addClass('used').html('已加入分会');
                      }else if(data.code==2){
                          bb_alert("未注册");
                      }else if(data.code==3){
                          bb_alert("加入超限:已经加入三个分会");
                      } else {
					      bb_alert("加入失败请稍后再试");
					  }
                 });
          }else if(state==2){//已加入三个月
              bb_confirm("退出分会", "确认退出该分会吗？", "放弃", "确定", function(wc){
                if(wc == "right"){
                     actUrl = 'https://xyh.botbrain.ai/we/cap/del'
                     $.post(actUrl, { fh_id: param.id },function(data){
                          if(data.code==0){
                                bb_toast('退出成功')
                                $('.fh-word .act-btn').data('state',0).html('加入分会')
                          }else{
                              bb_alert("退出分会失败，请稍后重试");
                          }
                     });
                }
           });
          }
     })
     $(document).scroll(function()
     {
         if($(document).height() - $(document).scrollTop() - window.innerHeight <100 )
         {
             if(!storage.all) {
                 storage.start+=1
                 getActive()
             }
         }
     });
 })
</script>
</body>
</html>