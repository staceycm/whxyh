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
    <div class="page_bd page-alumni-record">
        <!--<a href="javascript:;" class="weui-btn weui-btn_primary">点击展现searchBar</a>-->
        <div class="weui-search-bar" id="searchBar">
            <form class="weui-search-bar__form" onsubmit="return false;">
                <div class="weui-search-bar__box">
                    <i class="weui-icon-search"></i>
                    <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="请输入姓名、单位、职业或关注领域" required="">
                    <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
                </div>
                <label class="weui-search-bar__label" id="searchText" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
                    <i class="weui-icon-search"></i>
                    <span>搜索</span>
                </label>
            </form>
            <a href="javascript:" class="weui-search-bar__cancel-btn" id="search">搜索</a>
        </div>
        <div class="select-form">
            <div class="select-wrap">
                <select class="weui-select" name="xyYear" id="xyYear">
                    <option value="">年级</option>
                </select>
                <span class="select-arrow"></span>
            </div>
            <div class="select-wrap">
                <select class="weui-select" name="xyName" id="xyName">
                    <option value="">学院</option>
                </select>
                <span class="select-arrow"></span>
            </div>
            <div class="select-wrap">
                <select class="weui-select" name="fh_id" id="fh_id">
                    <option value="">分会</option>
                </select>
                <span class="select-arrow"></span>
            </div>
        </div>
        <div class="alumni-count">校友列表共 <span>XX</span> 位</div>
        <div class="alumni-list"></div>
        <!--<div class="weui-cells searchbar-result" id="searchResult" style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1); display: none;">
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd weui-cell_primary">
                    <p>实时搜索文本</p>
                </div>
            </div>
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd weui-cell_primary">
                    <p>实时搜索文本</p>
                </div>
            </div>
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd weui-cell_primary">
                    <p>实时搜索文本</p>
                </div>
            </div>
            <div class="weui-cell weui-cell_access">
                <div class="weui-cell__bd weui-cell_primary">
                    <p>实时搜索文本</p>
                </div>
            </div>
        </div>-->
        <div class="weui-tabbar" style="position: fixed">
            <a href="${req.contextPath}/we/h5/home" class="weui-tabbar__item">
                <span style="display: inline-block;position: relative;">
                    <img src="${req.contextPath}/assets/img/schoolmate.png" alt="" class="weui-tabbar__icon">
                    <span class="weui-badge" style="position: absolute;top: -2px;right: -13px;">8</span>
                </span>
                <p class="weui-tabbar__label">校友会</p>
            </a>
            <a href="javascript:;" class="weui-tabbar__item weui-bar__item_on">
                <span style="display: inline-block;position: relative;">
                    <img src="${req.contextPath}/assets/img/schoolbook-click.png" alt="" class="weui-tabbar__icon">
                    <span class="weui-badge weui-badge_dot" style="position: absolute;top: 0;right: -6px;"></span>
                </span>
                <p class="weui-tabbar__label">校友录</p>
            </a>
            <a href="${req.contextPath}/we/h5/my/index" class="weui-tabbar__item">
                <span style="display: inline-block;position: relative;">
                    <img src="${req.contextPath}/assets/img/my.png" alt="" class="weui-tabbar__icon">
                </span>
                <p class="weui-tabbar__label">我的</p>
            </a>
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
    <script>
     $(function(){
         var param = {kw:'',xyYear:'',xyName:'',fh_id:'',start:1,all:false};//kw:搜索的内容 xyYear:入学年限 xyNname:学院名称 fh_id: 分会id start 初始页码
         var eclipseWrap={xyName:{val:'',text:'学院'},fh_id:{val:'',text:'分会'}};
         var $searchBar = $('#searchBar'),
            // $searchResult = $('#searchResult'),
            $searchText = $('#searchText'),
            $searchInput = $('#searchInput'),
            $searchClear = $('#searchClear'),
            $search = $('#search');
        function hideSearchResult(){
            // $searchResult.hide();
            $searchInput.val('');
        }
        function cancelSearch(){
            hideSearchResult();
            $searchBar.removeClass('weui-search-bar_focusing');
            $searchText.show();
        }
        $searchText.on('click', function(){
            $searchBar.addClass('weui-search-bar_focusing');
            $searchInput.focus();
        });
        $searchInput.on('blur', function () {
            if(!this.value.length) cancelSearch();
        });
        $searchInput.bind('search',function(){//绑定手机键盘上搜索按钮
            param.kw=$searchInput.val();
            param.start=1;
            getAlumniList('search');
        })
        $search.on('click',function(){//搜索按钮搜索
            param.kw=$searchInput.val();
            param.start=1;
            getAlumniList('search');
        })
        $('#xyYear,#xyName,#fh_id').on('click',function(){
            var name = $(this).attr('name')
            $(this).next('span').toggleClass('active');
            if($(this).next('span').is('.active')){//展开状态下 把省略号收回 option中文字复原
                $(this).find("option:selected").text( eclipseWrap[name].text);
            }
        })
        $('#xyYear,#xyName,#fh_id').on('change',function(){
            var val= $(this).val();
            var text = $(this).find("option:selected").text()
            param.xyYear=$('#xyYear').val();
            param.xyName=$('#xyName').val();
            param.fh_id=$('#fh_id').val();
            param.start=1;
            if(val!==''){//选中后变蓝色
                $(this).css('color','#30a9ff');
                if(val.length>=6){//如果大于六个字符 要拼省略号 原生样式不支持
                    var name = $(this).attr('name')
                    eclipseWrap[name]={val:val,text:text}
                    var str = text.substr(0,2)+'...'+text.substr(-2);
                    $(this).find("option:selected").text(str);
                }
            }else{
                $(this).css('color','#666666');
            }
            getAlumniList('search');
        })
            // .on('input', function(){
            //     if(this.value.length) {
            //         $searchResult.show();
            //     } else {
            //         $searchResult.hide();
            //     }
            // });
        //1970年至今遍历
        function getYearSelect(){
            var date = new Date();
            var y = date.getFullYear();
            var yearHtml='';
            for(var i = 1970;i<=y;i++){
                yearHtml+='<option value="'+i+'" >'+i+'</option>';
            }
            $('#xyYear').append(yearHtml);
        }
        //获取学院列表
        function getXySelect(){
            var xyUrl = '${req.contextPath}/we/xy/xy_list';
            var xyHtml='';
            $.ajax({url:xyUrl,type:'post',success:
                function(d){
                    d.data.forEach(function(item,idx){
                        xyHtml+='<option value="'+item+'" >'+item+'</option>';
                    });
                    $('#xyName').append(xyHtml);
                }
            })
        }
        //获取分会列表
        function getFhSelect(){
             var fhUrl = '${req.contextPath}/we/cap/getCha'
             var fhHtml='';
             $.ajax({url:fhUrl,type:'post',success:
                function(d){
                    d.data.forEach(function(item,idx){
                        fhHtml+='<option value="'+item.id+'" >'+item.jc_name+'</option>';
                    });
                    $('#fh_id').append(fhHtml);
                }
             })
        }
        //获取校友列表
        function getAlumniList(type){
            var alumniUrl = '${req.contextPath}/we/xy/findxy_list?kw='+encodeURI(encodeURI(param.kw))+'&xyYear='+param.xyYear+'&xyName='+encodeURI(encodeURI(param.xyName))+'&fh_id='+param.fh_id+'&start='+param.start;
            var alumniHtml=''
            $.ajax({url:alumniUrl,type:'post',success:
                function(d){
                    if(d.code==0){
                        $('.alumni-count').find('span').html(d.data.num);
                        (d.data.xy_list||[]).forEach(function(item,idx){
                            var className = item.state ==1?"icon-cc-heart":"icon-cc-heart-o"; // 1已经被关注收藏  0 未被关注收藏
                            var telHanderHtml='',telShowHtml='',xyAcademy2Html='';
                            if(item.showMobile){//false不公开 true公开
                                telHanderHtml='<a href="tel:'+item.mobile+'"><i class="iconfont icon-tel">&#xe634;</i></a>';
                                telShowHtml= '<p class="weui-media-box__desc">电话：<span>'+item.mobile+'</span></p>'
                            }
                            if(item.xyAcademy2!=null){
                                xyAcademy2Html='    <p class="weui-media-box__desc" style="padding-bottom:6px;">'+item.xyAcademy2+'-'+item.xyType2+'-'+item.xyYear2+'</p>';
                            }
                            var headImg=d.data.sex=='女'?"${req.contextPath}/assets/img/f-user.png":"${req.contextPath}//assets/img/m-user.png";
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
                                           '        <span data-openid="'+item.openId+'" data-name="'+item.name+'"><i class="iconfont icon-da-call '+className+'" ></i><i class="iconfont icon-send-msg" >&#xe643;</i>'+telHanderHtml+'</span>'+
                                           '    </h4>'+
                                           '    <p class="weui-media-box__desc" style="padding-bottom:6px;">'+item.xyAcademy+'-'+item.xyType+'-'+item.xyYear+'</p>'+xyAcademy2Html+
                                           '    <p class="weui-media-box__desc" style="padding-bottom:6px;">'+item.danwei+'-'+item.zhiwu+'</p>'+telShowHtml+
                                           '  </div>'+
                                           '</div>'
                        })
                        if(d.data.xy_list.length<10){
                             param.all=true;//已经全部加载完
                             if(d.data.xy_list.length==0&&param.start==1){//第一次加载或搜索且数据为空时
                                   alumniHtml = $('<div class="bigPic_container feed-detail-container no-content">'+
                                            '<img src="${req.contextPath}/assets/img/null.png" />'+
                                            '<div class="bigPic_active font12">'+
                                            '<div class="bigPic_source" style="text-align: center">暂无数据~</div>'+
                                            '</div></div>');
                             }
                         }
                        if(type=='search'){
                             $('.alumni-list').html(alumniHtml);
                             $('.alumni-count').html('搜索到<span>'+d.data.num+'</span>位符合条件的校友')
                        }else{
                             $('.alumni-list').append(alumniHtml);
                        }
                    }
                }
            })
        }
        function init(){
            getYearSelect();
            getXySelect();
            getFhSelect();
            getAlumniList()
        }
        init();
        //收藏该校友 取消收藏该校友 发送信息
        $('.alumni-list').on('click',function(e){
            var openId,state;
            var $target = $(e.target);
            if($target.is('.icon-da-call')){
                if($target.is('.icon-cc-heart')){
                    $target.addClass('icon-cc-heart-o').removeClass('icon-cc-heart');//取消收藏
                    state=1 //操作类型   0添加收藏 1取消收藏
                }else{
                    $target.addClass('icon-cc-heart').removeClass('icon-cc-heart-o');//收藏
                    state=0
                }
                var daCallUrl = '${req.contextPath}/we/xy/collect';
                openId = $target.parent().data('openid');
                $.post(daCallUrl, {xy_openId:openId,state:state },function(d){
                    if(d.code==0){
                        bb_toast(d.msg)
                    }
                 });
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
            		if(d.code==0){
                        bb_toast(d.msg);
            			$dialog.fadeOut(200);
            		} else {
            		    bb_toast(d.msg);
            			$dialog.fadeOut(200);
            		}
            	});
          });
        }

        //下拉监听
        $(document).scroll(function(){
             if($(document).height() - $(document).scrollTop() - window.innerHeight <100 )
             {
                 if(!param.all) {
                     param.start+=1;
                     getAlumniList('add');
                 }
             }
         });
     })
    </script>
</body>
</html>