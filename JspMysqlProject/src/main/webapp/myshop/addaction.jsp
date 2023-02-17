<%@page import="myshop.model.MyshopDao"%>
<%@page import="myshop.model.MyshopDto"%>
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
	  request.setCharacterEncoding("utf-8");
      String sangpum=request.getParameter("sangpum");
      String photo=request.getParameter("photo");
      int price=Integer.parseInt(request.getParameter("price"));
      String ipgoday=request.getParameter("ipgoday");
      
      MyshopDto dto=new MyshopDto();
      
      dto.setSangpum(sangpum);
      dto.setPhoto(photo);
      dto.setPrice(price);
      dto.setIpgoday(ipgoday);
      
      MyshopDao dao=new MyshopDao();
      dao.insertShop(dto);
      
      response.sendRedirect("shoplist.jsp");
      
   %>
	
</body>
</html>