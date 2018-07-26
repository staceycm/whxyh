<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
        charset="utf-8">
    <title>校友信息</title>
    <link rel="stylesheet" href="${req.contextPath}/assets/css/wi-administration.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">
    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${req.contextPath}/assets/js/base.js"></script>
    <style>
    	 .delete-peoples{
    	 	width: 100%;
    	 	height: 100%;
    	 	background: rgba(0,0,0,0.7);
    	 	position:fixed;
		 	 top: 0;left: 0;
		 	 display:-webkit-flex;
		 	 -webkit-justify-content:center;
		 	 -webkit-align-items:center;

    	 }
    	.delete-center-white{
    		width: 5.2rem;
    		height: 2.13rem;
    		background: #FFFFFF;
			border-radius: .15rem .2rem .2rem .2rem;
			 overflow:hidden;
    	}
    	
    	.delete-center-white p{
    		width: 100%;
    		height: 1.3rem;
    		border-bottom:1px solid #F5F5F5;
    		font-size:.32rem;
    		text-align:center;
    		line-height: 1.3rem;
    	}
    	.delete-center-white div{
    		height:.8rem;
    		display:-webkit-flex;
    	}
    	
    	.delete-center-white button{
    		width: 49.5%;
    		height: .8rem;
    		border:none;
    		font-size:.28rem;
    		color:#999999;
    		border-right:1px solid #F5F5F5;
    		background:white;
    		box-sizing:border-box;
    	}
    	.delete-center-white button:last-child{
    		border-right:none;
    		color:#30A9FF;
    	}
    	.noreject{
    	   width:100%!important;
    	}
    	/*陈萌新增样式*/
        .user-file-handler{
            display: -webkit-box;      /* OLD - iOS 6-, Safari 3.1-6 */
            display: -moz-box;         /* OLD - Firefox 19- (buggy but mostly works) */
            display: -ms-flexbox;      /* TWEENER - IE 10 */
            display: -webkit-flex;     /* NEW - Chrome */
            display: flex;
            height: .9rem;
            line-height: .9rem;
            flex-shrink: 0;
            -webkit-flex-shrink: 0;
            width: 100%;
        }
        .user-file-handler a{
            display: -webkit-box;      /* OLD - iOS 6-, Safari 3.1-6 */
            display: -moz-box;         /* OLD - Firefox 19- (buggy but mostly works) */
            display: -ms-flexbox;      /* TWEENER - IE 10 */
            display: -webkit-flex;     /* NEW - Chrome */
            display: flex;
            flex-grow: 1;
            font-size: 18px;
            color:#000
        }
        .user-file-handler a i{
            margin: 0 auto;
        }
        .user-file-handler a i.icon-cc-heart{
            color:#f74f51
        }
    	
    </style>
