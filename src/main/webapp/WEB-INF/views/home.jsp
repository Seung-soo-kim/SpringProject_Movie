<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	
	<link rel="shortcut icon" type="image/x-icon" href="${ pageContext.request.contextPath }/resources/img/icon.jpg"/>
	<title>Cinema</title>	
	<style type="text/css">
	* { magin:0; padding:0; }
 #moviewrap{width:100%; height:100%; position:relative; }
 
 /* background img */
.main_bg{ width:100%; height:300px; z-index:-1000; position:absolute; }
.main_bg > img{ width:100%; height:300px; background-repeat: no-repeat; }

.m_list_bg{ width:100%; height:630px; z-index:-1000; position:absolute; }
.m_list_bg > img{ width:100%; height:100%; background-repeat: no-repeat; }

.f_bg{ width:100%; height:200px; z-index:-1000; position:absolute; }
.f_bg > img{ width:100%; height:100%; background-repeat: no-repeat; }


/* header */
#header{ width:100%; height:300px; position:absolute; }

#header .gnb{ width:80%; height:40px; position:relative; margin:0 auto; }
#header .gnb ul{ width:200px; float:right; list-style:none; }
#header .gnb ul li{ float:right; margin-right:10px; }
#header .gnb ul > li > a{ text-decoration:none; color:white; letter-spacing:2px; font-size:13px; }

#header .nav{ width:80%; height:240px; position:relative; margin:10px auto; }
#header .nav #nav_left{ width:180px; height:180px; position:absolute; margin:30px 4%; }
#header .nav #nav_left > img{ width:180px; height:180px; }
#header .nav #nav_right{ width:180px; height:180px; position:absolute; margin-left:82%; margin-top:40px; }
#header .nav #nav_right > img{ width:220px; height:160px; }
#header .nav > h2{ width:50%; height:70px; position:absolute; margin:30px 25%; }
#header .nav > h2 > img{ width:100%; height:70px; }

#header .nav ul{ width:60%; height:60px; list-style:none; position:absolute; margin-top:120px; margin-left:20%; }
#header .nav ul > li{ float:left; width:25%; height:50px; text-align:center; line-height:80px; }
#header .nav ul > li > a{ text-decoration:none; color:white; font-size:18px; font-weight:400px; letter-spacing:2px; text-shadow: 5px 5px 5px white, 0 0 120px purple, 0 0 5px maroon; }
#header .nav ul > li > a:visited { text-decoration: none; }


/* contents 1 */
#movie_list{ width:100%; height:630px; position:absolute; margin-top:300px; }
#movie_list .main_movie_list{ width:80%; height:100%; position:relative; margin:-10px auto; }

#movie_list .main_movie_list > p{ width:100%; height:50px; background:rgb(119, 119, 119, 0.3); color:white; border-radius:20px; text-align:center; font-size:20px; font-weight:bold; line-height:50px; }

#movie_list .main_movie_list ul{ list-style:none; width:95%; height:450px; margin:0 auto; }
#movie_list .main_movie_list ul > li{ width:20%; height:400px; float:left; margin-top:25px; margin-left:4%;}
#movie_list .main_movie_list ul > li > img{ width:100%; height:100%; }
#movie_list .main_movie_list ul > li .case{ width:65%; height:12%; display:block; float:right; margin-top:12px; background:rgb(3, 123, 148, 0.8); text-align:center; border-radius:20px;}
#movie_list .main_movie_list ul > li .case > a{ text-decoration: none; line-height:50px; color:white; }
#movie_list .main_movie_list ul > li .like{ width:30%; height:12%; background:rgb(121, 121, 121, 0.8); border-radius:20px; margin-top:12px; text-align:center; }
#movie_list .main_movie_list ul > li .like > a{ text-decoration: none; line-height:48px; color:white; }

#movie_list .main_movie_list ul li .h_info{ position:relative; width:100%; height:100%; background:rgb(37, 37, 37, 0.7); margin-top:-400px; display:none; }
#movie_list .main_movie_list ul li .h_info p{ width:95%; height:95%; position:absolute; margin-left:2.5%; margin-top:5%; overflow:hidden; font-size:12px; font-weight:400; word-spacing:3px; line-height:1.8; color:white; }
#movie_list .main_movie_list ul li:hover .h_info{ display:block; }



