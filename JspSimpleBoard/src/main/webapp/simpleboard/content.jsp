<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.simpleboard.SimpleDto"%>
<%@page import="model.simpleboard.SimpleDao"%>
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
<%
	String num = request.getParameter("num");
	SimpleDao dao = new SimpleDao();
	//조회수 증가
	dao.updateReadCount(num);
	//데이터
	SimpleDto dto = dao.getData(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<table class="table table-condensed" style="width:600px;">
		<tr>
			<td style = "width: 500px;">
				<b><%=dto.getSubject() %></b>
			</td>
			<td>
				<span style="color:gray; font-size:9pt;"><%=sdf.format(dto.getWriteday()) %></span>
			</td>
		</tr>
		
		<tr>
			<td colspan ="2">
				
				<%=dto.getContent().replace("\n","<br>") %>
				<br><br>
				<a href = "../upload/<%=dto.getImgname()%>">
				<img alt="" src="../upload/<%=dto.getImgname()%>" style="max-width: 300px;"></a>
			</td>
		</tr>
		
		
	</table>
	<div style = "margin-left:400px;">
			<button type = "button" class="btn btn-default" onclick = "location.href='insertform.jsp'">글쓰기</button>
			<button type = "button" class="btn btn-default" onclick = "location.href='boardlist.jsp'">목록</button>
			<button type = "button" class="btn btn-default" onclick = "location.href='updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
			<button type = "button" class="btn btn-default" onclick = "location.href='deleteform.jsp?num=<%=dto.getNum()%>''">삭제</button>
		</div>
</body>
</html>