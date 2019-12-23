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
</head>
<body>
<% 
	String redirectUrl = "";
	 String id = request.getParameter("id");
    String pw = request.getParameter("pw");
  
    %>

<%
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	String str = "";
	String db_id="";
	String db_pw =""; 
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
		
		while(rs.next()){
			db_id = rs.getString("id");
			db_pw = rs.getString("passwd"); //두번째 필드의 데이터
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
	if(db_pw.equals(pw)){
		session.setAttribute("loginId", id);
		 response.sendRedirect("main.jsp");
	}
	else{
		 response.sendRedirect("login.jsp");
	}
	
	
%>

</body>
</html>