/* contents 2 */
#contents{ width:100%; height:1840px; position:absolute; margin-top:930px; background:radial-gradient(#DDDDDD, gray, #313131);}

#contents .main_teaser{ width:80%; height:650px; position:relative; margin:70px auto; }
#contents .main_teaser > p{ width:100%; height:50px; background:rgb(119, 119, 119, 0.3); color:white; border-radius:20px; text-align:center; font-size:20px; font-weight:bold; line-height:50px; }
#contents .main_teaser .poster{ width:22%; height:500px; margin-top:20px; position:absolute; }
#contents .main_teaser .poster > img{ width:100%; height:100%; position:absolute; }

#contents .main_teaser .t_video{ width:50%; height:500px; margin-left:25%; margin-top:40px; }
#contents .main_teaser .t_info{ width:20%; height:420px; margin-left:77%; position:absolute; margin-top:-30%; }
#contents .main_teaser .t_info .tit{ width:100%; height:70px; font-size:25px; font-weight:bold; line-height:50px; border-bottom: 3px solid rgba(192, 192, 192, 0.3); color:white; }
#contents .main_teaser .t_info .txt{ width:100%; height:320px; margin-top:20px; font-size:15px; font-weight:400; word-spacing:3px; line-height:1.8; color:white; }

#contents .main_editor{ width:80%; height:1100px; position:relative; margin:-50px auto; }
#contents .main_editor > p{ width:100%; height:50px; background:rgb(119, 119, 119, 0.3); color:white; border-radius:20px; text-align:center; font-size:20px; font-weight:bold; line-height:50px; }

#contents .main_editor ul{ width:100%; height:100%; position:absolute; list-style:none; }
#contents .main_editor ul li{ float:left; }



/* 민형pick */
#contents .main_editor ul li:nth-child(1) .pick_img{ width:300px; height:450px; margin-left:50px; border-radius:80px; position:relative; }
#contents .main_editor ul li:nth-child(1) .pick_img > img{ width:300px; height:450px; position:absolute; border-radius:80px; }
#contents .main_editor ul li:nth-child(1) .pick_who{ width:300px; height:450px; margin-left:50px; border-radius:80px; position:absolute; background:rgb(119, 119, 119, 0.5); z-index:5; }
#contents .main_editor ul li:nth-child(1) .pick_who > p{ width:200px; height:200px; margin:120px auto; text-align:center; font-size:25px; line-height:7; color:white; }
#contents .main_editor ul li:nth-child(1) .pick_info{ display:none; width:300px; height:450px; position:absolute; z-index:6; margin-left:50px; margin-top:-450px; border-radius:80px; }
#contents .main_editor ul li:nth-child(1) .pick_info > span{ display:none; width:80%; height:30px; position:absolute; margin-top:60px; margin-left:30px; line-height:2; font-weight:bold; font-size:18px; color:white; }
#contents .main_editor ul li:nth-child(1) .pick_info > p{ display:none; width:80%; height:300px; position:absolute; margin-top:110px; margin-left:30px; color:white; overflow:hidden; word-spacing:3px; font-size:13px; }

#contents .main_editor ul li:nth-child(1):hover .pick_who > p{ display:none; }
#contents .main_editor ul li:nth-child(1):hover .pick_info { display:block; }
#contents .main_editor ul li:nth-child(1):hover .pick_info > span{ display:block; }
#contents .main_editor ul li:nth-child(1):hover .pick_info > p{ display:block; }

/* 성수pick */
#contents .main_editor ul li:nth-child(2){ width:300px; height:450px; position:relative; margin-left:250px; border-radius:80px; }
#contents .main_editor ul li:nth-child(2) .pick_img > img{ width:300px; height:450px; position:absolute; border-radius:80px; }
#contents .main_editor ul li:nth-child(2) .pick_who{ width:300px; height:450px; position:absolute; border-radius:80px; background:rgb(119, 119, 119, 0.5); z-index:5; }
#contents .main_editor ul li:nth-child(2) .pick_who > p{ width:200px; height:200px; margin:120px auto; text-align:center; font-size:25px; line-height:7; color:white; }
#contents .main_editor ul li:nth-child(2) .pick_info{ display:none; width:300px; height:450px; position:absolute; z-index:6; border-radius:80px; }
#contents .main_editor ul li:nth-child(2) .pick_info > span{ display:none; width:80%; height:30px; position:absolute; margin-top:60px; margin-left:30px; line-height:2; font-weight:bold; font-size:18px; color:white; }
#contents .main_editor ul li:nth-child(2) .pick_info > p{ display:none; width:80%; height:300px; position:absolute; margin-top:110px; margin-left:30px; color:white; overflow:hidden; word-spacing:3px; font-size:13px; }

