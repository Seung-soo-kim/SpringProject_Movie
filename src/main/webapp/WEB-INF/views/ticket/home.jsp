<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css">
	<title>Cinema</title>
</head>
<body>
	
	<div id="moviewrap">
		<!-- header -->
		<div id="header">
			<div class="gnb">
				<ul>
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>
			<div class="nav">
				<h1 id="nav_left"><img src="nav_logo_left"></h1>
				<h2><img scr="nav_logo"></h2>
				<ul>
					<li><a href="#">영화</a></li>
					<li><a href="ticketing.do">예매</a></li>
					<li><a href="#">영화관</a></li>
					<li><a href="#">커뮤니티</a></li>				
				</ul>
				<h1 id="nav_right"><img src="nav_logo_right"></h1>
			</div>
		</div>
		<!-- header 끝 -->
		
		<!-- contents -->
		<div id="contents">
			<div class="main_banner"></div>
			
			<div class="main_teaser">
				<div>동영상</div>
				<div>홍보배너</div>
			</div>
			
			<div class="main_event"></div>
		</div>
		<!-- contents 끝 -->
		
		<div id="footer_banner"></div>
		
		<!-- footer -->
		<div id="footer">
			<p><img src="footer_logo"></p>
			<address>서울특별시 마포구 서강로 136 아이비티워 2층,3층</address>
			<p>2조 Spring Project Movie</p>
			<p>민형, 성수, 우성, 선영, 원경, 유진</p>
		</div>
		<!-- footer 끝 -->
	</div>	
	
</body>
</html>
