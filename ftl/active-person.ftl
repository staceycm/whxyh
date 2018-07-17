<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>已报名</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">

    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${req.contextPath}/assets/js/base.js"></script>
</head>
<body>
    <div class="page_bd page-active-person">
        <div class="registered-list"></div>
        <div class="registered-more"></div>
    </div>
    <script>
     $(function(){
         var start=1;
         function getRegList(){
              var listUrl='${req.contextPath}/we/act/act_persons?start='+start+'&act_id=${actId}';
              if(start>2){ //请求第二次即为全部数据
                  return;
              }
              $.ajax({url:listUrl,type:'post',success:function(d){

                   console.log(d);
                   var listHtml=''
                   if(d.code==0){
                       document.title='已报名（'+d.data.num+'人）';
                       (d.data.per_list||[]).forEach(function(item,idx){
                           var time = getTimer(item.bm_time);
                           var headImg=item.sex=='女'?"${req.contextPath}/assets/img/f-user.png":"${req.contextPath}/assets/img/m-user.png";
                           if(item.headImgUrl && item.headImgUrl!==""){
                                    headImg=item.headImgUrl
                                }
                           listHtml+='<div class="weui-media-box weui-media-box_friends">'+
                                    '  <div class="weui-media-box__hd">'+
                                    '    <img class="weui-media-box__thumb circle-img" src="'+headImg+'">'+
                                    '  </div>'+
                                    '  <div class="weui-media-box__bd">'+
                                    '    <h4 class="weui-media-box__title">'+
                                    '        <b>'+item.name+'</b>'+
                                    '        <span data-openid="'+item.openId+'" >'+time+'</span>'+
                                    '    </h4>'+
                                    '    <p class="weui-media-box__desc" style="margin-top:14px;">'+item.xyYear+'-'+item.xyAcademy+'-'+item.xyType+'</p>'+
                                    // '    <p class="weui-media-box__desc" style="padding-bottom:6px;">'+item.danwei+''+item.zhiwu+'</p>'+
                                    '  </div>'+
                                    '</div>'
                       })
                       $('.registered-list').append(listHtml);
                       if(start==1){//第一次请求
                           if(d.data.per_list.length<12){ //数据不足12条
                                if(d.data.per_list.length==0){//无人报名
                                      listHtml=$('<div class="bigPic_container feed-detail-container no-content">'+
                                                  '<img src="./assets/img/null.png" />'+
                                                  '<div class="bigPic_active font12">'+
                                                  '<div class="bigPic_source" style="text-align: center">暂无数据~</div>'+
                                                  '</div></div>');
                                     $('.registered-list').append(listHtml);
                                }else{
                                    $('.registered-more').addClass('registered-all').html('没有更多数据了')
                                }
                           }
                       }else{//第二次请求 请求全部剩余数据
                           $('.registered-more').addClass('registered-all').html('没有更多数据了')
                       }
                   }
               }})
            }
           $(document).scroll(function(){
                if($(document).height() - $(document).scrollTop() - window.innerHeight <100 ){
                    start+=1;
                    getRegList();//第二次请求剩余全部数据
                }
            });
           getRegList();//第一次请求12条数据
     })
    </script>
</body>

</html>