#contents .main_editor ul li:nth-child(2):hover .pick_who > p{ display:none; }
#contents .main_editor ul li:nth-child(2):hover .pick_info { display:block; }
#contents .main_editor ul li:nth-child(2):hover .pick_info > span{ display:block; }
#contents .main_editor ul li:nth-child(2):hover .pick_info > p{ display:block; }

/* 우성pick */
#contents .main_editor ul li:nth-child(3){ width:300px; height:450px; position:relative; margin-left:250px; border-radius:80px; }
#contents .main_editor ul li:nth-child(3) .pick_img > img{ width:300px; height:450px; position:absolute; border-radius:80px; }
#contents .main_editor ul li:nth-child(3) .pick_who{ width:300px; height:450px; position:absolute; border-radius:80px; background:rgb(119, 119, 119, 0.5); z-index:5; }
#contents .main_editor ul li:nth-child(3) .pick_who > p{ width:200px; height:200px; margin:120px auto; text-align:center; font-size:25px; line-height:7; color:white; }
#contents .main_editor ul li:nth-child(3) .pick_info{ display:none; width:300px; height:450px; position:absolute; border-radius:80px; z-index:6; }
#contents .main_editor ul li:nth-child(3) .pick_info > span{ display:none; width:80%; height:30px; position:absolute; margin-top:60px; margin-left:30px; line-height:2; font-weight:bold; font-size:18px; color:white; letter-spacing:-2;}
#contents .main_editor ul li:nth-child(3) .pick_info > p{ display:none; width:80%; height:300px; position:absolute; margin-top:110px; margin-left:30px; color:white; overflow:hidden; word-spacing:3px; font-size:13px; }

#contents .main_editor ul li:nth-child(3):hover .pick_who > p{ display:none; }
#contents .main_editor ul li:nth-child(3):hover .pick_info { display:block; }
#contents .main_editor ul li:nth-child(3):hover .pick_info > span{ display:block; }
#contents .main_editor ul li:nth-child(3):hover .pick_info > p{ display:block; }

/* 선영pick */
#contents .main_editor ul li:nth-child(4){ width:300px; height:450px; margin-left:50px; margin-top:50px; border-radius:80px; position:relative; }
#contents .main_editor ul li:nth-child(4) .pick_img > img{ width:300px; height:450px; position:absolute; border-radius:80px; }
#contents .main_editor ul li:nth-child(4) .pick_who{ width:300px; height:450px; position:absolute; z-index:5; border-radius:80px; background:rgb(119, 119, 119, 0.5); z-index:5; }
#contents .main_editor ul li:nth-child(4) .pick_who > p{ width:200px; height:200px; margin:120px auto; text-align:center; font-size:25px; line-height:7; color:white; }
#contents .main_editor ul li:nth-child(4) .pick_info{ display:none; width:300px; height:450px; position:absolute; border-radius:80px; z-index:6; }
#contents .main_editor ul li:nth-child(4) .pick_info > span{ display:none; width:80%; height:30px; position:absolute; margin-top:60px; margin-left:30px; line-height:2; font-weight:bold; font-size:18px; color:white; }
#contents .main_editor ul li:nth-child(4) .pick_info > p{ display:none; width:80%; height:300px; position:absolute; margin-top:110px; margin-left:30px; color:white; overflow:hidden; word-spacing:3px; font-size:13px; }

#contents .main_editor ul li:nth-child(4):hover .pick_who > p{ display:none; }
#contents .main_editor ul li:nth-child(4):hover .pick_info { display:block; }
#contents .main_editor ul li:nth-child(4):hover .pick_info > span{ display:block; }
#contents .main_editor ul li:nth-child(4):hover .pick_info > p{ display:block; }

