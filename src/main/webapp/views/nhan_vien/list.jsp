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
    <h3 class="text-center">Quản lí nhân viên</h3>
    <a href="add"><button class="btn btn-success my-3">Thêm nhân viên</button></a>
    <c:if test="${not empty message}">
        <div class="alert ${alertClass}">
                ${message}
        </div>
    </c:if>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Stt</th>
                <th>Mã</th>
                <th>Tên</th>
                <th>Email-fe</th>
                <th>Email-fpt</th>
                <th>Thạng thái</th>
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
                    <td>${nv.accountFPT}</td>
                    <td>${nv.trangThai == 1 ? "Đang hoạt động" : "Ngừng hoạt động"}</td>
                    <td>
                        <a href="edit/${nv.id}"><i class="bi bi-vector-pen"></i></a>
                        <a href="${nv.id}"><i class="bi bi-trash3"></i></a>
                        <a href="/bo-mon/chuyen-nganh/${nv.id}"><i class="bi bi-eye"></i></a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>