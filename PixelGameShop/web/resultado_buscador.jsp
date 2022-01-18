<%@page import="controllers.ShowUser"%>
    <%@page import="Utils.RequestUtils"%>
        <%@page import="Utils.requestUP"%>
            <%@page import="models.products"%>
                <%@page import="java.util.List"%>
                    <%
                    //List<usuer> users = (List<usuer>)request.getAttribute(RequestUtils.KEY_ALL_USERS);
                    //List<usuer> users = (List<usuer>)request.getAttribute("ShowUsers");
                    List<products> prods = (List<products>)request.getAttribute(requestUP.KEY_ALL_Prods);
                    %>
                        <%@page contentType="text/html" pageEncoding="UTF-8"%>
                            <!doctype html>
                            <html lang="en">

                            <head>
                                <!-- Required meta tags -->
                                <meta charset="utf-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                                <!-- Bootstrap CSS -->
                                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

                                <title>resultado busqueda</title>
                            </head>

                            <body>
                                <style>
                                    #articulo {
                                        padding-top: 6px;
                                        padding-bottom: 6px;
                                        padding-left: 40px;
                                    }
                                </style>
                                <% int ida=0; %>
                                    <%@ include file="navbar.jsp" %>
                                        <%
                                //for(usuer user : users){
                                for(products prod : prods){
                                int idp= prod.getIdprod();
                                if(ida!=idp) {
                                %>
                                            <div id="articulo">
                                                <div class="row">
                                                    <div class="col col-lg-2">
                                                        <div>
                                                            <img src="<%=prod.getPimg()%>" alt="..." height="300" width="300" class="img-thumbnail">
                                                        </div>
                                                    </div>
                                                    <div class=" col">
                                                        <a>
                                                            <%//user.getNamePUser()%>
                                                                <b>Nombre del Producto:</b> <%= prod.getNombre() %>
                                                        </a> <br>
                                                        <b>Descripción:</b> <%= prod.getDescri() %>
                                                    </div>
                                                    <div class="col  col-lg-2">
                                                        <% //user.getNameLUser() %>
                                                        <b>Categoria:</b> <%= prod.getCatego() %>
                                                                <div class="btn-group-vertical">
                                                                    <%--   <button type="button" value="<%=prod.getIdprod()%>" class="btn btn-secondary" onclick="location.href='objetodetalle.jsp'"></button>--%>
                                                                        <a type="button" class="btn btn-outline-secondary" value="John" name="IDP" id="IDP" href="GETONEPROD?IDP=<%=prod.getIdprod()%>">Mirar</a>
                                                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <% ida=idp; }} %>
                                                <!-- Optional JavaScript -->
                                                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                                                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                                                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                                                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                            </body>

                            </html>