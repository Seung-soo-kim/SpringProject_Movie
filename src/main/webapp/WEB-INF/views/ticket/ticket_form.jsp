<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .seat {
            width: 30px;
            height: 30px;
        }
        
        .clicked {
            background-color: red;
            color: white;
        }
    </style>
<script type="text/javascript">
window.onload=function(){
	seat();
}
	function seat() {
	 var seatWrapper= document.querySelector(".seat-wrapper");
	 var div = '';
	 var selectedSeats = new Array();
	 var test=[];
	 var selectedSeatsMap=[];
	 for(var i = 0 ; i < 7 ; i++){
		 div = document.createElement("div");
		 seatWrapper.append(div);
		 for(var j = 0 ; j < 7 ; j++){
			 var input = document.createElement("input");
			 input.type="button";
			 input.name="seats";
			 input.classList="seat";
			 mapping(input, i, j);
			 div.append(input);
			 input.addEventListener('click',function( e ) {
				 	console.log(e.target.value);
	                //중복방지 함수
	                selectedSeats = selectedSeats.filter(function(element, index){ 
	                	selectedSeats.indexOf(element) != index;
	                	});
	                //selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

	                //click class가 존재할때(제거해주는 toggle)
	                if (input.classList.contains("clicked")) {
	                    input.classList.remove("clicked");
	                    clicked = document.querySelectorAll(".clicked");
	                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
	                    clicked.forEach(function(data) {
	                        selectedSeats.push(data.value);
	                    });
	                    /* clicked.forEach((data) => {
	                        selectedSeats.push(data.value);
	                    }); */
	                    //click class가 존재하지 않을때 (추가해주는 toggle)
	                } else {
	                    input.classList.add("clicked");
	                    clicked = document.querySelectorAll(".clicked");
	                    clicked.forEach(function(data) {
	                        selectedSeats.push(data.value);
	                    });
	                }
	                console.log(selectedSeats);
				 
			 })
		 }//for_in
	  }//for-out
	}

function mapping(input, i, j) {
    if (i === 0) {
        input.value = "A" + j;
    } else if (i === 1) {
        input.value = "B" + j;
    } else if (i === 2) {
        input.value = "C" + j;
    } else if (i === 3) {
        input.value = "D" + j;
    } else if (i === 4) {
        input.value = "E" + j;
    } else if (i === 5) {
        input.value = "F" + j;
    } else if (i === 6) {
        input.value = "G" + j;
    }
}
 
</script>
</head>
<body>
 <div class="seat-wrapper"></div>

</body>
</html>