<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	String login = (String)session.getAttribute("loginId"); %>
<a href = "main.jsp?target=mainMenu"><img src = "1.png" width="10%" height="40"></a>
		<a href = "main.jsp?target=Calendar"><img src = "2.png" width="10%" height="40"></a>
		<a href = "main.jsp?target=allboard_List"><img src = "3.png" width="10%" height="40"></a>
		<a href = "main.jsp?target=Board_List"><img src = "4.png" width="10%" height="40"></a>
		<a href = "main.jsp?target=notice"><img src = "5.png" width="10%" height="40"></a>
		<%if(login.equals("aaa")){%>
			<a href = "main.jsp?target=noticeWrite"><img src = "6.png" width="10%" height="40"></a>
		<%}
		%>
		<a href =  "main.jsp?target=memberList"><img src = "7.png" width="10%" height="40"></a>
		<a href = "main.jsp?target=myinfo"><img src = "8.png" width="10%" height="40"></a>
		
</body>
</html>