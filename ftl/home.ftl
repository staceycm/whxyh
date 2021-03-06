<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>${xiaoyouhuiName}</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/plugin/swiper/swiper-4.3.3.min.css">

    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${req.contextPath}/assets/plugin/swiper/swiper-4.3.3.min.js"></script>
    <script src="${req.contextPath}/assets/js/base.js"></script>
</head>
    <div class="page_bd page-home">
        <div class="weui-tab">
            <div class="weui-tab__panel">
                <div class="swiper-container">
                    <div class="swiper-wrapper">

                    </div>
                    <div class="swiper-pagination"></div>
                </div>
                <div class="branch-list-wrap">
                    <ul class="branch-list">
                        <!--<li><span>老</span>老校友会</li>
                        <li><span>经</span>经管分会</li>
                        <li><span>法</span>法学分会</li>
                        <li><span>文</span>文学分会</li>
                        <li class="show-more"><i class="icon iconfont">&#xe60c;</i>更多</li>
                        <li class="branch-more"><span>测</span>测绘分会</li>
                        <li class="branch-more"><span>水</span>水电分会</li>
                        <li class="branch-more"><span>政</span>政管分会</li>
                        <li class="branch-more"><span>互</span>互联网AI分会</li>
                        <li class="branch-more"><span>北</span>北京研究生联谊会</li>
                        <li class="branch-more"><span>物</span>物理电信分会</li>
                        <li class="branch-more"><span>医</span>医学分会</li>
                        <li class="branch-more"><span>信</span>信管分会</li>
                        <li class="branch-more"><span>传</span>媒分会</li>
                        <li class="branch-more"><span>化</span>化学分会</li>
                        <li class="branch-more"><span>环</span>环渤海分会</li>
                        <li class="branch-more"><span>外</span>外语分会</li>
                        <li class="branch-more"><span>历</span>历史分会</li>
                        <li class="branch-more"><span>艺</span>艺术分会</li>
                        <li class="branch-more show-less"><i class="icon iconfont">&#xe600;</i>收起</li>-->
                    </ul>
                </div>
                <div class="weui-tab" style="height: auto">
                    <div class="weui-navbar">
                        <div class="weui-navbar__item" data-nav="intro">简介</div>
                        <div class="weui-navbar__item weui-bar__item_on" data-nav="feed">资讯 </div>
                        <div class="weui-navbar__item" data-nav="active">活动</div>
                    </div>
                    <div class="weui-tab__panel intro-panel" style="height: auto;">
                        <div class="intro-bg"></div>
                        <div class="intro-word">
                            <span class="intro-word-title">武大北京校友会简介</span>
                            <p>武汉大学北京校友会成立于1983年，首任名誉会长是叶圣陶先生。李锐学长、董辅礽老师均担任过北京校友会会长。现任会长为武汉大学79级校友陈东升。<br/>
