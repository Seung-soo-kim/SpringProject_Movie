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
.a0{
	background-color:gray;
	color:white;
}
.t0{
	background-color:gray;
	color:white;
}
.c0{
	background-color:gray;
	color:white;
}
</style>
<script type="text/javascript"  src="${pageContext.request.contextPath }/resources/js/count.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">
window.onload=function(){
	already_seat();
	var time="${ sessionScope.vo.time}";
	var time_s=time.substring(0,16);
	document.getElementById("time_s").value=time_s;
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

<div style="width:600px ;margin:0 auto ;overflow: hidden;background-color:gray; " align="center">
	<h3 style="color:#F0F6E8">인원/좌석</h3>
</div>
<div  style="width:600px  ;margin:0 auto ;overflow: hidden; " align="center">
	<div style="float:left;width:150px">
	   <table style="float:left;">
			<tr>
				<td>어른</td>
				<td>:</td>
				<c:forEach var="j" begin="0" end="2" step="1">
					<td><input class="a${j}" id="a${j}" type="button" value="${j}" name="${j}" onclick="count1('${j}');" style="border:none; width: 20px;height: 20px;"></td>
				</c:forEach>
				<input id="ad" type="hidden">
			</tr>
			<tr>
				<td>청소년</td>
				<td>:</td>
				<c:forEach var="j" begin="0" end="2" step="1">
					<td><input class="t${j}" id="t${j}" type="button" value="${j}" name="${j}" onclick="count2('${j}');" style="border:none; width: 20px;height: 20px;"></td>
				</c:forEach>
				<input id="te" type="hidden">
			</tr>
			<tr>
				<td>우대</td>
				<td>:</td>
				<c:forEach var="j" begin="0" end="2" step="1">
					<td><input class="c${j}" id="c${j}" type="button" value="${j}" name="${j}" onclick="count3('${j}');" style="border:none;width: 20px;height: 20px;"></td>
				</c:forEach>
				<input id="ch" type="hidden">
			</tr>
			<tr>
				<td>총</td>
				<td id="to" colspan="3" align="right">0</td>
				<td>명</td>
			</tr>
	      	
	      	
	      	
	   </table>
	      		<input id="m_t" type="hidden">
   </div>

	
	
	<form action="paymoney.do" method="get" style="border-left:1px solid grey;height:119px ; overflow:hidden;">
		<div style=" overflow:hidden;float:left; width:250px; border-right: 1px solid grey ;height:119px ;">
			<p style="font-weight: bold;font-size: 15px">선택된 좌석수 </p>
			<div align="center" style="border-bottom: 1px solid grey">
				<input name="seat_count" value=0 id="seat_count" readonly style="width:20px; border:none; background-color: #F2E8C4;" align="center">
			</div>
			
			<p style="font-weight: bold;font-size: 15px">좌석 번호 </p>
			<div id="set" style="margin-top: 15px" >
			
			</div>
		</div>
		
		<div style="float:right;">
			
				<div align="left">
				<input name="m_name" value="${sessionScope.vo.m_name}" readonly style="font-weight:bold ;border:none; background-color: #F2E8C4;">
				</div>
			
				<div align="left">
			 	<input name="city" value="${sessionScope.vo.city}" readonly style="width:25px;border:none ;background-color: #F2E8C4;">
				<input name="district" value="${sessionScope.vo.district}" readonly style="width:30px;border:none; background-color: #F2E8C4;">
				</div>
				
				<div align="left"  >
					<input id="time_s" readonly style="border:none ;background-color: #F2E8C4;">
				</div>	
			
				<div align="left">
				<input name="total_m" id="total_m" value=0 readonly style="text-align:right;;font-size:20px;width:60px;border:none; background-color: #F2E8C4;">
				<b>원</b>
				</div>
				
			
			
			
				<div align="left">
				<input type="button" value="결재하기" onclick="send(this.form);">
				</div>
				<input name="time" value="${sessionScope.vo.time}" type="hidden">
				<input type="hidden" name="date_s" value="${sessionScope.vo.date_s}" readonly style="border:none ; background-color: #F2E8C4;">
		</div>
	</form>
	
</div>
  
<div>
<div style="width:600px;height:400px ;margin:0 auto ;border:1px solid ;overflow: hidden; background-color:#424242 " align="center"  >
<div style="margin-bottom: 15px">
<h1 align="center" style="color:#A4A4A4">::SCREEN::</h1>
</div>
   <c:forEach var="i" items="A열,B열,C열,D열,E열,F열,G열">
      <div>
         <c:forEach var="j" begin="1" end="8" step="1">
         		<c:if test="${j eq 2 }">
               <input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="seat('${i}${j}');" style="border:none;border-bottom:1px solid ;margin-right:15px ">
        		</c:if>
         		<c:if test="${j eq 7 }">
               <input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="seat('${i}${j}');" style="border:none;border-bottom:1px solid ;margin-left:15px">
         		</c:if>
         		<c:if test="${j ne 7 and j ne 2 }">
         		<input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="seat('${i}${j}');" style="border:none;border-bottom:1px solid ;margin-left:0px">
         		</c:if>
         </c:forEach>
      </div>
   </c:forEach>
</div>

</div>


</body>
</html>