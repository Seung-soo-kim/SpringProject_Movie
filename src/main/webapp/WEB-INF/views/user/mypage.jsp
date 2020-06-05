<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin: 0 ;padding: 0}
#dd{ width:100%; height:600px; z-index:-1000; position:absolute; }
#dd > img{ width:100%; height:100%; background-repeat: no-repeat; }


</style>
</head>
<body>

  <jsp:include page="header.jsp"/>
  <div style="width:100% ;height:600px  ;margin:300px auto ;overflow: hidden;position: absolute;" align="center">
 <div id="dd">
		<img src="${ pageContext.request.contextPath }/resources/img/m_list_bg.png">
 </div>
 <P style="width:80%; height:50px; background:rgb(119, 119, 119, 0.3); color:white; border-radius:20px; text-align:center; font-size:20px; font-weight:bold; line-height:50px;">${ sessionScope.user.name }님 환영합니다</P>
 <P style="width:80%; height:50px; background:rgb(119, 119, 119, 0.3); color:white; border-radius:20px; text-align:center; font-size:20px; font-weight:bold; line-height:50px;">영화 예매 내역</P>
 	<div>
 		
 	</div>
 </div>
  
 
</body>
</html>