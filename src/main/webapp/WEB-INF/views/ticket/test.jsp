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
*{margin: 0; padding: 0;}
	.st{width:90px;

    background-color: #F4F1E5;

    border: none;

    color:#4E4D49;
	굴림;
    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 10px;
	
	font-weight:normal;
	
    margin: 4px;

    cursor: pointer;

}

 input:hover {
    background-color:#393836;
    color:#F4F1E5;
    
}
body{
	background-color: #F2E8C4;
}

/* //div스크롤바 꾸미기  */
div::-webkit-scrollbar {
    width: 8px;
  }
  div::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 8px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  div::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 8px;
    box-shadow: inset 0px 0px 5px white;
  }
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
<table>
</table>
</div>
<div style="width:1200px ;margin:0 auto ;border:1px solid ;overflow: hidden;" align="center">
<!--border지워도댐  -->


<!--영화 출력  -->
		<div style="float:left;margin: 4px;">
			<div style="background-color:gray ; margin:0"><h3 style="color:#F0F6E8">영화</h3></div>
			<div class="movie_select" id="movie_select" style="overflow:scroll;overflow-x:hidden; width:190px; height:200px;background-color:#F4F1E5">
			
			</div>
		</div>
	

		
		<div style="margin: 4px;float:left;">
			<div style="background-color:gray ; margin:0"><h3 style="color:#F0F6E8">극장</h3></div>
			<div>
				
			<div id="city_select" style="overflow:scroll;overflow-x:hidden; width:190px; height:200px;float:left;background-color:#F4F1E5">
			</div>
			
			<div id="district_select" style="overflow:scroll; overflow-x:hidden;width:190px; height:200px;float:left;background-color:#F4F1E5">
			
			</div>
			</div>
		</div>
	


<!--날자 출력  -->
		
		<div style="margin: 4px;float:left;">
			<div style="background-color:gray ; margin:0"><h3 style="color:#F0F6E8">날짜 및 시간</h3></div>
			<div>
				<div id="date_select" style="overflow:scroll; overflow-x:hidden;width:190px; height:200px;float:left;background-color:#F4F1E5">
				
				</div>

<!--상영시간 출력  -->
				<div id="time_select" style="overflow:scroll;overflow-x:hidden; width:190px; height:200px;float:left;background-color:#F4F1E5">
				
				</div>
			</div>
		</div>

<!-- 예매 정보 한번에 보기 -->
<div style="margin: 4px;float:left;">
<div style="background-color:gray ; margin:0"><h3 style="color:#F0F6E8">예매 정보</h3></div>
<form  action="ticketform.do" method="get">

	<table style="background-color:#F4F1E5" >
	<tr>
		<td><input name="m_name" id="m_name" readonly style="border:none"></td>
	</tr>
	<tr>
		<td><input name="city" id="city" readonly style="border:none"></td>
	</tr>
	<tr>
		<td><input name="district" id="district" readonly style="border:none"></td>
	</tr>
	<tr>
		<td><input name="time" id="time" readonly style="border:none"></td>
	</tr>
	
	</table>
	<input type="button" value="좌석 선택하기" onclick="send(this.form);">
	<input type="hidden" name="date_s" id="date" readonly style="border:none">
	
	
</form>
</div>

</div>
</body>
</html>