<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 그 이상의 감동. CGW</title>
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/movie_detail.css">
	<style type="text/css">
		.back_c {margin:0; line-height:89px; width:100px; height:100px;
			background: url(${pageContext.request.contextPath}/resources/img/aa.png) no-repeat;
			background-size: contain;}   /* 뒷배경 사진은 나중에 바꾸기!!!!!!!!!!!! */
			
		.write {width:25px; height:25px; line-height:10px;}
	
		h3, h5 {display: inline}
		
		.p {margin: 0;}
		
		.close{width:15px; height:15px;}
	</style>
	
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/httpRequest.js"></script>
	<script type="text/javascript">
		
	
		if (self.name != 'reload') {
			self.name = 'reload';
			self.location.reload(true);
		}
		else self.name = '';
	
		window.onload=function(){
			
			var totalTitle;
			var outposters;
			var splitStills;
			if( "${type}" == "2" ){
				load_list2();
			} else {
				load_list();			
			}
		};
		
		function saeroi(){
			if (self.name != 'reload') {
				self.name = 'reload';
				self.location.reload(true);
			}
			else self.name = '';
		}
		
		
		//여러개 포스터 잘라쓰기
		function spPoster(inPosters) {
			
	    	outposters = inPosters.split('|');
			
			if (inPosters === "") {
				outposters[0] = "${ pageContext.request.contextPath }/resources/img/nullImg.png";
			}
			
			//한개 포스터 출력
			var onePoster = document.createElement("img");
		    onePoster.src = outposters[0];
		    document.getElementById("movie_detail_poster_contain").appendChild(onePoster);
		    document.getElementById("movie_first_box").style.backgroundImage="url("+outposters[0]+")";
			
		    //여러개의 포스터 출력(임시 : 포스터 더보기 누르면 뜨게)
			/* for(var i = 0 ; i<outposters.length; i++){
			    var onePoster = document.createElement("img");
		    	onePoster.src = outposters[i];
		    	document.getElementById("movie_detail_poster_contain").appendChild(onePoster); 
	    	} */

		}
		
		//필요한 OPEN API 불러오기(Ajax)
		//상영예정작 -> 상세정보
		function load_list(){
			var url ='http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp';
			var param = 'collection=kmdb_new2&detail=Y&ServiceKey=U8ECM752YKB763PI62AV&movieId=${movieId}&movieSeq=${movieSeq}';
			sendRequest( url, param, resultFn, "GET" );
		}
		
		//박스오피스 -> 상세정보
		function load_list2(){
			var url ='http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp';
			var param = 'collection=kmdb_new2&detail=Y&ServiceKey=U8ECM752YKB763PI62AV&title=${title}&releaseDts=${releaseDts}';
			sendRequest( url, param, resultFn, "GET" );		
		}
		
		function resultFn(){
			
			if( xhr.readyState == 4 && xhr.status == 200 ){
				
				var data = xhr.responseText;
				var json = eval("["+data+"]");		

		    	spPoster(json[0].Data[0].Result[0].posters);//포스터
		    	var movieNm = json[0].Data[0].Result[0].title;
		    	
		    	//영화 제목	
		    	if( "${type}" == "2" ){
		    		totalTitle="${title}";	
		    	} else {
		    		//()"${type}" == "1" )
		    		totalTitle=movieNm;		    	
		    	}
		    	document.getElementById("movie_detail_title").innerHTML=totalTitle;
		    	document.getElementById("movie_detail_titleEng").innerHTML=json[0].Data[0].Result[0].titleEng;//영화 영문 제목
		    	document.getElementById("movie_detail_directors").innerHTML="<b>감독  </b>" +json[0].Data[0].Result[0].directors.director[0].directorNm;//감독
		    	
		    	//배우 출력하기 위한 코드
		    	var actor = "<b>배우  </b>";
		    	var maxNumActor = json[0].Data[0].Result[0].actors.actor.length;
		    	var etc = 0;
		    	//배우가 많으면 5명만 출력
		    	if( maxNumActor >= 6 ){
		    		maxNumActor = 6;
		    		etc = 1;
		    	}
		    	
		    	for(var i=0 ; i<maxNumActor; i++){
			    	if( i === maxNumActor-1 ){
			    		actor += json[0].Data[0].Result[0].actors.actor[i].actorNm;
			    		if( etc === 1 ) {
			    			actor += " 등..";
			    		}
			    	} else {
				    	actor += json[0].Data[0].Result[0].actors.actor[i].actorNm + " ,  ";//배우 한명 한명			    		
			    	}
		    	}
			    document.getElementById("movie_detail_actors").innerHTML=actor;//배우들
		    	etc = 0;
			    
			    document.getElementById("movie_detail_genre").innerHTML="<b>장르  </b>"+json[0].Data[0].Result[0].genre;//장르
			    document.getElementById("movie_detail_rating").innerHTML=json[0].Data[0].Result[0].rating;//관람등급
			    document.getElementById("movie_detail_nation").innerHTML="<b>국가  </b>"+json[0].Data[0].Result[0].nation;//국가
			    document.getElementById("movie_detail_company").innerHTML="<b>제작  </b>"+json[0].Data[0].Result[0].company;//회사
		    	
		    	document.getElementById("movie_detail_relDate").innerHTML=json[0].Data[0].Result[0].repRlsDate+" 개봉";//개봉일
		    	document.getElementById("movie_detail_runtime").innerHTML=json[0].Data[0].Result[0].runtime+"분";//상영시간
			    	
		    	document.getElementById("movie_detail_plot").innerHTML=json[0].Data[0].Result[0].plots.plot[0].plotText;//줄거리
				
		    	//트레일러 주소 불러오기
		    	if( "${type}" == "2" ){
		    		document.getElementById("movie_trailer_frame").src="${trailer}";
		    	}
		    	
		    	//여러개의 스틸이미지를 출력하기 위함
		    	var stills = json[0].Data[0].Result[0].stlls;
	             splitStills = stills.split('|');
	            if(splitStills.length >= 4){
	                document.getElementById("movie_still_img_0").src = splitStills[0];
	                document.getElementById("movie_still_img_1").src = splitStills[1];
	                document.getElementById("movie_still_img_2").src = splitStills[2];
	            } else if(splitStills.length == 3){
	               document.getElementById("movie_still_img_0").src = splitStills[0];
	                document.getElementById("movie_still_img_1").src = splitStills[1];
	                document.getElementById("movie_still_img_2").src = "${ pageContext.request.contextPath }/resources/img/nullImg.png";
	            } else if(splitStills.length == 2){
	               document.getElementById("movie_still_img_0").src = splitStills[0];
	               document.getElementById("movie_still_img_1").src = "${ pageContext.request.contextPath }/resources/img/nullImg.png";
	               document.getElementById("movie_still_img_2").src = "${ pageContext.request.contextPath }/resources/img/nullImg.png";
	            } else{
	               document.getElementById("movie_still_img_0").src = "${ pageContext.request.contextPath }/resources/img/nullImg.png";
	               document.getElementById("movie_still_img_1").src = "${ pageContext.request.contextPath }/resources/img/nullImg.png";
	               document.getElementById("movie_still_img_2").src = "${ pageContext.request.contextPath }/resources/img/nullImg.png";
	            }
	        	
			}
		}
		
		var num = 0;
		var maxNum = num+3;
    	function nextStill() {
			num++;
			maxNum = num+3;
			document.getElementById("prevBtn").style.display="block";   
			if( maxNum >= splitStills.length ) {
				document.getElementById("nextBtn").style.display="none";   					
			}
			document.getElementById("movie_still_img_0").src = splitStills[num];
			document.getElementById("movie_still_img_1").src = splitStills[num+1];
			document.getElementById("movie_still_img_2").src = splitStills[num+2];
		}
		
		function prevStill() {
			num--;
			document.getElementById("nextBtn").style.display="block";
			if( num <= 0) {
				document.getElementById("prevBtn").style.display="none";   
			}
			document.getElementById("movie_still_img_0").src = splitStills[num];
			document.getElementById("movie_still_img_1").src = splitStills[num+1];
			document.getElementById("movie_still_img_2").src = splitStills[num+2];
		}
		
		
		//--------------요서부터 review.jsp 합치기 시작--------------------
		//페이지 한 번만 새로고침 => return history.back(); 일케 돌아오면 새로고침 해줘야 아이디 뜸
	
		
		//로그인했는지 했으면 리뷰를 작성했는지 안했는지
		function check( ){
			var id = document.getElementById("id").value.trim();
			/* var totalTitle = document.getElementById("m_name").value.trim(); */
			var url ="checkLogin.do?id="+id+"&m_name="+totalTitle.trim();
			sendRequest(url, null, resultFnReview, "GET");
		}
		
		function resultFnReview(){
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var data = xhr.responseText;
				
				if(data == 'no'){
					alert("로그인 후 이용하세요");	
					location.href="login_form.do";
				}else if(data == 'already'){
					alert("이미 리뷰를 작성 하셨습니다.");
					return;
					
					/* movieId=${movieId}&movieSeq=${movieSeq} */
				}else{
					if( "${type}" == "1" ){
						var totalVar1 = "${movieId}";
						var totalVar2 = "${movieSeq}";
					} else {
						//( "${type}" == "2" )
						var totalVar1 = "${title}";
						var totalVar2 = "${releaseDts}";
					}
					window.open('insert_form.do?id='+data+"&m_name="+totalTitle+"&type=${type}&totalVar1="+totalVar1 +"&totalVar2="+totalVar2, '', 'width=665px, height=660px, left=370px,top=50px');			
				}		
			}
		}
		
		//...누르면 확인해서 수정or신고 판단
		function dotcheck(id){
			var id_u = document.getElementById("id").value.trim();
			var user = document.getElementById("user_"+id);
			var user2 = document.getElementById("user2_"+id);
			var di = document.getElementById("di_" + id);
			
			if(id == id_u){
				user.style.display = 'block';
				return;
			}
			user2.style.display = 'block';
		}
		
		//수정
		function modify(){
			var id = document.getElementById("id").value.trim();
			if( "${type}" == "1" ){
				var totalVar1 = "${movieId}";
				var totalVar2 = "${movieSeq}";
			} else {
				//( "${type}" == "2" )
				var totalVar1 = "${title}";
				var totalVar2 = "${releaseDts}";
			}
			window.open("modify_form.do?id="+id+"&m_name="+totalTitle+"&type=${type}&totalVar1="+totalVar1+"&totalVar2="+totalVar2, "수정하기", "width=665px, height=660px, left=370px, top=50px");
		}
		
		//리뷰 지우고 돌아오기
		function del(){
			var id = document.getElementById("id").value.trim();
			
			if(!confirm("정말 삭제 하시겠습니까?")){
				return;
			}
			
			var url = "delete.do";
			var param = "id=" + id + "&m_name=" + totalTitle;
			
			sendRequest(url, param, resultFnReview2, "POST");	
		}
		function resultFnReview2(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				
				if(data == 'no'){
					alert("삭제 실패");
				}
				alert("삭제 성공");
				location.href = location.href;
			}
		}
		
		//x누르면 닫게
		function cancle(id){
			var user = document.getElementById("user_"+id);
			var user2 = document.getElementById("user2_"+id);
			
			user.style.display="none";
			user2.style.display="none";
		}
		
	</script>
		

