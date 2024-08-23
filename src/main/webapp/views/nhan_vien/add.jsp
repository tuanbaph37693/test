<%@page language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="f" uri="jakarta.tags.functions" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<h3 class="text-center">Thêm nhân viên</h3>
<a href="hien-thi"><button class="btn btn-secondary my-3">Quay lại</button></a>
<c:if test="${not empty message}">
    <div class="alert ${alertClass}">
            ${message}
    </div>
</c:if>
<form method="post" action="store">
    <div class="my-3">
        <label class="form-label d-flex"><span style="color: red">*</span>Mã nhân viên</label>
        <input type="text" name="ma" class="form-control" value="${data.ma}">
        <c:if test="${not empty errors['ma']}">
            <small style="color: red">${errors['ma']}</small>
        </c:if>
    </div>
    <div class="my-3">
        <label class="form-label d-flex"><span style="color: red">*</span>Tên nhân viên</label>
        <input type="text" name="ten" class="form-control" value="${data.ten}">
        <c:if test="${not empty errors['ten']}">
            <small style="color: red">${errors['ten']}</small>
        </c:if>
    </div>
    <div class="my-3">
        <label class="form-label d-flex"><span style="color: red">*</span>Email FE</label>
        <input type="text" name="accountFE" class="form-control" placeholder="vd: abc@fe.edu.vn" value="${data.accountFE}">
        <c:if test="${not empty errors['accountFE']}">
            <small style="color: red">${errors['accountFE']}</small>
        </c:if>
    </div>
    <div class="my-3">
        <label class="form-label d-flex"><span style="color: red">*</span>Email FPT</label>
        <input type="text" name="accountFPT" class="form-control"placeholder="vd: abc@fpt.edu.vn" value="${data.accountFPT}">
        <c:if test="${not empty errors['accountFPT']}">
            <small style="color: red">${errors['accountFPT']}</small>
        </c:if>
    </div>
    <div>
        <button class="btn btn-success">Add</button>
    </div>
</form>

</body>
</html>