<%@page import="mysql.db.SimpleDao"%>
<%@page import="mysql.db.SimpleDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	SimpleDto dto = new SimpleDto();
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String pw = request.getParameter("password");
	String content = request.getParameter("content");
	
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setPassword(pw);
	dto.setContent(content);
	
	SimpleDao dao = new SimpleDao();
	dao.SimpleInsert(dto);
	response.sendRedirect("boardList.jsp");
	
%>
