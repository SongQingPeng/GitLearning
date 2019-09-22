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
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="${pageContext.request.contextPath}/admin/modiAdminServlet.do" method="post"  class="main_form" enctype="multipart/form-data">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input name="aname" type="text" value="${adm.aname }" />
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${adm.acname }"  /></div>
                    <div class="text_info clearfix"><span>管理员图标：</span></div>
                    <div class="input_info">
                    <img style="width:60px;height:60px;" src="${pageContext.request.contextPath}${adm.aimg}"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium"></div>
                    </div>
                     <div class="text_info clearfix"><span>修改管理员图标：</span></div> 
                    <div class="input_info">
                    <input type="file" class="width200"  name="imgFile"/>
                    <span class="required">*</span>
                    </div>
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input name="atel" type="text" value="${adm.atel }"  />
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg">正确的电话号码格式：手机或固话</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input name="aemail"type="text" class="width200" value="${adm.aemail }"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium error_msg">50长度以内，正确的 email 格式</div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
                               <c:forEach items="${listrole }" var="role">
                                <li><input name="rid" type="checkbox"  value="${role.rid }"
                                <c:forEach  items="${adm.lr }" var="rl">
                                  <c:if test="${role.rid==rl.rid}"> 
                            				checked="checked"
                                  </c:if>
                                </c:forEach>
                                />${role.rname}</li>
                               </c:forEach>
                            </ul>
                        </div>
                        <span class="required">*</span>
                        <div class="validate_msg_tiny error_msg">至少选择一个</div>
                    </div>
                    <div class="button_info clearfix">
                        <input id="smt"type="button" value="保存" class="btn_save" />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                    <div>
                     <input name="aid"type="hidden" value="${adm.id }"/> 
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">    
        </div>
    </body>
</html>
