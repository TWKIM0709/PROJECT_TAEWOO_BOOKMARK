<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<title>결제 성공</title>
</head>
<body>
	
</body>

<script type="text/javascript">
Swal.fire(
        '결제가 완료되었습니다',
        '빠른 시일 내에 만나요!',
        'success'
        ).then(function(){
            location.href="paymentList.do";        	
        })

</script>
</html>