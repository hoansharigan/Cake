<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
            <meta name="author" content="Hỏi Dân IT" />
            <title>Dashboard - Hỏi Dân IT</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="/admin/css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="../layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="../layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Dashboard</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                            <div class="container my-5">
                                <div class="row my-4 pb-3 border-bottom">
                                    <div class="col-12 d-flex justify-content-between ">
                                        <h2 class="inline-block">Table Users</h2>
                                        <a href="/admin/product/create" class="btn btn-success">Create Product</a>
                                    </div>
                                </div>
                                <div class="row">
                                    <table class="table table-hover border">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">FullName</th>
                                                <th scope="col">Role</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <!-- <tbody>
                                            <c:forEach items="${Users}" var="item">
                                                <tr>
                                                    <td>${item.id}</td>
                                                    <td>${item.name}</td>
                                                    <td>${item.price}</td>
                                                    <td>${item.factory}</td>
                                                    <td>${Action}</td>
                                                    <td>
                                                        <a href="/admin/user/${item.id}"
                                                            class="btn btn-success p-2">View</a>
                                                        <a href="/admin/user/update/${item.id}"
                                                            class="btn btn-warning p-2">Update</a>
                                                        <a href="/admin/user/delete/${item.id}"
                                                            class="btn btn-danger p-2">Delete</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody> -->
                                    </table>
                                </div>
                            </div>
                        </div>
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="admin/js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="admin/js/chart-area-demo.js"></script>
            <script src="admin/js/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="admin/js/datatables-simple-demo.js"></script>
        </body>

        </html>