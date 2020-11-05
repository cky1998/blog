<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 引入bootstrap的css库 -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
body {
	background-image: url(img/qixi.jpg);
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed;
}

* {
	margin: 0px;
	padding: 0px;
}

#top {
	background-color: #2AABD2;
}

.page {
	background-color: #2AABD2;
	width: 13%;
	height: 50px;
	display: inline-block;
	float: left;
}

.select {
	background-color: #2AABD2;
	font-size: 14px;
	width: 18%;
	height: 50px;
	display: inline-block;
	text-align: center;
	float: left;
}

.login {
	background-color: #2AABD2;
	font-size: 14px;
	width: 30%;
	height: 50px;
	display: inline-block;
	text-align: center;
	float: right;
}

.page a {
	font-size: 20px;
}

.page:hover {
	background-color: #DFF0D8;
}

td {
	text-align: right;
}

#time {
	color: black;
}

a {
	text-decoration: none;
	color: #FFFF00;
}

#headerwrap {
	float: right;
}
</style>
</head>
<body onload="showTime()">
	<div id="top">
		<tr>
			<div class="page">
				<a href="login.jsp" >首页</a>
			</div>
			<div class="page">
				<a href="#" onclick="doCheck()">心情随笔</a>
			</div>
			<div class="page">
				<a href="#" onclick="doCheck()">技术分享</a>
			</div>
			<div class="page">
				<a href="#" onclick="doCheck()">文章上传</a>
			</div>
			<div class="select">
				<input type="text" name="textvalue" id="textvalue"
					style="height: 20px" /> <input type="submit" οnclick="fun()"
					value="搜索" />
			</div>
			<div class="login">
				<td class="td">
					<div id="time">2020年07月13日09:06:38 星期一</div>
				</td>
				<td class="td"><a href="#" onclick="doLogin()">登录</a></td> 
				<td class="td"><a href="#" onclick="doRegister()">注册</a></td>
			</div>
		</tr>
	</div>
	
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<h1 class="animate-box" data-animate-effect="fadeIn">鹊桥仙</h1>
					<h3>—秦观</h3>
					<h3 class="animate-box" data-animate-effect="fadeIn">
						纤云弄巧 飞星传恨 <br>银汉迢迢暗度 <br>金风玉露一相逢 <br>便胜却人间无数
					</h3>
					<h3 class="animate-box" data-animate-effect="fadeIn">
						柔情似水 佳期如梦 <br>忍顾鹊桥归路 <br>两情若是久长时 <br>又岂在朝朝暮暮
						<h3>
				</div>
			</div>
		</div>
	</div>
	
	<!--登录的Modal -->
	<div class="modal fade" id="login_Modal" tabindex="-1" role="dialog"
		aria-labelledby="Login_ModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="login_ModalLabel">关闭</h4>
				</div>
				<div class="modal-body">
					<form action="LoginServlet" method="post" class="form-horizontal">
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">账号ID:</label>
							<div class="col-lg-9">
								<input type="text" name="u_id" id="u_id"
									class="form-control" value="" placeholder="请输入登录账号" />
							</div>
						</div>
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">密码:</label>
							<div class="col-lg-9">
								<input type="password" name="u_pwd" id="u_pwd"
									class="form-control" value="" placeholder="请输入登录密码" />
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">登录</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!--注册的Modal -->
	<div class="modal fade" id="register_Modal" tabindex="-1" role="dialog"
		aria-labelledby="Register_ModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="register_ModalLabel">关闭</h4>
				</div>
				<div class="modal-body">
					<form action="RegisterServlet" method="post" class="form-horizontal">
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">ID:</label>
							<div class="col-lg-9">
								<input type="text" name="u_id" id="u_id"
									class="inputClass form-control" value="${form.rid }" placeholder="请输入id" />
							</div>
						</div>
						<td class="tdError">  
						          <label class="errorClass" id="ridError">${errors.rid }</label>  
						</td>  
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">账号名:</label>
							<div class="col-lg-9">
								<input type="text" name="u_name" id="u_name"
									class="inputClass form-control" value="${form.rname }" placeholder="请输入用户名" />
							</div>
						</div>
						<td class="tdError">  
						          <label class="errorClass" id="rnameError">${errors.rname }</label>  
						</td>  
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">邮箱:</label>
							<div class="col-lg-9">
								<input type="text" name="u_email" id="u_email"
									class="inputClass form-control" placeholder="请输入邮箱" />
							</div>
						</div>
						<td class="tdError">  
						          <label class="errorClass" id="reamilError">${errors.reamil }</label>  
						</td>  
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">密码:</label>
							<div class="col-lg-9">
								<input type="password" name="u_pwd" id="u_pwd"
									class="inputClass form-control" value="${form.rpwd }" placeholder="请输入密码" />
							</div>
						</div>
						<td class="tdError">  
						          <label class="errorClass" id="rpwdError">${errors.rpwd }</label>  
						</td>  
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">确认密码:</label>
							<div class="col-lg-9">
								<input type="password" name="u_pwd2" id="u_pwd2"
									class="inputClass form-control" value="${form.rpwd2 }" placeholder="确认密码" />
							</div>
						</div>
						<td class="tdError">
						          <label class="errorClass" id="rpwd2Error">${errors.rpwd2 }</label>  
						</td>  
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">注册</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="check_Modal" tabindex="-1" role="dialog"
		aria-labelledby="Check_ModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="check_ModalLabel">关闭</h4>
				</div>
				<div class="modal-body">
					<p>亲，请先登录哦！</p>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//jQuery函数库要求，页面加载完毕后，再执行
	function showTime() {
		//获取系统时间
		var time = new Date();
		var msg = "";
		var y = time.getFullYear();
		msg += y + "年";
		//值是0-11之间的数字
		var m = time.getMonth() + 1;
		if (m < 10) {
			m = "0" + m;
		}
		msg += m + "月";
		var d = time.getDate();
		msg += d + "日";
		var h = time.getHours();
		if (h < 10) {
			h = "0" + h;
		}
		msg += h + ":";
		var mi = time.getMinutes();
		if (mi < 10) {
			mi = "0" + mi;
		}
		msg += mi + ":";
		var s = time.getSeconds();
		if (s < 10) {
			s = "0" + s;
		}
		msg += s + " ";
		var a = time.getDay();
		if (a == 1) {
			msg += "星期一";
		} else if (a == 2) {
			msg += "星期二";
		} else if (a == 3) {
			msg += "星期三";
		} else if (a == 4) {
			msg += "星期四";
		} else if (a == 5) {
			msg += "星期五";
		} else if (a == 6) {
			msg += "星期六";
		} else {
			msg += "星期日";
		}
		//把msg赋给id为time的控件中
		document.getElementById("time").innerHTML = msg;
		setTimeout("showTime()", 1000);
	}
	function doLogin() {
		jQuery("#login_Modal").modal('show');
	}
	function doRegister() {
		jQuery("#register_Modal").modal('show');
	}
	function doCheck() {
		jQuery("#check_Modal").modal('show');
	}
	$(function() {  
	    /*  
	     * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！  
	     */  
	    $(".errorClass").each(function() {  
	        showError($(this));//遍历每个元素，使用每个元素来调用showError方法  
	    });  
	      
	      
	    /*  
	     * 2. 输入框得到焦点隐藏错误信息  
	     */  
	    $(".inputClass").focus(function() {  
	        var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id  
	        $("#" + labelId).text("");//把label的内容清空！  
	        showError($("#" + labelId));//隐藏没有信息的label  
	    });  
	      
	    /*  
	     * 3. 输入框失去焦点进行校验  
	     */  
	    $(".inputClass").blur(function() {  
	        var id = $(this).attr("id");//获取当前输入框的id  
	        var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名  
	        eval(funName);//执行函数调用  
	    });  
	      
	    /*  
	     * 4. 表单提交时进行校验  
	     */  
	    $("#registForm").submit(function() {  
	        var bool = true;//表示校验通过  
	        if(!RegisterId()) {  
	            bool = false;  
	        }  
	        if(!validateLoginpass()) {  
	            bool = false;  
	        }  
	        if(!validateReloginpass()) {  
	            bool = false;  
	        }  
	        if(!validateEmail()) {  
	            bool = false;  
	        }  
	        if(!validateVerifyCode()) {  
	            bool = false;  
	        }  
	          
	        return bool;  
	    });  
	});  
	/*  
	 * 登录名校验方法  
	 */  
	function RegisterId() {  
	    var id = "rid";  
	    var value = $("#" + id).val();//获取输入框内容  
	    /*  
	     * 1. 非空校验  
	     */  
	    if(!value) {  
	        $("#" + id + "Error").text("用户ID不能为空！");  
	        showError($("#" + id + "Error"));  
	        return false;  
	    }
		/*  
		 * 2. 长度校验  
		 */  
		if(value.length<4 ||value.length>20) {  
		    /*  
		    * 获取对应的label  
		    * 添加错误信息  
		    * 显示label  
		    */  
		    $("#" + id + "Error").text("用户ID长度必须在4 ~ 20之间！");  
		    showError($("#" + id + "Error"));  
		    false;  
		}
		 /*  
		* 3. 是否注册校验  
		*/
		$.ajax({  
		        url:"/Servlet/CheckIdServlet",//要请求的servlet  
		        data:{method:"ajaxRegisterId", rid:value},//给服务器的参数  
		        type:"POST",  
		        dataType:"json",  
		        async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。  
		        cache:false,  
		        success:function(result) {  
		            if(!result) {//如果校验失败  
		                $("#" + id + "Error").text("用户ID已被注册！");  
		                showError($("#" + id + "Error"));  
		                return false;  
		            }  
		        }  
		    });  
		return true;  
	}
	/*  
	 * 登录名校验方法  
	 */  
	function RegisterName() {  
	    var id = "rname";  
	    var value = $("#" + id).val();//获取输入框内容  
	    /*  
	     * 1. 非空校验  
	     */  
	    if(!value) {  
	        /*  
	         * 获取对应的label  
	         * 添加错误信息  
	         * 显示label  
	         */  
	        $("#" + id + "Error").text("用户名不能为空！");  
	        showError($("#" + id + "Error"));  
	        return false;  
	    }  
	    /*  
	     * 2. 长度校验  
	     */  
	    if(value.length<2 || value.length>20) {  
	        /*  
	         * 获取对应的label  
	         * 添加错误信息  
	         * 显示label  
	         */  
	        $("#" + id + "Error").text("用户名长度必须在2 ~ 20之间！");  
	        showError($("#" + id + "Error"));  
	        false;  
	    }  
	    /*  
	     * 3. 是否注册校验  
	     */  
	    $.ajax({  
	        url:"/Servlet/CheckIdServlet",//要请求的servlet  
	        data:{method:"ajaxRegisterName", rname:value},//给服务器的参数  
	        type:"POST",  
	        dataType:"json",  
	        async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。  
	        cache:false,  
	        success:function(result) {  
	            if(!result) {//如果校验失败  
	                $("#" + id + "Error").text("用户名已被注册！");  
	                showError($("#" + id + "Error"));  
	                return false;  
	            }  
	        }  
	    });  
	    return true;  
	}  
	/*  
	 * Email校验方法  
	 */  
	function RegisterEmail() {  
	    var id = "remail";  
	    var value = $("#" + id).val();//获取输入框内容  
	    /*  
	     * 1. 非空校验  
	     */  
	    if(!value) {  
	        /*  
	         * 获取对应的label  
	         * 添加错误信息  
	         * 显示label  
	         */  
	        $("#" + id + "Error").text("Email不能为空！");  
	        showError($("#" + id + "Error"));  
	        return false;  
	    }  
	    /*  
	     * 2. Email格式校验  
	     */  
	    if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {  
	        /*  
	         * 获取对应的label  
	         * 添加错误信息  
	         * 显示label  
	         */  
	        $("#" + id + "Error").text("错误的Email格式！");  
	        showError($("#" + id + "Error"));  
	        false;  
	    }
	    /*  
	     * 3. 是否注册校验  
	     */  
	    $.ajax({  
	        url:"/Servlet/CheckIdServlet",//要请求的servlet  
	        data:{method:"ajaxRegisterEmail", remail:value},//给服务器的参数  
	        type:"POST",  
	        dataType:"json",  
	        async:false,//是否异步请求，如果是异步，那么不会等服务器返回，我们这个函数就向下运行了。  
	        cache:false,  
	        success:function(result) {  
	            if(!result) {//如果校验失败  
	                $("#" + id + "Error").text("Email已被注册！");  
	                showError($("#" + id + "Error"));  
	                return false;  
	            }  
	        }  
	    });  
	    return true;          
	}  
	/*  
	 * 确认密码校验方法  
	 */  
	function Registerpwd() {  
	    var id = "rpwd2";  
	    var value = $("#" + id).val();//获取输入框内容  
	    /*  
	     * 1. 非空校验  
	     */  
	    if(!value) {  
	        /*  
	         * 获取对应的label  
	         * 添加错误信息  
	         * 显示label  
	         */  
	        $("#" + id + "Error").text("确认密码不能为空！");  
	        showError($("#" + id + "Error"));  
	        return false;  
	    }  
	    /*  
	     * 2. 两次输入是否一致校验  
	     */  
	    if(value != $("#rpwd").val()) {  
	        /*  
	         * 获取对应的label  
	         * 添加错误信息  
	         * 显示label  
	         */  
	        $("#" + id + "Error").text("两次输入不一致！");  
	        showError($("#" + id + "Error"));  
	        false;  
	    }  
	    return true;      
	}  
</script>
</html>