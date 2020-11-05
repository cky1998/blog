<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	#headerwrap{
		float: right;
	}
</style>
</head>
<body onload="showTime()">
	<div id="top">
			<tr>
				<div >
					<li class="disabled">
						<a href="#">首页</a>
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
	<div id="headerwrap">
	      <div class="container">
	        <div class="row">
	          <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	            <h1 class="animate-box" data-animate-effect="fadeIn">鹊桥仙</h1>
	              <h3>—秦观</h3>
	            <h3 class="animate-box" data-animate-effect="fadeIn">
					纤云弄巧   飞星传恨
					<br>银汉迢迢暗度
					<br>金风玉露一相逢
					<br>便胜却人间无数
				</h3>
	            <h3 class="animate-box" data-animate-effect="fadeIn">
					柔情似水   佳期如梦
					<br>忍顾鹊桥归路
					<br>两情若是久长时
					<br>又岂在朝朝暮暮
				<h3>
	          </div>
	        </div>
	      </div>
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
</script>
<script scr="${info.username }/static"></script>
</html>