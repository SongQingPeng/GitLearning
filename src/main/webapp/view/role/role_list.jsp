<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file="../include/head.jsp" %>
        <script language="javascript" type="text/javascript">
        function deleteRole(rid) {
            var r = window.confirm("确定要删除此角色吗？");
            //var path = '${pageContext.request.contextPath}';
            if(r) location.href="${pageContext.request.contextPath}/role/deleteRoleServlet.do?rid="+rid;
            var msg = '${msg}';
            if(msg!=""){
            	$("#operate_result_info").append(msg);
            	$("#operate_result_info").css("display","block");
            }
        }
        function updateRole(rid) {
            location.href="${pageContext.request.contextPath}/role/updateShowRoleServlet.do?rid="+rid;
        }
        </script>
    </head>
    <body>
        <%@ include file="../include/body.jsp" %>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="#" method="post">
                <!--查询-->
                <div class="search_add">
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/role/showAddRoleServlet.do';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="${pageContext.request.contextPath}/assets/images/close.png" onclick="this.parentNode.style.display='none';" />
                </div> <!--删除错误！该角色被使用，不能删除。-->
                <!--数据区域：用表格展示数据-->     
                <div id="data">                      
                    <table id="datalist">
                        <tr>                            
                            <th>角色 ID</th>
                            <th>角色名称</th>
                            <th class="width600">拥有的权限</th>
                            <th class="td_modi"></th>
                        </tr> 
                      <c:forEach items="${listrole }" var="role">                     
                        <tr>
                            <td>${role.rid }</td>
                            <td>${role.rname }</td>
                            <td>${role.listPriv }</td>
                            <td>
                                <input type="button" value="修改" 
                                class="btn_modify" onclick="updateRole(${role.rid});"/>
                                <input type="button" value="删除"
                                 class="btn_delete" onclick="deleteRole(${role.rid});" />
                            </td>
                        </tr>
                      </c:forEach>
                    </table>
                </div> 
                <!--分页-->
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
