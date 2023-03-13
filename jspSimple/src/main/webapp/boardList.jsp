<%@page import="mysql.db.SimpleDao"%>
<%@page import="java.util.List"%>
<%@page import="mysql.db.SimpleDto"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	SimpleDao db = new SimpleDao();
	List<SimpleDto> list = db.getAllBoardDatas();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>
<body>
	<div class = "alert alert-success" ><%=list.size() %></div>
	<table class = "table table-hover" style="width:800px;">
		<caption><b>게시판형 목록보기</b>
			<button type = "button" class = "btn btn-info" onclick = "location.href='insertForm.jsp'">글쓰기</button>
			<button type = "button" class = "btn btn-info" onclick = "location.href='boardList.jsp'">목록2</button>
			<button type = "button" class = "btn btn-info" onclick = "location.href='/JspSimpleBoard/index.jsp'">인덱스</button>
		</caption>
		
		<tr style="background:#fffacd">
		  <th width="70">번호</th>
		  <th width="70">제목</th>
		  <th width="200">내용</th>
		  <th width="70">작성자</th>
		  <th width="70">작성일</th>
		  
		</tr>
		
		<%
			//출력할 날짜
			// for each문 대신에 for문으로 밑에 리스트 값 다 출력해오기
			//for(SimpleDto dto:list)
			for(int i=0; i<list.size(); i++)
			{
				
				//dto
				SimpleDto dto =list.get(i);
				%>
				
				<tr>
					
					<!-- 제목누르면 내용보기로 넘어가기 -->
					<td ><%=i+1 %></td>
					<td><a href="boardlist.jsp?num=<%=dto.getNum()%>"></a>
						<%=dto.getSubject()%></td>
					<td><%=dto.getContent() %></td>
					<td><%=dto.getWriter() %></td>
					<td><%=dto.getWriteday() %></td>
					
				</tr>
			<%}
		%>
	</table>
</body>
</html>