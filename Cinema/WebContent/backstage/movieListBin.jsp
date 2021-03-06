<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Basic_tables</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet">
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts--->
<link
	href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900'
	rel='stylesheet' type='text/css'>
<!---//webfonts--->
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- 引入 artDialog -->
<script src="artDialog/lib/jquery-1.10.2.js"></script>
<script src="artDialog/dist/dialog-min.js"></script>
<link href="artDialog/css/ui-dialog.css" rel="stylesheet" type="text/css" />
<script src="artDialog/dist/dialog-plus.js"></script>

 <!--   日期时间框控件  -->
<script type="text/javascript" src="<%=path %>/backstage/jedate/jedate.js"></script>

		
<script type="text/javascript">
	$(function() {
		var classColor = new Array("active", "success", "info", "warning","danger");
		var a = document.getElementById("tableColor");
		var b = a.getElementsByTagName("tr");
		var len = b.length;
		var num = 1;
		for (var i = 1; i <= len; i++) {
			if (i % 2 == 0) {

			} else if(i%2!=0){
				if (num == 1) {
					document.getElementById(i).className = classColor[0];
				} else if (num == 2) {
					document.getElementById(i).className = classColor[1];
				} else if (num == 3) {
					document.getElementById(i).className = classColor[2];
				} else if (num == 4) {
					document.getElementById(i).className = classColor[3];
				} else if (num == 5) {
					document.getElementById(i).className = classColor[4];
					num = 0;
				}
				num++;
			}
		}
		
		

		for(var i=1;i<=len;i++){
			var a=$("#"+'mov'+i).html();
			if(a.length>70){
			$("#"+i+'-').html(a.substr(0,3)+"...")
			}
		}
	});
	
	function search() {
		var pageForm = document.getElementById("searchForm");
		//document.getElementById("pages").value=pages;
		pageForm.action="MovieQueryServlet.do?oper=list";
		pageForm.method="post";
		pageForm.submit();
	}

	
	function del(id){
		var d = dialog({
		    title: '提示',
		    content: '确认删除吗？',
		    okValue: '确定',
		    fixed: true,
		    width:'400px',
		    height:'200px',
		    ok: function () {
		    	self.location="MovieUpdateServlet.do?oper=delete&idDel="+id;
		    },
		    cancelValue: '取消',
		    cancel: function () {
		    	
		    }
		});
		d.showModal();
	}

</script>
</head>
<body>
	<div id="wrapper">
	
		<jsp:include page="left.jsp" />

		<div id="page-wrapper">
			<div class="col-md-12 graphs">
				<div class="xs">
					<h3>Movie</h3>
					<!--彩色表格-->
					<div id="tableColor" class="bs-example4" data-example-id="contextual-table">
						<div style="margin-bottom: 10px;">
							<form id="searchForm">
									<div class="form-group">
										<div class="row">
											<div class="col-md-2 grid_box1">
												<input type="hidden" name="status" value="-1" id="status1">
												<input type="text" class="form-control1" placeholder="电影名" name="name" value="${name1 }">
											</div>
											<div class="col-md-3 grid_box1">
												<input class="datainp" id="indate" type="hidden" placeholder="只显示年月" value=""  readonly>
												<input class="datainp" id="datebut" type="hidden" placeholder="请选择"  readonly><input type="hidden" onClick="jeDate({dateCell:'#datebut',isTime:true,format:'YYYY-MM-DD hh:mm:ss'})" value="打开">
												<input name="fromTime"  class="datainp form-control1" id="dateinfo1" type="text" placeholder="上映日期从" value="${fromTime1 }"  readonly>
											</div>
											<div class="col-md-3 grid_box1">
												<input class="datainp" id="indate" type="hidden" placeholder="只显示年月" value=""  readonly>
												<input class="datainp" id="datebut" type="hidden" placeholder="请选择"  readonly><input type="hidden" onClick="jeDate({dateCell:'#datebut',isTime:true,format:'YYYY-MM-DD hh:mm:ss'})" value="打开">
												<input name="toTime"  class="datainp form-control1" id="dateinfo2" type="text" placeholder="上映日期到" value="${toTime1 }" readonly>
											</div>
												
											<button type="button" class="btn btn-primary" onclick="search()">查找</button>
											<div class="clearfix"> </div>
										</div>
									</div>
							</form>
							<a href="movieAdd.jsp"><button type="button" class="btn btn-primary">添加</button></a>
						</div>
						<table class="table" >
							<thead>
								<tr>
									<th>编号</th>
									<th>名称</th>
									<th>语言</th>
									<th>上映日期</th>
									<th>片长(分钟)</th>
									<!-- <th>描述</th>
									<th>操作</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="stu" varStatus="vs">
									<tr id="${vs.count }">
										<th scope="row">${vs.count+15*(pages-1) }</th>
										<td><a href="MovieQueryServlet.do?oper=query&id=${stu.id }" >${stu.name }</a></td>
										<td>${stu.language }</td>
										<td>${stu.creat_time }</td>
										<td>${stu.time }</td>
										<%--<td>
									  <span id="${stu.id }" style="float:left;">${stu.description }</span> 
										 <a  href="showMessageAdd.jsp?movie_id=${stu.id }&movie_name=${stu.name}" >
										 	生成展映信息<!-- style="float:right;" class="tablelink" -->
										 </a>
										</td>
										<td>
											${stu.description }
										</td>
										 <td>
										 	 <a href="MovieQueryServlet.do?oper=query&id=${stu.id }" >
										 	编辑
										 	</a>
											<a href ="javascript:void(0);" onclick="del(${stu.id })" >删除</a>
										</td>--%>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<jsp:include page="page.jsp" />
					</div>
				</div>
				
				<jsp:include page="bottom.jsp" />
				
			</div>
		</div>
	</div>
	
	<!-- Nav CSS -->
	<link href="css/custom.css" rel="stylesheet">
	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>
	<script src="js/custom.js"></script>
	
	 <script type="text/javascript">
    //jeDate.skin('gray');
	jeDate({
		dateCell:"#indate",//isinitVal:true,
		format:"YYYY-MM",
		isTime:false, //isClear:false,
		//minDate:"2015-10-19 00:00:00",
		//maxDate:"2016-11-8 00:00:00"
	})
    jeDate({
		dateCell:"#dateinfo1",
		format:"YYYY-MM-DD",
		//isinitVal:true,
		isTime:true, //isClear:false,
		//minDate:"2014-09-19 00:00:00",
		okfun:function(val){alert(val)}
	})
	jeDate({
		dateCell:"#dateinfo2",
		format:"YYYY-MM-DD",
		//isinitVal:true,
		isTime:true, //isClear:false,
		//minDate:"2014-09-19 00:00:00",
		okfun:function(val){alert(val)}
	})
</script> 
</body>
</html>
