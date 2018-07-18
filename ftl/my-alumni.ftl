<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>校友录</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">
    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${req.contextPath}/assets/js/base.js"></script>
</head>
<body style="background: #FFFFFF">
    <div class="page_bd page-my-alumni">
        <div class="weui-tab" style="height: auto">
            <div class="weui-tab__panel" style="height: auto;">
                <div class="weui-navigator">
                    <div id="tagnav" class="weui-navigator-wrapper">
                       <ul class="weui-navigator-list">
                            <li class="active" data-page="collect"><a href="javascript:;" >我收藏的</a></li>
                            <li data-page="contact"><a href="javascript:;" >联系过的</a></li>
                       </ul>
                    </div>
                </div>
                <div class="alumni-list alumni-collect-list active"></div>
                <div class="alumni-list alumni-contact-list"></div>
            </div>
        </div>
    </div>
    <!--BEGIN dlg_alert-->
    <div id="dlg_sendsms" style="display: none;">
      <div class="weui-mask"></div>
      <div class="weui-dialog">
        <div class="weui-dialog__hd"><strong class="weui-dialog__title">给校友发短信</strong></div>
        <div class="weui-dialog__bd">
                            <textarea class="weui-textarea" placeholder="请输入留言内容" rows="4"></textarea>
                        <div class="weui-textarea-counter"><span>0</span>/20</div>
                    </div>
        <div class="weui-dialog__ft">
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_default">放弃</a>
            <a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">发送</a>
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
         var page='collect';//‘contact’
         var storage ={collect:{all:false,start:1},contact:{all:false,start:1}}
         //切换页面
         $('#tagnav li').on('click',function(){
             $(this).addClass('active').siblings('li').removeClass('active');
             page=$(this).data('page');
             $('.alumni-'+page+'-list').addClass('active').siblings('div').removeClass('active');
             if($('.alumni-'+page+'-list').html()==''){
                 getAlumniList()
             }
         })

        //获取校友列表
        function getAlumniList(){
            var alumniUrl = '', alumniHtml='';
            if(page=='collect'){
                alumniUrl = '${req.contextPath}/we/xy/get_myxy_collect?start='+storage[page].start;
            }else{
                alumniUrl='${req.contextPath}/we/xy/my_xy_conn?start='+storage[page].start;
            }
            $.ajax({url:alumniUrl,type:'post',success:
                function(d){
                    if(d.code==0){
                        (d.data||[]).forEach(function(item,idx){
                            var telHanderHtml='',telShowHtml='',xyAcademy2Html='',fhHtml='';
                            if(item.showMobile){//false不公开 true公开
                                telHanderHtml='<a href="tel:'+item.mobile+'"><i class="iconfont icon-tel">&#xe634;</i></a>';//打电话图标
                                telShowHtml= '<p class="weui-media-box__desc" style="padding-bottom:6px;">电话：<span>'+item.mobile+'</span></p>'//电话号码
                            }
                            if(item.xyAcademy2!=null){//第二学历
                                xyAcademy2Html='<p class="weui-media-box__desc" style="padding-bottom:6px;">'+(item.xyYear2?item.xyYear2+'级-':'')+item.xyAcademy2+'-'+item.xyType2+'</p>';
                            }
                            if(item.fhName.length!=0){//所属分会
                                fhHtml='<p class="weui-media-box__desc" style="padding-bottom:6px;">所属分会：'+item.fhName.join("、")+'</p>'
                            }
                            var headImg=d.data.sex=='女'?"${req.contextPath}/assets/img/f-user.png":"${req.contextPath}/assets/img/m-user.png";//el替换
                            if(item.headImgUrl && item.headImgUrl!==""){
                                headImg=item.headImgUrl
                            }
                            alumniHtml+='<div class="weui-media-box weui-media-box_friends" data-openid="'+item.openId+'">'+
                                           '  <div class="weui-media-box__hd">'+
                                           '    <img class="weui-media-box__thumb circle-img" src="'+headImg+'">'+
                                           '  </div>'+
                                           '  <div class="weui-media-box__bd">'+
                                           '    <h4 class="weui-media-box__title">'+
                                           '        <b>'+item.name+'</b>'+
                                           '        <span data-openid="'+item.openId+'" data-name="'+item.name+'"><i class="iconfont icon-da-call icon-cc-heart"></i><i class="iconfont icon-send-msg">&#xe643;</i>'+telHanderHtml+'</span>'+
                                           '    </h4>'+
                                           '    <p class="weui-media-box__desc" style="padding-bottom:6px;">'+(item.xyYear?item.xyYear+'级-':'')+item.xyAcademy+'-'+item.xyType+'</p>'+xyAcademy2Html+fhHtml+
                                           '    <p class="weui-media-box__desc" style="padding-bottom:6px;">'+item.danwei+'-'+item.zhiwu+'</p>'+telShowHtml+
                                           '    <p class="weui-media-box__desc" style="padding-bottom:6px;">关注领域：'+item.areas+'</p>'+
                                           '  </div>'+
                                           '</div>'
                        })
                        if(d.data.length<10){
                             storage[page].all=true;//已经全部加载完
                             if(d.data.length==0&&storage[page].start==1){//第一次加载且数据为空时
                                   alumniHtml = $('<div class="bigPic_container feed-detail-container no-content">'+
                                            '<img src="${req.contextPath}/assets/img/null.png" />'+
                                            '<div class="bigPic_active font12">'+
                                            '<div class="bigPic_source" style="text-align: center">暂无数据~</div>'+
                                            '</div></div>');
                             }
                        }
                        $('.alumni-'+page+'-list').append(alumniHtml);
                    }
                }
            })
        }

        //收藏该校友 取消收藏该校友 发送信息 打电话
        $('.alumni-list').on('click',function(e){
            var openId,state;
            var $target = $(e.target);
            if($target.is('.icon-da-call')){
                openId = $(e.target).parent().data('openid');
                var daCallUrl = '${req.contextPath}/we/cap/add';
                if($target.is('.icon-cc-heart')){//取消收藏
                    state=1 //操作类型   0添加收藏 1取消收藏
                    bb_confirm("取消收藏", "确认取消收藏该校友吗？", "放弃", "确定", function(wc){//暂时设计为 取消收藏需要确认弹窗 收藏功能不需要弹窗
                        if(wc == "right"){
                             $.post(daCallUrl, { xy_openId: openId,state:state },function(d){
                                 if(d.code==0){
                                      $target.addClass('icon-cc-heart-o').removeClass('icon-cc-heart');//取消收藏
                                      if($target.parents('.alumni-list').is('.alumni-collect-list')){//如果是我收藏的列表 需要将该校友移除
                                          $target.parents('.weui-media-box').hide().remove();
                                      }
                                      bb_toast(d.msg)
                                 }else{
                                     bb_alert(d.msg)
                                 }
                             });
                        }
                    });
                }else{//收藏功能 只可能出现在我联系过的列表里
                     state=0
                     $.post(daCallUrl, { xy_openId: openId,state:state },function(d){
                          if(d.code==0){
                              $target.addClass('icon-cc-heart').removeClass('icon-cc-heart-o');//收藏
                               bb_toast(d.msg)
                          }else{
                              bb_alert(d.msg)
                          }
                      });
                }
            }else if($target.is('.icon-send-msg')){//发送信息
                openId = $target.parent().data('openid');
                var name = $target.parent().data('name');
                sendSms(openId,name)
            }else if($target.is('.icon-tel')){//打电话埋点
                openId = $target.parents('span').data('openid');
                $.post('${req.contextPath}/we/callXy', { toOpenId: openId},function(d){
                      console.log(d.msg)
                });
            }else{
                  openId = $target.parents('.weui-media-box').data('openid');
                  if(openId){//如果存在openId 说明没点击在页面空白处
                      window.location.href=""//请替换路径
                  }
              }
        });
        //发送信息
        function sendSms(openId, to){
        	  var $dialog = $('#dlg_sendsms');
        	  $dialog.find('.weui-dialog__title').text("给"+to+"发短信");
        	  $dialog.fadeIn(200);
        	  $dialog.find('.weui-dialog__btn_default').one('click', function () {
        	      $dialog.fadeOut(200);
        	  });
        	  $txt = $dialog.find('.weui-textarea');
              $counter = $dialog.find('.weui-textarea-counter');
        	  $txt.unbind().on("change keyup", function(){
                    $counter.find('span').text($txt.val().length);
                    if($txt.val().length>20){
                     $counter.addClass("weui-cell_warn");
                   }else{
                     $counter.removeClass("weui-cell_warn");
                   }
        	  });
            $dialog.find('.weui-dialog__btn_primary').unbind().on('click', function () {
            	if($txt.val().length>20){
            		bb_toast("留言内容不能超过20个字符");
            		return;
            	}else if($txt.val().length==0){
                    bb_toast("留言内容不能为空");
                    return;
            	}
            	$.post("${req.contextPath}/we/leaveMsg", {"toOpenId": openId, "msg":$txt.val()}, function(d){
            		bb_toast(d.msg);
            		if(d.code==0){
            			$dialog.fadeOut(200);
            		}
            	});
          });
        }
        //下拉监听
        $(document).scroll(function(){
             if($(document).height() - $(document).scrollTop() - window.innerHeight <100 ){
                 if(!storage[page].all) {
                     storage[page].start+=1;
                     getAlumniList();
                 }
             }
        });
        getAlumniList()
     })
    </script>
</body>
</html>