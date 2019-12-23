<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
              <%@ page import= "java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String id = request.getParameter("id");

int check = -1;

	
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/jsptest";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		
		String sql = "select * from member where id = ?" ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			check = 1;
		
		}else{
			check= 0;
	
		}
		

	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null)
			try{
				pstmt.close();}catch(SQLException sqle){}
		if(conn !=null)
			try{conn.close();}catch(SQLException sqle){}
	}
	
	if(check==1){
		%>
		
		<b><font color="red"><%=id%></font>는 이미 사용중인 아이디입니다.</b>
		<input type="button" value="닫기" onclick="setid()"> 
	<% }
	else{
	%>
		<center>
		<b>입력하신 <font color="red"><%=id%></font>는 <br/>
		사용하실 수 있는 ID 입니다.
		<input type="button" value="닫기" onclick="setid()"></center>
		<%} %> 
<script type="text/javascript">
	function setid(){
		opener.document.userInfo.id.value="<%=id%>";
		window.self.close();
	}
</script>
</body>
</html>