/* 원경pick */
#contents .main_editor ul li:nth-child(5){ width:300px; height:450px; border-radius:80px; position:relative; margin-left:250px; margin-top:50px;}
#contents .main_editor ul li:nth-child(5) .pick_img > img{ width:300px; height:450px; position:absolute; border-radius:80px; }
#contents .main_editor ul li:nth-child(5) .pick_who{ width:300px; height:450px; border-radius:80px; position:absolute; background:rgb(119, 119, 119, 0.5); z-index:5; }
#contents .main_editor ul li:nth-child(5) .pick_who > p{ width:200px; height:200px; margin:120px auto; text-align:center; font-size:25px; line-height:7; color:white; }
#contents .main_editor ul li:nth-child(5) .pick_info{ display:none; width:300px; height:450px; position:absolute; border-radius:80px; z-index:6; }
#contents .main_editor ul li:nth-child(5) .pick_info > span{ display:none; width:80%; height:30px; position:absolute; margin-top:60px; margin-left:30px; line-height:2; font-weight:bold; font-size:18px; color:white; }
#contents .main_editor ul li:nth-child(5) .pick_info > p{ display:none; width:80%; height:300px; position:absolute; margin-top:110px; margin-left:30px; color:white; overflow:hidden; word-spacing:3px; font-size:13px; }

#contents .main_editor ul li:nth-child(5):hover .pick_who > p{ display:none; }
#contents .main_editor ul li:nth-child(5):hover .pick_info { display:block; }
#contents .main_editor ul li:nth-child(5):hover .pick_info > span{ display:block; }
#contents .main_editor ul li:nth-child(5):hover .pick_info > p{ display:block; }

/* 유진pick */
#contents .main_editor ul li:nth-child(6){ width:300px; height:450px; position:relative; margin-left:250px; margin-top:50px; border-radius:80px; }
#contents .main_editor ul li:nth-child(6) .pick_img > img{ width:300px; height:450px; position:absolute; border-radius:80px; }
#contents .main_editor ul li:nth-child(6) .pick_who{ width:300px; height:450px; border-radius:80px; position:absolute; background:rgb(119, 119, 119, 0.5); z-index:5; }
#contents .main_editor ul li:nth-child(6) .pick_who > p{ width:200px; height:200px; margin:120px auto; text-align:center; font-size:25px; line-height:7; color:white; }
#contents .main_editor ul li:nth-child(6) .pick_info{ display:none; width:300px; height:450px; border-radius:80px; position:absolute; z-index:6; }
#contents .main_editor ul li:nth-child(6) .pick_info > span{ display:none; width:80%; height:30px; position:absolute; margin-top:60px; margin-left:30px; line-height:2; font-size:18px; font-weight:bold; color:white; }
#contents .main_editor ul li:nth-child(6) .pick_info > p{ display:none; width:80%; height:300px; position:absolute; margin-top:110px; margin-left:30px; color:white; overflow:hidden; word-spacing:3px; font-size:13px; }

#contents .main_editor ul li:nth-child(6):hover .pick_who > p{ display:none; }
#contents .main_editor ul li:nth-child(6):hover .pick_info { display:block; }
#contents .main_editor ul li:nth-child(6):hover .pick_info > span{ display:block; }
#contents .main_editor ul li:nth-child(6):hover .pick_info > p{ display:block; }




/* footer */
#footer{ width:100%; height:200px; position:absolute; margin-top:2770px; }
#footer .f_logo{ width:150px; height:150px; position:absolute; margin-top:-3px; }
#footer .f_logo > img{ width:150px; height:150px; }

#footer .f_txt{ width:50%; height:150px; position:relative; margin:25px auto; }
#footer address{ width:100%; height:30px; position:absolute; margin:30px auto; text-align:center; color:white; }
#footer .team1{ width:100%; height:30px; position:absolute; margin:60px auto; text-align:center; color:white; }
#footer .team2{ width:100%; height:30px; position:absolute; margin:90px auto; text-align:center; color:white; }
	</style>
