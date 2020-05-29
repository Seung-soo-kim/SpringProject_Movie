<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.seat {
            width: 45px;
            height: 45px;
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
      	<tr>
      		<td>합계</td>
      		<td id="m_t" colspan="3" align="right"></td>
      		<td>원</td>
      	</tr>
   </table>
   </div>
   
</div>

<hr>
   <h1 align="center">::SCREEN::</h1>
<hr>
   

<div >
   <c:forEach var="i" items="A열,B열,C열,D열,E열,F열,G열">
      <div>
            
         <c:forEach var="j" begin="1" end="7" step="1">
         	
               <input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="seat('${i}${j}');">
         	
         	
            
         </c:forEach>
      </div>
   </c:forEach>
</div>
<hr>
<form action="paymoney.do" method="get">
<div id="set">
<h3>::선택한 좌석번호::</h3>

</div>
<h3>::예매 정보::</h3>
<input name="m_name" value="${param.m_name }" readonly>
<input name="city" value="${param.city }" readonly>
<input name="district" value="${param.district }" readonly>
<input name="date_s" value="${param.date_s }" readonly>
<input name="time" value="${param.time }" readonly>
<input name="total_m" id="total_m" readonly>
<input name="seat_count" id="seat_count" readonly>
<div>
<input type="button" value="결재하기" onclick="send(this.form);">
</div>
</form>

</body>
</html>