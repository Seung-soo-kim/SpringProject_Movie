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
		//영화이름 저장
		var movieNm = document.getElementById("movie_select").value;
		document.getElementById("m_name").value=movieNm;
		document.getElementById("m_name").innerHTML=movieNm;
		
		//영화 재 선택시 아래항목 리셋		
		var district_select = document.getElementById("district_select");
		var date_select = document.getElementById("date_select");
		var city_select =document.getElementById("city_select");
		if(city_select.options.length >1){
	    
		    for(var i=1; i<city_select.options.length; i++) {
		    	city_select.options[i] = null;
		    	city_select.options.length = 1;
		    }
		}
		if(district_select.options.length >1){
		    
		    for(var i=1; i<district_select.options.length; i++) {
		    	district_select.options[i] = null;
		    	district_select.options.length = 1;
		    }
		}
		if(date_select.options.length >1){
		    
		    for(var i=1; i<date_select.options.length; i++) {
		    	date_select.options[i] = null;
		    	date_select.options.length = 1;
		    }
		}
		//영화 재선택시 ticket에 저장된 영화제목 이외의 항목 제거 
	    document.getElementById("city").value="";
	    document.getElementById("city").innerHTML="";
	    document.getElementById("district").value="";
	    document.getElementById("district").innerHTML="";
	    document.getElementById("date").value="";
	    document.getElementById("date").innerHTML="";
		
		
		//각 영화가 상영하는 지역을 DB에서 가져와 출력
		var url="citylist.do"
		var param="m_name="+movieNm;
		sendRequest( url, param, resultFn2, "GET" );
	}
	
	function resultFn2() {
		
		if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			var json = eval(data);
			var city_select =document.getElementById("city_select")
			
			for(var i=0 ; i<json.length; i++){
				var option = document.createElement("option");
				option.innerHTML=json[i].city;
				option.value=json[i].city;
				city_select.appendChild(option);
			}
		}
	}
	
	
	
	//지역 선택시 실행되는 메서드
	function city() {
		
		//ticket에 아래 내용 저장
		var movieNm = document.getElementById("movie_select").value;
		var city= document.getElementById("city_select").value;
		
		
		document.getElementById("city").value=city;
		document.getElementById("city").innerHTML=city;
		
		//지역 재선택시 아래 항목 초기화
		var district_select = document.getElementById("district_select");
		var date_select = document.getElementById("date_select");
		if(district_select.options.length >1){
		    
		    for(var i=1; i<district_select.options.length; i++) {
		    	district_select.options[i] = null;
		    	district_select.options.length = 1;
		    }
		}
		if(date_select.options.length >1){
		    
		    for(var i=1; i<date_select.options.length; i++) {
		    	date_select.options[i] = null;
		    	date_select.options.length = 1;
		    }
		}
		
		
		//각 영화가 상영하는 지역의 상영관을 DB에서 가져와 출력
		
		var url="districtlist.do"
		var param="m_name="+movieNm+"&city="+city;
		sendRequest( url, param, resultFn3, "GET" );
	}//city
	
	function resultFn3() {
		if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			var json = eval(data);
			alert(data);
			var district_select = document.getElementById("district_select");
			
			for(var i=0 ; i<json.length;i++){
				
				var option = document.createElement("option");
				option.innerHTML=json[i].district;
				option.value=json[i].district;
				district_select.appendChild(option);
			}
		}
	}//resultFn3
	
	//상영관 선택시 실행
	function district() {
		var movieNm = document.getElementById("movie_select").value;
		var city= document.getElementById("city_select").value;
		var district= document.getElementById("district_select").value;
		
		
		//ticket에 아래 항목 저장
		document.getElementById("district").value=district;
		document.getElementById("district").innerHTML=district;
		
		//상영관 재선택시 아래 항목 초기화
		var date_select = document.getElementById("date_select");
		if(date_select.options.length >1){
		    
		    for(var i=1; i<date_select.options.length; i++) {
		    	date_select.options[i] = null;
		    	date_select.options.length = 1;
		    }
		}
		
		var url="datelist.do"
		var param="m_name="+movieNm+"&city="+city+"&district="+district;
		sendRequest( url, param, resultFn4, "GET" );
	}//district
	
	
	function resultFn4() {
		if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			var json = eval(data);
			//[{"max_month":"06","max_date":"04","min_month":"05","min_date":"28" , 'date_o':'2' , 'day':'목요일'}]
			//
			var date_o = json[0].date_o *1;
			
			//요일
			var day = json[0].day;
			
			//
			
			var dt = new Date();
			//달
			var m = json[0].min_month*1;
			var month = m+'';
			//일
			var d =  json[0].min_date*1;
			
			
			//요일(int형)
			
			var day_int = dt.getDay()//0~6
			
			//요일(리스트)        0    1     2     3     4   5   6
			var arrayDayStr=['일요일' ,'월요일' , '화요일' , '수요일', '목요일','금요일','토요일'];
			//해당 요일의 day_int 값 구하기
			for(var i=0 ; i < arrayDayStr.length ; i++){
				if(arrayDayStr[i]==day){
					day_int=i;
				}
			}
			
			//현재 요일 출력
			//var day=arrayDayStr[day_int];
			//년
			var y = dt.getFullYear();
			var year=y+'';
			
			var date_select = document.getElementById("date_select");
			
			
			
				for(var j=0 ; j <date_o+1 ;j++){
					
					var option = document.createElement("option");
					//var date=d+"";
					
					option.innerHTML=month+'월 '+ d + '일 ' + day ;
					if(month <10){
						var mt = "0"+month;
					}
					if(d <10){
						var da="0"+d;
					}else{
						var da = d+"";
					}
					option.value=mt+""+da+""+year;
					
					
					date_select.appendChild(option);
					d++;
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
					
				}//for-in
			
		
		}//if
	}//resultFn4()
	
		
		
	//상영 날짜 클릭시 실행
	function date() {
		var movieNm = document.getElementById("movie_select").value;
		var city= document.getElementById("city_select").value;
		var district= document.getElementById("district_select").value;
		var date= document.getElementById("date_select").value;
		
		
		document.getElementById("date").value=date;
		document.getElementById("date").innerHTML=date;
		var date_s=date+"";
		var url="timelist.do";
		var param="movieNm="+movieNm+"&city="+city+"&district="+district+"&date_s="+date_s;
		alert(date_s);
		sendRequest(url,param,resultFn5 , "get"); 
	}//date
	function resultFn5() {
		if( xhr.readyState == 4 && xhr.status == 200 ){
			var data = xhr.responseText;
			var json = eval(data);
			alert(data);
			
		}
	} //resultFn5
	
</script>

<style type="text/css">

</style>
</head>
<body>



<div>

<form action="">
<!-- 영화목록 -->
<select id="movie_select" onchange="movie();">
		<option>::영화를 선택하세요::</option>
</select>
</form>

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

<hr>

<!--상영시간 출력  -->
<select id="time_select" onchange="time();"><!-- 옵션을 바꿀 때마다time 메서드 실행 -->
		<option>::시간을 선택하세요::</option>
</select>

<hr>
<!-- 예매 정보 한번에 보기 -->
<form  action="">
	<p name="m_name" id="m_name"></p>
	<p name="city" id="city"></p>
	<p name="district" id="district"></p>
	<p name="date" id="date"></p>
</form>
</div>
</body>
</html>