<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>我的分会</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">

    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
</head>
<div class="container" id="container">
    <div class="page page_bd page-my-fh"></div>
</div>
</body>
<script>
 $(function(){
       function getMyFh(){
           var myFhUrl = '${req.contextPath}/we/cap/my_cha';
           var listHtml='';
           var colArr=['#f5b8b8','#ff9393','#85aff0','#b9d784','#ffc549',
                  '#f0a786','#89c9fe','#bfa0ee','#e5c144','#75cc81',
                  '#5bd0d5','#ff9157','#4eb3f1','#ff8e85','#e0ce9d',
                  '#ffb8eb','#9dc4ff','#8fdc6b','#f5b8b8','#ff9393',
                  '#85aff0','#b9d784','#ffc549','#f0a786','#89c9fe',
                  '#bfa0ee','#e5c144','#75cc81','#5bd0d5','#ff9157',
                  '#4eb3f1','#ff8e85','#e0ce9d','#ffb8eb','#9dc4ff','#8fdc6b','#75cc81','#89c9fe']
            $.ajax({url:myFhUrl,type:'post',success:function(d){
                if(d.code==0){
                     d.data.forEach(function(item,idx){
                         var firstLeter = item.jc_name.substr(0,1);
                         listHtml+='<div class="weui-panel">\n'+
                                    '            <div class="weui-panel__bd">\n'+
                                    '                <div class="weui-media-box weui-media-box_small-appmsg">\n'+
                                    '                    <div class="weui-cells">\n'+
                                    '                        <a class="weui-cell weui-cell_access" href="${req.contextPath}/we/h5/cap/index?id='+item.id+'">\n'+
                                    '                            <div class="weui-cell__hd"><span style="background:'+colArr[idx]+'">'+firstLeter+'</span></div>\n'+
                                    '                            <div class="weui-cell__bd weui-cell_primary">\n'+
                                    '                                <p>'+item.jc_name+'</p>\n'+
                                    '                            </div>\n'+
                                    '                            <span class="arrow-right"><i class="iconfont icon-arrow-right"></i></span>\n'+
                                    '                        </a>\n'+
                                    '                    </div>\n'+
                                    '                </div>\n'+
                                    '            </div>\n'+
                                    '        </div>'
                     })
                     if(listHtml==''){//无数据返回时
                         listHtml=$('<div class="bigPic_container feed-detail-container no-content">'+
                                      '<img src="${req.contextPath}/assets/img/null.png" />'+
                                      '<div class="bigPic_active font12">'+
                                      '<div class="bigPic_source" style="text-align: center">您还没有加入任何分会</div>'+
                                      '</div></div>');
                     }
                     $('.page-my-fh').append(listHtml)
                }
            }});
       }
       getMyFh();
 })
</script>
</html>