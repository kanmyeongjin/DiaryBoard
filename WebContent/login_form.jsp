<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<div align="center">가입할 ID 와 Password 및 자기소개를 입력하세요. </div>
<form name="userInfo" action="SignSave.jsp" method="post" ><!-- 화면이 보내지면 n2.jsp로 post형식으로 보냄 -->
<!-- submit 버튼을 누르면 textform.jsp으로 내용전달  -->


<div style="text-align:center;"> <!-- 글자들 가운데로 정렬 -->


<table  border=1 align="center">  <!--  // 화면을 일정하게 배열하기 위해 <table> 태그를 사용 -->
	<tr>
		<td>ID:</td>
		<td><input type="text" placeholder="영문" name="id" required><input type="button" onClick="idCheck()" value= "중복확인"></td>
	</tr>
	<tr>
		<td>Password :</td>
		<td><input type="password" placeholder="영문+숫자"  name="pw" required></td>
	</tr>
	<tr>
		<td>이름 :</td>
		<td><input type="text" placeholder="홍길동"  name="name" required></td>
	</tr>
	<tr>
		<td>나이:</td>
		<td><select name="age" required>
			<% 
				for(int i=18; i<50; i++)
				{
					out.print("<option>"+i+"</option>");
					
				}
			%>
		</select>세</td>
	</tr>
	<tr>
		<td>전화번호:</td>
		<td><input type="text" placeholder="010-0000-0000"  name="ph" required></td>
	</tr>
	<tr>
		<td>주소:</td>
		<td><input type="text" placeholder="서울 동작구 대방동"  name="address" required></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><!-- 라디오버튼 이름을 같이 줘야 같은 범주로 속함 value값을 다르게 해서 보냄 -->
		<input type="radio" name="M_Status" value="남자" checked >남자
		<input type="radio" name="M_Status" value="여자" >여자
		</td>
	</tr>
	<tr>
		<td>관심분야</td>
		<td><!-- 체크박스 이름을 같은걸해도되고 안해도 되고 value값을 다르게 해서 보냄 타입이 체크박스 -->
		<input type="checkbox" name="cp" value="운동" >운동<br/>
		<input type="checkbox" name="cp" value="여가" checked >여가<br/>
		<input type="checkbox" name="cp" value="독서" >독서<br/>
		<input type="checkbox" name="cp" value="여행" >여행<br/>
		<input type="checkbox" name="cp" value="영화" >영화<br/>
		</td>
	</tr>
		
</table><!-- 전송 초기화 버튼 submit타입은 전송 reset타입은 초기화 -->
<input type="submit" value="전송" name="submitbtn">
<input type="reset" value="초기화" name="resetbtn">

</form>
</div>
</body>
</html>