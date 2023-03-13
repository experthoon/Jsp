<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form action = "insertAction.jsp" method = "post">
		<table class = "table table-bordered" style ="width:500px;">
			<tr>
				<th style="width:100px;" bgcolor = "lightgray">작성자</th>
				<td>
					<input type = "text" name = "writer" style = "width:200px;" class = "form-control" placeholder = "writer" autofocus="autofocus" required ="required">
				</td>
			</tr>
			
			<tr>
				<th style="width:100px;" bgcolor = "lightgray">제목</th>
				<td>
					<input type = "text" name = "subject" style = "width:300px;" class = "form-control" placeholder = "제목"  required ="required">
				</td>
			</tr>
			
			<tr>
				<th style="width:100px;" bgcolor = "lightgray">비밀번호</th>
				<td>
					<input type = "text" name = "password" style = "width:300px;" class = "form-control" placeholder = "비밀번호"  required ="required"
					pattern="[0-9]{4}">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" >
					<textarea style="width: 500px; height: 200px;" class="form-control" name = "content" required = "required"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="submit" class = "btn btn-info" value = "저장하기">
				<input type ="button"class="btn btn-info" value = "목록으로" onclick = "location.href='boardlist.jsp'">
				</td>
			</tr>
		</table>
	</form>
	
	<img alt="" src="" id ="blah" style="max-width: 300px;">
</body>
</html>