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
        		
        		var msg = '${msg}';
        		if(msg != ""){
        			showResult(msg);
        		}
        	});
        	
            //保存成功的提示消息
            function showResult(msg) {
                showResultDiv(true,msg);
                window.setTimeout("showResultDiv(false,'');", 3000);
            }
            function showResultDiv(flag,msg) { 
                if (flag){
                	$("#save_result_info").text(msg);
                	$("#save_result_info").css("display","block");
                }
                else
                	$("#save_result_info").css("display","none");
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
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="${pageContext.request.contextPath }/admin/addAdminInfoServlet.do"  method="post"  class="main_form" enctype="multipart/form-data">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input name="aname" type="text" />
                        <span class="required">*</span>
                        <div class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                        <input name="acname" type="text"  />
                        <span class="required">*</span>
                        <div class="validate_msg_long"></div>
                    </div>
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                        <input name="pwd" type="password"  />
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg"></div>
                    </div>
                    <div class="text_info clearfix"><span>重复密码：</span></div>
                    <div class="input_info">
                        <input type="password"  />
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg"></div>
                    </div>      
					<div class="text_info clearfix"><span>上传头像</span></div>
                    <div class="input_info">
                        <input type="file" name="imgFile"   />
                        <span class="required">*</span>
                        <div class="validate_msg_long error_msg"></div>
                    </div>  
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input name="atel"  type="text" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium error_msg"></div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input  name="aemail" type="text" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium error_msg"></div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
                               <c:forEach items="${ listrole}" var="role">
                                <li><input name="rid" type="checkbox"  value="${role.rid}"/>${role.rname }</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <span class="required">*</span>
                        <div class="validate_msg_tiny error_msg">至少选择一个</div>
                    </div>
                    <div class="button_info clearfix">
                        <input id="smt" type="button" value="保存" class="btn_save"  />
                        <input type="button" value="取消" class="btn_save" />
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