北京校友会希望可以团结在北京的武大历届校友，互相帮助，为北京的城市发展、国家的进步带来积极影响和贡献。</p>
                        </div>
                        <div class="intro-frame">
                            <span class="intro-frame-title">武大北京校友会架构</span>
                            <div class="intro-frame-list">
                                <ul>
                                    <!-- <li><a class="bg1 font20" href="${req.contextPath}/we/h5/cap/index?id=106668">老校友会</a></li>
                                    <li><a class="bg1 font18" href="${req.contextPath}/we/h5/cap/index?id=106669">经管分会</a></li>
                                    <li><a class="bg2 font22" href="${req.contextPath}/we/h5/cap/index?id=106678">互联网AI分会</a></li>
                                    <li><a class="bg1 font18" href="${req.contextPath}/we/h5/cap/index?id=106679">信管分会</a></li>
                                    <li><a class="bg1 font18" href="${req.contextPath}/we/h5/cap/index?id=106670">法学分会</a></li>
                                    <li><a class="bg2 font18" href="${req.contextPath}/we/h5/cap/index?id=106670">测绘分会</a></li>
                                    <li><a class="bg2 font20" href="${req.contextPath}/we/h5/cap/index?id=106673">水电分会</a></li>
                                    <li><a class="bg3 font20" href="${req.contextPath}/we/h5/cap/index?id=106676">北京研究生联谊会</a></li>
                                    <li><a class="bg1 font15" href="${req.contextPath}/we/h5/cap/index?id=106680">传媒分会</a></li>
                                    <li><a class="bg2 font18" href="${req.contextPath}/we/h5/cap/index?id=106681">化学分会</a></li>
                                    <li><a class="bg1 font18" href="${req.contextPath}/we/h5/cap/index?id=106684">历史分会</a></li>
                                    <li><a class="bg2 font20" href="${req.contextPath}/we/h5/cap/index?id=106685">艺术分会</a></li>
                                    <li><a class="bg1 font15" href="${req.contextPath}/we/h5/cap/index?id=106683">外语分会</a></li>
                                    <li><a class="bg2 font22" href="${req.contextPath}/we/h5/cap/index?id=106671">文学分会</a></li>
                                    <li><a class="bg3 font22" href="${req.contextPath}/we/h5/cap/index?id=106682">物理电信分会</a></li>
                                    <li><a class="bg1 font18" href="${req.contextPath}/we/h5/cap/index?id=106675">环渤海分会</a></li>
                                    <li><a class="bg2 font22" href="${req.contextPath}/we/h5/cap/index?id=106677">医学分会</a></li>
                                    <li><a class="bg1 font18" href="${req.contextPath}/we/h5/cap/index?id=106677">城设分会</a></li> -->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="weui-tab__panel feed-panel panel-active" style="height: auto;">
                        <div class="weui-navigator ">
                            <div id="tagnav" class="weui-navigator-wrapper">
                               <ul class="weui-navigator-list"></ul>
                            </div>
                            <div class="add-navigator"><a href="">+</a></div>
                        </div>

                       <div class="feed-detail"></div>
                    </div>
                    <div class="weui-tab__panel active-panel" style="height: auto;">
                        <div class="active-detail"></div>
                    </div>
                </div>
            </div>
            <div class="weui-tabbar" style="position: fixed">
                <a href="javascript:;" class="weui-tabbar__item weui-bar__item_on">
                    <span style="display: inline-block;position: relative;">
                        <img src="${req.contextPath}/assets/img/schoolmate-click.png" alt="" class="weui-tabbar__icon">
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
                <a href="${req.contextPath}/we/h5/my/index" class="weui-tabbar__item ">
                    <span style="display: inline-block;position: relative;">
                        <img src="${req.contextPath}/assets/img/my.png" alt="" class="weui-tabbar__icon">
                    </span>
                    <p class="weui-tabbar__label">我的</p>
                </a>
            </div>
        </div>
        <div class="home-share">
            <a href=""><i class="iconfont">&#xe77d;</i></a>
        </div>
    </div>
