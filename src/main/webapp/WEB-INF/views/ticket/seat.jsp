<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.seat {
            width: 30px;
            height: 30px;
        }

</style>
<script type="text/javascript"  src="${pageContext.request.contextPath }/resources/js/count.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">
window.onload=function(){
	//페이지 실행시 DB에서 예약된 자리 정보 가져온다
	
	
}	
	
	

</script>
</head>
<body>
<div>
	
   <div>
   	
   <table>
		<tr>
			<td>어른</td>
			<c:forEach var="j" begin="0" end="2" step="1">
				<td><input type="button" value="${j}" name="${j}" onclick="count1('${j}');"></td>
			</c:forEach>
			<td id="ad">0</td>
			<td>명</td>
		</tr>
		<tr>
			<td>청소년</td>
			<c:forEach var="j" begin="0" end="2" step="1">
				<td><input type="button" value="${j}" name="${j}" onclick="count2('${j}');"></td>
			</c:forEach>
			<td id="te">0</td>
			<td>명</td>
		</tr>
		<tr>
			<td>어린이</td>
			<c:forEach var="j" begin="0" end="2" step="1">
				<td><input type="button" value="${j}" name="${j}" onclick="count3('${j}');"></td>
			</c:forEach>
			<td id="ch">0</td>
			<td>명</td>
		</tr>
		<tr>
			<td>총</td>
			<td id="to">0</td>
			<td>명</td>
		</tr>
      
   </table>
   </div>
   <div>
      ${param.m_name }<br> ${param.city}<br> ${param.district}<br> ${param.date_s}<br> ${param.time}
   </div>
</div>

<hr>
   <h1 align="center">::SCREEN::</h1>
<hr>
   

<div >
   <c:forEach var="i" items="A,B,C,D,E,F,G">
      <div>
            
         <c:forEach var="j" begin="1" end="7" step="1">
         	
               <input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="send('${i}${j}');">
         	
         	
            
         </c:forEach>
      </div>
   </c:forEach>
</div>
<hr>
<form action="">
<div id="set">
<h3>::선택한 좌석번호::</h3>

</div>
<input type="button" value="결재하기" onclick="">
</form>

</body>
</html>