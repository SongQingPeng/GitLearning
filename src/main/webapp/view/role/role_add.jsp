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
            //保存成功的提示消息
           $(function(){
        		$("#smt").click(function(){
        			$(".main_form").submit();
        		});
        	
        	});
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
            <!--保存操作后的提示信息：成功或者失败-->
            <div >${msg }</div><!--保存失败，角色名称重复！-->
            <form action="${pageContext.request.contextPath }/role/addRoleInfoServlet.do" method="post" class="main_form">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                    <input name="rname" type="text" class="width200" />
                    <span class="required">*</span>
                    <div class="validate_msg_medium"></div>
                </div>                    
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul>
                        <c:forEach items="${listpriv }" var="priv">
                            <li><input name="pid" type="checkbox" value="${priv.pid }"
                            <c:if test="${priv.by003==1}"> 
                            				checked="checked"
                            				class="ry"
                            </c:if>
                            />${priv.by001 }</li>
                         </c:forEach>
                        </ul>
                    </div>
                    <span class="required">*</span>
                    <div class="validate_msg_tiny">至少选择一个权限</div>
                </div>
                <div class="button_info clearfix">
                    <input id="smt"  type="button" value="保存" class="btn_save"  />
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
