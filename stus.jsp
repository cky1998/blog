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
	#container{
		margin: 10px;
	}
</style>
</head>
<body>
<div id="container">
	<form action="" method="post">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<td>
						
					</td>
					<td>学号</td>
					<td>姓名</td>
					<td>性别</td>
					<td>班级</td>
					<td>教师</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="checkbox" name="ids" value="1"/>
					</td>
					<td>neu001</td>
					<td>张三</td>
					<td>男</td>
					<td>java1班</td>
					<td>王五</td>
					<td>
						<a href="#" onclick="doDelete('1','张三')">删除</a>
						<a href="#" onclick="doFix('1','张三','1','1')">修改</a>
					</td>
				</tr>
				<!--以下内容可以删除-->
				<tr>
					<td>
						<input type="checkbox" name="ids" value="2"/>
					</td>
					<td>neu002</td>
					<td>李四</td>
					<td>男</td>
					<td>java1班</td>
					<td>王五</td>
					<td>
						<a href="#" onclick="doDelete('2','李四')">删除</a>
						<a href="#" onclick="doFix('2','李四','1','1')">修改</a>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="ids" value="3"/>
					</td>
					<td>neu003</td>
					<td>刘七</td>
					<td>女</td>
					<td>java1班</td>
					<td>王五</td>
					<td>
						<a href="#" onclick="doDelete('3','刘七')">删除</a>
						<a href="#" onclick="doFix('3','刘七','2','1')">修改</a>
					</td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" name="ids" value="4"/>
					</td>
					<td>neu004</td>
					<td>赵六</td>
					<td>男</td>
					<td>java2班</td>
					<td>钱九</td>
					<td>
						<a href="#" onclick="doDelete('4','赵六')">删除</a>
						<a href="#" onclick="doFix('4','赵六','1','2')">修改</a>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<button type="submit" class="btn btn-lg btn-danger">批量删除</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
<!-- 删除的Modal -->
	<input type="hidden" id="del_stu_id">
	<div class="modal fade" id="del_Modal" tabindex="-1" role="dialog" aria-labelledby="Del_ModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span><tton>
	        <h4 class="modal-title" id="del_ModalLabel">提示</h4>
	      </div>
	      <div class="modal-body">
	        你确定要删除【<sap id="del_msg"></sap>】吗？
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 修改的Modal -->
	<div class="modal fade" id="fix_Modal" tabindex="-1" role="dialog" aria-labelledby="Fix_ModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span><tton>
	        <h4 class="modal-title" id="fix_ModalLabel">提示</h4>
	      </div>
	      <div class="modal-body">
			  <form action="" method="post" class="form-horizontal">
			  		<div class="form-group">
			  			<label class="control-label col-lg-2">姓名:</label>
			  			<div class="col-lg-8">
			  				<input type="text" name="stu_name" id="stu_name"
			  					class="form-control"/>
			  			</div>
			  		</div>
			  		
			  		<div class="form-group">
			  			<label class="control-label col-lg-2">性别:</label>
			  			<div class="col-lg-8">
			  				<select name="stu_sex" id="stu_sex" class="form-control">
			  					<option value="0">保密</option>
			  					<option value="1">男</option>
			  					<option value="2">女</option>
			  				</select>
			  			</div>
			  		</div>
			  		
			  		<div class="form-group">
			  			<label class="control-label col-lg-2">班级:</label>
			  			<div class="col-lg-8">
			  				<select name="cla_id" id="cla_id" class="form-control">
			  					<option value="1">java1班</option>
			  					<option value="2">java2班</option>
			  				</select>
			  			</div>
			  		</div>
			  </form>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消<tton>
	        <button type="button" class="btn btn-primary">确定<tton>
	      </div>
	    </div>
	  </div>
	</div>
</body>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function doDelete(id,name){
		jQuery("#del_stu_id").val(id);
		jQuery("#del_msg").html(name);
		jQuery("#del_Modal").modal('show');
	}
	var stu_id;
	function doFix(id,name,sex,className){
		stu_id=id;
		jQuery("#stu_name").val(name);
		jQuery("#stu_sex").val(sex);
		jQuery("#cla_id").val(className);
		jQuery("#fix_Modal").modal('show');
	}
</script>
</html>