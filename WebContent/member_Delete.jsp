<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function removeCheck(){
	
	var user_pw = document.deletemember.pw.value;
	var user_id = document.deletemember.id.value;
	if(user_pw==""){
		alert("비밀번호를 입력하세요!!");
	}else{
	
	var url = "deletecheck.jsp?id="+user_id+"&pw="+user_pw;
	 window.name = "parentForm";
     window.open(url,
             "chkForm", "width=500, height=300, resizable = no, scrollbars = no");
	}
}

</script>
<body align = center>
<%String login = (String)session.getAttribute("loginId"); %>
<form method="post" name = "deletemember" action="main.jsp?target=member_Delete_action">비밀번호를 입력해주세요.<br>아 이 디  :<input type="text" name="id" value="<%=login %>" readonly>
<p>비밀번호:<input type="password"  name="pw" required><br>
	<input type="button" onclick="removeCheck()" value="확인" /></form>


</body>
</html>