<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>순위</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
<script type="text/javascript">

window.onload=function(){
    load_list();
 };
 
 //목록을 가져오는 함수
 function load_list(){
	// 조회할 날짜를 계산
	var dt = new Date();

	var m = dt.getMonth() + 1;
	if (m < 10) {
		var month = "0" + m;
	} else {
		var month = m + "";
	}

	var d = dt.getDate() - 7;
	if (d < 10) {
		var day = "0" + d;
	} else {
		var day = d + "";
	}

	var y = dt.getFullYear();
	var year = y + "";

	var result = year + month + day;
    //192.168.1.101:9090/vs/list.do
    var url ='http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json';
    var param = 'key=a7c6bfb2e16d4d1ae14730f90bc6726a&targetDt='+result+'&itemPerPage=10';
    sendRequest( url, param, resultFn, "GET" );
    
 }
 
 function resultFn(){
    
    if( xhr.readyState == 4 && xhr.status == 200 ){
       
       var data = xhr.responseText;
       var json=eval("[" + data + "]");
       alert(data);
       
       var movie_select =document.getElementById("movie_select")
      for(var i=0 ; i<json[0].boxOfficeResult.weeklyBoxOfficeList.length ; i++){
    	  
    	  var option = document.createElement("option");
    	  option.innerHTML =json[0].boxOfficeResult.weeklyBoxOfficeList[i].rank+" : "+json[0].boxOfficeResult.weeklyBoxOfficeList[i].movieNm;//옵션 이름 
		  
			
		  movie_select.appendChild(option);
    	  
    	  
      }
       
       
    }  
    
 }


</script>
<style type="text/css">

</style>
</head>
<body>
<!-- 영화목록 -->
<select id="movie_select" onchange=""><!-- 옵션을 바꿀 때마다 movie_player메서드 실행 -->
		<option>::영화를 선택하세요::</option>
</select>
	
</body>
</html>