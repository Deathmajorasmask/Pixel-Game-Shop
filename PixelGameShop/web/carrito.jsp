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

                    <title>Carrito</title>
                </head>

                <body>
                    <jsp:include page="navbar.jsp">
                        <jsp:param name="Uname" value="fer" />
                    </jsp:include>
                    <%
                    List<usuer> users = (List<usuer>)request.getAttribute(RequestUtils.KEY_ALL_USERS);
                    //List<usuer> users = (List<usuer>)request.getAttribute("ShowUsers");
                    List<carrito> carrs = (List<carrito>)request.getAttribute(RequestUtils.KEY_ALL_CARR);
                    %>
                        <div class="container"> <br>
                            <%
                    int ida=0;
                    int idC=0;
                    //  for(usuer user : users){
                    for(carrito carr : carrs){
                    int idp= carr.getIdCar();
                    int idS=carr.getIdArt();
                    if(ida!=idp&&idC!=idS)
                    {
                    %>
                                <div class="row">
                                    <div class="col-md-auto">
                                        <div>
                                            <img src="<%=carr.getPimg()%>" alt="..." class="img-thumbnail" height="350" width="350">
                                        </div>
                                    </div>

                                    <div class="col"> <br>
                                        <p>
                                            <%=carr.getNombre()%>
                                        </p> <br>
                                        <p> Descripcion:
                                            <%=carr.getDescri()%>
                                        </p> <br>
                                        <p> Categoria:
                                            <%=carr.getCatego()%>
                                        </p> <br>
                                        <p> Estado:
                                            <%=carr.getEst()%>
                                        </p>
                                        <br>
                                        <p> Tipo de Pago:
                                            <%=carr.getTP()%>
                                        </p>
                                    </div> <br>
                                    <form name="log3" method="POST" action="modCar?car=<%=carr.getIdCar()%>">
                                        <div>
                                            <div class=".col-sm-4" align="center">
                                                <p>cantidad </p>
                                                <input type="number" class="form-control" placeholder=" <%=carr.getCant()%>" name="c22">
                                            </div>
                                            <div class="col col-lg-2" align="center">
                                                <p>precio individual
                                                    <%=carr.getPrUn()%>
                                                </p>
                                            </div>
                                            <div class="col col-lg-2" align="center">
                                                <%int PT=carr.getPrUn()*carr.getCant();
                                                if(PT<=0){
                                                %>
                                                    <p>Precio total: ??</p>
                                                    <% }else{ %>
                                                        <p>Precio total:
                                                            <%=PT%>
                                                        </p>
                                                        <% } %>
                                            </div>
                                        </div>

                                        <div class="btn-group-vertical">
                                            <%if(carr.getIdEst()!=2){%>
                                                <button type="button" class="btn btn-success" disabled="true">Aceptar</button>
                                                <% }else{ %>
                                                    <a class="btn btn-success" href="compra?IDP=<%=carr.getIdCar()%>">Aceptar</a>
                                                    <% } %>
                                                        <%--
                                            <button type="button"  class="btn btn-warning">Modificar</button>
                                            --%>
                                                            <input class="btn btn-warning" type="submit" name="Subir" id="boton">
                                                            <a class="btn btn-danger" href="modCar?car=<%=carr.getIdCar()%>">Cancelar</a>
                                        </div>
                                </div>
                                </form> <br>
                                <%}
                                ida= idp;
                                idC= idS;
                                }%>
                        </div>

                        <!-- Optional JavaScript -->
                        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                </body>

                </html>