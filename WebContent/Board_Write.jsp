<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>글쓰기</title>
<%String login = (String)session.getAttribute("loginId");%>
<style type="text/css">
table.type08 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    margin: 20px 10px;
}

table.type08 thead th {
   
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #c00;
    background: #dcdcd1;
}
table.type08 tbody th {
    width: 150px;
  
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: white;
}
table.type08 td {
    width: 350px;
    
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
     background: gray;
</style>

<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardWriteCheck() {
		var form = document.BoardWriteForm;
		return true;
	}
</script>
</head>

<body>


		<table class="type08" >
		<form name="BoardWriteForm" method="post" action="main.jsp?target=Board_Write_action" >
		<thead>
				<tr>
					<th colspan="2" align="center">일 기 쓰 기</th>
					
				</tr>
			</thead>
		<tbody>
    		<tr>
				<th scope="cols">작성자</th>
				<td><input type=text name=id size=10 value="<%=login %>" readonly></td>
			</tr>
			<tr>	
				<th scope="row">익명</th><td><input type="checkbox" name="anony" value="o" ></td>
			<tr/>
			<tr>	
     			<th scope="row">나만보기</th><td><input type="checkbox" name="dcheck" value="o" ></td> 
     			
    		
			</tr>
			<tr>
	 			<th scope="row">오늘의 기분</th>
	 			<td><select name="feel">
				<option>좋음</option>
				<option>보통</option>
				<option>나쁨</option>
				</select></td>
    		</tr>
    		<tr>
     			<th scope="row">오늘의 날씨</th>
     			<td><input type=text name=weather size=30 required></td>
    		</tr>
    		<tr>
     			<th scope="row">제 목</th>
     			<td><input type=text name=title size=100 required></td>
    		</tr>
    		<tr>
     			<th scope="row" colspan="2" align="center">내 용</th>
    		</tr>
    		<tr>
     			<td colspan="2" align="center"><textarea name=content rows ="10" cols="100" required></textarea></td>
    		</tr>
    		
    	
    		<tr>
     			<td colspan="2"><div align="center">
     			<input type="submit" value="등록" >&nbsp;&nbsp;
         		<input type="button" value="저장안하고 나가기" onclick="move('main.jsp?target=Board_List');"></div>
     			</td>
    		</tr> 
		</tbody>
	</form> 
</table>

</body>
</html>