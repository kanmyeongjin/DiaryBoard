<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하루일기</title>
<style type="text/css">

.line{border-top:1px solid red;}
  table {
    width: 80%;
    height: 500px;
    border: 1px solid #444444;
    font-weight : bold;
    background-image:url('background.png');
    background-size: 100%;
    
    
    
  }
</style>
</head>
<body>

<table src="background.png" align='center'>

<tr align = center><form method="post" action="login_check.jsp"><td rowspan=2> 하 루 일 기<br>아 이 디  :<input type="text" name="id"><p>비밀번호:<input type="password"  name="pw"><br>
	<input type=submit value="로그인"></form>
	<button onclick="location.href='login_form.jsp'">회원가입</button></td></tr>

</table>

</body>
</html>