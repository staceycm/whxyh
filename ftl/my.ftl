<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>我的</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">

    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
</head>
<div class="container" id="container">
    <div class="page page_bd page-my">
        <div class="weui-panel my-info">
            <div class="weui-panel__bd">
                <div class="weui-media-box weui-media-box_appmsg">
                    <div class="weui-media-box__hd my-info-img">
                        <img class="weui-media-box__thumb circle-img" src="${req.contextPath}/assets/img/logo.jpg" alt="">
                    </div>
                    <div class="weui-media-box__bd my-info-word">
                        <h4 class="weui-media-box__title"><span>大萌</span><a href="${req.contextPath}/we/join"><i class="iconfont">&#xe6c5;</i>编辑</a></h4>
                        <p class="weui-media-box__desc"><span>2103级</span><b></b><span>计算机软件学院</span></p>
                    </div>
                    <a href="${req.contextPath}/we/h5/admin" class="manager-turn">管理员工作台</a>
                </div>
            </div>
        </div>
        <div class="weui-panel my-list">
            <div class="weui-panel__bd">
                <div class="weui-media-box weui-media-box_small-appmsg">
                    <div class="weui-cells">
                        <!-- <a class="weui-cell weui-cell_access" href="javascript:;">
                            <div class="weui-cell__hd"><img src="${req.contextPath}/assets/img/my-card.png" alt="" style="width:16px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd weui-cell_primary">
                                <p>我的名片</p>
                            </div>
                            <span class="weui-cell__ft"></span>
                        </a>-->
                       <!-- <a class="weui-cell weui-cell_access" href="${req.contextPath}/we/h5/my/to_my_act">
                            <div class="weui-cell__hd"><img src="${req.contextPath}/assets/img/my-schoolmate.png" alt="" style="width:16px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd weui-cell_primary">
                                <p>我的校友</p>
                            </div>
                            <span class="weui-cell__ft"></span>
                        </a>-->
                        <a class="weui-cell weui-cell_access" href="${req.contextPath}/we/h5/my/to_my_act">
                            <div class="weui-cell__hd"><img src="${req.contextPath}/assets/img/my-active.png" alt="" style="width:16px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd weui-cell_primary">
                                <p>我的活动</p>
                            </div>
                            <span class="weui-cell__ft"></span>
                        </a>
                        <a class="weui-cell weui-cell_access" href="${req.contextPath}/we/h5/my/to_my_fh">
                            <div class="weui-cell__hd"><img src="${req.contextPath}/assets/img/my-fh.png" alt="" style="width:16px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd weui-cell_primary">
                                <p>我的分会</p>
                            </div>
                            <span class="weui-cell__ft"></span>
                        </a>
                        <!-- <a class="weui-cell weui-cell_access" href="javascript:;">
                            <div class="weui-cell__hd"><img src="${req.contextPath}/assets/img/my-msg.png" alt="" style="width:13px;margin-right:5px;display:block"></div>
                            <div class="weui-cell__bd weui-cell_primary">
                                <p>我的资讯</p>
                            </div>
                            <span class="weui-cell__ft"></span>
                        </a>-->
                    </div>
                </div>
            </div>
        </div>
        <div class="weui-tabbar" style="position: fixed">
            <a href="${req.contextPath}/we/h5/home" class="weui-tabbar__item">
                <span style="display: inline-block;position: relative;">
                    <img src="${req.contextPath}/assets/img/schoolmate.png" alt="" class="weui-tabbar__icon">
                    <span class="weui-badge" style="position: absolute;top: -2px;right: -13px;">8</span>
                </span>
                <p class="weui-tabbar__label">校友会</p>
            </a>
             <a href="${req.contextPath}/we/h5/view" class="weui-tabbar__item">
                    <span style="display: inline-block;position: relative;">
                        <img src="${req.contextPath}/assets/img/schoolbook.png" alt="" class="weui-tabbar__icon">
                        <span class="weui-badge weui-badge_dot" style="position: absolute;top: 0;right: -6px;"></span>
                    </span>
                    <p class="weui-tabbar__label">校友录</p>
                </a>
            <a href="javascript:;" class="weui-tabbar__item weui-bar__item_on">
                <span style="display: inline-block;position: relative;">
                    <img src="${req.contextPath}/assets/img/my-click.png" alt="" class="weui-tabbar__icon">
                </span>
                <p class="weui-tabbar__label">我的</p>
            </a>
        </div>
    </div>
</div>
</body>
<script>
 $(function(){
       function getInfo(){
           var infoUrl = '${req.contextPath}/we/xy/my_info';
            $.ajax({url:infoUrl,type:'post',success:function(d){
                if(d.code==0){
                    var headImg=d.data.sex=='女'?"${req.contextPath}/assets/img/f-user.png":"${req.contextPath}/assets/img/m-user.png";
                    if(d.data.headImgUrl && d.data.headImgUrl!==""){
                        headImg=d.data.headImgUrl
                    }
                     $('.my-info-img').find('img').prop('src',headImg);
                     $('.my-info-word .weui-media-box__title').find('span').html(d.data.name);
                     $('.my-info-word .weui-media-box__desc').find('span').eq(0).html(d.data.xyYear);
                     $('.my-info-word .weui-media-box__desc').find('span').eq(1).html(d.data.xyName);
                     if(d.data.role==0){//0：管理员 1：普通用户
                         $('.my-info .manager-turn').show();
                     }
                }
            }});
       }
       getInfo();
 })
</script>
</html>