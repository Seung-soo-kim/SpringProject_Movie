﻿	var total=0;//총인원수
	var a=0;//어른 카운트
	var t=0;//청소년 카운트
	var c=0;//어린이 카운트
	
	
	//어른 카운트 메서드
	function count1(i) {
		//인원 선택시 실행 되는 메서드
		i=i*1;
		if(i==0){
			total-=a;
			a=0;
		}else if(i==1){
			total-=a;
			a=1;
			total+=a;
		}else if(i==2){
			total-=a;
			a=2;
			total+=a;
		}else{
			a = i;
			total+=i;
		}
			//console.log(total);
			document.getElementById("to").innerHTML=total;
			document.getElementById("ad").innerHTML=a;
	}
	
	//청소년 카운트 메서드
	function count2(i) {
		//인원 선택시 실행 되는 메서드
		i=i*1;
		if(i==0){
			total-=t;
			t=0;
		}else if(i==1){
			total-=t;
			t=1;
			total+=t;
		}else if(i==2){
			total-=t;
			t=2;
			total+=t;
		}else{
			t = i;
			total+=i;
		}
			//console.log(total);
			document.getElementById("to").innerHTML=total;
			document.getElementById("te").innerHTML=t;
	}
	
	//어린이 카운트 메서드
	function count3(i) {
		//인원 선택시 실행 되는 메서드
		i=i*1;
		if(i==0){
			total-=c;
			c=0;
		}else if(i==1){
			total-=c;
			c=1;
			total+=c;
		}else if(i==2){
			total-=c;
			c=2;
			total+=c;
		}else{
			c = i;
			total+=i;
		}
			//console.log(total);
			document.getElementById("to").innerHTML=total;
			document.getElementById("ch").innerHTML=c;
	}












