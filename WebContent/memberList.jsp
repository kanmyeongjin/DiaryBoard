<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
 <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    color: white;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    font-size:1.5em;
    vertical-align: top;
    color: #00ff00;
    border-bottom: 3px solid #036;
}

table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
<%
	String login = (String)session.getAttribute("loginId");
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	String str = "";
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/jsptest";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		
		String sql = "select * from member" ;
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		%>
		<table  width="1500" height="200" class="type09">
		<thead>
		<tr><th scope="cols" align="center">아이디</th><th scope="cols" align="center">비밀번호</th><th scope="cols" align="center">이름</th><th scope="cols" align="center">가입시간</th><th scope="cols" align="center">주소</th><th scope="cols" align="center">전화번호</th><th scope="cols" align="center">나이</th><th scope="cols" align="center">성별</th><th scope="cols" align="center">관심분야</th></tr>
		</thead>
		<%
		while(rs.next()){
			%>
			<tr><td><%=rs.getString("id")%></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
				<td><%=rs.getString(8) %></td>
				<td><%=rs.getString(9) %></td>
			</tr>
		<%} %>
		</table>
	<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null)
			try{
				pstmt.close();}catch(SQLException sqle){}
		if(conn !=null)
			try{conn.close();}catch(SQLException sqle){}
		
	}
	


%>
</body>
</html>