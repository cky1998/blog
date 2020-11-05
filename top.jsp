<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top</title>
<style type="text/css">
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
			color:black;
	}
</style>
</head>
<body onload="showTime()">
	<div id="top">
			<tr>
				<div class="page"><a href="">首页</a></div>
				<div class="page"><a href="">心情随笔</a></div>
				<div class="page"><a href="">技术分享</a></div>
				<div class="page"><a href="">个人归档</a></div>
				<div class="select">
					<input type="text" name = "textvalue" id = "textvalue" style="height:20px"/>
					<input type="submit" οnclick="fun()" value="搜索"/>
				</div>
				<div class="login">
					<td class="td">
						<div id="time">2020年07月13日09:06:38 星期一</div>
					</td>
					<td class="td">
						欢迎【<span>${info.admin_name }</span>】登录<a href="">注销</a>
					</td>
				</div>
			</tr>
	</div>
</body>
<script type="text/javascript">
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
</script>
</html>