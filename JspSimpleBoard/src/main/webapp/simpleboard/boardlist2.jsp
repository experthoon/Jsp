<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.simpleboard.SimpleDto"%>
<%@page import="java.util.List"%>
<%@page import="model.simpleboard.SimpleDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
SimpleDao db = new SimpleDao();
List<SimpleDto> list = db.getAllBoardDatas();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
   <div class="alert alert-danger" style="width:800px;">
      <b>총<%=list.size() %>개의 글이 있습니다.</b>
   </div>
   <br>
   <table class="table table-hover" style="width:800px;">
      <caption>
         <b>게시판형 목록보기</b>
         <button type="button" class="btn btn-info" onclick="location.href='insertform.jsp'">글쓰기</button>
         <button type="button" class="btn btn-info" onclick="location.href='boardlist.jsp'">목록1</button>
         <button type="button" class="btn btn-info" onclick="location.href='boardlist2.jsp'">목록2</button>
         <button type="button" class="btn btn-info" onclick="location.href='/JspSimpleBoard/index.jsp'">인덱스</button>
      </caption>
      <tr>
      <%
      for(int i = 0; i< list.size(); i++) {
         int no = list.size() - i;
         SimpleDto dto = list.get(i);
      %>
         <td>
            <a href="content.jsp?num=<%=dto.getNum() %>">
               <img src="../upload/<%=dto.getImgname()%>" 
               style="border:1px solid gray; width:200px;height:200px; margin:5px;">
               <br>
               <%=dto.getSubject()%>
            </a>
            <br>
            <span style="color:gray; font-size:9pt;">
               조회:<%=dto.getReadcount()%>&nbsp;&nbsp;&nbsp;
               <%=sdf.format(dto.getWriteday())%>
               <br>
               <%=dto.getWriter() %>
            </span>
         </td>
         <%
         if((i+1) % 5 == 0) {   
      %>
      </tr>
      <tr>
         <%
         }%>
         <%
      }
      %>
      </tr>   
   </table>
</body>
</html>