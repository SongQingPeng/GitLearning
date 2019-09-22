<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/assets/css/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath }/assets/css/global_color.css" /> 
        <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-3.2.1.min.js"></script> 
        <script language="javascript" type="text/javascript">
          $(function(){
       	   $("#smt").click(function(){
       		 $(".main_form").submit();
       	   });
         });
            //保存成功的提示信息
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
<%--     <jsp:include page="${pageContext.request.contextPath }/view/res/body.jsp"></jsp:include> --%>
        <div id="header">当前用户:${ad.aname}
            <img src="${pageContext.request.contextPath }/assets/images/logo.png"  alt="logo" class="left"/>
            <a href="${pageContext.request.contextPath }/admin/existServlet.do">[退出]</a>            
        </div>
<!--         Logo区域结束 -->
<!--         导航区域开始 -->
         <div id="navi">
              <ul id="menu">
                <c:forEach items="${ad.lp }" var="pr">
                   <li><a href="${pageContext.request.contextPath }${pr.purl }" class="${pr.pclass}"></a></li>
                </c:forEach> 
            </ul>
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <!--保存操作后的提示信息：成功或者失败-->
            <span >${msg }</span>
            <form action="${pageContext.request.contextPath }/admin/updateAdminServlet.do" method="get" class="main_form">
                <div class="text_info clearfix"><span>管理员账号：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${ad.acname }" /></div>
                <div class="text_info clearfix"><span>角色：</span></div>
                <div class="input_info">
                    <input type="text" readonly="readonly" class="readonly width400"  value="${ad.lrString}" />
                </div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input name="aname" type="text" value="${ad.aname }" />
                    <span class="required">*</span>
                    <div class="validate_msg_medium"></div>
                </div>
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input name="atel" type="text" class="width200" value="${ad.atel }" />
                    <div class="validate_msg_medium"></div>
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input name="aemail" type="text" class="width200" value="${ad.aemail }" />
                    <div class="validate_msg_medium"></div>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${ad.createtime }"/></div>
                <div class="button_info clearfix">
                    <input id="smt" type="button" value="保存" class="btn_save" onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" />
                </div>
               <div>
                    <input type="hidden" name="aid" value="${ad.id }"/>
               </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
