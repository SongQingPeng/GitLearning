<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
<title>Insert title here</title>
</head>
<body>
      <div id="header">当前用户:${ad.aname}
            <a href="${pageContext.request.contextPath }/view/login.jsp">[退出]</a>            
      </div>
      <div id="index_navi">
            <ul id="menu">
                <c:forEach items="${ad.lp }" var="pr">
                   <li>
                   <a class=" ${pr.pclass }_off"  href="${pageContext.request.contextPath }${pr.purl }"></a>
                   </li>
                </c:forEach>
            </ul>
       </div>
</body>
</html>