<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title style="font-family: Verdana, Geneva, Tahoma, sans-serif;">Restaurent </title>
                <link rel="stylesheet" href="css/bootstrap-5.3.3-dist/bootstrap-5.3.3-dist/css/bootstrap.min.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                    integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link rel="stylesheet" href="client/css/style.css">
                <link rel="stylesheet" href="client/css/responsive.css">
                <link rel="icon" href="client/img/iconLogo2.png" type="image/x-icon">
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/nav.jsp" />
                <div class="body">
                    <!-- panel  -->

                    <div class="panel " id="header"
                        style="background-image: url(client/img/bg1.webp); height: 50vh; background-size: cover; background-position: center; position: relative;">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-6 col-lg-7 col-md-8 ">
                                    <div class="content">
                                        <div class="panel_subtitle" style="">
                                            <h2>Thơm Ngon</h2>
                                        </div>
                                        <h1 class="title">Sản Phẩm </h1>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                    <section>
                        <div class="slider">
                            <div class="container" style="box-shadow: 4px 4px 10px #ccc; border-radius: 20px;">
                                <h1 style="font-size: 30px !important; font-weight: bold;" class="subtitle">Most Popular
                                </h1>
                                <h1 class=" title">Our Exclusive Cakes</h1>
                                <div class="row">
                                    <div class="col-12">
                                    </div>
                                </div>
                                <div class="product">
                                    <div class="row">
                                        <c:forEach items="${products}" var="item">
                                            <div class="col-md-4">
                                                <div class="item dish__item" style="margin-bottom: 20px;">
                                                    <div class="img" style=" margin-bottom: 10px;">
                                                        <img src="/images/product/${item.image}" style="height: 250px;"
                                                            alt="">
                                                    </div>
                                                    <a href="/products/${item.id}"
                                                        style="text-decoration: none; color: black;">
                                                        <h3 class="item_name">${item.name}</h3>
                                                    </a>
                                                    <p style=" white-space: nowrap;       
                                                overflow: hidden;         
                                                text-overflow: ellipsis; 
                                                width: 100%; ">${item.shortDesc}</p>
                                                    <p>Giá :
                                                        <fmt:formatNumber type="number" value="${item.price}" />đ
                                                    </p>
                                                    <div class="btn btn-order"> I Order
                                                        Now
                                                    </div>
                                                    <div class="btn btn-order add__card" style="margin-left: 10px;">Add
                                                        to
                                                        cart
                                                    </div>

                                                </div>

                                            </div>
                                        </c:forEach>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- footer -->
                    <jsp:include page="../layout/footer.jsp" />
                </div>
            </body>

            <script>
                const scrollers = document.querySelectorAll(".scroller");

                // If a user hasn't opted in for recuded motion, then we add the animation
                if (!window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
                    addAnimation();
                }

                function addAnimation() {
                    scrollers.forEach((scroller) => {
                        // add data-animated="true" to every `.scroller` on the page
                        scroller.setAttribute("data-animated", true);

                        const scrollerInner = scroller.querySelector(".scroller__inner");
                        const scrollerContent = Array.from(scrollerInner.children);

                        scrollerContent.forEach((item) => {
                            const duplicatedItem = item.cloneNode(true);
                            duplicatedItem.setAttribute("aria-hidden", true);
                            scrollerInner.appendChild(duplicatedItem);
                        });
                    });
                }

            </script>
            <script src="client/js/nav.js"></script>
            <script src="client/js/cart.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>

            </html>