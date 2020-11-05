<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	body{
		background-image: url(img/qixi.jpg);
		background-repeat:no-repeat ;
		background-size:100% 100%;
		background-attachment: fixed;
	}
	*{
		margin: 0px;
		padding:0px;
	}
	#top{
		background-color: #2AABD2;
	}
	.page{
		background-color: #2AABD2;
		width:13%;
		height:50px;
		display:inline-block;
		float: left;
	}
	.disabled{
		background-color: #2AABD2;
		width:13%;
		height:50px;
		display:inline-block;
		float: left;
		font-size: 20px;
	}
	.select{
		background-color: #2AABD2;
		font-size: 14px;
		width:18%;
		height:50px;
		display:inline-block;
		text-align: center;
		float: left;
	}
	.login{
		background-color: #2AABD2;
		font-size: 14px;
		width:30%;
		height:50px;
		display:inline-block;
		text-align: center;
		float: right;
	}
	.page a{
		font-size: 20px;
	}
	.page:hover{
		background-color: #DFF0D8;
	}
	td{
		text-align: right;
	}
	#time{
			color:black;
	}
	a{
		text-decoration: none;
			color: #FFFF00;
	}
	.sh{
		margin: 10px;
			width:60%;
			height:60%;
			font-size: 18px;
			text-align: center;
	}
</style>
</head>
<body onload="showTime()">
	<div id="top">
			<tr>
				<div >
					<li class="disabled">
						<a href="index.jsp">首页</a>
					</li>
				</div>
				<div >
					<li class="page">
						<a href="EssayServlet">心情随笔</a>
					</li>
				</div>
				<div >
					<li class="page">
						<a href="TechServlet">技术分享</a>
					</li>
				</div>
				<div >
					<li class="page">
						<a href="write.jsp">文章上传</a>
					</li>
				</div>
				<div class="select">
					<input type="text" name = "textvalue" id = "textvalue" style="height:20px"/>
					<input type="submit" οnclick="fun()" value="搜索"/>
				</div>
				<div class="login">
					<td class="td">
						<div id="time">2020年07月13日09:06:38 星期一</div>
					</td>
					<td class="td">
						<a href="login.jsp">注销</a>
					</td>
				</div>
			</tr>
	</div>
	<div class="sh">
					<form action="" method="" class="form-horizontal">
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">文章名:</label>
							<div class="col-lg-9">
								<input type="text" name="u_id" id="u_id"
									class="form-control" value="${item.title}" readonly="readonly"/>
							</div>
						</div>
						<div class="form-group form-group-lg">
							<label class="control-label col-lg-3">作者:</label>
							<div class="col-lg-9">
								<input type="text" name="u_pwd" id="u_pwd"
									class="form-control" value="${item.author}" readonly="readonly"/>
							</div>
						</div>
						<div class="form-group form-group-lg">
							<tr>
							<label class="control-label col-lg-3">正文:</label>
							</tr>
							<div class="col-lg-9">
								<input type="hidden" name="pdesc1" id="pdesc1" />
								<textarea name="pdesc" rows="30" cols="50" id="pdesc" class="form-control" readonly="readonly">${item.text}</textarea>
							</div>
						</div>
					</form>
	</div>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	//jQuery函数库要求，页面加载完毕后，再执行
	function showTime(){
		//获取系统时间
		var time=new Date();
		var msg="";
		var y=time.getFullYear();
		msg+=y+"年";
		//值是0-11之间的数字
		var m=time.getMonth()+1;
		if(m<10){m="0"+m;}
		msg+=m+"月";
		var d=time.getDate();
		msg+=d+"日";
		var h=time.getHours();
		if(h<10){h="0"+h;}
		msg+=h+":";
		var mi=time.getMinutes();
		if(mi<10){mi="0"+mi;}
		msg+=mi+":";
		var s=time.getSeconds();
		if(s<10){s="0"+s;}
		msg+=s+" ";
		var a=time.getDay();
		if(a==1){msg+="星期一";}
		else if(a==2){msg+="星期二";}
		else if(a==3){msg+="星期三";}
		else if(a==4){msg+="星期四";}
		else if(a==5){msg+="星期五";}
		else if(a==6){msg+="星期六";}
		else{msg+="星期日";}
		//把msg赋给id为time的控件中
		document.getElementById("time").innerHTML=msg;
		setTimeout("showTime()",1000);
	}
	var uname="${info.username }";
	session.setAttribute("uname",uname);
	function changeText(){
		document.getElementById("pdesc").value=document.getElementById("pdesc1").value;
	}
</script>
<script scr="${info.username }/static"></script>
</html>