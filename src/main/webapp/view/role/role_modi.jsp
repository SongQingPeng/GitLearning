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
            	$(".ry").css("display","none");
            	$("#smt").click(function(){
            		$(".main_form").submit();
            	});
            });
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
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
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success"></div>
            <form action="${pageContext.request.contextPath }/role/updateRoleServlet.do" method="post" class="main_form">
                <div class="text_info clearfix"><span>角色名称：</span></div>
                <div class="input_info">
                    <input name="rname" type="text" class="width200" value="${role.rname }" />
                    <span class="required">*</span>
                    <div class="validate_msg_medium error_msg"></div>
                </div>                    
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul>
                           <c:forEach items="${listpriv}" var="priv">
                              <li><input name="pid" type="checkbox" value="${priv.pid }"
                              <c:forEach items="${role.lp }" var="pr">
								<c:if test="${priv.pid==pr.pid}"> 
                            				checked="checked"
                                </c:if>
							  </c:forEach> 
							  <c:if test="${priv.by003==1}"> 
                            				checked="checked"
                                </c:if>
							  <c:if test="${priv.by003==1}"> 
                            				class="ry"
                              </c:if>
							  />
							  <c:if test="${priv.by003==0}"> 
                               ${priv.by001 }
                              </c:if></li>
                          </c:forEach>
                        </ul>
                    </div>
                    <span class="required">*</span>
                    <div class="validate_msg_tiny">至少选择一个权限</div>
                </div>
                <div class="button_info clearfix">
                    <input id="smt" type="button" value="保存" class="btn_save" />
                    <input type="button" value="取消" class="btn_save" />
                </div>
                <input type="hidden" name="rid" value="${role.rid }"/>
            </form> 
        </div>
        <!--主要区域结束-->
        <div id="footer">
            
        </div>
    </body>
</html>
