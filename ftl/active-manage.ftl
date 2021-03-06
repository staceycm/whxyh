<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>活动管理</title>
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
    <div class="page_bd page-active-manage">
        <div class="weui-tab" style="height: auto">
            <div class="weui-tab__panel" style="height: auto;">
                <div class="weui-navigator">
                    <div id="tagnav" class="weui-navigator-wrapper">
                       <ul class="weui-navigator-list">
                            <li class="active" data-state="0"><a href="javascript:;" >未进行</a></li>
                            <li data-state="1"><a href="javascript:;" >进行中</a></li>
                            <li data-state="2"><a href="javascript:;" >已结束</a></li>
                       </ul>
                    </div>
                </div>
                <div class="active-detail">
                    <!--<div class="weui-panel weui-panel_access line-wrapper">
                        <div class="weui-panel__bd line-scroll-wrapper">
                            <div class="active-show line-normal-wrapper">
                                <a href="javascript:;" style="display:inline-block">
                                    <div class="weui-media-box weui-media-box_text">
                                        <h4 class="weui-media-box__title">武汉大学北京校友聚会</h4>
                                         <p class="weui-media-box__desc">
                                             <img src="assets/img/wuda.png" alt="">
                                             <span>活动时间： 2014-09-09 </br>活动地点：这里</span>
                                         </p>
                                    </div>
                                </a>
                                <div class="registered-list-wrap">
                                    <ul class="registered-list">
                                        <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                        <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                        <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                        <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                        <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                        <li><a href="javascript:;"><i class="iconfont">&#xe608;</i></a></li>
                                    </ul>
                                    <p><span>3</span>个校友已经报名参加 &gt;</p>
                                </div>
                                <div class="weui-cell">
                                    <div class="weui-cell__bd">向校友会成员发送活动通知</div>
                                    <div class="weui-cell__ft"><a id="btn_copy_mobile" href="javascript:;" class="weui-btn_plain-primary">发送</a></div>
                                </div>
                            </div>
                            <div class="active-handler line-btn-delete">
                                <ul>
                                    <li class="active-edit">
                                        <span><i class="iconfont">&#xe6c5;</i></span>
                                        <p>编辑</p>
                                    </li>
                                    <li class="active-del">
                                        <span><i class="iconfont">&#xe62a;</i></span>
                                        <p>删除</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="weui-panel weui-panel_access line-wrapper">
                                            <div class="weui-panel__bd line-scroll-wrapper">
                                                <div class="active-show line-normal-wrapper">
                                                    <a href="javascript:;" style="display:inline-block">
                                                        <div class="weui-media-box weui-media-box_text">
                                                            <h4 class="weui-media-box__title">武汉大学北京校友聚会</h4>
                                                             <p class="weui-media-box__desc">
                                                                 <img src="assets/img/wuda.png" alt="">
                                                                 <span>活动时间： 2014-09-09 </br>活动地点：这里</span>
                                                             </p>
                                                        </div>
                                                    </a>
                                                    <div class="registered-list-wrap">
                                                        <ul class="registered-list">
                                                            <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                                            <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                                            <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                                            <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                                            <li><a href="javascript:;"><img src="assets/img/logo.jpg" alt=""></a></li>
                                                            <li><a href="javascript:;"><i class="iconfont">&#xe608;</i></a></li>
                                                        </ul>
                                                        <p><span>3</span>个校友已经报名参加 &gt;</p>
                                                    </div>
                                                    <div class="weui-cell">
                                                        <div class="weui-cell__bd">向校友会成员发送活动通知</div>
                                                        <div class="weui-cell__ft"><a id="btn_copy_mobile" href="javascript:;" class="weui-btn_plain-primary">发送</a></div>
                                                    </div>
                                                </div>
                                                <div class="active-handler line-btn-delete">
                                                    <ul>
                                                        <li class="active-edit">
                                                            <span><i class="iconfont">&#xe6c5;</i></span>
                                                            <p>编辑</p>
                                                        </li>
                                                        <li class="active-del">
                                                            <span><i class="iconfont">&#xe62a;</i></span>
                                                            <p>删除</p>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>-->
                </div>
            </div>
        </div>
        <div class="add-active">
            <a href="${req.contextPath}/we/h5/admin/act_add?type=publish">+</a>
        </div>
    </div>
    <script>
     $(function(){
         var lastX, lastXForMobile;// 用于记录被按下的对象
         var pressedObj;  // 当前左滑的对象
         var lastLeftObj; // 上一个左滑的对象
         var start;       // 用于记录按下的点

        var state=0;//页面初始时为未开始页面 //state  0 活动未开始  1活动进行中 2活动已结束
        var storage ={0:{data:'',all:false,start:1},1:{data:'',all:false,start:1},2:{data:'',all:false,start:1}}


        // 获取活动列表接口
        function getActive(type){
            var activeUrl = '${req.contextPath}/we/admin/get_fh_act?state='+state+'&start='+storage[state].start;
            var activeHtml='';
            if(type=='change'){//首次加载或者切换页面时 storage无数据情况下 先清空list容器
                $('.active-detail').html('')
            }
            $.ajax({url:activeUrl,type:'post',success:function(d){
                console.log(d);
                if(d.code==0){
                    (d.data||[]).forEach(function(item,idx){
                        var start = formatDateTime(item.actStrTime,'noyear'),end = formatDateTime(item.actEndTime,'noyear');
                        var personHtml='',pushHtml='';
                        if(item.per_data.num!=0){//判断是否显示人员列表
                            personHtml='<div class="registered-list-wrap"><ul class="registered-list">';
                            item.per_data.per_list.forEach(function(item1,idx1){
                                var headImg=item1.sex=='女'?"${req.contextPath}/assets/img/f-user.png":"${req.contextPath}/assets/img/m-user.png";
                                if(item1.headImgUrl && item1.headImgUrl!==""){
                                    headImg=item1.headImgUrl
                                }
                                personHtml+='<li><a href="javascript:;"><img src="'+headImg+'" alt=""></a></li>'
                            })
                            if(item.per_data.num>5){
                                personHtml+='<li><a href="${req.contextPath}/we/h5/admin/actmanage/act_person?actId='+item.id+'"><i class="iconfont">&#xe608;</i></a></li>'
                            }
                            personHtml+='</ul><p><span>'+item.per_data.num+'</span>个校友已经报名参加 &gt;</p></div>';
                        }
                        if(item.ts_ok==1){//0 无推送按钮 1 显示推送按钮
                            pushHtml='<div class="weui-cell"><div class="weui-cell__bd">向校友会成员发送活动通知</div>';
                            if(item.ts_state==1){ //0,null 未推送 显示发布按钮  1 已推送 显示已发布按钮
                                 pushHtml+='<div class="weui-cell__ft"><a id="btn_copy_mobile" href="javascript:;" class="weui-btn_plain-primary pushed" >已发送</a></div>'
                            }else{
                                 pushHtml+='<div class="weui-cell__ft"><a id="btn_copy_mobile" href="javascript:;" class="weui-btn_plain-primary push" data-activeid="'+item.id+'">发送</a></div>'
                            }
                            pushHtml+='</div>';
                        }
                        if(item.ed_dl==1){//1 属于本分会的活动可编辑 0 属于其他分会的活动不可编辑
                            activeHtml+='<div class="weui-panel weui-panel_access line-wrapper">\n'+
                                     '       <div class="weui-panel__bd line-scroll-wrapper">\n'+
                                     '           <div class="active-show line-normal-wrapper">\n'+
                                     '               <a href="javascript:;" style="display:inline-block">\n'+
                                     '                   <div class="weui-media-box weui-media-box_text">\n'+
                                     '                       <h4 class="weui-media-box__title"><span>本分会</span>'+item.name+'</h4>\n'+
                                     '                       <p class="weui-media-box__desc">\n'+
                                     '                           <img src="'+item.img_url+'" alt="">\n'+
                                     '                           <span>活动时间：'+start+' ~ '+end+'</br>活动地点：'+item.actAddr+'</span>\n'+
                                     '                       </p>\n'+
                                     '                   </div>\n'+
                                     '               </a>\n'+personHtml+pushHtml+
                                     '           </div>\n'+
                                     '           <div class="active-handler line-btn-delete">\n'+
                                     '               <ul>\n'+
                                     '                   <li class="active-edit" data-activeid='+item.id+'><a href="#none">\n'+
                                     '                       <span><i class="iconfont">&#xe6c5;</i></span>\n'+
                                     '                       <p>编辑</p></a>\n'+
                                     '                   </li>\n'+
                                     '                   <li class="active-del" data-activeid='+item.id+'><a href="#none">\n'+
                                     '                       <span><i class="iconfont">&#xe62a;</i></span>\n'+
                                     '                       <p>删除</p></a>\n'+
                                     '                   </li>\n'+
                                     '               </ul>\n'+
                                     '           </div>\n'+
                                     '       </div>\n'+
                                     '   </div>'
                        }else{
                            activeHtml+='<div class="weui-panel weui-panel_access no-line-scroll">\n'+
                                     '       <div class="weui-panel__bd">\n'+
                                     '           <div class="active-show">\n'+
                                     '               <a href="javascript:;" style="display:inline-block">\n'+
                                     '                   <div class="weui-media-box weui-media-box_text">\n'+
                                     '                       <h4 class="weui-media-box__title">'+item.name+'</h4>\n'+
                                     '                       <p class="weui-media-box__desc">\n'+
                                     '                           <img src="'+item.img_url+'" alt="">\n'+
                                     '                           <span>活动时间：'+start+' ~ '+end+'</br>活动地点：'+item.actAddr+'</span>\n'+
                                     '                       </p>\n'+
                                     '                   </div>\n'+
                                     '               </a>\n'+personHtml+pushHtml+
                                     '           </div>\n'+
                                     '       </div>\n'+
                                     '   </div>'
                        }
                    })
                    if(d.data.length<10){//如果请求返回数据少于10 说明已经没有更多数据
                        storage[state].all=true;
                        if(d.data.length==0&&storage[state].start==1){//第一次请求 且无数据 则显示为空状态
                           activeHtml=$('<div class="bigPic_container feed-detail-container">'+
                              '<img src="${req.contextPath}/assets/img/null.png" />'+
                              '<div class="bigPic_active font12">'+
                              '<div class="bigPic_source" style="text-align: center">还没有活动哦~</div>'+
                              '</div></div>');
                        }
                    }
                    $('.active-detail').append(activeHtml);
                    storage[state].data=activeHtml;
                    getScroll();
                }
            }})
        }
        //左滚动出现编辑删除按钮事件监听
        function getScroll(){
                     // 设定每一行的宽度=屏幕宽度+按钮宽度
                     // $(".line-scroll-wrapper").width($(".line-wrapper").width() + $(".line-btn-delete").width());
                     $(".line-scroll-wrapper").each(function(idx,item){
                         $(this).width($(this).parents(".line-wrapper").width() + $(this).find(".line-btn-delete").width());
                         // $(this).height($(this).find('.line-normal-wrapper').height())
                         // $(this).find('.active-handler').height($(this).find('.line-normal-wrapper').height())
                     })
                     // $(".line-scroll-wrapper").height($('.line-normal-wrapper').height())
                     // 设定常规信息区域宽度=屏幕宽度
                     $(".line-normal-wrapper").width($(".line-wrapper").width());
                     // 获取所有行，对每一行设置监听
                     var lines = $(".line-normal-wrapper");
                     var len = lines.length;
                     // 网页在移动端运行时的监听
                     for (var i = 0; i < len; ++i) {
                         lines[i].addEventListener('touchstart', function(e){
                             lastXForMobile = e.changedTouches[0].pageX;
                             pressedObj = this; // 记录被按下的对象
                             // 记录开始按下时的点
                             var touches = e.touches[0];
                             start = {
                                 x: touches.pageX, // 横坐标
                                 y: touches.pageY  // 纵坐标
                             };
                         });
                         lines[i].addEventListener('touchmove',function(e){
                             // 计算划动过程中x和y的变化量
                             var touches = e.touches[0];
                             delta = {
                                 x: touches.pageX - start.x,
                                 y: touches.pageY - start.y
                             };
                             // 横向位移大于纵向位移，阻止纵向滚动
                             if (Math.abs(delta.x) > Math.abs(delta.y)) {
                                 e.preventDefault();
                             }
                         });
                         lines[i].addEventListener('touchend', function(e){
                             if (lastLeftObj && pressedObj != lastLeftObj) { // 点击除当前左滑对象之外的任意其他位置
                                 $(lastLeftObj).animate({marginLeft:"0"}, 500); // 右滑
                                 lastLeftObj = null; // 清空上一个左滑的对象
                             }
                             var diffX = e.changedTouches[0].pageX - lastXForMobile;
                             if (diffX < -150) {
                                 $(pressedObj).animate({marginLeft:"-132px"}, 500); // 左滑
                                 lastLeftObj && lastLeftObj != pressedObj &&
                                     $(lastLeftObj).animate({marginLeft:"0"}, 500); // 已经左滑状态的按钮右滑
                                 lastLeftObj = pressedObj; // 记录上一个左滑的对象
                             } else if (diffX > 150) {
                               if (pressedObj == lastLeftObj) {
                                 $(pressedObj).animate({marginLeft:"0"}, 500); // 右滑
                                 lastLeftObj = null; // 清空上一个左滑的对象
                               }
                             }
                         });
                     }
                 }

        getActive('change');
        //切换页面
        $('#tagnav li').on('click',function(){
            $(this).addClass('active').siblings('li').removeClass('active');
            state=$(this).data('state');
            var data = storage[state].data;//缓存页面数据内容
            if(data!=''){
                $('.active-detail').html(data);
                getScroll();//重新绑定scroll事件
            }else{
                 getActive('change');
            }
        })
        //删除 事件监听 (编辑、查看更多人员 页面跳转泽雨可以直接写到href里）
        $('.active-detail').on('click',function(e){
            var $target = $(e.target),id=$target.data('activeid')||$target.parents('.active-del').data('activeid');
            if($target.is('.active-del')||$target.is('.active-del i')||$target.is('.active-del p')||$target.is('.active-del span')||$target.is('.active-del a')){

                bb_confirm("删除活动", "确认删除1个活动吗？", "放弃", "确定", function(wc){
                    if(wc == "right"){
                        $.post('${req.contextPath}/we/admin/del_fh_act', { act_id: id },function(data){
                            if(data.code==0){
                                $(e.target).parents('.weui-panel').fadeOut().remove();
                                storage[state].data=$('.active-detail').html();
                                if($('.active-detail .weui-panel').length<4){//少于四条数据时 继续请求数据
                                    if(!storage[state].all) {
                                        storage.start+=1
                                        getActive()
                                    }
                                }
                            }else{
                                 bb_alert(data.msg);
                            }
                       });
                    }
                });
            }
            //发布 推送
            if($target.is('.push')){
                $.post('${req.contextPath}/we/message/ts', { act_id: id },function(data){
                    if(data.code==0){
                        $target.removeClass('push').addClass('pushed')
                    }else{
                         bb_alert(data.msg);
                    }
               });
            }
        })
        $(document).scroll(function(){
            if($(document).height() - $(document).scrollTop() - window.innerHeight <100 ){
                if(!storage[state].all) {
                    storage.start+=1
                    getActive()
                }
            }
        });

     })
    </script>
</body>

</html>