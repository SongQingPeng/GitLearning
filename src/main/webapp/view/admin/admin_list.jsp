<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<%@ include file="../include/head.jsp"%>
<script language="javascript" type="text/javascript">
	//显示角色详细信息
	function showDetail(flag, a) {
		var detailDiv = a.parentNode.getElementsByTagName("div")[0];
		if (flag) {
			detailDiv.style.display = "block";
		} else
			detailDiv.style.display = "none";
	}
	//重置密码
	function resetPwd() {
		alert("请至少选择一条数据！");
		//document.getElementById("operate_result_info").style.display = "block";
	}
	//删除
	function deleteAdmin(aid) {
		var r = window.confirm("确定要删除此管理员吗？");
		document.getElementById("operate_result_info").style.display = "block";
		if(r) location.href="${pageContext.request.contextPath}/admin/deleteAdminServlet.do?aid="+aid;
		var msg = '${msg}';
        if(msg!=""){
        	$("#operate_result_info").append(msg);
        	$("#operate_result_info").css("display","block");
        }
	}
	function updateAdmin(aid) {
	   location.href="${pageContext.request.contextPath}/admin/showModiAdminServlet.do?aid="+aid;
	}
	function selectAdmin() {
		location.href="${pageContext.request.contextPath }/admin/selectShowAdminServlet.do?rname="+$("#rname").val();
		}
	//全选
	function selectAdmins(inputObj) {
		var inputArray = document.getElementById("datalist")
				.getElementsByTagName("input");
		for (var i = 1; i < inputArray.length; i++) {
			if (inputArray[i].type == "checkbox") {
				inputArray[i].checked = inputObj.checked;
			}
		}
	}
</script>
</head>
<body>
	<!--Logo区域开始-->
	<!--Logo区域结束-->
	<!--导航区域开始-->
	<%@ include file="../include/body.jsp" %>
	<!--导航区域结束-->
	<!--主要区域开始-->
	<div id="main">
		<form action="#" method="post">
			<!--查询-->
			<div class="search_add">
				<div>
					模块： <select id="selModules" class="select_search">
						<option>全部</option>
						<option>角色管理</option>
						<option>管理员管理</option>
						<option>资费管理</option>
						<option>账务账号</option>
						<option>业务账号</option>
						<option>账单管理</option>
						<option>报表</option>
					</select>
				</div>
				<div>
					角色：
					<input type="text" id="rname" class="text_search width200" />
				</div>
				<div>
					<input type="button" value="搜索" class="btn_search" 
					onclick="selectAdmin();" 
					/>
				</div>
				<input type="button" value="密码重置" class="btn_add"
					onclick="resetPwd();" /> 
			    <input type="button" value="增加"
					class="btn_add" onclick="location.href='${pageContext.request.contextPath }/admin/showAddAdminServlet.do';" />
			</div>
			<!--删除和密码重置的操作提示-->
			<div id="operate_result_info" class="operate_fail">
				<img src="${pageContext.request.contextPath}/assets/images/close.png"
					onclick="this.parentNode.style.display='none';" /> <span></span>
				<!--密码重置失败！数据并发错误。-->
			</div>
			<!--数据区域：用表格展示数据-->
			<div id="data">
				<table id="datalist">
					<tr>
						<th class="th_select_all"><input type="checkbox"
							onclick="selectAdmins(this);" /> <span>全选</span></th>
						<th>管理员头像</th>
						<th>管理员ID</th>
						<th>姓名</th>
						<th>登录名</th>
						<th>电话</th>
						<th>电子邮件</th>
						<th>授权日期</th>
						<th class="width100">拥有角色</th>
						<th></th>
					</tr>
					<c:forEach items="${page.admin }" var="admin">
						<tr>
							<td><input type="checkbox" /></td>
							<td><img class="ii" alt="头像" src=" ${pageContext.request.contextPath }${admin.aimg}"></td>
							<td>${admin.id }</td>
							<td>${admin.aname }</td>
							<td>${admin.acname }</td>
							<td>${admin.atel }</td>
							<td>${admin.aemail }</td>
							<td>${admin.createtime }</td>
							<td><a class="summary" onmouseover="showDetail(true,this);"
								onmouseout="showDetail(false,this);">${admin.lrString }</a> <!--浮动的详细信息-->
								<div class="detail_info">
									${admin.lrString }</div></td>
							<td class="td_modi"><input type="button" value="修改"
								class="btn_modify" onclick="updateAdmin(${admin.id});" />
								<input type="button" value="删除" class="btn_delete"
								onclick="deleteAdmin(${admin.id});" /></td>
						</tr>
				  </c:forEach>
				</table>
			</div>
			<!--分页-->
			<div id="pages">
				<a href="${pageContext.request.contextPath }/admin/showAdminServlet.do?currentPage=" ${page.currentPage-1 }>上一页</a>
				 <a class="current_page">1</a> 
				 <c:forEach begin="2" end="${page.totalPage}" varStatus="status">
				 <a href="${pageContext.request.contextPath }/admin/showAdminServlet.do?currentPage=" ${page.totalPage/page.currentPage }>${status+2 }</a>
				 </c:forEach>
				<a href="${pageContext.request.contextPath }/admin/showAdminServlet.do?currentPage=" ${page.currentPage+1 }>下一页</a>
			</div>
		</form>
	</div>
	<!--主要区域结束-->
	<div id="footer"></div>
</body>
</html>
