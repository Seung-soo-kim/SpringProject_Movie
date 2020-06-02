<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>순위</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/select.js"></script>
<style type="text/css">
	.st{width:100px;

    background-color: #f8585b;

    border: none;

    color:#fff;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
    
	border-radius:10px;

}
.st:hover {
    background-color: blue;
}

출처: https://nimolove.tistory.com/44 [Chaeni_vlog 🌈]
</style>
<script type="text/javascript">

window.onload=function(){
    load_list();
 };
</script>

<style type="text/css">

</style>
</head>
<body>

<div>
	<h3>영화</h3>
</div>
<div>


<!--영화 출력  -->
		
		<div id="movie_select" style="overflow:scroll; width:185px; height:200px;float:left;">
			
		</div>
	

		
		<div style="float:left;">
			<div id="city_select" style="overflow:scroll; width:185px; height:200px;float:left;">
				
			</div>
			
			<div id="district_select" style="overflow:scroll; width:185px; height:200px;float:left;">
			
			</div>
		</div>
	


<!--날자 출력  -->
		
		<div style="float:left;">
			<div id="date_select" style="overflow:scroll; width:185px; height:200px;float:left;">
				
			</div>

<!--상영시간 출력  -->
			<div id="time_select" style="overflow:scroll; width:185px; height:200px;float:left;">
				
			</div>
		</div>

<!-- 예매 정보 한번에 보기 -->
<form  action="ticketform.do" method="get">
	<input name="m_name" id="m_name" readonly>
	<input name="city" id="city" readonly>
	<input name="district" id="district" readonly>
	<input type="hidden" name="date_s" id="date" readonly>
	<input name="time" id="time" readonly>
	<input type="button" value="좌석 선택하기" onclick="send(this.form);">
	
</form>
</div>
</body>
</html>