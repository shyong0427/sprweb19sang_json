<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록(ajax로 처리)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		$("#showData").empty();
		
		$.ajax({
			type : "get",
			url : "sangpum",
			dataType : "json",
			success : function(sangpumData) {
				var str = "<table border='1'>";
				str += "<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>";
				
				var list = sangpumData.datas;
				$(list).each(function(index, obj) { // 순서, 데이터
					str += "<tr>";
					str += "<td>" + obj["code"] + "</td>";
					str += "<td>" + obj["sang"] + "</td>";
					str += "<td>" + obj["su"] + "</td>";
					str += "<td>" + obj["dan"] + "</td>";
					str += "</tr>";
				});
				
				str += "</table>";
				
				$("#showData").append(str);
			},
			error : function() {
				$("#showData").html("<b>에러</b> 발생!");
			}
		});
	});
</script>
</head>
<body>
	** 상품자료 (@MVC - Ajax - MyBatis) ** <br>
	<div id="showData"></div>
</body>
</html>