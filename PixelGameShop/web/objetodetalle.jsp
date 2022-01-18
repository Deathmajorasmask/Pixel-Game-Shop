<%@page import="Utils.RequestUtils"%>
    <%@page import="models.carrito"%>
        <%@page import="models.coment"%>
            <%@page import="Utils.requestUP"%>
                <%//@page import="models.usuer"%>
                    <%@page import="models.products"%>
                        <%@page import="java.util.List"%>
                            <%
                            //List<usuer> users = (List<usuer>)request.getAttribute(RequestUtils.KEY_ALL_USERS);
                            //List<usuer> users = (List<usuer>)request.getAttribute("ShowUsers");
                            List<products> prods = (List<products>)request.getAttribute(requestUP.KEY_ALL_Prods);
                            List<coment> come = (List<coment>)request.getAttribute(requestUP.KEY_ALL_COMN);
                            List<carrito> carrs = (List<carrito>)request.getAttribute(RequestUtils.KEY_ALL_CARR);
                            %>

                                <!doctype html>
                                <html lang="en">

                                <head>
                                    <!-- Required meta tags -->
                                    <meta charset="utf-8">
                                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                                    <!-- Bootstrap CSS -->
                                    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                                    <title>Producto | Detalle</title>
                                </head>

                                <body>
                                    <jsp:include page="navbar.jsp">
                                        <jsp:param name="Uname" value="fer" />
                                    </jsp:include>
                                    <%
                                    HttpSession mySession = request.getSession();
                                    String name2 = (String)mySession.getAttribute("jes");
                                    String name1 = (String)mySession.getAttribute("gar");
                                    Integer name3 = (Integer)mySession.getAttribute("jes2");
                                    //byte[] name3 = (byte[])mySession.getAttribute("img");
                                    %>
                                        <% int ida=0; %>
                                            <div class="row" style="padding-left:20px; padding-top:20px; padding-right:20px; padding-bottom:20px;">
                                                <div>
                                                    
                                                    <div class="container-fluid">
                                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style=" margin: auto; height: 300px;width: 300px; padding-top: 15px ; padding-bottom: 15px ;">
                                                    <ol class="carousel-indicators">
                                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                                    </ol>
                                                    <div class="carousel-inner">
                                                        
                                                        <%
                                                    //for(usuer user : users){
                                                    int vid = prods.size();
                                                    int act=0;  
                                                    for(products prod : prods){
                                                    int idp= prod.getIdprod();
                                                    if(vid-1!=act&&vid!=0){
                                                        if(act==0){
                                                    %>
                                                    <div class="carousel-item active " >
                                                    <img src="<%=prod.getPimg()%>" alt="..." height="300" width="300px" class="img-thumbnail">
                                                    </div>
                                                    <% 
                                                        }else{%>
                                                        <div class="carousel-item">
                                                        <img src="<%=prod.getPimg()%>" alt="..." height="300" width="300px" class="img-thumbnail">
                                                        </div>
                                                        <%}} else { %>
                                                            <div class="carousel-item">
                                                            <iframe height="300" width="300" src="<%=prod.getPimg()%>"> </iframe>
                                                            </div>
                                                        <% }act++; }%>
                                                    </div>
                                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" style="">
                                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                        <span class="sr-only">Next</span>
                                                    </a>
                                                    </div>
                                                    
                                                    </div>
                                                    </div>
                                                    <% //  for(usuer user : users){
                                            for(products prod : prods){
                                            int idp= prod.getIdprod();
                                            %>
                                                        <div class="col">
                                                            <% if(ida!=idp){ %>
                                                                <b>Producto: </b>
                                                                <%= prod.getNombre() %><br>
                                                                    <b>Categoria: </b>
                                                                    <%= prod.getCatego() %><br>
                                                                        <b>Descripción: </b>
                                                                        <%=prod.getDescri() %>
                                                                            <% ida=idp; }%><br>
                                                        </div>
                                                        <% } %>
                                                </div>
                                            </div>
                                            
                                            <div class="container-fluid" style="">
                                                <form name="log" method="POST" action="addcarr?prod=<%=ida%>">
                                                    <div class="form-group col-md-4" id="cate">
                                                        <select id="inputState" class="form-control" name="TPP">
                                                            <option selected value="1">Paypal</option>
                                                            <option value="2">Efectivo</option>
                                                            <option value="3">Debito/Credito</option>
                                                            <option value="4">Monedero Virtual</option>
                                                            <option value="5">Pendiente</option>
                                                        </select>
                                                    </div>
                                                    <div class="input-group mb-3">
                                                        <input type="number" class="form-control" placeholder="cantidad" aria-label="Recipient's username" aria-describedby="basic-addon2" name="cat">
                                                        <div class="input-group-append">
                                                            <input class="form-control" type="submit" value="Enviar propuesta" name="Subir" id="boton">
                                                            <%-- <button class="btn btn-outline-secondary" value="<%= ida %>" method="POST" type="button" onclick="location.href='addcarr'" >pedir</button> --%>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div>
                                                    <hr style="border: 10px solid blue; border-radius: 5px;">
                                                </div>
                                                <% if(carrs.size()>0){ %>
                                                <h2>Mi Opinión</h2>
                                                    <form name="logos" method="POST" action="opinoin?prod=<%=ida%>">
                                                        <div class="input-group mb-3">
                                                            <input type="number" class="form-control" placeholder="valoracion" aria-label="Recipient's username" aria-describedby="basic-addon2" name="val">
                                                            <input type="Text" class="form-control" placeholder="opinion del producto" aria-label="Recipient's username" aria-describedby="basic-addon2" name="opc">
                                                            <div class="input-group-append">
                                                                <input class="form-control" type="submit" value="Comentar" name="Subir" id="boton">
                                                                <%-- <button class="btn btn-outline-secondary" value="<%= ida %>" method="POST" type="button" onclick="location.href='addcarr'" >pedir</button> --%>
                                                            </div>
                                                        </div>
                                                    </form>
                                                <div>
                                                    <hr style="border: 10px solid blue; border-radius: 5px;">
                                                </div>
                                                    <%} for(coment CM : come){ %> <br>
                                                        <div class="card">
                                                            <div class="card-header">
                                                                <b>Usuario: </b><%=CM.getUname()%>
                                                                    <%=CM.getUape()%>
                                                            </div>
                                                            <div class="card-body">
                                                                <h5 class="card-title">Calificación:
                                                                    <%=CM.getVal()%>
                                                                </h5>
                                                                <p class="card-text">
                                                                    <b>Opinión: </b><%=CM.getCome()%>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <% } %>
                                            </div>
                                            <!-- Optional JavaScript -->
                                            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                                            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                                </body>

                                </html>