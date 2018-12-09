<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
<script>
	function start() {
		var msg = '${msg}';
		var url = '${url}';
		alert(msg);
		location.href = "product.jsp";
	}
</script>
</head>
<body onload="start()">

</body>
</html>