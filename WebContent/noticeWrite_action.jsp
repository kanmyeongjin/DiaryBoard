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
<form action="main.jsp?target=notice" method="post" >
<%
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");
Timestamp reg_date = new Timestamp(System.currentTimeMillis());
%>

<%
	
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	String no = "";
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/jsptest";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
		
		String sql = "select count(*) from board " ;
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
		no = rs.getString(1);
		}
		if(no==null){
			no=1+"";
		}else{
		int to = Integer.parseInt(no);
		to++;
		no = Integer.toString(to)+"";
		}
		sql = "insert into board values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,no);
		pstmt.setTimestamp(2,reg_date);
		pstmt.setString(3, title);
		pstmt.setString(4,content);
		pstmt.executeUpdate();
		out.println("공지사항이 등록되었습니다.<br>");

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

<input type="submit" value="공지사항으로" name="submitbtn">

</body>
</html>