<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Detail ${id}</title>
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
                        <h2 class="inline-block">User Detail with ${id}</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="card" style="width: 18rem;">
                        <div class="card-header">
                            User information
                        </div>
                        <!-- <ul class="list-group list-group-flush">
                            <li class="list-group-item">${user.id}</li>
                            <li class="list-group-item"> ${user.email}</li>
                            <li class="list-group-item"> ${user.fullName}</li>
                            <li class="list-group-item"> ${user.address}</li>
                        </ul> -->
                    </div>
                </div>
            </div>

        </body>

        </html>