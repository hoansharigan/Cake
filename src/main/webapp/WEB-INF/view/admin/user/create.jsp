<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                <link rel="stylesheet" href="css/main.css">
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
                                <div class="container">
                                    <div class="row ">
                                        <div class="col-6 m-auto">
                                            <form:form enctype="multipart/form-data" class="" method="post"
                                                action="/admin/user/create" modelAttribute="newUser">
                                                <h2 class="border-bottom mb-4">Create User</h2>
                                                <div class="row">
                                                    <div class="col-6 mb-3 mb-3">
                                                        <label for="exampleInputEmail1" class="form-label">Email
                                                            address</label>
                                                        <form:input path="email" type="email" class="form-control"
                                                            aria-describedby="emailHelp" />
                                                    </div>
                                                    <div class="col-6 mb-3 mb-3">
                                                        <label for="exampleInputPassword1"
                                                            class="form-label">Password</label>
                                                        <form:input path="password" type="password"
                                                            class="form-control" />
                                                    </div>
                                                    <div class="mb-3 col-6 mb-3">
                                                        <label for="exampleInputPassword1" class="form-label">Phone
                                                            number</label>
                                                        <form:input path="phoneNumber" type="password"
                                                            class="form-control" />
                                                    </div>
                                                    <div class="mb-3 col-6 mb-3">
                                                        <label for="exampleInputPassword1" class="form-label">Full
                                                            Name</label>
                                                        <form:input path="fullName" type="password"
                                                            class="form-control" />
                                                    </div>
                                                    <div class="mb-3 col-12 mb-3">
                                                        <label for="exampleInputPassword1"
                                                            class="form-label">Address</label>
                                                        <form:input path="address" type="password"
                                                            class="form-control" />
                                                    </div>
                                                    <div class="col-6 mb-3 mb-3">
                                                        <label for="">Role : </label>
                                                        <form:select class="form-select" path="role.name">
                                                            <form:option value="ADMIN">ADMIN</form:option>
                                                            <form:option value="USER">USER</form:option>
                                                        </form:select>

                                                    </div>
                                                    <div class="col-6 mb-3 mb-3">
                                                        <div class="input-group mb-3" style="height: 40px;">
                                                            <label for="">Avatar : </label>
                                                            <input type="file" class="form-control"
                                                                accept=".png,.jpg,.jpeg" id="avatarFile"
                                                                name="hoidanitFile" />
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <img style="max-height: 250px ; display: none;" src="" alt=""
                                                            id="avatarPreview">
                                                    </div>
                                                </div>
                                                <div class="text-center">
                                                    <button type="submit" class="btn btn-primary w-25 text-center">
                                                        Create
                                                    </button>
                                                </div>
                                            </form:form>
                                        </div>
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