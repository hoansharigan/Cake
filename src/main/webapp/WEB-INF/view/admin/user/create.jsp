<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                <div class="container">
                    <div class="row ">
                        <div class="col-6 m-auto">
                            <form:form class="mt-5" method="post" action="admin/user/create" modelAttribute="newUser">
                                <h2 class="border-bottom">Create User</h2>
                                <div class="mb-3 col-12">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <form:input path="email" type="email" class="form-control"
                                        aria-describedby="emailHelp" />
                                </div>
                                <div class="mb-3 col-12">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <form:input path="password" type="password" class="form-control" />
                                </div>
                                <div class="mb-3 col-12">
                                    <label for="exampleInputPassword1" class="form-label">Phone number</label>
                                    <form:input path="phoneNumber" type="password" class="form-control" />
                                </div>
                                <div class="mb-3 col-12">
                                    <label for="exampleInputPassword1" class="form-label">Full Name</label>
                                    <form:input path="fullName" type="password" class="form-control" />
                                </div>
                                <div class="mb-3 col-12">
                                    <label for="exampleInputPassword1" class="form-label">Address</label>
                                    <form:input path="address" type="password" class="form-control" />
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary w-25 text-center">Create</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>

            </body>

            </html>