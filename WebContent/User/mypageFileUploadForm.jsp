<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MypageFileUploadForm</title>
</head>
<body>

   <form action="mypageUpdate.jsp" method="post" enctype="multipart/form-data">
   	사진: <input type="file" name="file"><br>
   	<input type="submit" value="전송">
   </form>

</body>
</html>