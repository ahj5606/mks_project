<%@page import="client.Logic.SendMail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//인증번호 받을 이메일 주소 받기
	String email = request.getParameter("i_email");
	//email = "ljina0218@gmail.com";
	
	//인증번호 메일보내기
	SendMail sm = new SendMail();
	String rnum = sm.randomNum();//인증번호 4자리 랜덤 생성
	sm.sendMail(email, rnum);//전송
	out.print(rnum);
%>
