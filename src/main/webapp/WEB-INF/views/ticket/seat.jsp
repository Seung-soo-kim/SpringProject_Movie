<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@include file="../user/check_login.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0; padding: 0;}
.seat {
            width: 45px;
            height: 45px;
        }
body{
	background-color: #F2E8C4;
}
</style>
<script type="text/javascript"  src="${pageContext.request.contextPath }/resources/js/count.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">
window.onload=function(){
	already_seat();
	
}	
	//예약된 좌석 클릭못하게 막기
	function already_seat() {
		var url="findseat.do";
		var param = "m_name=${sessionScope.vo.m_name}&city=${sessionScope.vo.city}&district=${sessionScope.vo.district}&date_s=${sessionScope.vo.date_s}&time=${sessionScope.vo.time}";
		sendRequest(url , param , resultFn6 , "get");
	}
	function resultFn6() {
		if(xhr.readyState==4 && xhr.status==200){
		 var data = xhr.responseText;
		 var json=eval(data);
		 for(var i = 0 ; i < json.length ; i++){
			
			document.getElementById(json[i].seat).disabled=true;
		 	document.getElementById(json[i].seat).style.background="gray";
		 
			 
		 }
		
		}
		
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
				<td><input type="button" value="${j}" name="${j}" onclick="count1('${j}');" style="width: 20px;height: 20px;"></td>
			</c:forEach>
			<td id="ad">0</td>
			<td>명</td>
		</tr>
		<tr>
			<td>청소년</td>
			<c:forEach var="j" begin="0" end="2" step="1">
				<td><input type="button" value="${j}" name="${j}" onclick="count2('${j}');" style="width: 20px;height: 20px;"></td>
			</c:forEach>
			<td id="te">0</td>
			<td>명</td>
		</tr>
		<tr>
			<td>어린이</td>
			<c:forEach var="j" begin="0" end="2" step="1">
				<td><input type="button" value="${j}" name="${j}" onclick="count3('${j}');" style="width: 20px;height: 20px;"></td>
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
   

<div style="width:600px;height:400px ;margin:0 auto ;border:1px solid ;overflow: hidden; background-color:#424242 " align="center"  >
<div style="margin-bottom: 15px">
<h1 align="center" style="color:#A4A4A4">::SCREEN::</h1>
</div>
   <c:forEach var="i" items="A열,B열,C열,D열,E열,F열,G열">
      <div>
         <c:forEach var="j" begin="1" end="8" step="1">
         		<c:if test="${j eq 2 }">
               <input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="seat('${i}${j}');" style="margin-right:15px ;margin-left:0px">
        		</c:if>
         		<c:if test="${j eq 7 }">
               <input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="seat('${i}${j}');" style="margin-left:15px">
         		</c:if>
         		<c:if test="${j ne 7 and j ne 2 }">
         		<input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="seat('${i}${j}');" style="margin-left:0px">
         		</c:if>
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
<input name="m_name" value="${sessionScope.vo.m_name}" readonly>
<input name="city" value="${sessionScope.vo.city}" readonly>
<input name="district" value="${sessionScope.vo.district}" readonly>
<input name="date_s" value="${sessionScope.vo.date_s}" readonly>
<input name="time" value="${sessionScope.vo.time}" readonly>
<input name="total_m" id="total_m" readonly>
<input name="seat_count" id="seat_count" readonly>
<div>
<input type="button" value="결재하기" onclick="send(this.form);">
</div>
</form>

</body>
</html>