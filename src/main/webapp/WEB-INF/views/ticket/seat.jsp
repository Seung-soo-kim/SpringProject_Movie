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
<%-- <script type="text/javascript"  src="${pageContext.request.contextPath }/resources/js/count.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">
window.onload=function(){
	
	
	//페이지 실행시 DB에서 예약된 자리 정보 가져온다
}	
	
	
	//선택한 좌석수
	var count=0;
	var total=0;//총인원수
	var a=0;//어른 카운트
	var t=0;//청소년 카운트
	var c=0;//어린이 카운트
	
	//어른 카운트 메서드
	function count1(i) {
		//인원 선택시 실행 되는 메서드
		i=i*1;
		if(i==0){
			total-=a;
			a=0;
		}else if(i==1){
			total-=a;
			a=1;
			total+=a;
		}else if(i==2){
			total-=a;
			a=2;
			total+=a;
		}else{
			a = i;
			total+=i;
		}
			if(count>total){
				alert("좌석수를 줄이세요");
			}
			//console.log(total);
			document.getElementById("to").innerHTML=total;
			document.getElementById("ad").innerHTML=a;
	}
	
	//청소년 카운트 메서드
	function count2(i) {
		//인원 선택시 실행 되는 메서드
		i=i*1;
		if(i==0){
			total-=t;
			t=0;
		}else if(i==1){
			total-=t;
			t=1;
			total+=t;
		}else if(i==2){
			total-=t;
			t=2;
			total+=t;
		}else{
			t = i;
			total+=i;
		}
		if(count>total){
			alert("좌석수를 줄이세요");
		}
			//console.log(total);
			document.getElementById("to").innerHTML=total;
			document.getElementById("te").innerHTML=t;
	}
	
	//어린이 카운트 메서드
	function count3(i) {
		//인원 선택시 실행 되는 메서드
		i=i*1;
		if(i==0){
			total-=c;
			c=0;
		}else if(i==1){
			total-=c;
			c=1;
			total+=c;
		}else if(i==2){
			total-=c;
			c=2;
			total+=c;
		}else{
			c = i;
			total+=i;
		}
		if(count>total){
			alert("좌석수를 줄이세요");
		}
			//console.log(total);
			document.getElementById("to").innerHTML=total;
			document.getElementById("ch").innerHTML=c;
	}

	
	//좌석 선택시 실행되는 메서드
   function send( id ) {
	var div =document.getElementById("set");
	var p = document.createElement("input");
      	p.innerHTML=id;
      	p.id=id+"s";
      	p.value=id;
      	p.name=id;
		p.readonly="readonly"
      var input = document.getElementById(id);
      //console.log(input.value);
      if(input.style.background=="red"){
    	var inp=document.getElementById(id+"s");
    	input.style.background="white";
    	count-=1;
    	div.removeChild(inp);
      }else if(count<total){
    	  
    	count+=1;
      	input.style.background="red";
      	console.log(count);
      	div.appendChild(p);
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