</head>
<body>
	
	<div id="moviewrap">
		<!-- header -->
		<div id="header">
			<div class="main_bg"><img src="${ pageContext.request.contextPath }/resources/img/main_bg.png"></div>
			<div class="gnb">
				<ul>
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</div>
			<div class="nav">
				<h1 id="nav_left"><img src="${ pageContext.request.contextPath }/resources/img/logo_test.png"></h1>
				<h2><img src="${ pageContext.request.contextPath }/resources/img/nav_logo.png"></h2>
				<ul>
					<li><a href="#">영화</a></li>
					<li><a href="ticketing.do">예매</a></li>
					<li><a href="#">영화관</a></li>
					<li><a href="review.do">커뮤니티</a></li>				
				</ul>
				<h1 id="nav_right"><img src="${ pageContext.request.contextPath }/resources/img/logo_test2.png"></h1>
			</div>
		</div>
		<!-- header 끝 -->
		
		<!-- contents 1 -->
		<div id="movie_list">
			<div class="m_list_bg"><img src="${ pageContext.request.contextPath }/resources/img/m_list_bg.png"></div>
			<div class="main_movie_list">
				<p>상영 영화 안내</p>
				<ul>
					<li>
						<img src="${ pageContext.request.contextPath }/resources/img/main_poster1.jpg">
						<div class="h_info">
							<a href="#"><p>
								불가능한 꿈, 그 이상의 쇼!<br>
								<br>
								쇼 비즈니스의 창시자이자, 꿈의 무대로 전세계를 매료시킨 남자 ‘바넘’의 이야기에서 영감을 받아 탄생한 오리지널 뮤지컬 영화 <위대한 쇼맨>. 
								<레미제라블> 이후 다시 뮤지컬 영화로 돌아온 휴 잭맨부터 잭 에프론, 미셸 윌리엄스, 레베카 퍼거슨, 젠다야까지 할리우드 최고의 배우들이 합류해 환상적인 앙상블을 선보인다.
								여기에 <미녀와 야수> 제작진과 <라라랜드> 작사팀의 합류로 더욱 풍성해진 비주얼과 스토리, 음악까지 선보일 <위대한 쇼맨>은 ‘우리는 누구나 특별하다’는 메시지로 관객들에게 재미는 물론, 감동까지 선사할 것이다.<br>
								THIS IS ME! 우리는 누구나 특별하다!
							</p></a>
						</div>
						<div class="case"><a href="#">예 매</a></div>
						<div class="like"><a href="#">Like</a></div>
					</li>
					<li>
						<img src="${ pageContext.request.contextPath }/resources/img/main_poster2.jpg">
						<div class="h_info">
							<a href="#"><p>
								1분 1초 설레며, 24시간 사랑했던
								내 인생 가장 찬란했던 순간으로 돌아갈 수 있다면?
								<br>
								<br>
								행복했던 그때 그 모든 것이 그리워진 ‘빅토르’는
								100% 고객 맞춤형 핸드메이드 시간여행의 설계자 ‘앙투안’의 초대로
								하룻밤의 시간여행을 떠난다.
								그의 눈 앞에 마법처럼 펼쳐진 ‘카페 벨에포크’에서
								‘빅토르’는 꿈에 그리던 첫사랑과 재회하게 되는데...
							</p></a>
						</div>
						<div class="case"><a href="#">예 매</a></div>
						<div class="like"><a href="#">Like</a></div>
					</li>
					<li>
						<img src="${ pageContext.request.contextPath }/resources/img/main_poster3.jpg">
						<div class="h_info">
							<a href="#"><p>
								404일의 감금, 나가야 할 문은 15개!<br>
								성공률 0%의 탈옥이 시작된다!<br>
								<br>
								인권운동가 ‘팀’과 ‘스티븐’은 억울한 판결로 투옥된다.
								둘은 불의에 굴복하지 않고 탈출을 결심한다.
								나가기 위해 열어야 할 강철 문은 15개!
								그들은 나뭇조각으로 열쇠를 만들기 시작하고,
								지금껏 아무도 성공한 적 없는 0%의 확률 속에서
								목숨을 건 단 한 번의 기회를 노리는데…
							</p></a>
						</div>
						<div class="case"><a href="#">예 매</a></div>
						<div class="like"><a href="#">Like</a></div>
					</li>
					<li>
						<img src="${ pageContext.request.contextPath }/resources/img/main_poster4.jpg">
						<div class="h_info">
							<a href="#"><p>
								“왕관을 거부한 유쾌한 반란”<br>
								<br>
								우리는 예쁘지도 추하지도 않다! 우리는 화가 났을 뿐!
								여자라는 이유만으로 학계에서 무시당하지만
								실력으로 이기겠다는 여성 운동가이자 역사가 ‘샐리’(키이라 나이틀리)
								성적 대상화의 주범 미스월드에
								한 방 먹일 작전을 짠 페미니스트 예술가 ‘조’(제시 버클리)
								역사상 최초의 미스 그레나다로서
								흑인 아이들에게 희망을 전하고 싶은 ‘제니퍼’(구구 바샤-로)
								1970년, 달 착륙과 월드컵 결승보다 더 많은 1억 명이 지켜본 ‘미스월드’
								성적 대상화를 국민 스포츠로 만든 미스월드에 맞서
								자신의 스타일대로 진정한 자유를 외친 여성들의 유쾌한 반란이 시작된다!
							</p></a>
						</div>
						<div class="case"><a href="#">예 매</a></div>
						<div class="like"><a href="#">Like</a></div>
					</li>
				</ul>			
			</div>		
		</div>
		
		<!-- contents 2 -->
		<div id="contents">
			<div class="main_teaser">
				<p>Recommend</p>
				<div class="poster"><img src="${ pageContext.request.contextPath }/resources/img/main_movie_poster.jpg"></div>
				<div class="t_video">
					<iframe width="750" height="500" src="https://www.youtube.com/embed/iAKApms7jJk" 
						frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
					</iframe>
				</div>
				<div class="t_info">
					<p class="tit">톰보이</p>
					<p class="txt">
						새로 이사 온 아이, ‘미카엘’.				
						파란색을 좋아하고, 끝내주는 축구 실력과 유난히 잘 어울리는 짧은 머리로
						친구들을 사로잡는 그의 진짜 이름은 ‘로레’!
						눈물겹게 아름답고, 눈부시게 다정했던
						10살 여름의 비밀 이야기가 시작된다!
					 </p>
				</div>
			</div>
			
			<div class="main_editor">
				<p>Event</p>
				<ul>
					<li>
						<div class="pick_who">
							<p>민형's pick!</p>
						</div>
						<div class="pick_img">
							<img src="${ pageContext.request.contextPath }/resources/img/editor_pick_1.jpg">
						</div>
						<div class="pick_info">
							<span>#겨울왕국</span>
							<p>
								얼어붙은 세상을 녹일 자매가 온다!
								서로가 최고의 친구였던 자매 ‘엘사’와 ‘안나’. 
								하지만 언니 ‘엘사’에게는 하나뿐인 동생에게조차 말 못할 비밀이 있다. 
								모든 것을 얼려버리는 신비로운 힘이 바로 그것. 
								‘엘사’는 통제할 수 없는 자신의 힘이 두려워 왕국을 떠나고, 
								얼어버린 왕국의 저주를 풀기 위해 ‘안나’는 언니를 찾아 환상적인 여정을 떠나는데……
								</p>
						</div>
					</li>
					<li>
						<div class="pick_who">
							<p>성수's pick!</p>
						</div>						
						<div class="pick_img">
							<img src="${ pageContext.request.contextPath }/resources/img/editor_pick_2.jpg">
						</div>						
						<div class="pick_info">
							<span>#존 윅</span>
							<p>
								그를 건드리지 말았어야 했다
								상대를 잘못 고른 적들을 향한 통쾌한 복수!
								전설이라 불리던 킬러 ‘존 윅’(키아누 리브스)은 사랑하는 여인을 만나 결혼을 하면서 범죄의 세계에서 은퇴한다. 행복도 잠시, 투병 끝에 부인이 세상을 떠나고 그의 앞으로 부인이 죽기 전에 보낸 강아지 한 마리가 선물로 배달된다. 그러던 어느 날, 그의 집에 괴한들이 들이닥치는데…
								더 이상 잃을 것이 없다. 오직 너희만 죽인다!
								건드리지 말아야 할 그의 분노를 잘못 깨웠다.
								받은 것보다 더 돌려주는 통쾌한 복수, 존 윅의 거침없는 복수가 마침내 폭발한다!
							</p>
						</div>
					</li>
					<li>
						<div class="pick_who">
							<p>우성's pick!</p>
						</div>						
						<div class="pick_img">
							<img src="${ pageContext.request.contextPath }/resources/img/editor_pick_3.jpg">
						</div>
						<div class="pick_info">
							<span>#나는 내일, 어제의 너와 만난다.</span>
							<p>
								내일, 만날 수 있을까?
								어제의 너를-
								스무 살의 ‘타카토시’는 지하철에서 우연히 만난
								‘에미’를 보고 순식간에 마음을 빼앗긴다.
								운명 같은 끌림을 느낀 타카토시의 고백으로
								두 사람은 연인이 되고, 매일 만나 행복한 데이트를 한다.
								 
								하지만, 왠지 종종 의미를 알 수 없는 눈물을 보이던 에미로부터
								믿을 수 없는 비밀을 듣게 된 타카토시는 큰 혼란에 빠진다.
								 
								그 비밀은 바로 타카토시와 에미의 시간은 서로 반대로 흐르고 있고,
								교차되는 시간 속에서 함께 할 수 있는 시간은 오직 30일뿐이라는 것.
								 
								30일 후에도, 이 사랑은 계속될 수 있을까?
							</p>
						</div>
					</li>
					<li>
						<div class="pick_who">
							<p>선영's pick!</p>
						</div>						
						<div class="pick_img">
							<img src="${ pageContext.request.contextPath }/resources/img/editor_pick.jpg">
						</div>						
						<div class="pick_info">
							<span>#닥터스트레인지</span>
							<p>
								마블 히어로의 새로운 시작!
								모든 것을 초월한, 역사상 가장 강력한 히어로가 온다!
								불의의 사고로 절망에 빠진 천재 외과의사 ‘닥터 스트레인지(베네딕트 컴버배치)’.
								마지막 희망을 걸고 찾아 간 곳에서 ‘에인션트 원(틸다 스윈튼)’을 만나 세상을 구원할 강력한 능력을 얻게 되면서,
								모든 것을 초월한 최강의 히어로로 거듭나는데...
							 </p>
						</div>
					</li>
					<li>
						<div class="pick_who">
							<p>원경's pick!</p>
						</div>						
						<div class="pick_img">
							<img src="${ pageContext.request.contextPath }/resources/img/editor_pick_4.jpg">
						</div>						
						<div class="pick_info">
							<span>#인피니티 워</span>
							<p>
								새로운 조합을 이룬 어벤져스,
								역대 최강 빌런 타노스에 맞서 세계의 운명이 걸린
								인피니티 스톤을 향한 무한 대결이 펼쳐진다!
								 
								마블의 클라이맥스를 목격하라!
							</p>
						</div>
					</li>
					<li>
						<div class="pick_who">
							<p>유진's pick!</p>
						</div>						
						<div class="pick_img">
							<img src="${ pageContext.request.contextPath }/resources/img/editor_pick_6.gif">
						</div>						
						<div class="pick_info">
							<span>#인셉션</span>
							<p>
								타인의 꿈에 들어가 생각을 훔치는 특수 보안요원 코브.
								그를 이용해 라이벌 기업의 정보를 빼내고자 하는 사이토는
								코브에게 생각을 훔치는 것이 아닌, 생각을 심는 ‘인셉션’ 작전을 제안한다.
								성공 조건으로 국제적인 수배자가 되어있는 코브의 신분을 바꿔주겠다는
								거부할 수 없는 제안을 하고, 사랑하는 아이들에게 돌아가기 위해 그 제안을 받아들인다.
								최강의 팀을 구성, 표적인 피셔에게 접근해서 ‘인셉션’ 작전을 실행하지만
								예기치 못한 사건들과 마주하게 되는데…
								꿈 VS 현실
								시간, 규칙, 타이밍 모든 것이 완벽해야만 하는,
								단 한 번도 성공한 적 없는 ‘인셉션’ 작전이 시작된다!
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- contents 끝 -->

		<!-- footer -->
		<div id="footer">
			<div class="f_bg"><img src="${ pageContext.request.contextPath }/resources/img/footer_bg.png"></div>
			<div class="f_txt">
				<p class="f_logo"><img src="${ pageContext.request.contextPath }/resources/img/logo_test.png"></p>
				<address>서울특별시 마포구 서강로 136 아이비티워 2층,3층</address>
				<p class="team1">2조 Spring Project Movie</p>
				<p class="team2">민형, 성수, 우성, 선영, 원경, 유진</p>
			</div>
		</div>
		<!-- footer 끝 -->
	</div>	
	
</body>
</html>
