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
String pw = request.getParameter("pw");

int check = -1;

	
	Connection conn = null; //데이터 베이스 연결하는방법
	PreparedStatement pstmt = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3309/jsptest";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName ("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
		
		String sql = "select * from member where id = ? and passwd = ?" ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			check = 0;
		
		}else{
			check= 1;
	
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
		
		<b><font color="red"><%=id%></font>비밀번호를 잘못 입력했습니다.</b>
		<input type="button" value="닫기" onclick="setid()"> 
	<% }
	else{
	%>
		<center>
		<b> <font color="red">정말로 탈퇴하실겁니까...?</font> <br/>
		
		<input type="button" value="응" onclick="location.href='member_Delete_action.jsp?id=<%=id%>'">
		<br>
		<input type="button" value="아냐.. 아직은 탈퇴안할래 " onclick="Sub()">
		</center>
		<%} %> 
<script type="text/javascript">
	function setid(){
		opener.document.deletemember.pw.value="";
		window.self.close();
	}
	function Sub(){
		opener.document.location.href="main.jsp";
		window.close()
	}
	
</script>
</body>
</html>