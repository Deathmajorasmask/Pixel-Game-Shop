<%-- 
    Document   : navbar
    Created on : Nov 7, 2019, 7:08:54 PM
    Author     : Deathmajorasmask
--%>

    <%@page import="com.tutorialesJosem.MySQL.ConectaBD"%>
        <%@page import="models.usuer"%>
            <%@page import="Utils.RequestUtils"%>
                <%@page import="java.util.List"%>
                    <!doctype html>
                    <html lang="en">

                    <head>
                        <!-- Required meta tags -->
                        <meta charset="utf-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                    </head>

                    <body>
                        <%
                        HttpSession mySession = request.getSession();
                        String name2 = (String)mySession.getAttribute("jes");
                        String name1 = (String)mySession.getAttribute("gar");
                        Integer name3 = (Integer)mySession.getAttribute("jes2");
                        //  byte[] name3 = (byte[])mySession.getAttribute("img");    
                        %>
                            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                                <a class="navbar-brand" href="Inix"><img src="img/LogoPixelGameShop.png" style="width: 40px; height: 40px; border-radius: 50%; float: left;" alt="Mr.Game&Watch" height="60" width="60"></a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="Inix">Inicio<span class="sr-only">(current)</span></a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Sesión
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <div class="dropdown-content">
                                                    <a class="dropdown-item" href="login.jsp">Iniciar sesión </a>
                                                    <a class="dropdown-item" href="logadm.jsp">Iniciar como Administrador</a>
                                                    <a class="dropdown-item" href="index.jsp">Registrate</a>
                                                    <a class="dropdown-item" href="logOut">Cerrar Sesión</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Categorías
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <div class="dropdown-content">
                                                    <a class="dropdown-item" href="byCate?cate=1">Consolas </a>
                                                    <a class="dropdown-item" href="byCate?cate=2">Videojuegos</a>
                                                    <a class="dropdown-item" href="byCate?cate=3">Joysticks</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="getCar">Carrito</a>
                                        </li>
                                </div>
                                </ul>
                                    
                                <div class="search-container">
                                    <form action="showallPRD">
                                        <input type="text" placeholder="Buscar..." name="search" autocomplete="off">
                                        <input class="btn btn-outline-secondary" type="submit" name="buscar" text="buscar" id="boton2">
                                    </form>
                                </div>
                            </nav>
                            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                <% if (name2!= null){ %>
                                <% if(name3 != 0) {%>
                                    <img src="GetPerfilImage?idUser=<%=name3%>" height="60" width="60">
                                    <% } else{%>
                                    <img src="img/AngusAdmin.jpg" height="60" width="60">
                                    <% }%>
                                    <%  } else{ %>
                                        <img src="img/Gamewatch.png" style="width: 40px; height: 40px; border-radius: 50%; float: left;" alt="Mr.Game&Watch" height="60" width="60">
                                        <% }%>
                                                <a class="text">   
                                                <% if (name2!= null){ %>
                                                <% if(name2 == "administrador"){ %>
                                                Admin
                                                <%}else{ %>
                                                <%= name2     %> <%= name1%>
                                                <% } %>
                                                <%  } else{%>
                                                Usuario Anonimo
                                                <% } %>
                                                </a>
                            </nav>
                            <% if(name2=="administrador"){ %>
                                <jsp:include page="navbaradm.jsp" />
                                <%
                                    }
                                %>
                    </body>

                    </html>
