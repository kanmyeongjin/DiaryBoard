<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 후 메인메뉴</title>
<style type="text/css">
html, body, #fullheight {

height:100%;
}

#bg {
  background-img:url('board_back.jpg');
  background-repeat : no-repeat;
  background-size : 100% 100%;
    
 
}
</style>
</head>
<body >
<%
	String login = (String)session.getAttribute("loginId");
	String target = request.getParameter("target");
	if(target ==null) target="mainMenu";
	String targetPage = target + ".jsp";
%>
<div id="fullheight">
<table width="100%" height="100%" >
<tr height="10%" align="right"><td colspan="2"><a href = "main.jsp"><img src="test.png" height="100" width="100%"></a> <br><%=login %>님 환영합니다.<button onclick="location.href='logout.jsp'">로그아웃</button> </td></tr>
<tr height="10%" align="center"><td >
		<jsp:include page="menu.jsp" />
		
	</td></tr><tr height="80%"><td align="center" background="board_back.jpg" id="bg" alt=""><jsp:include page="<%=targetPage %>" /></td></tr>
</table>
</div>
</body>
</html>