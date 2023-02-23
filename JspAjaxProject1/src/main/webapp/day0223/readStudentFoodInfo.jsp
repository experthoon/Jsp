<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <h2> Student(json)_db읽어오기</h2>
    <button type="button" class="btn btn-success" id="btn1">studentTojson</button>
  	<h2> food(xml)_db읽어오기</h2>
  	<button type="button" class="btn btn-success" id="btn2">foodToxml</button>
  
   
   <div id="show"></div>
   
   <script type="text/javascript">
     $("#btn2").click(function() {
     	
    	 $.ajax({
    		 type: "get",
    		 url:"foodToXml.jsp",
    		 dataType:"xml",
    		 success:function(res){
    			
    			 var s="";
    			 $(res).find("food").each(function(i,ele){
    				 
    				 var n=$(ele);
    				 
    				 s+="<div class='alert alert-info' style='width:400px;'>";
    				 s+="No: "+n.attr("num")+","+"<br>";
    				 s+="음식이름: "+n.find("foodname").text()+"<br>";
    				 s+="음식사진: <img src='"+n.find("foodphoto").text()+"' width='100'>"+"<br>";
    				 s+="가격: "+n.find("price").text()+"<br>";
    				 s+="수량: "+n.find("cnt").text()+"<br>";
    				 s+="</div>";
    			 });
    			 
    			 $("#show").html(s);
    		 }
    	 })
     });
     
     $("#btn1").click(function() {
      	
    	 $.ajax({
    		type:"get",
    		url:"studentToJson.jsp",
    		dataType:"json",
    		success:function(res){
    			
    			var s="";
    			
    			$.each(res,function(i,item){
    				s+="<div class='alert alert-warning' style='width:300px;'>";
    				s+="index: "+i+"<br>";
    				s+="num :"+item.num+"<br>";
    				s+="이름: "+item.stuname+"<br>";
    				s+="<img src='"+item.stuphoto+"' width='100'>";
    				s+="java: "+item.java+"<br>";
    				s+="ajax: "+item.ajax+"<br>";
    				s+="</div> <br>";
    				
    			});
    			$("#show").html(s);
    		}
    	 });
     });
   
   </script>
   
   
</body>
</html>