</head>
<body>
    <div class="adminFriendFiles">
        <div class="userfileHeader">
            <img src="${req.contextPath}/assets/img/user-icon.jpg" alt="">
            <h2 class="wx-name"></h2>
        </div>
        <div class="userfile-content">
            <div class="userfile-list-item list1-orheight">
                <div>真实姓名</div>
                <div class="username"></div>
            </div>
            <div class="userfile-list-item list1-orheight">
                <div>公司/单位</div>
                <div class="userdanwei"></div>
            </div>
            <div class="userfile-list-item list1-orheight">
                <div>职务</div>
                <div class="user-zhiwu"></div>
            </div>
           <!--<div class="userfile-list-item list1-orheight">
                <div>手机号码</div>
                <div class="user-phone"></div>
            </div>-->
            <div class="userfile-list-item list1-orheight">
                <div>微信号</div>
                <div class="user-wexin"> </div>
            </div>
            <div class="userfile-list-item list1-orheight">
                <div>校友</div>
                <div class="user-file-school-year"> </div>
            </div>
            
        </div>
        <div class="userfile-content">
            <div class="userfile-list-item">
                <div>关注的领域</div>
                <div class="user-file-guanzhu"></div>
            </div>
            <div class="userfile-list-item">
                <div>他的诉求</div>
                <div class="user-file-suqiu"></div>
            </div>

        </div>
        
        <div class="userfile-content">
            <div class="userfile-list-item">
                <div>加入分会</div>
                <div class="user-file-fh"></div>
            </div>
            <div class="userfile-list-item">
                <span class="user-file-handler">
                    <a href="javascript:;"><i class="iconfont icon-da-call"></i></a>
                    <a href="javascript:;"><i class="iconfont icon-send-msg">&#xe643;</i></a>
                </span>
            </div>
        </div>
        
        <!-- 这个是审核用户 -->
        <div class="rejectFn">
            <button class="noreject">删除</button>
        </div>
        
        <!--这个是删除-->
        <div class="delete-peoples" style="display:none">
        	<div class="delete-center-white">
	        	<p>确定删除么？</p>
	        	<div>
	        		<button class="quxiao">取消</button>
	        		<button class="queding">确定</button>
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
    <!--BEGIN dlg_alert-->
        <div id="dlg_alert" style="display: none;">
          <div class="weui-mask"></div>
          <div class="weui-dialog">
            <div class="weui-dialog__bd">内容部分。</div>
            <div class="weui-dialog__ft"><a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary" >知道了</a></div>
          </div>
        </div>
    <!--END dlg_alert-->
    <script src="${req.contextPath}/assets/js/font.js"></script>

    <script>
        $(function () {
                $('.userfileHeader').show();
                $('.rejectHeader').hide();
                
                
                // 获取地址栏所携带的参数
                var objarr = {};
                window.location.href.split('?')[1].split('&').forEach(function (ite) {
                    var jish = ite.split('=');
                    objarr[jish[0]] = jish[1];
                });
                var ids = objarr.uid;
                // 驳回理由弹框事件
                $('.noreject').on('click', function () {
                    $('.delete-peoples').show();
                });
                
                // 判断是不是显示删除校友键
                var type='${type}';
                if (!type) {
                    $('.rejectFn').hide();
                } 
                
				// 请求校友详细信息
                $.ajax({
                    url: '${req.contextPath}/we/xy/xydetails',
                    type: 'GET',
                    data: { openId: ids },
                    success: function (res) {
                        console.log(res);
                        if (res.code == 0) {
                            setUserFile(res.data);
                        }
                    }
                });
                
/*================================= 删除提示 框 =========================================================*/
				// 取消
				$('.quxiao').on('click', function() {
					$('.delete-peoples').hide();
				})
				
				// 确定
				$('.queding').on('click', function() {
				     //删除
                      $.ajax({
                        url: '${req.contextPath}/we/admin/del_xy',
                        type: 'GET',
                        data: {
                            openId: ids
                        },
                        success: function (res) {
                            console.log(res);
                            if (res.code == 0) {
                                window.location.href = '${req.contextPath}/we/h5/view';
                            }
                        }
                   });
				})
                
/*=================================  设置校友信息 =======================================================*/                
                function setUserFile(data) {
                    $('.user-icon').attr('src', data.headImgUrl);
                    $('.userfileHeader').find('img').attr('src', data.headImgUrl);
                    $('.wx-name').html(data.nickname);
                    $('.username').html(data.name);
                    $('.userdanwei').html(data.danwei);
                    $('.user-zhiwu').html(data.zhiwu);
                    $('.user-wexin').html(data.wechatId ? data.wechatId : '');
                    $('.user-wexin').html(data.wechatId ? data.wechatId : '');
                    $('.user-file-school-year').html(data.xyAcademy+'-'+data.xyYear+'-'+data.xyType);
                    $('.user-file-guanzhu').html(data.areas);
                    $('.user-file-suqiu').html(data.twitter);
                    $('.user-file-fh').html(data.fhName);
                    // 陈萌-新增代码
                    var className = data.state ==1?"icon-cc-heart":"icon-cc-heart-o"; // 1已经被关注收藏  0 未被关注收藏
                    $('.user-file-handler .icon-da-call').addClass(className);
                    if(data.showMobile){//如果需要显示手机号 则插入拨打手机按钮
                        var telHanderHtml='<a href="tel:'+data.mobile+'"><i class="iconfont icon-tel">&#xe634;</i></a>';
                        $('.user-file-handler').append(telHanderHtml);
                    }
                }

/*=================================  新增代码-陈萌 处理收藏 取消收藏 发送信息 打电话 =======================================================*/

                //收藏该校友 取消收藏该校友 发送信息
                $('.user-file-handler').on('click',function(e){
                    var openId='',state;//el替换
                    var $target = $(e.target)
                    if($target.is('.icon-da-call')){
                        if($target.is('.icon-cc-heart')){
                            $target.addClass('icon-cc-heart-o').removeClass('icon-cc-heart');//取消收藏
                            state=1 //操作类型   0添加收藏 1取消收藏
                        }else{
                            $target.addClass('icon-cc-heart').removeClass('icon-cc-heart-o');//收藏
                            state=0
                        }
                        var daCallUrl = '${req.contextPath}/we/cap/add';
                        $.post(daCallUrl, { xy_openId: openId,state:state },function(d){
                            if(d.code==0){
                               bb_toast(d.msg)
                            }
                         });
                    }else if($target.is('.icon-send-msg')){//发送信息
                        var name = $target.parent().data('name');
                        sendSms(openId,name)
                    }else if($target.is('.icon-tel')){//打电话埋点
                         $.post('${req.contextPath}/we/callXy', { toOpenId: openId},function(d){
                               console.log(d.msg)
                         });
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

/*========================================= 工具类函数 =====================================================*/
            function timestampToTime(timestamp) {
                let date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
                Y = date.getFullYear() + '-';
                M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                D = date.getDate() + ' ';
                h = date.getHours() + ':';
                m = date.getMinutes() + ':';
                s = date.getSeconds();
                return Y + M + D + h + m + s;
            }
        })
    </script>
</body>
</html>