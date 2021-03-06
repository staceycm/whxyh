<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>我的活动</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">

    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${req.contextPath}/assets/js/base.js"></script>
</head>
    <div class="page_bd page-my-active"></div>
</body>
<script>
 $(function(){
       var storage={start:1,all:false};
       function getMyActive(){
           var myActiveUrl = '${req.contextPath}/we/act/my_actlist?start='+storage.start;
           var listHtml='';
           $.ajax({url:myActiveUrl,type:'post',success:function(d){
                if(d.code==0){
                     d.data.forEach(function(item,idx){
                         var start = formatDateTime(item.actStrTime,'noyear'),end = formatDateTime(item.actEndTime,'noyear')
                         var status;
                         if(item.status == 1){
                             status={color:'#3eb6ff',word:'待参加'};
                         }else if(item.status ==2){
                             status={color:'#FFB01F',word:'进行中'};
                         }else{
                             status={color:'#d7d7d7',word:'已结束'};
                         }
                         listHtml+='<div class="weui-panel weui-panel_access"><span class="active-status" style="background:'+status.color+'"><i></i>'+status.word+'</span>\n'+
                                    '   <div class="weui-panel__bd">\n'+
                                    '        <a href="${req.contextPath}/we/h5/act/index?actId='+item.id+'" style="display:inline-block"><div class="weui-media-box weui-media-box_text">\n'+
                                    '            <h4 class="weui-media-box__title">'+item.name+'</h4>\n'+
                                    '            <p class="weui-media-box__desc">\n'+
                                    '                <img src="'+item.img_url+'" alt="">\n'+
                                    '                <span>活动时间： '+start+' ~ '+end+'</br>活动地点： '+item.actAddr+'</span>\n'+
                                    '            </p>\n'+
                                    '        </div></a>\n'+
                                    '    </div>\n'+
                                    '</div>'
                     })
                     if(d.data.length<10){
                          storage.all=true;//已经全部加载完 返回数据不足10条 说明没有更多数据了
                          if(d.data.length==0&&storage.start==1){
                               listHtml=$('<div class="bigPic_container feed-detail-container no-content">'+
                                  '<img src="${req.contextPath}/assets/img/null.png" />'+
                                  '<div class="bigPic_active font12">'+
                                  '<div class="bigPic_source" style="text-align: center">您还没有报名过活动</div>'+
                                  '</div></div>');
                          }
                     }
                     $('.page-my-active').append(listHtml)
                }
            }});
       }
       $(document).scroll(function(){
            if($(document).height() - $(document).scrollTop() - window.innerHeight <100 ){
                if(!storage.all) {
                    storage.start+=1
                    getMyActive()
                }
            }
        });
       getMyActive();
 })
</script>
</html>