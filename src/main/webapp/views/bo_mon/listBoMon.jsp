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
<h3 class="text-center">Quản lí bộ môn/chuyên ngành</h3>
<a href="add"><button class="btn btn-success my-3">Thêm chuyên ngành</button></a>
<a href="/nhan-vien/hien-thi" class="mx-3"><button class="btn btn-secondary my-3">Quay lại</button></a>
<div class="my-3">
    <h3 class="text-left">Thông tin nhân viên</h3>
    <div class="d-flex">
        <div class="mx-3">
            <label class="form-label d-flex">Mã nhân viên</label>
            <input type="text" name="ma" class="form-control" value="${data.ma}" readonly>
        </div>
        <div class="mx-3">
            <label class="form-label d-flex">Tên nhân viên</label>
            <input type="text" name="ten" class="form-control" value="${data.ten}" readonly>
        </div>
        <div class="mx-3">
            <label class="form-label d-flex">Email FE</label>
            <input type="text" name="accountFE" class="form-control" value="${data.accountFE}" readonly>
        </div>
        <div class="mx-3">
            <label class="form-label d-flex">Email FPT</label>
            <input type="text" name="accountFPT" class="form-control" value="${data.accountFPT}" readonly>
        </div>
    </div>
</div>
<div>
    <h3 class="text-left">Danh sách bộ môn, chuyên ngành theo cơ sở</h3>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Stt</th>
            <th>Cơ sở</th>
            <th>Bộ môn</th>
            <th>Chuyên ngành</th>
            <th>Tương tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="nv" varStatus="index">
            <tr>
                <td>${index.count}</td>
                <td>${nv.ma}</td>
                <td>${nv.ten}</td>
                <td>${nv.accountFE}</td>
                <td>
                    <a href="${nv.id}"><i class="bi bi-trash3"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>