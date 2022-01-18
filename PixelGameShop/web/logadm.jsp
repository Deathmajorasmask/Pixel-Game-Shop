<%@page import="javax.naming.Context"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title> Iniciar Sesión </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="img/master.css">
</head>

<body>
    
     
<jsp:include page="navbar.jsp" >  
<jsp:param name="Uname" value="fer" />  
</jsp:include> 

    <div class="login-box">

        <img src="img/LogoPixelGameShop.png" class="avatar" alt="Avatar Image">
        <h1>Pixel <span>Game</span> Shop (Admin)</h1>
        <form name="admlg" method="POST" action="logAdm">
            <!--USERNAME INPUT -->
            <label for="username">Usuario Administrador</label>
            <input type="text" name="userName" id="a" placeholder="Usuario" autocomplete="off">
            <!--PASSWORD INPUT -->
            <label for="password">Contraseña</label>
            <input type="password" name="BBB" placeholder="Contraseña" autocomplete="off">
            <input type="submit"  value="Iniciar Sesión" name="Subir" id="boton2">
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>





<!-------------------------------------------------
<!doctype html>
<html lang="en">
<head>
     Required meta tags 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     Bootstrap CSS 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>login administrador</title>
</head>
<style>
 .container{padding-top: 20px;}

</style>

<body>
  
    <div class="container">

   
               
                 <form name="admlg" method="POST" action="logAdm">
            
           
                <label for="exampleInputEmail1">Clave</label>
                <input type="text" class="form-control"   placeholder="administrador" name="userName" id="a">
        
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" placeholder="Password" name="BBB">
           
            <div>
                
        
                
                
        <input  class="btn btn-primary" type="submit" name="Subir" id="boton2">
             <%--   <button type="button" class="btn btn-primary" onclick="location.href='pagpapw.html'">acepter</button> --%>
                <button type="button" class="btn btn-primary" onclick="location.href='index.jsp'">Registrarse</button>
            </div>

        </form>
                     
    </div>

     Optional JavaScript 
     jQuery first, then Popper.js, then Bootstrap JS 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>-->