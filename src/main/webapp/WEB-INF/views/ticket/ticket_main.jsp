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

	var d = dt.getDate() - 5;
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
    //전주 박스오피스순으로 출력(10위 까지만)
    var param = 'key=a7c6bfb2e16d4d1ae14730f90bc6726a&targetDt='+result+'&itemPerPage=10';
    sendRequest( url, param, resultFn, "GET" );
    
 }
 
 function resultFn(){
    
    if( xhr.readyState == 4 && xhr.status == 200 ){
       
       var data = xhr.responseText;
       var json=eval("[" + data + "]");
     
       //id가 movie_select인 태그를 가져온다
       var movie_select =document.getElementById("movie_select")
       
      for(var i=0 ; i<json[0].boxOfficeResult.weeklyBoxOfficeList.length ; i++){
    	  
    	  var option = document.createElement("option");
    	  option.innerHTML =json[0].boxOfficeResult.weeklyBoxOfficeList[i].movieNm;//영화목록
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
		var sido = ['서울', '인천'];
		
		//id가 city_select인 태그를가져온다
		var city_select =document.getElementById("city_select")
		
		for(var i=0 ; i<sido.length;i++){
			var option = document.createElement("option");
			option.innerHTML=sido[i];
			option.value=sido[i];
			city_select.appendChild(option);
		}
	}
	
	//지역 선택시 실행되는 메서드
	function city() {
		var city= document.getElementById("city_select").value;
		document.getElementById("city").value=city;
		document.getElementById("city").innerHTML=city;
		
		
		//각 영화가 상영하는 지역의 상영관을 DB에서 가져와 출력(나중에 DB로 추가할 예정)
		var sido = ['강남', '용산' , '마포'];
		
		var district_select = document.getElementById("district_select");
		
		for(var i=0 ; i<sido.length;i++){
			var option = document.createElement("option");
			option.innerHTML=sido[i];
			option.value=sido[i];
			district_select.appendChild(option);
		}
		
	}
	
	//
	function district() {
		//
		var district= document.getElementById("district_select").value;
		document.getElementById("district").value=district;
		document.getElementById("district").innerHTML=district;
		
		//날자 출력
		var dt = new Date();
		//달
		var m = dt.getMonth() + 1;
		var month = m+'';
		//일
		var d = dt.getDate() 
		
		
		//요일(int형)
		
		var day_int = dt.getDay()//0~6
		
		//요일(리스트)        0    1     2     3     4   5   6
		var arrayDayStr=['일' ,'월' , '화' , '수', '목','금','토'];
		//현재 요일 출력
		var day=arrayDayStr[day_int];
		//년
		var y = dt.getFullYear();
		var year=y+'';
		
		var date_select = document.getElementById("date_select");
		
		var sido = ['강남', '용산' , '마포'];
		
		
		
		for(var i=0 ; i<2;i++){
			for(var j=0 ; j <6 ;j++){
			var option = document.createElement("option");
			var date=d+"";
			option.innerHTML=month+'월 '+ date + '일 ' + day + '요일';
			option.value=year + month + date;
			date_select.appendChild(option);
			d++;//수정해야함(달별로 끝나는 날이 다르므로)
			if(month=='1' ||month=='3' ||month=='5'||month=='7'||month=='8'||month=='10'||month=='12'){
				if(d>31){
					d=1;
					month++;
					if(month>12){
						month=1;
					}
				}
			}else if(month=='2'){
				if(d>28){
					d=1;
					month++;
				}
			}else{
				if(d>30){
					d=1;
					month++;
				}
			}
			
			
			day_int++;
			if(day_int >6){
				day_int=0;
			}
			day=arrayDayStr[day_int];
			}
		}
		
		document.getElementById("date").value=day;
		document.getElementById("date").innerHTML=day;
	}
	
	
</script>
<style type="text/css">

</style>
</head>
<body>



<div>


<!-- 영화목록 -->
<select id="movie_select" onchange="movie();">옵션을 바꿀 때마다movie메서드 실행
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

<hr>


<!--날자 출력  -->
<select id="date_select" onchange="date();"><!-- 옵션을 바꿀 때마다date 메서드 실행 -->
		<option>::날짜를 선택하세요::</option>
</select>



<!-- 예매 정보 한번에 보기 -->
<form action="">
	<p name="m_name" id="m_name"></p>
	<p name="city" id="city"></p>
	<p name="district" id="district"></p>
	<p name="date" id="date"></p>
</form>
</div>
</body>
</html>