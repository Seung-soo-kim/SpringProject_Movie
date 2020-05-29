<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String[] arr= request.getParameterValues("seat");
	String seat="&seats=";
	for(int i = 0 ; i < arr.length ;i++){
		seat+=arr[i];
		if(i != (arr.length -1 )){
			seat+="&seats=";
		}
				
	}
	request.setAttribute("seat", seat);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"  src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">
 	function pay() {
 		var url="saveTicket.do";
		var param="m_name=${param.m_name}&id=${sessionScope.user.id}&city=${param.city}<%=seat%>&district=${param.district}&date_s=${param.date_s}&time=${param.time}&pay_money=${param.total_m}&seat_count=${param.seat_count}";
		sendRequest(url , param , resultFn , "GET");
	}
	function resultFn() {
		if(xhr.readyState==4 && xhr.status==200){
			alert("결재 성공");
			location.href="saveseat.do";
		}
	} 
	
</script>
</head>
<body>
	 <input type="button" value="찐결재" onclick="pay();">
	
</body>
</html>
<!-- --예매 DB

--시퀀스
create sequence seq_ticket_idx;

--테이블
create table ticket(
	t_idx number primary key,--예매번호
	m_name varchar2(100) not null,--영화이름
	id varchar2(100),--예매회원ID(forignkey)
	city varchar2(100),--상영지역
	district varchar2(100),--각 지역별 위치
	date_s date,--상영날짜
	time varchar2(10),--상영시간
	seat varchar2(10),--좌석 번호
	pay_money varchar2(100)--결재금액	
); -->
