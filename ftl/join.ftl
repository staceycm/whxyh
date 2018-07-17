<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" charset="utf-8">
    <title>加入${xiaoyouhuiName}</title>
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/weui.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/css/w-reset.css">
    <link rel="stylesheet" type="text/css" href="${req.contextPath}/assets/font/iconfont.css">
    <script src="${req.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    function showSecondEdu(){
	$("#show_second_edu").hide();
	$("#second_edu").show();
}
    function bb_confirm(title, content, btnLeft, btnRight, fn){
      var $dialog = $('#dlg_confirm');
      $dialog.fadeIn(200);
      $dialog.find('.weui-dialog__title').text(title);
      $dialog.find('.weui-dialog__bd').text(content);
      $dialog.find('.weui-dialog__btn_default').text(btnLeft || "放弃");
      $dialog.find('.weui-dialog__btn_primary').text(btnRight || "确认");
      $dialog.find('.weui-dialog__btn').one('click', function () {
          $dialog.fadeOut(200);
          if($.isFunction(fn)){
          	fn($(this).hasClass('weui-dialog__btn_default')?"left":"right");
          }
      });
    }

    function bb_alert(content, btn,callback){
      var $dialog = $('#dlg_alert');
      $dialog.fadeIn(200);
      $dialog.find('.weui-dialog__bd').text(content);
      $dialog.find('.weui-dialog__btn_primary').text(btn || "知道了");
      $dialog.find('.weui-dialog__btn').one('click', function () {
          $dialog.fadeOut(200);
           setTimeout(function(){
				callback && callback();
          }, 200);
      });
    }

    function bb_toast(content){
      var $toast = $('#toast');
      $toast.find('.weui-toast__content').text(content || "已完成");
      if ($toast.css('display') != 'none') {
        return;
      }
      $toast.fadeIn(100);
      setTimeout(function () {
          $toast.fadeOut(100);
      }, 2000);
    }

    function bb_loading(content){
      var $loadingToast = $('#loadingToast');
      $loadingToast.find('.weui-toast__content').text(content || "数据加载中");
      if ($loadingToast.css('display') != 'none') {
        return;
      }
      $loadingToast.fadeIn(100);
      setTimeout(function () {
        $loadingToast.fadeOut(100);
      }, 2000);
    }

    function countDown(times, fn){
      fn(times);
      if(times > 0){
       setTimeout($.proxy(countDown, this, times - 1, fn), 1000);
      }
    }
    </script>
</head>
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
<!--BEGIN dlg_alert-->
<div id="dlg_alert" style="display: none;">
  <div class="weui-mask"></div>
  <div class="weui-dialog">
    <div class="weui-dialog__bd">内容部分。</div>
    <div class="weui-dialog__ft"><a href="javascript:;" class="weui-dialog__btn weui-dialog__btn_primary">知道了</a></div>
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

<!--BEGIN loading toast -->
<div id="loadingToast" style="display:none;">
  <div class="weui-mask_transparent"></div>
  <div class="weui-toast">
    <i class="weui-loading weui-icon_toast"></i>
    <p class="weui-toast__content">数据加载中</p>
  </div>
