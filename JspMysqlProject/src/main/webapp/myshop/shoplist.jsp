<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="myshop.model.MyshopDao"%>
<%@page import="myshop.model.MyshopDto"%>
<%@page import="java.text.NumberFormat"%>
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
   MyshopDao dao = new MyshopDao();
   List<MyshopDto> slist = dao.getAllSangpums();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   %>
   
   <div style="margin: 30px 30px;">
      <h3 class="alert alert-info" style="width:800px;">목록</h3><br>
      <button type="button" class="btn btn-info"
      onclick="location.href='addform.jsp'">상품추가</button>
   </div>
   <br>
   <table class="table table-bordered" style="width: 800px;">
      <tr class="table-info" bgcolor="orange" style="text-align:center;">
         <td width="60">번호</td>
         <td width="300">상품명</td>
         <td width="120">가격</td>
         <td width="160">입고일</td>
         <td width="160">등록일</td>
      </tr>
      <%
      if(slist.size()==0){%>
         <tr>
            <td colspan="5" align="center">
               <h3>
                  <b>등록된 상품이 없습니다.</b>
               </h3>
            </td>
         </tr>
      <%} else {
         NumberFormat nf = NumberFormat.getCurrencyInstance();
         

         for (int i = 0; i < slist.size(); i++) {
            MyshopDto dto = slist.get(i);
         %>
         <tr>
            <td><%=i+1%></td>
            <td>
               <img src="../쇼핑몰사진/<%=dto.getPhoto()%>.jpg" width="40" height=40 class="img-thumbnail">
               <!-- 상품명 클릭시 상세페이지로 이동  dto.getNum()-->
               <a href="detailpage.jsp?num=<%=dto.getNum()%>" style="color:black; text-decoration:none;">
                  <b><%=dto.getSangpum() %></b>
               </a>
            </td>
            <td align="center"><%=nf.format(dto.getPrice())%></td>
            <td><%=dto.getIpgoday()%></td>
            <td><%=sdf.format(dto.getWriteday())%></td>
         </tr>
         <%
         }
      }
      %>
   </table>
	
</body>
</html>