<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
   function send( id ) {
      var input = document.getElementById(id);
      console.log(id);
      //input.classList="clicked";
   }

</script>
</head>
<body>
<div>
   <div>
   <table>
      <c:forEach var="i" items="어른 , 청소년,어린이">
         <tr>
            <td >${i }</td>
            <c:forEach var="j" begin="0" end="2" step="1">
               <td><input type="button" value="${j}" name="${j}"></td> 
            </c:forEach>
         </tr>
      </c:forEach>
   </table>
   </div>
   <div>
      ${parm.m_name } ${param.city} ${param.district} ${param.date}
   </div>
</div>

<hr>
   <h1 align="center">::SCREEN::</h1>
<hr>
   

<div >
   <c:forEach var="i" items="A,B,C,D,E,F,G">
      <div>
            
         <c:forEach var="j" begin="1" end="7" step="1">
               <input name="${i}${j}" type="button" id="${i}${j}"
               value="${i}${j}" class="seat" onclick="send(${i}${j});">
            
         </c:forEach>
      </div>
   </c:forEach>
</div>
   
   
</body>
</html>