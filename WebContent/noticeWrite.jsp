<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import= "java.sql.*" %>
 <%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.type08 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    margin: 20px 10px;
}

table.type08 thead th {
   
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #c00;
    background: #dcdcd1;
}
table.type08 tbody th {
    width: 150px;
  
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: white;
}
table.type08 td {
    width: 350px;
    
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
     background: gray;
</style>
</head>
<body>
<%String login = (String)session.getAttribute("loginId");%>

		<table class="type08" >
		<form name="BoardWriteForm" method="post" action="main.jsp?target=noticeWrite_action" >
		<thead>
				<tr>
					<th colspan="2" align="center">공지사항 글쓰기</th>
					
				</tr>
			</thead>
			<tbody>
    		<tr>
				<th scope="cols">작성자</td>
				<td><input type=text name=id size=10 value="<%=login %>" readonly></td>
				
			</tr>
    		<tr>
     			<th scope="cols">제 목</td>
     			<td><input type=text name=title size=100 required></td>
    		</tr>
    		<tr>
     			<th scope="row" colspan="2" align="center">내 용</th>
    		</tr>
    		<tr>
     			<td colspan="2" align="center"><textarea name=content rows ="10" cols="100" required></textarea></td>
    		</tr>
    		<tr>
     			<td colspan="2"><div align="center">
     			<input type="submit" value="등록" >&nbsp;&nbsp;
         		<input type="button" value="저장안하고 나가기" onclick="move('main.jsp?target=notice');"></div>
     			</td>
    		</tr> 
		</tbody>
	</form> 
</table>

</body>
</html>