<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/assets/css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/assets/css/global_color.css" /> 
        <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-3.2.1.min.js"></script> 
        <script type="text/javascript">
          $(function(){
        	 $("#smt").click(function(){
        		 $(".main_form").submit();
        	 });
          });
        </script>  
    </head>
    <body>
       <%@include file="../include/body.jsp" %>
        <!--导航区域结束-->
        <div id="main">      
            <!--保存操作后的提示信息：成功或者失败-->      
<%--             <div id="save_result_info" class="save_fail">${errorMsg }</div><!--保存失败，旧密码错误！--> --%>
                <div>${errorMsg }</div>
            <form action="/UpdatePwdServlet.do" method="post" class="main_form">
                <div class="text_info clearfix"><span>旧密码：</span></div>
                <div class="input_info">
                    <input name="oldpwd" type="password" class="width200"  /><span class="required">*</span>
                    <div class="validate_msg_medium"></div>
                </div>
                <div class="text_info clearfix"><span>新密码：</span></div>
                <div class="input_info">
                    <input  name="newpwd"  type="password"  class="width200" /><span class="required">*</span>
                    <div class="validate_msg_medium"></div>
                </div>
                <div class="text_info clearfix"><span>重复新密码：</span></div>
                <div class="input_info">
                    <input  name="newpwd1"  type="password" class="width200"  /><span class="required">*</span>
                    <div class="validate_msg_medium"></div>
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
