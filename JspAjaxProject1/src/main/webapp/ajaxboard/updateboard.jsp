<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	AjaxBoardDao dao = new AjaxBoardDao();

	//엔코딩
	request.setCharacterEncoding("utf-8");
	
	//데이터 읽기
	String num = request.getParameter("unum");
	String writer = request.getParameter("uwriter");
	String subject = request.getParameter("usubject");
	String content = request.getParameter("ucontent");
	String avata = request.getParameter("uavata");
	
	//dti로 묶어주기
	AjaxBoardDto dto = new AjaxBoardDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setAvata(avata);
	
	//update 호출
	dao.updateBoard(dto);
%>