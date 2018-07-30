<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>我的名片</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/plugin/swiper/swiper-4.3.3.min.css">

    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${req.contextPath}/assets/plugin/swiper/swiper-4.3.3.min.js"></script>
    <script src="${req.contextPath}/assets/js/base.js"></script>
</head>
<body>
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

    <div class="page_bd page-my-card">
        <div class="card-wrap">
            <img src="" alt="">
            <div class="card-handle">
                <span class="card-choice"><i class="iconfont icon-choice">&#xe601;</i></span>
                <span class="card-down"><i class="iconfont icon-down">&#xe64a;</i></span>
            </div>
        </div>
        <div class="card-modal" style="display: none;">
            <h4>选择模板</h4>
            <div class="weui-navigator">
                <div id="tagnav" class="weui-navigator-wrapper">
                   <ul class="weui-navigator-list">
                       <!--<li class="active"><img src="assets/img/card-bg1.png" alt=""></li>
                       <li><img src="assets/img/card-bg2.png" alt=""></li>
                       <li><img src="assets/img/card-bg3.png" alt=""></li>
                       <li><img src="assets/img/card-bg1.png" alt=""></li>
                       <li><img src="assets/img/card-bg2.png" alt=""></li>
                       <li><img src="assets/img/card-bg1.png" alt=""></li>
                       <li><img src="assets/img/card-bg1.png" alt=""></li>-->
                    </ul>
                </div>
            </div>
            <div class="weui-dialog__ft">
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default">取消</a>
                <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">确定</a>
            </div>
          </div>
        </div>
    </div>
    <script>
     $(function(){
         $('.icon-choice').on('click',function(){//点击预览模板
             previewModal()
         })
         $('.icon-down').on('click',function(){//点击下载图片到本地
             longPress();
         })
         //获取模板列表
         function initCardModal(){
             var cardListUrl='${req.contextPath}/we/getCardTemplates';
             $.ajax({url:cardListUrl,type:'post',success:function(d){
                 if(d.code==0){
                     var cardHtml='';
                     (d.data||[]).forEach(function(item,idx){
                        cardHtml+='<li data-cardid= "'+item.template_id+'"><img src="'+item.template_url+'" alt=""></li>'                     })
                 }
                 $('.weui-navigator-list').append(cardHtml);//生成模板html结构
                 //根据返回结果计算列表长度
                 var sum_width=0;
                 $('.weui-navigator-list li:first').addClass('active');
                 // 重新计算模板list长度
                 $('.weui-navigator-list li').map(function(idx,item){
                     sum_width+=($(item).width())+15;
                 });
                 $('.weui-navigator-list').width(sum_width+15);
                 //获取默认模板的
                 getCard("");//不传id 默认为用户已选择（或默认）模板
                 $('.weui-navigator-list li').on('click',function(e){
                     $(this).addClass('active').siblings('li').removeClass('active')
                     id=$(this).data('cardid');
                     getCard(id)
                 })
             }});
         }
         //生成预览模板图片
         function getCard(id){
          
             var cardUrl='${req.contextPath}/we/getcards';
             $.ajax({
                 url: cardUrl,
                 type: 'GET',
                 data: {
                     template_id: id
                 },
                 success: function (res) {
                     console.log(res);
                     $('.card-wrap img').prop('src',res.data);

                 }
            });
         }
         initCardModal();
         //预览模板模态窗
         function previewModal(){
             var $dialog = $('.card-modal');
             $dialog.fadeIn(200);
             var startSrc =$('.card-wrap img').prop('src');
             $dialog.find('.weui-dialog__btn_default').one('click', function () {//取消
                  $dialog.fadeOut(200);
                  $('.card-wrap img').prop('src',startSrc);
             });
             $dialog.find('.weui-dialog__btn_primary').unbind().on('click', function () {//保存
                 $.post('${req.contextPath}/we/savaCard', { template_id:$('.weui-navigator-list li.active').data('cardid')},function(data){
                     if(data.code==0){
                         bb_toast(data.msg);
                         $dialog.fadeOut(200);
                     }else{
                          bb_alert(data.msg);
                     }
                 });
           });
         }
         //模拟图片长按操作
         function longPress(){
             $('.card-wrap img').trigger('touchstart');
             var timeout = setTimeout(function(){
                 $('.card-wrap img').trigger('touchend');
                 clearTimeout(timeout);
             },800);
         }
     })

    </script>
</body>

</html>