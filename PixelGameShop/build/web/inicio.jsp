
<%@page import="Utils.RequestUtils"%>
    <%@page import="models.carrito"%>
        <%@page import="java.util.List"%>
            <%@page import="models.usuer"%>
                <!doctype html>
                <html lang="en">

                <head>
                    <!-- Required meta tags -->
                    <meta charset="utf-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                    <!-- Bootstrap CSS -->
                    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                    <title>Pixel Game Shop!</title>
                </head>

                <body>
                    <jsp:include page="navbar.jsp">
                        <jsp:param name="Uname" value="fer" />
                    </jsp:include>
                    <%
                    List<carrito> carrs = (List<carrito>)request.getAttribute(RequestUtils.KEY_ALL_CARR);
                    %>
                        <div class="container-fluid">
                            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style=" margin: auto; width: 90%; padding-top: 15px ; padding-bottom: 15px ;">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active" data-interval="9000">

                                        <a href="byCate?cate=1">
                                            <img src="img/ConsolePanel.jpg" class="d-block w-100" alt="..." height="700">
                                        </a>
                                    </div>
                                    <div class="carousel-item" data-interval="9000">
                                        <a href="byCate?cate=2">
                                            <img src="img/VideogamesPanel.jpg" class="d-block w-100" alt="..." height="700">
                                        </a>
                                    </div>
                                    <div class="carousel-item" data-interval="9000">

                                        <a href="byCate?cate=3">
                                            <img src="img/JoysticksPanel.jpg" class="d-block w-100" alt="..." height="700">
                                        </a>

                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        
                        <div class="container" style=" height: 100px; padding-top: 5px;padding-bottom: 5px;">
                            <a href="byCate?cate=1">
                                <div class="card bg-dark text-white">
                                    <img src="img/SoldGamesCard.png" class="card-img" alt="..." height="100" width="42">
                                    <div class="card-img-overlay">
                                        <h3 class="card-title">Más Vendidos</h3>
                                        <p class="card-text">Basados en las compras de nuestros distinguidos clientes.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <br><br>
                        
                        <div class="container" style="padding-top: 5px;padding-bottom: 5px;">
                            <div class="row">
                                <%
                            int idC=0;
                            //  for(usuer user : users){
                            for(carrito carr : carrs){
                            int idS=carr.getIdArt();
                            if(idC!=idS) {
                            %>
                                    <div class="col-sm-4">
                                        <div class="card" style="width: 18rem;">
                                            <a href="GETONEPROD?IDP=<%=idS%>"> 
                                            <img class="card-img-top" src="<%=carr.getPimg() %>" alt="Card image cap">
                                            <div class="card-body">
                                                <p class="card-text"><%=carr.getNombre() %></p>
                                                <p class="card-text"><%=carr.getCatego()%></p>
                                            </div>
                                            </a>
                                        </div>
                                    </div>
                                    <% }
                            } %>
                            </div>
                        </div>
                            <br>
                        <div class="container" style=" height: 100px; padding-top: 5px;padding-bottom: 5px;">
                            <a href="byCate?cate=1">
                                <div class="card bg-dark text-white">
                                    <img src="img/VideogamesCard.png" class="card-img" alt="..." height="100" width="42">
                                    <div class="card-img-overlay">
                                        <h3 class="card-title">Consolas de Videojuegos</h3>
                                        <p class="card-text">Encontraras una gran colección de Consolas de todas las compañias y todas las epocas, desde Retro hasta actuales.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                            <br><br><br>
                        <div class="container" style="height: 100px; padding-top: 5px;padding-bottom: 5px;">
                            <a href="byCate?cate=2">
                                <div class="card bg-dark text-white">
                                    <img src="img/GameCard.png" class="card-img" alt="..." height="100" width="42">
                                    <div class="card-img-overlay">
                                        <h3 class="card-title">Videojuegos</h3>
                                        <p class="card-text">Encuentra en nuestra colección inumerables titulos inolvidables, listos para sumergirte en una gran experiencia</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                            <br><br><br>
                        <div class="container" style="height: 100px; padding-top: 5px;padding-bottom: 5px;">
                            <a href="byCate?cate=3">
                                <div class="card bg-dark text-white">
                                    <img src="img/JoysticksCard.png" class="card-img" alt="..." height="100" width="42">
                                    <div class="card-img-overlay">
                                        <h3 class="card-title">Mandos - Joysticks</h3>
                                        <p class="card-text">Una gran variedad de mandos de gran calidad y por distribuidores autorizados</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <!-- Optional JavaScript -->
                        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                </body>

                </html>