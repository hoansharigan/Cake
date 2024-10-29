<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Create User</title>
            <link rel="stylesheet" href="css/main.css">
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        </head>

        <body>
            <div class="container my-5">
                <div class="row my-4 pb-3 border-bottom">
                    <div class="col-12 d-flex justify-content-between ">
                        <h2 class="inline-block">Table Users</h2>
                        <a href="/admin/user/create" class="btn btn-success">Create User</a>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-hover border">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Email</th>
                                <th scope="col">FullName</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${Users}" var="item">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.email}</td>
                                    <td>${item.fullName}</td>
                                    <td>
                                        <a href="/admin/user/${item.id}" class="btn btn-success p-2">View</a>
                                        <a href="" class="btn btn-warning p-2">Update</a>
                                        <a href="" class="btn btn-danger p-2">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </body>

        </html>