</body>
<script>
 $(function(){
     var page= 'feed';//'intro active'
     var storage={feed:{},active:{st:1,all:false}};//st:活动页初始页面为 1 all:是否全部加载完 //缓存资讯数据
     var getListFlag=true;//数据锁

     function getLunbo(){
          var fhLunboUrl = 'https://api.botbrain.ai/rec/v1/JRVPRMIT9P/feed?uid=pic&column_id=106688';
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


     //分会列表获取
     function getFenHui(){
         var fhUrl = '${req.contextPath}/we/cap/getCha'
         var fhHtml='',fhJjHtml='';
         var colArr=['#f5b8b8','#ff9393','#85aff0','#b9d784','#ffc549',
                  '#f0a786','#89c9fe','#bfa0ee','#e5c144','#75cc81',
                  '#5bd0d5','#ff9157','#4eb3f1','#ff8e85','#e0ce9d',
                  '#ffb8eb','#9dc4ff','#8fdc6b','#f5b8b8','#ff9393',
                  '#85aff0','#b9d784','#ffc549','#f0a786','#89c9fe',
                  '#bfa0ee','#e5c144','#75cc81','#5bd0d5','#ff9157',
                  '#4eb3f1','#ff8e85','#e0ce9d','#ffb8eb','#9dc4ff','#8fdc6b','#75cc81','#89c9fe']
         $.ajax({url:fhUrl,type:'post',success:
            function(d){
                  (d.data||[]).forEach(function(item,idx){
                           var firstLeter = item.jc_name.substr(0,1);
                           var randomNum = Math.ceil(Math.random()*2);
                           if(idx<4){
                                fhHtml='<li data-fhid="'+item.id+'" ><a href="${req.contextPath}/we/h5/cap/index?id='+item.id+'"><span style="background: '+colArr[idx]+'">'+firstLeter+'</span>'+item.jc_name+'</a></li>';
                           }else if(idx==4){
                                fhHtml='<li class="show-more"><i class="icon iconfont">&#xe60c;</i>更多</li>'+
                                       '<li class="branch-more" data-fhid="'+item.id+'"><a href="${req.contextPath}/we/h5/cap/index?id='+item.id+'"><span style="background: '+colArr[idx]+'">'+firstLeter+'</span>'+item.jc_name+'</a></li>'
                           }else{
                               fhHtml='<li class="branch-more" data-fhid="'+item.id+'"><a href="${req.contextPath}/we/h5/cap/index?id='+item.id+'"><span style="background: '+colArr[idx]+'">'+firstLeter+'</span>'+item.jc_name+'</a></li>'
                           }
                           $('.branch-list').append(fhHtml);
                           fhJjHtml+='<li><a class="bg'+randomNum+'" href="${req.contextPath}/we/h5/cap/index?id='+item.id+'">'+item.jc_name+'</a></li>'
                       })
                       $('.branch-list').append('<li class="branch-more show-less"><i class="icon iconfont">&#xe600;</i>收起</li>');
                        $('.intro-frame-list ul').append(fhJjHtml);
                        //显示更多
                       $('.show-more').on('click',function(){
                           $(this).hide('fast',function(){
                                $('.branch-more').fadeIn()
                           });
                       })
                       //收起
                       $('.show-less').on('click',function(){
                           $('.show-more').show();
                           $('.branch-more').fadeOut()
                       })
              }})

     }
     //资讯栏目获取
     function getFeed(){
         var columnUrl = 'https://api.botbrain.ai/config/v1/JRVPRMIT9P';
         $.getJSON(columnUrl,{},function(d){
                 if(d.code==0){
                     // 重新计算二级菜单长度
                     var sum_width=0,html='';
                     d.data.columns.forEach(function(item,idx){
                         if(idx==0){
                            storage.feed.show=item.id //当前显示列表的栏目id
                         }
                         html+='<li data-columnid="'+item.id+'"><a href="javascript:;">'+item.name+'</a></li>'
                         var name = 'column'+item.id
                         storage.feed[name]={};
                     })
                     $('.weui-navigator-list').append(html);
                     $('.weui-navigator-list li:first').addClass('weui-state-active');
                     // $('.weui-navigator-list li:last').css('width',$('.weui-navigator-list li:last').width()+30);
                     // // 重新计算二级菜单长度
                     // $('.weui-navigator-list li').map(function(idx,item){
                     //     sum_width+=($(item).width())-0;
                     // });
                     // $('.weui-navigator-list').width(sum_width+30);
                     $(".weui-navigator-list li").on('click touchstart',function(e){
                         window.event? window.event.returnValue = false : e.preventDefault();
                         $(".weui-navigator-list li.weui-state-active").removeClass('weui-state-active');
                         $(e.target).parent().addClass('weui-state-active');
                         var iWidth = $(e.target).width();
                         var iLeft = $(e.target)[0].offsetLeft;
                         var screenW = (window.innerWidth - iWidth)/2;
                         $('.weui-navigator-wrapper').stop().animate({
                             scrollLeft:iLeft - screenW +'px'
                         },500);
                         var name='column'+$(e.target).parent().data('columnid');
                         var data = storage.feed[name].data;
                         if(data!=null){
                             $('.feed-detail').html(data);
                         }else{
                             storage.feed.show=$(e.target).parent().data('columnid');
                             renderList('change');
                         }
                     });
                     //第一个栏目feed信息初始化
                     renderList('change')
                 }
              })
     }
     //各栏目数据渲染
     function renderList(type){
        var feedUrl = 'https://api.botbrain.ai/rec/v1/JRVPRMIT9P/time?uid=1223&column_id='+storage.feed.show+'&action=1';
         if(type=='change'){
             $('.feed-detail').html('');
         }else{//add 下拉加载
             feedUrl = 'https://api.botbrain.ai/rec/v1/JRVPRMIT9P/time?uid=1223&column_id='+storage.feed.show+'&action=3&load_cursor='+storage.feed['column'+storage.feed.show].load_cursor+'&refresh_cursor='+storage.feed['column'+storage.feed.show].refresh_cursor;
         }
        getListFlag=false;
         $.getJSON(feedUrl,{},function(d){
             if(d.code==0){
                 d.data.items.map(function(item,index){
                     var time = getTimer(item.insert_time);
                     if(item.layout == '1'){//无图
                        list = $('<div class="noPic_container feed-detail-container"><a href="'+item.view_url+'">'+
                                '<p class="noPic_text font17">'+item.title+'</p>'+
                                '<div class="noPic_active font14">'+
                                '<div class="noPic_summary">'+item.summary+'</div>'+
                                '<div class="noPic_source font13">'+item.source_name+'<span class=noPic_time>'+time+'</span><span class="dislike"><i class="iconfont">&#xe60d;</i></span></div>'+
                                '</div></a></div>');
                        $('.feed-detail').append(list);
                     }else if(item.layout == '2'){//单小
                        list = $('<div class="onePic_container feed-detail-container"><a href="'+item.view_url+'">'+
                                 '<div class="onePic_left">'+
                                 '<p class="onePic_text font17">'+item.title+'</p>'+
                                 '<div class="onePic_active font14">'+
                                 '<div class="onePic_source font13">'+item.source_name+'<span class=onePic_time>'+time+'</span><span class="dislike"><i class="iconfont">&#xe60d;</i></span></div>'+
                                 '</div>'+
                                 '</div>'+
                                 '<div class="onePic_right">'+
                                 '<img src='+item.images[0]+'/>'+
                                 '</div></a></div>');
                        $('.feed-detail').append(list);
                     }else if(item.layout == '3'){//单大
                        list = $('<div class="bigPic_container feed-detail-container"><a href="'+item.view_url+'">'+
                                 '<p class="bigPic_text font17">'+item.title+'</p>'+
                                 '<img src='+item.images[0]+' />'+
                                 '<div class="bigPic_active font14">'+
                                 '<div class="bigPic_source font13">'+item.source_name+'<span class=bigPic_time>'+time+'</span><span class="dislike"><i class="iconfont">&#xe60d;</i></span></div>'+
                                 '</div></a></div>');
                        $('.feed-detail').append(list);
                     }else if(item.layout == '4'){//三图
                        list = $('<div class="threePic_container feed-detail-container"><a href="'+item.view_url+'">'+
                                 '<p class="threePic_text font17">'+item.title+'</p>'+
                                 '<div class="threePic_box">'+
                                    '<div class="threeImg">'+
                                        '<img src='+item.images[0]+' />'+
                                    '</div>'+
                                    '<div class="threeImg">'+
                                        '<img src='+item.images[1]+' />'+
                                    '</div>'+
                                    '<div class="threeImg">'+
                                        '<img src='+item.images[2]+' />'+
                                    '</div>'+
                                 '</div>'+
                                 '<div class="threePic_active font14">'+
                                    '<div class="threePic_source font13">'+item.source_name+'<span class=threePic_time>'+time+'</span><span class="dislike"><i class="iconfont">&#xe60d;</i></span></div>'+
                                 '</div></a></div>');
                        $('.feed-detail').append(list);
                        storage.feed['column'+storage.feed.show].data=$('.feed-detail').html();
                        storage.feed['column'+storage.feed.show].load_cursor=d.data.time_param.load_cursor;
                        storage.feed['column'+storage.feed.show].refresh_cursor=d.data.time_param.refresh_cursor;
                        getListFlag=true
                     }
                   })
             }
         })
     }
     //活动列表获取
     function getActive(){
         var activeUrl = '${req.contextPath}/we/act/list?start='+storage.active.st;
         var activeHtml ='';
         $.ajax({url:activeUrl,type:'post',success:function(d){
             
             (d.data.data||[]).map(function(item,idx){
                  var start = formatDateTime(item.actStrTime,'noyear'),end = formatDateTime(item.actEndTime,'noyear');
                  activeHtml = $('<a href="${req.contextPath}/we/h5/act/index?actId='+item.id+'"><div class="bigPic_container feed-detail-container">'+
                           '<img src="'+item.img_url+'"/>'+
                           '<p class="bigPic_text font18">'+item.name+'</p>'+
                           '<div class="bigPic_active font14">'+
                           '<div class="bigPic_source"><i class="iconfont">&#xe68f;</i> 活动时间：'+start+'~'+end+'</div>'+
                           '<div class="bigPic_source"><i class="iconfont">&#xe6c3;</i> 活动地点：'+item.actAddr+'</div>'+
                           '</div></div></a>');
                  $('.active-detail').append(activeHtml);
              })
             if(d.data.data.length<10){
                 storage.active.all=true;//已经全部加载完
                 if(d.data.data.length==0&&storage.active.st==1){//第一次加载且数据为空时
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
     getFenHui();
     getFeed();
     getActive();


     //切换panel
     $('.weui-navbar__item').on('click touchend',function(){
         $(this).addClass('weui-bar__item_on').siblings().removeClass('weui-bar__item_on');
         page = $(this).data('nav');
         $('.'+page+'-panel').addClass('panel-active').siblings().removeClass('panel-active');
     })
     // 资讯不喜欢
     $('.feed-detail').on('click touchend',function(e){
         if($(e.target).is('i')){
             $(e.target).parents('.feed-detail-container').slideUp('slow').hide();
         }
     })
     //页面监听滚动
     $(document).scroll(function()
         {
             if($(document).height() - $(document).scrollTop() - window.innerHeight <100 ){ //距离页面底部还有100px时
                  if(page=='active'){//活动页
                      if(!storage.active.all) {
                          storage.active.st+=1
                          getActive()
                      }
                  }else if(page=='feed'){
                      getListFlag && renderList('add')
                  }
             }
         });
 })
</script>
</html>