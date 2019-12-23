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
<body>
<%
	String login = (String)session.getAttribute("loginId");
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/jsptest";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		
		String sql = "select * from diary where dCheck = 'x' ORDER BY reg_Date DESC" ;
		pstmt = conn.prepareStatement(sql);
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
		int count = 1;
		String str ="";
		
		while(rs.next()){
			
			str = rs.getString("anony");
			
			%>
			
			<tr>
				<td align="center"><%=count%></td>
				<td><a href="./main.jsp?target=allboard_View&no=<%=rs.getString("number")%>&id=<%=rs.getString("id")%>" style="text-decoration:none; color : white;"><%=rs.getString("title")%></a></td>
				<td align="center">
				<% if(str.equals("o"))
					out.println("익명");
				else
					out.println(rs.getString("id"));
					%></td>
				<td align="center"><%=rs.getTimestamp("reg_date")%></td>
			</tr>
			
		
		
		<% count++;} %>
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
	
	
		<input type="button" value="처음으로" onclick="location.href='main.jsp?target=allboard_List'"  src="./back.PNG"/>
		<input type="button" value="글쓰기" onclick="location.href='main.jsp?target=Board_Write'" />

</body>
</html>