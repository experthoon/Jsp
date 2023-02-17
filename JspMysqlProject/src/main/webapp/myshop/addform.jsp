<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form action = "addaction.jsp" method = "post">
	<table class = "table table-bordered" style = "width: 400px;">
		<caption><b>상품등록</b></caption>
		<tr>
			<th width="100" bgcolor="#ccf">상품명</th>
				<td>
					<input type = "text" name = "sangpum" required="required" class = "form-control">
				</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#ccf">상품사진</th>
				<td>
				<div>
					<select name = "photo" id="photo" class="form-select" style="width:150px;">
						<option value="11">단화</option>
						<option value="25">원피스</option>
						<option value="24">바지</option>
						<option value="30">헤어스카프</option>
						<option value="29">모자</option>
						<option value="32">정장</option>
					</select>
					<img alt = "" src = "" width="30" height = "30" id = "myphoto">
				</div>
				<script type = "text/javascript">
					$("#photo").change(function(){
						var s =  "../쇼핑몰사진/" + $(this).val()+".jpg";
						$("#myphoto").attr("src",s);
					});
				</script>
				
				</td>
		</tr>
		
		<tr>
			<th width="100" bgcolor="#ccf">상품가격</th>
			<td>
				<input type = "text" name = "price" required = "required" class = "form-control">
			</td>
		</tr>
		
		<tr>
			<th width = "100" bgcolor = "#ffc">입고일</th>
				<td>
					<input type = "date" name = "ipgoday" value = "2023-02-10" class = "form-control">
				</td>
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<button type = "submit" class = "btn btn-info">상품저장</button>
				<button type = "button" class = "btn btn-success" onclick = "location.href ='shoplist.jsp'">상품목록</button>
			</td>
		</tr>
	</table>
	
	</form>
</body>
</html>