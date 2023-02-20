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
	<%
	//세션저장
	session.setAttribute("msg", "happy!!!");
	session.setMaxInactiveInterval(10);
	%>
	
	<h2>10초안에 눌러주세요!!!</h2>
	<form action="sessionAction.jsp" method = "post">
		<h2>가고싶은 여행지는?</h2>
			<input type="radio" value = "이탈리아 로마 5박 6일" name = "travel" >이탈리아 로마 5박 6일 &nbsp;
			<input type="radio" value = "영국 런던 5박 6일" name = "travel" >영국 런던 5박 6일&nbsp;
			<input type="radio" value = "일본 오사카 로마 5박 6일" name = "travel" >일본 오사카 로마 5박 6일&nbsp;
			<input type="radio" value = "미국 뉴욕 로마 5박 6일" name = "travel" >미국 뉴욕 로마 5박 6일&nbsp;
			<input type="radio" value = "프랑스 파리 로마 5박 6일" name = "travel" checked="checked" >프랑스 파리 로마 5박 6일&nbsp;
			
			<input type ="submit" value="상품신청">
	</form>
</body>
</html>