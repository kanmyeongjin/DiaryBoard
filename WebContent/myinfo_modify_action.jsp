<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "java.sql.*" %>
    <%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
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

<form action="main.jsp" method="post" >
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pw");
String name= request.getParameter("name");
String address = request.getParameter("address");
String tel = request.getParameter("ph");
String age = request.getParameter("age");
String gender = request.getParameter("M_Status");
String favorites[] = request.getParameterValues("cp");
String favorite= "";
for(int i=0; i<favorites.length;i++) {
	if(i==0)
	{
		favorite = favorite + favorites[i];
	}else{
	favorite = favorite + "/"+ favorites[i];
	}
}
%>

<%
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	String str = "";
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/jsptest";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

	
		String sql = "UPDATE member SET id=?, passwd=?, name=?, address=?, tel=?, age=?, gender=?, favorite=?  WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pwd);
		pstmt.setString(3,name);
		pstmt.setString(4,address);
		pstmt.setString(5,tel);
		pstmt.setString(6,age);
		pstmt.setString(7,gender);
		pstmt.setString(8,favorite);
		pstmt.setString(9,id);
		pstmt.executeUpdate();
		
		out.println(id+"님의 정보가 수정되었습니다.<br>");

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

<input type="submit" value="메인으로" name="submitbtn">

</body>
</html>