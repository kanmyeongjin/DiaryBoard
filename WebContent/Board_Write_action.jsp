<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@ page import= "java.sql.*" %>
    <% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>글쓰기 완료</title>
</head>
<body>
		<form action="main.jsp?target=Board_List" method="post" >
<%
String id = request.getParameter("id");
String anony = request.getParameter("anony");
String feel= request.getParameter("feel");
String weather = request.getParameter("weather");
String title = request.getParameter("title");
String content = request.getParameter("content");
String dcheck = request.getParameter("dcheck");
Timestamp reg_date = new Timestamp(System.currentTimeMillis());
%>

<%
	if(anony == null){
		anony = "x";
	}
	if(dcheck == null){
		dcheck = "x";
	}
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	String no = "";
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/jsptest?useUnicode=true&characterEncoding=utf8";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
		
		String sql = "select count(*) from diary where id = ?" ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
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
		sql = "insert into diary values(?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,no);
		pstmt.setTimestamp(3, reg_date);
		pstmt.setString(4,title);
		pstmt.setString(5,feel);
		pstmt.setString(6,weather);
		pstmt.setString(7,anony);
		pstmt.setString(8,dcheck);
		pstmt.setString(9,content);
		pstmt.executeUpdate();
		out.println("글이 저장되었습니다<br>");
		out.println(id+""+no+""+title);
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

<input type="submit" value="목록으로" name="submitbtn">
</body>
</html>