</div>
<!--END loading toast-->
<#assign has_sencond_edu=xiaoyou?? && xiaoyou.xyType2?? && xiaoyou.xyYear2?? && xiaoyou.xyAcademy2??>
<#assign cur_year=.now?string.yyyy?number> 
  <div class="container" id="container">
    <div class="page page_bd">
        <div class="weui-panel" style="margin-top: 1px;">
      <div class="weui-panel__bd">
        <div class="weui-media-box weui-media-box_appmsg">
          <div class="weui-media-box__hd">
              <img class="weui-media-box__thumb circle-img" src="${user.headImgUrl!}" alt="">
          </div>
          <div class="weui-media-box__bd">
              <h4 class="weui-media-box__title">${user.nickname!"测试"}</h4>
              <#if xiaoyou??>
          <p class="weui-media-box__desc">修改您的资料，让校友了解您的最新动态</p>
          <#else>
          <p class="weui-media-box__desc">您已经微信登陆，请补充您的资料，认证后，享受校友会各项服务</p>
          </#if>
          </div>
        </div>
      </div>
    </div>
        <form id="form" method="post" enctype="application/x-www-form-urlencoded"><input type="hidden" name="openId" value="${user.openId!}">
    <div class="weui-cells__title">基本信息</div>
    <div class="weui-cells weui-cells_form">
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">真实姓名</label></div>
        <div class="weui-cell__bd"><input name="name" value="${xiaoyou.name!}" class="weui-input" placeholder="请填写您的真实姓名"></div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">公司/单位</label></div>
        <div class="weui-cell__bd"><input name="danwei" value="${xiaoyou.danwei!}" class="weui-input" placeholder="当前所在的公司或单位名称"></div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">职务</label></div>
        <div class="weui-cell__bd"><input name="zhiwu" value="${xiaoyou.zhiwu!}" class="weui-input" placeholder="当前所担任的职务"></div>
      </div>
      <div class="weui-cell weui-cell_vcode">
        <div class="weui-cell__hd"><label class="weui-label">手机号码</label></div>
         <#if xiaoyou??>
        <div class="weui-cell__bd"><input readonly="readonly" value="${xiaoyou.mobile}" name="mobile" class="weui-input" type="tel" placeholder="手机号"></div>
        <div class="weui-cell__ft">
          <a id="btn_editmobile" href="javascript:;" class="weui-vcode-btn">修改手机号</a>
          <a id="btn_sendsms" style="display: none" href="javascript:;" class="weui-vcode-btn">获取验证码</a>
        </div>
        <#else>
        <div class="weui-cell__bd"><input name="mobile" class="weui-input" type="tel" placeholder="手机号"></div>
        <div class="weui-cell__ft"><a id="btn_sendsms" href="javascript:;" class="weui-vcode-btn">获取验证码</a></div>
    </#if>
      </div>
      <div class="weui-cell" id="cell_yanzhengma">
        <div class="weui-cell__hd"><label class="weui-label">验证码</label></div>
        <div class="weui-cell__bd"><input name="yanzhengma" class="weui-input" placeholder="请填写验证码"></div>
      </div>
      <div class="weui-cell weui-cell_switch">
        <div class="weui-cell__bd">向校友公开我的手机号码</div>
         <#if xiaoyou?? && xiaoyou.isShowMobile()>
    <div class="weui-cell__ft"><input name="showMobile" value="true" class="weui-switch" type="checkbox" checked="checked"></div>
    <#else>
    <div class="weui-cell__ft"><input name="showMobile" value="true" class="weui-switch" type="checkbox"></div>
    </#if>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">微信号</label></div>
         <div class="weui-cell__bd"><input name="wechatId" class="weui-input"  value="${xiaoyou.wechatId}" placeholder="微信号"></div>
        <div class="weui-cell__ft"><a id="btn_copy_mobile" href="javascript:;" class="weui-btn_plain-primary-copy ">同手机号</a></div>
      </div>
      <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">身份证号</label></div>
        <div class="weui-cell__bd"><input name="id_number" value="${xiaoyou.id_number}" class="weui-input" placeholder="*用户核实校友身份"></div>
      </div>
    </div>
     <div class="weui-cells__title">在校经历</div>
    <div class="weui-cells weui-cells_form">
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd"><label for="xyType" class="weui-label">校友类型</label></div>
        <div class="weui-cell__bd"><select class="weui-select" name="xyType" id="xyType">
          <option value="">选择校友类型</option>
           <#list ["学士", "硕士", "博士", "教职工"] as t>
           <option value="${t}" <#if xiaoyou?? &&xiaoyou.xyType==t> selected="selected"</#if>>${t}</option>
           </#list>
        </select>
        </div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd"><label for="xyYear" class="weui-label">入学年份</label></div>
        <div class="weui-cell__bd"><select class="weui-select" name="xyYear" id="xyYear">
          <option value="">选择入学年份</option>
               <#list cur_year..1970 as year>
               <option value="${year}" <#if xiaoyou?? &&xiaoyou.xyYear==year> selected="selected"</#if>>${year}</option>
               </#list>
               <option value="1969" <#if xiaoyou?? &&xiaoyou.xyYear==1969> selected="selected"</#if>>1970前</option>
        </select></div>
      </div>
      <#if academies??>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd"><label for="xyYear" class="weui-label">所在学院</label></div>
        <div class="weui-cell__bd"><select class="weui-select" name="xyAcademy" id="xyAcademy">
          <option value="">选择学院</option>
          <#list academies as academy>
      <option value="${academy}" <#if xiaoyou?? &&xiaoyou.xyAcademy==academy> selected="selected"</#if>>${academy}</option>
    </#list>
        </select>
        </div>
      </div>
       <#else>
    <div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">学院</label></div>
    <div class="weui-cell__bd"><input name="xyAcademy" id="xyAcademy" value="${xiaoyou.xyAcademy!}" class="weui-input" placeholder="您所在的学院"></div>
     </div>
     </#if>
     <#if !has_sencond_edu>
     <a id="show_second_edu" href="javascript:showSecondEdu();void(0);" class="weui-cell weui-cell_link"><div class="weui-cell__bd">添加另一段在校经历</div></a>
      </#if>
    </div>
    
    
    
    <div id="second_edu" <#if !has_sencond_edu>style="display:none"</#if> >
    <div class="weui-cells__title">第二段在校经历</div>
    <div class="weui-cells weui-cells_form">
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd"><label for="xyType2" class="weui-label">校友类型</label></div>
        <div class="weui-cell__bd"><select class="weui-select" name="xyType2" id="xyType2">
          <option value="">选择校友类型</option>
          <#list ["学士", "硕士", "博士", "教职工"] as t>
      <option value="${t}" <#if xiaoyou?? &&xiaoyou.xyType2==t> selected="selected"</#if>>${t}</option>
      </#list>
        </select></div>
      </div>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd"><label for="xyYear2" class="weui-label">入学年份</label></div>
        <div class="weui-cell__bd"><select class="weui-select" name="xyYear2" id="xyYear2">
          <option value="">选择入学年份</option>
            <#list cur_year..1970 as year>
              <option value="${year}" <#if xiaoyou?? &&xiaoyou.xyYear2==year> selected="selected"</#if>>${year}</option>
             </#list>
            <option value="1969" <#if xiaoyou?? &&xiaoyou.xyYear2==1969> selected="selected"</#if>>1970前</option>
        </select></div>
      </div>
      <#if academies??>
      <div class="weui-cell weui-cell_select weui-cell_select-after">
        <div class="weui-cell__hd"><label for="xyYear" class="weui-label">所在学院</label></div>
        <div class="weui-cell__bd"><select class="weui-select" name="xyAcademy2" id="xyAcademy2">
          <option value="">选择学院</option>
      <#list academies as academy>
      <option value="${academy}" <#if xiaoyou?? &&xiaoyou.xyAcademy2==academy> selected="selected"</#if>>${academy}</option>
    </#list>
        </select></div>
      </div>
       <#else>
  <div class="weui-cell">
    <div class="weui-cell__hd"><label class="weui-label">学院</label></div>
    <div class="weui-cell__bd"><input name="xyAcademy2" value="${xiaoyou.xyAcademy2}" class="weui-input" placeholder="您所在的学院"></div>
  </div>
    </#if>
    </div>
    <div class="weui-cells__tips">*只支持填写两段在校经历, 第二段可以不填</div>
    </div>

    <div class="weui-cells__title"> </div>
    <div class="weui-cells bt-0-cell">
        <div class="weui-cell">
            <div class="weui-cell__hd"><p>工作过的公司或单位名称</p></div>
        </div>
      <div class="weui-cell textarea-wrap-cell">
        <div class="weui-cell__bd"><textarea name="orgs" class="weui-textarea border-textarea" placeholder="简称即可,多个可用逗号或空格分开" rows="4">${xiaoyou.orgs!}</textarea></div>
      </div>
      <p></p>
      <div class="weui-cell">
          <div class="weui-cell__hd"><p>关注的领域</p></div>
      </div>
      <div class="weui-cell textarea-wrap-cell">
        <div class="weui-cell__bd"><textarea name="areas" class="weui-textarea border-textarea" placeholder="多个用逗号或空格隔开，如 移动互联网，金融，投资，创业，人工智能" rows="4">${xiaoyou.areas!}</textarea></div>
      </div>
      <p></p>
      <div class="weui-cell ">
        <div class="weui-cell__hd"><p>你的诉求</p></div>
    </div>
      <div class="weui-cell textarea-wrap-cell">
        <div class="weui-cell__bd"><textarea name="twitter" class="weui-textarea border-textarea" placeholder="向大家说说你的诉求" rows="4">${xiaoyou.twitter!}</textarea></div>
      </div>
    </div>
    
   
   <#if xiaoyou??>
