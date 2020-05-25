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
     
       
       var movie_select =document.getElementById("movie_select")
      for(var i=0 ; i<json[0].boxOfficeResult.weeklyBoxOfficeList.length ; i++){
    	  
    	  var option = document.createElement("option");
    	  option.innerHTML =json[0].boxOfficeResult.weeklyBoxOfficeList[i].rank+" : "
    	  					+json[0].boxOfficeResult.weeklyBoxOfficeList[i].movieNm;//옵션 이름 
    	  option.value=json[0].boxOfficeResult.weeklyBoxOfficeList[i].movieNm;	
			
		  movie_select.appendChild(option);
    	  
    	  
      }
       
       
    }  
    
 }
	//영화 클릭시 실행되는 메서드
	function movie() {
		var movieNm = document.getElementById("movie_select").value;
		
		//영화이름 저장
		document.getElementById("m_name").value=movieNm;
		document.getElementById("m_name").innerHTML=movieNm;
		
		
		//각 영화가 상영하는 지역을 DB에서 가져와 출력(나중에 DB로 추가할 예정)
		var sido = ['서울', '경기' , '인천','강원','대전','대구'];
		
		for(var i=0 ; i<sido.length;i++){
			var option = document.createElement("option");
			option.innerHTML=sido[i];
			option.value=sido[i];
			loc_select.appendChild(option);
		}
	}
	
	//지역 선택시 실행되는 메서드
	function city() {
		var loc= document.getElementById("city_select").value;
		document.getElementById("city").value=city;
		document.getElementById("city").innerHTML=city;
		
		
		//각 영화가 상영하는 지역의 상영관을 DB에서 가져와 출력(나중에 DB로 추가할 예정)
		var sido = ['강남', '용산' , '마포'];
		
		for(var i=0 ; i<sido.length;i++){
			var option = document.createElement("option");
			option.innerHTML=sido[i];
			option.value=sido[i];
			loc_select.appendChild(option);
		}
		
	}
	
	function district() {
		var loc= document.getElementById("district_select").value;
		document.getElementById("district").value=district;
		document.getElementById("district").innerHTML=district;
		
		
		//각 영화가 상영하는 시간을 
		var sido = ['강남', '용산' , '마포'];
		
		for(var i=0 ; i<sido.length;i++){
			var option = document.createElement("option");
			option.innerHTML=sido[i];
			option.value=sido[i];
			loc_select.appendChild(option);
		}
	}
	
</script>
<style type="text/css">

</style>
</head>
<body>
<div>


<!-- 영화목록 -->
<select id="movie_select" onchange="movie();"><!-- 옵션을 바꿀 때마다movie메서드 실행 -->
		<option>::영화를 선택하세요::</option>
</select>

<hr>


<!--상영 지역-->
<select id="city_select" onchange="city();"><!-- 옵션을 바꿀 때마다 city() 메서드 실행 -->
		<option>::지역을 선택하세요::</option>
</select>
<hr>

<!--각 지역별 상영관-->
<select id="district_select" onchange="district();"><!-- 옵션을 바꿀 때마다 district() 메서드 실행 -->
		<option>::지역을 선택하세요::</option>
</select>

<!-- 예매 정보 한번에 보기 -->
<form action="">
	<p name="m_name" id="m_name"></p>
	<p name="city" id="city"></p>
	<p name="district" id="district"></p>
	
</form>
</div>
</body>
</html>