<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import= "java.sql.*" %>
 <%request.setCharacterEncoding("utf-8");%>
 <%@ page import="java.util.StringTokenizer" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function idCheck(){
	
	var user_id = document.userInfo.id.value;
	if(user_id==""){
		alert("아이디를 입력하세요!!");
	}else{
	
	var url = "idcheck.jsp?id="+user_id;
	 window.name = "parentForm";
     window.open(url,
             "chkForm", "width=500, height=300, resizable = no, scrollbars = no");
	}
}
</script>
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
		
		
		String sql = "select * from member where id = ?" ;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,login);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		%>
			
		<form name="userInfo" action="main.jsp?target=myinfo_modify_action.jsp?time=<%=rs.getString(4) %>" method="post" ><!-- 화면이 보내지면 n2.jsp로 post형식으로 보냄 -->
<!-- submit 버튼을 누르면 textform.jsp으로 내용전달  -->


<div style="text-align:center;"> <!-- 글자들 가운데로 정렬 -->


<table  border=1 align="center">  <!--  // 화면을 일정하게 배열하기 위해 <table> 태그를 사용 -->
	<tr>
		<td>ID:</td>
		<td><input type="text"  name="id" value="<%=rs.getString("id")%>" readonly></td>
	</tr>
	<tr>
		<td>Password :</td>
		<td><input type="password" value="<%=rs.getString(2) %>"name="pw" required></td>
	</tr>
	<tr>
		<td>이름 :</td>
		<td><input type="text" value="<%=rs.getString(3) %>"  name="name" required></td>
	</tr>
	<tr>
		<td>나이:</td>
		<td><select name="age" required>
			<% 
				int str = Integer.valueOf(rs.getString(7));
				for(int i=18; i<50; i++)
				{
					if(i == str){
					out.print("<option selected='selected'>"+i+"</option>");}
					else{out.print("<option>"+i+"</option>");}
					
				}
			%>
		</select>세</td>
	</tr>
	<tr>
		<td>전화번호:</td>
		<td><input type="text" value="<%=rs.getString(6) %>" name="ph" required></td>
	</tr>
	<tr>
		<td>주소:</td>
		<td><input type="text" value="<%=rs.getString(5) %>"  name="address" required></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><!-- 라디오버튼 이름을 같이 줘야 같은 범주로 속함 value값을 다르게 해서 보냄 -->
		<%if("남자".equals(rs.getString(8))){ %>
		<input type="radio" name="M_Status" value="남자" checked >남자
		<input type="radio" name="M_Status" value="여자" >여자
		<%}else{  %>
		<input type="radio" name="M_Status" value="남자"  >남자
		<input type="radio" name="M_Status" value="여자" checked>여자
		<%} %>
		</td>
	</tr>
	<tr>
	<%StringTokenizer st = new StringTokenizer(rs.getString(9), "/"); %>		
		<td>관심분야</td>
		<td><!-- 체크박스 이름을 같은걸해도되고 안해도 되고 value값을 다르게 해서 보냄 타입이 체크박스 -->
		<input type="checkbox" name="cp" value="운동" <%while(st.hasMoreTokens()){ if("운동".equals(st.nextToken())){out.print("checked");}}%>>운동<br/>
		 <input type="checkbox" name="cp" value="여가" <%st = new StringTokenizer(rs.getString(9), "/");while(st.hasMoreTokens()){ if("여가".equals(st.nextToken())){out.print("checked");}}%> >여가<br/>

		
		<input type="checkbox" name="cp" value="독서" <%st = new StringTokenizer(rs.getString(9), "/");while(st.hasMoreTokens()){ if("독서".equals(st.nextToken())){out.print("checked");}}%>  >독서<br/>

		
		<input type="checkbox" name="cp" value="여행" <%st = new StringTokenizer(rs.getString(9), "/");while(st.hasMoreTokens()){ if("여행".equals(st.nextToken())){out.print("checked");}}%>  >여행<br/>

		
		<input type="checkbox" name="cp" value="영화" <%st = new StringTokenizer(rs.getString(9), "/");while(st.hasMoreTokens()){ if("영화".equals(st.nextToken())){out.print("checked");}}%> >영화<br/>

		</td>
	</tr>

		
</table><!-- 전송 초기화 버튼 submit타입은 전송 reset타입은 초기화 -->
<input type="submit" value="수정" name="submitbtn">
<input type="reset" value="초기화" name="resetbtn">
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