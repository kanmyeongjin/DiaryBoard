<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import= "java.sql.*" %>

 <%request.setCharacterEncoding("utf-8");%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<style type="text/css">
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    color: white;

}
table.type09 thead th {
    padding: 10px;
    font-size:1.5em;
    font-weight: bold;
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
		
		
		String sql = "select * from diary where id = ? ORDER BY number DESC" ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,login);
		ResultSet rs = pstmt.executeQuery();
		
		%>
		<table width="800" height="200" class="type09">
		<colgroup>
			<col width="50" />
			<col width="500" />
			<col width="100" />
			<col width="50" />
		</colgroup>
		<thead>
			<tr>
				<th scope="cols" align="center">번 호</th>
				<th scope="cols" align="center">제 목</th>
				<th scope="cols" align="center">작성자</th>
				<th scope="cols" align="center">작성일</th>
			</tr>
		</thead>
		<tbody>
		<%
	
		while(rs.next()){
			
			%>
			
			<tr>
				<td scope="row" align="center"><%=rs.getString("number")%></td>
				<td><a href="./main.jsp?target=Board_View&no=<%=rs.getString("number")%>" style="text-decoration:none; color : white;"><%=rs.getString("title")%></a></td>
				<td align="center"><%=rs.getString("id")%></td>
				<td align="center"><%=rs.getTimestamp("reg_date")%></td>
			</tr>
			
		
		
		<% } %>
		</tbody>
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
	
	
		<input type="button" value="처음으로" onclick="location.href='main.jsp?target=Board_List'" />
		<input type="button" value="글쓰기" onclick="location.href='main.jsp?target=Board_Write'" />

</body>
</html>