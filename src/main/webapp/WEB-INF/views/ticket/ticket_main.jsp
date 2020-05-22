<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function m_list() {
		//조회할 날짜 계산 
		var dt = new Date();

		var m = dt.getMonth() + 1;
		if (m < 10) {
			var month = "0" + m;
		} else {
			var month = m + "";
		}

		var d = dt.getDate() - 1;
		if (d < 10) {
			var day = "0" + d;
		} else {
			var day = d + "";
		}

		var y = dt.getFullYear();
		var year = y + "";

		var result = year + month + day;
		var url="http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=N&ServiceKey=U8ECM752YKB763PI62AV";
		 var param="regDate="+result+"&audiAcc";
		 sendRequest(url,param,"resultFn","GET");
	}
	
	function resultFn() {
		if(xhr.readyState==4 && xhr.status==200){
			
		}
	}

</script>
</head>
<body>

</body>
</html>