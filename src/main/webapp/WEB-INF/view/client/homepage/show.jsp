<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <jsp:include page="../layout/panel.jsp" />

                <!-- slider -->
                <jsp:include page="../layout/slider.jsp" />

                <!-- about -->
                <jsp:include page="../layout/about.jsp" />

                <!-- service -->
                <jsp:include page="../layout/service.jsp" />

                <!-- video -->
                <jsp:include page="../layout/video.jsp" />

                <!-- customer -->
                <jsp:include page="../layout/customer.jsp" />

                <!-- slider infinite  -->
                <jsp:include page="../layout/slider_infinity.jsp" />

                <!-- footer -->
                <jsp:include page="../layout/footer.jsp" />

                <!-- modal -->
                <div class="modal_cart">
                    <div class="shopping_cart  ">
                        <h1 class="" style=" color: #fff; font-size: 60px; text-align: center;">
                            Giỏ Hàng
                        </h1>


                        <ul class="shopping__list " style="max-height: 500px; overflow-y: scroll; overflow-x: hidden;">

                        </ul>

                        <div style="color:#fff ; font-size: 22px;">
                            <span>Total: </span> <span class="shopping__cart__total">0 <span>$</span></span>
                        </div>
                        <div class=" " style="text-align: center;">
                            <a href="client/xacNhan.html" target="_blank" class="comfim">
                                <button class="btn btn-order "
                                    style="width: 80%; padding: 10px 0; color: #fff;">Order</button>
                            </a>
                        </div>


                        <div class="shopping__close">
                            <i class="fa-solid fa-xmark"></i>
                        </div>
                    </div>
                </div>


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
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

        </html>