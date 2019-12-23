<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import= "java.sql.*" %>

 <%request.setCharacterEncoding("utf-8");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
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
}
</style>
</head>


<% 
	
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	String str = "";
	String login = (String)session.getAttribute("loginId"); //일기장의 주인 id
	String no =  request.getParameter("no"); //나중에 게시판 디비만들때 id랑 일련번호 받아올때의 일련번호
	
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/jsptest";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	

		String sql = "select * from diary where id = ? and number = ?" ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,login);
		pstmt.setString(2,no);
		ResultSet rs = pstmt.executeQuery();
		
		
		rs.next();
			%>
				
		<table class="type08">
		<form name="BoardWriteForm" method="post" action="./main.jsp?target=Board_List" >
		<thead>
			<tr >
				<th colspan="2" align="center">일 기</th>
				
			</tr>
			</thead>
			<tbody>
    		<tr>
				<th scope="cols">작성자</th>
				<td><%=rs.getString("id") %> </td>
			</tr>
			<tr>
			<th scope="row">익명</th><td><%=rs.getString("anony") %></td>	
			<tr>
	 			<th scope="row">오늘의 기분</th><td><%=rs.getString("feel") %></td>
	 			
    		</tr>
    		<tr>
     			<th scope="row">오늘의 날씨</th>
     			<td><%=rs.getString("weather") %></td>
    		</tr>
    		<tr>
     			<th scope="row">제 목</th>
     			<td><%=rs.getString("title") %></td>
    		</tr>
    		<tr>
     			<th scope="row">나만보기</th><td><%=rs.getString("dCheck") %></td> 
     			
    		</tr>
    		<tr>
     			<th scope="row" colspan="2" align="center"s>내 용</th>
    		</tr>
    		<tr>
     			<td  colspan="2" height=100><%=rs.getString("content") %></td>
    		</tr>
    		
    		
    		<tr>
     			<td colspan="2"><div align="center">
     			<input type="submit" value="목록으로" >&nbsp;&nbsp;
         		</div>
     			</td>
    		</tr> 
	
	</form> 
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
<body>
	

</body>
</html>