</head>
<body>
	<div id="container">
	
		<div id="contents">
			<div id="movie_chart">
				<!-- <div id="chart_title"><h4>영화 상세 정보</h4></div> -->
				
				<div id="show_movie_details_con">
					
					<div id="movie_first_box">
					<div id="movie_first_box_cover">
						<div id="movie_detail_poster">
							<div id="movie_detail_poster_contain"></div>
							<!-- <input type="button" value="포스터 더 보기" onclick="moreView();"> -->
						</div>
						
						<div id="movie_detail_infomation">
							
							<div id="movie_titles">
								<div id="movie_detail_title"></div>
								<div id="movie_detail_titleEng"></div>					
							</div>
								
							<div id="movie_baseInfo">
								<div id="movie_detail_genre"></div>
								<div id="movie_detail_relDate"></div>
								<div id="movie_detail_runtime"></div>
		
								<div id="movie_detail_directors"></div>
								<div id="movie_detail_actors"></div>					
							</div>	
							
							<div id="movie_baseInfo_2">
								<div id="movie_detail_nation"></div>					
								<div id="movie_detail_rating"></div>
								<div id="movie_detail_company"></div>
							</div>
							
						</div>
					</div>
					</div>
	
					
					<div id="movie_detail_plots">
						<div id="movie_detail_plot_title">줄거리</div>
						<div id="movie_detail_plot"></div>					
					</div>
					
					<div id="movie_detail_still_box">
						<div id="movie_detail_still_box_position">
							<div id="movie_detail_still_title">스틸컷 / 예고편</div>
							<div id="movie_detail_still">
								<a href="javascript:void(0);" id="prevBtn" onclick="prevStill();"><img width="16px" src="${ pageContext.request.contextPath }/resources/img/leftArrow.png" ></a>
								<a href="javascript:void(0);" id="nextBtn" onclick="nextStill();"><img width="16px" src="${ pageContext.request.contextPath }/resources/img/rightArrow.png"></a>
								<div id="still_imgs">
									<img id="movie_still_img_0">
									<img id="movie_still_img_1">
									<img id="movie_still_img_2">
								</div>
							</div>
						</div>
						
					</div>
					
						<c:if test="${type eq '2'}">
							<div id="movie_trailer_box">
								<iframe id="movie_trailer_frame" width="950" height="534"
										frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
										allowfullscreen></iframe>
							</div>
						</c:if>

				</div>
			
			</div>
		</div>
	
		<div id="review_box">
			<div id="main" align="center">

				
		
				<input type="hidden" action="checkLogin.do" method="GET" name="id" id="id" value="${sessionScope.user.id }">
				<div id="review_title">
					<hr>
					실관람 평점<br>
		
					<h3>${avg_f2}</h3>
					<h5>/ 5</h5>
					
					<h1 class="back_c">${avg}</h1>
				</div>
				<hr>
	
				<table width="950px" align="center">
					<tr>
						<td width="30"></td>
						<td width="2" class="td_b"></td>
						<c:choose>
							<c:when test="${ empty sessionScope.user }">
								<td width="80" align="center">night cinema</td>
								<td width="2" class="td_b">
									<img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif">
								</td>
								<td align="center">
									<b>
			                            <c:if test="${empty title}">
			                               ${m_name}
			                            </c:if>
										<c:if test="${empty m_name}">
											${title}
										</c:if>
									</b>
									영화는 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.</td>
							</c:when>
							
							<c:otherwise>						
								<td width="80" align="center">${sessionScope.user.id }</td>
								<td width="2" class="td_b">
									<img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif">
								</td>
								<td align="center">
									<b>${sessionScope.user.id }</b>님, 
									<b>
			                            <c:if test="${empty title}">
			                               ${m_name}
			                            </c:if>
										<c:if test="${empty m_name}">
											${title}
										</c:if>
									</b>
									영화는 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.
								</td>
							</c:otherwise>
						</c:choose>
	
						<!-- <td width="120" onclick="write();"> -->
						<td width="120" class="new" onclick="check();">
							<!-- <td width="120" onclick="location.href='insert_form.do'"> -->
							<img src="${pageContext.request.contextPath}/resources/img/write1.png" class="write"> 관람평쓰기
						</td>
					</tr>
				</table>
	
				<hr>
	
				<table width="950" align="center">
				<tr>
					<td width="30"></td>
					<td width="2" class="td_b"></td>
					<td width="80" align="center">아이디</td>
					<td width="2" class="td_b">
						<img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif">
					</td>
					
					<td width="120" align="center">영화</td>
					<td width="2" class="td_b">
						<img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif">
					</td>
	
					<td width="40" class="td_b" align="center">평점</td>
	
					<td width="2" class="td_b">
						<img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif">
					</td>
	
					<td class="td_b" align="center"><pre>관람평</pre></td>
					<td width="2" class="td_b"></td>
					<td width="100" class="td_b" align="center"></td>
					
				</tr>
			
				<c:forEach var="vo" items="${ list }">	
					<tr>
						<td colspan="11" align="right">
							<div class="user" id="user_${vo.id}" align="right" style="position: absolute; left:680px;  background:url(${pageContext.request.contextPath}/resources/img/text.png); background-size:250px 100px;
								 background-position:center; background-repeat: no-repeat; display:none;">
				 			<input width="15" height="15" type="image" name="button" class="close" src="${pageContext.request.contextPath}/resources/img/close.png" onclick="cancle('${vo.id}');"> 
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br>&nbsp&nbsp&nbsp&nbsp&nbsp
							<input type="button" value="수정" onclick="modify();">
							<input type="button" value="삭제" onclick="del();">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br><br>
							</div>
							
							<div name="no" class="user2" id="user2_${vo.id}" style="background:url(${pageContext.request.contextPath}/resources/img/text.png); background-size:320px 110px;
								 background-position:center; background-repeat: no-repeat; font-size:12px; position: absolute; left:640px; text-align:center; display:none;"><br>
							&nbsp&nbsp&nbsp스포일러 및 욕설/비방하는
							<input width="15" height="15" type="image" name="button" class="close" src="${pageContext.request.contextPath}/resources/img/close.png" onclick="cancle('${vo.id}');">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp내용이 있습니까?
							&nbsp<a href="#">신고</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br><br>
							</div>
						</td>
					</tr>
				
					<tr>
					
					
						<td width="80" align="center">${vo.id }</td>
						<td width="2" class="td_b">
							<img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif">
						</td>
						<td width="120" align="center">${vo.m_name }</td>
						<td width="2" class="td_b">
							<img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif">
						</td>

						<td width="40" class="td_b" align="center">${vo.scope }</td>

						<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>

						<td class="td_b" align="center"><pre>${vo.content }</pre></td>
						<td width="2" class="td_b"><img src="${pageContext.request.contextPath}/resources/img/td_bg_01.gif"></td>
						
						<td width="80" class="td_b" align="center">
							<input width="15" height="15" type="image" name="button" src="${pageContext.request.contextPath}/resources/img/dot.png" onclick="dotcheck('${vo.id}');">     
							<br>
						</td>
					</tr>

					<tr>
						<td colspan="11" align="right">${vo.regdate}</td>
					</tr>
					
					<tr></tr>
					<tr></tr>

			</c:forEach>
			
			<tr>
				<td colspan="11" align="center">${ pageMenu }</td>
			</tr>
			
			</table>
			</div>
		</div>
		
	</div>
	
</body>
</html>