<div class="weui-btn-area"><a class="weui-btn weui-btn_primary" href="javascript:;" id="btn_join">提交修改</a></div>
<#else>
<div class="weui-btn-area"><a class="weui-btn weui-btn_primary" href="javascript:;" id="btn_join">立即加入</a></div>
</#if>
    </form>
    </div>
  </div>
</body>
<script >
$(function(){
    $("input[name='mobile']").on('change',function(){
      if($(this).val!==''){
        $('#btn_sendsms').css('color','#30a9ff')
      }else{
        $('#btn_sendsms').css('color','#inherit')
      }
    })

    function showSecondEdu(){
    	$("#show_second_edu").hide();
    	$("#second_edu").show();
    }
      //验证表单
    	$("#btn_join").on("click", function(){
    		//check length
    		if($("textarea[name='orgs']").val().length>100){
    			bb_alert("[工作过的公司单位]不能超过100个字符");
    			return;
    		}
    		if($("textarea[name='areas']").val().length>100){
              bb_alert("[关注领域]不能超过100个字符");
              return;
            }
    		if($("textarea[name='twitter']").val().length>100){
              bb_alert("[你的诉求]不能超过100个字符");
              return;
            }
        if(!(/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test($("input[name='id_number']").val()))){
          bb_alert("身份证号码填写不正确！");
        }
    		//check required
    		var checks = ["input[name='name']", "姓名",
    		              "input[name='danwei']", "公司/单位",
                      "input[name='zhiwu']", "职务",
                      "input[name='mobile']", "手机号",
                      "select[name='xyType']", "校友类型",
                      "select[name='xyYear']", "入学年份",
                      "#xyAcademy", "学院",
                      "textarea[name='areas']", "关注领域"];
    		if(editMobile){
    			checks.push("input[name='yanzhengma']");
                checks.push("短信验证码");
    		}
    		var emptys = [];
    		for(var i =0; i<checks.length; i=i+2){
    			if($(checks[i]).val().trim() == ""){
    				emptys.push(checks[i+1]);
    			}
    		}
    		if(emptys.length == 0){
    			if(editMobile){ //新填写或者修改手机号
      			$.getJSON("checksmscode", {"code": $("input[name='yanzhengma']").val()}, function(d) {
      				if (d.r == "ok") {
      				$.ajax({
			         		//几个参数需要注意一下
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "${req.contextPath}/we/join_submit" ,//url
			                data: $('#form').serialize(),
			                success: function (result) {
			                    console.log(result);//打印服务端返回的数据(调试用)
			                     if(result.code==0) {
			                      bb_alert(result.msg,'知道了', function() {
			                      	window.location.href = '${req.contextPath}/we/h5/home';
			                      });
			                      
			                    } else {
			                       bb_alert(result.msg,'知道了', function() {
			                      	window.location.href = '${req.contextPath}/we/h5/home';
			                      });
			                    }
			                    
			                },
			                error : function() {
			                    alert("异常！");
			                }
			           });
      				}else{
      					bb_alert("您填写的短信验证码不正确，请检查！");
      				}
      			});
    			}else{
    			$.ajax({
			         		//几个参数需要注意一下
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "${req.contextPath}/we/join_submit" ,//url
			                data: $('#form').serialize(),
			                success: function (result) {
			                    console.log(result);//打印服务端返回的数据(调试用
			                    if(result.code==0) {
			                         bb_alert(result.msg,'知道了', function() {
			                      	window.location.href = '${req.contextPath}/we/h5/home';
			                      });
			                    } else {
			                        bb_alert(result.msg,'知道了', function() {
			                      	window.location.href = '${req.contextPath}/we/h5/home';
			                      });
			                    }
			                },
			                error : function() {
			                    alert("异常！");
			                }
			           });
    			}
    		}else{
    			bb_alert("这些项目必须填写："+emptys.join("，"));
    		}
    	});
      //发送验证码
      var sendDisable =false;
      $("#btn_sendsms").on('click', function(){
      	if(sendDisable) return;
      	$mobile = $("input[name='mobile']");
      	if(!(/^1[34578]\d{9}$/.test($mobile.val()))){
      		bb_alert("手机号码填写不正确！");
      	}
        
      	$.getJSON("resendsms", {"mobile" : $mobile.val(), "openId": $("input[name='openId']").val()}, function(d) {
      		if (d.r == "ok") {
      			bb_toast("发送成功");
      			sendDisable = true;
      			$mobile.attr("readonly", "readonly");
      			countDown(120, function(times){
      				if(times == 0){
      					sendDisable = false;
      	        $mobile.removeAttr("readonly");
      	        $("#btn_sendsms").text("获取验证码");
      				}else{
      					$("#btn_sendsms").text("("+times+"秒后)重发");
      				}
      			});
      		}else{
      			bb_alert(d.msg);
      			sendDisable = false;
      		}
      	});
      });

      //wechatId copy
      $("#btn_copy_mobile").on('click', function(){
        $("input[name='wechatId']").val($("input[name='mobile']").val());
      });

      //修改操作
     <#if xiaoyou??>
      var editMobile = false;
     <#else>
      var editMobile = true;
     </#if>

      if(!editMobile){
      	$("#btn_editmobile").on('click', function(){
      		$("#btn_editmobile").hide();
      		$("#btn_sendsms").show();
      		$("input[name='mobile']").removeAttr("readonly");
      		$("#cell_yanzhengma").show();
      		editMobile = true;
      	});
      }else{
      	$("#cell_yanzhengma").show();
      }
})
</script>
</html>