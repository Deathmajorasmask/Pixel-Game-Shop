<%-- 
    Document   : index
    Created on : Oct 25, 2019, 3:44:21 PM
    Author     : Deathmajorasmask
--%>
    <%@page import="com.tutorialesJosem.MySQL.ConectaBD"%>
        <%@page import="models.usuer"%>
            <%@page import="Utils.RequestUtils"%>
                <%@page import="java.util.List"%>
                    <%@page contentType="text/html" pageEncoding="UTF-8"%>
                        <!DOCTYPE html>
                        <html>
                        <head>

                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <meta http-equiv="X-UA-Compatible" content="ie=edge">


                            <!-- Required meta tags -->
                            <meta charset="utf-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

                            <!-- Bootstrap CSS -->
                            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                            <link href="img/Register.css">
                            <title>registro</title>

                            <style>
                                div {
                                    padding-bottom: 15px;
                                }
                                
                                #ema {
                                    height: 40px;
                                    padding-bottom: 0px !important;
                                    padding-top: 0px !important;
                                }
                            </style>
                        </head>

                        <body>
                            <script>
                                vF = 0;
                            </script>
                            <jsp:include page="navbar.jsp">
                                <jsp:param name="Uname" value="fer" />
                            </jsp:include>
                            <script>
                                var vF = 0;
                            </script>
                            
                            
                            <div class="container">
                                <form name="log" method="POST" action="AddUser" enctype="multipart/form-data">
                                    <br>
                                    <div class="row">
                                        <div class="col">
                                            <input type="text" class="form-control" placeholder="Nombre" name="Fname">
                                        </div>
                                        <div class="col">
                                            <input type="text" class="form-control" placeholder="Apellidos" name="Lname">
                                        </div>
                                    </div>

                                    <div class="input-group mb-3" id="ema">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="email">e-mail</span>
                                        </div>
                                        <input type="text" id="Emadd" class="form-control" placeholder="ejemplo@gmail.com" aria-label="Username" aria-describedby="basic-addon1" name="Email">
                                    </div>

                                    <div>
                                        <input type="text" id="username" placeholder="Nombre de Usuario" class="form-control" aria-describedby="passwordHelpBlock" name="Nick">
                                        <small id="passwordHelpBlock" class="form-text text-muted">
                            * 6 caracteres
                        </small>
                                    </div>

                                    <div>
                                        <label for="inputUser">Numero de Telefono</label>
                                        <input type="text" id="telefono" class="form-control" aria-describedby="passwordHelpBlock" placeholder="solo digitos" name="tele">
                                        <small id="passwordHelpBlock" class="form-text text-muted">
                                * Hasta 10 digitos
                            </small>
                                    </div>

                                    <div>
                                        <label for="inputPassword5">Contraseña</label>
                                        <input type="password" id="Password1" class="form-control" aria-describedby="passwordHelpBlock" name="pass">
                                        <small id="passwordHelpBlock" class="form-text text-muted">
                                    * 8 caracteres, 1 Mayuscula , 1 minuscula y 1 numero
                            </small>
                                    </div>

                                    <div>
                                        <label for="inputPassword5">Confirmar Contraseña</label>
                                        <input type="password" id="Password2" class="form-control">
                                        <small id="passwordHelpBlock" class="form-text text-muted">
                                        * repita la contraseña como verificación
                            </small>
                                    </div>

                                    <div>
                                        <input type="text" id="direc" class="form-control" placeholder="Dirección (opcional)" aria-label="Username" aria-describedby="basic-addon1" name="dire">
                                    </div>


                                    <div class="form-group">
                                        <label for="exampleFormControlFile1">Imagen de Usuario</label>
                                        <input class="form-control" type="file" name="imageUser" />
                                    </div>
                                    <div>
                                        <%--    <input class="form-control" type="submit" name="Subir" id="boton" onclick="validacionesPag()">--%>
                                        <input class="form-control" value="Registrarme" type="submit" name="Subir" id="boton">
                                            <%--    <a type="button" class="btn btn-danger" href="ShowUser">show2</a>--%>
                                    </div>


                                </form>
                            </div>
                            <script language="javascript" type="text/javascript">
                                    function valida_envia() {
                                        var mayus = 0;
                                        var minus = 0;
                                        var num = 0;

                                        const CHAR_0 = '0'.charCodeAt(0);
                                        const CHAR_9 = '9'.charCodeAt(0);
                                        //valido el nombre
                                        if (document.log.Password1.value.length < 8) {
                                            alert("la contraseña tiene que ser minimo 8 caracteres")
                                                //document.form1.titulo.focus()
                                            return 1;
                                        }
                                        for (var ind = 0; ind < document.log.Password1.value.length; ind++) {
                                            var cara = document.log.Password1.value.charAt(ind);

                                            if (cara >= CHAR_0 || cara <= 9) {
                                                num++
                                            } else if (cara === cara.toUpperCase()) {
                                                mayus++;
                                            } else if (cara === cara.toLowerCase()) {
                                                minus++;
                                            }
                                        }
                                        if (mayus < 1) {
                                            alert("contrasena necesita al menos una MAYUSCULA")
                                            return 1;
                                        }
                                        if (minus < 1) {
                                            alert("contrasena al menos una minuscula")
                                            return 1;
                                        }
                                        if (num < 1) {
                                            alert("contrasena al menos un numero")
                                            return 1;
                                        }

                                        return 0;
                                    }

                                    function valida_email() {
                                        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(log.Emadd.value)) {
                                            return (0)
                                        }
                                        alert("correo electronico no valido")
                                        return (1)
                                    }

                                    function valida_pass() {
                                        if (document.log.Password1.value != document.log.Password2.value) {
                                            alert("copia de contrasena incorrecta")
                                            return 1;
                                        }
                                        return 0;
                                    }

                                    function valida_user() {

                                        //valido el nombre
                                        if (document.log.username.value.length < 6) {
                                            alert("la el usuario tiene que ser minimo 6 caracteres")
                                                //document.form1.titulo.focus()
                                            return 1;
                                        }
                                        return 0;
                                    }

                                    function valida_telf() {
                                        var mayus = 0;
                                        var minus = 0;
                                        var num = 0;
                                        const CHAR_0 = '0'.charCodeAt(0);
                                        const CHAR_9 = '9'.charCodeAt(0);
                                        //valido el nombre
                                        if (document.log.telefono.value.length == 8 || document.log.telefono.value.length == 10) {

                                            for (var ind = 0; ind < document.log.telefono.value.length; ind++) {
                                                var cara = document.log.telefono.value.charAt(ind);

                                                if (cara >= CHAR_0 || cara <= 9) {
                                                    num++
                                                } else if (cara === cara.toUpperCase()) {
                                                    mayus++;
                                                } else if (cara === cara.toLowerCase()) {
                                                    minus++;
                                                }
                                            }
                                            if (mayus > 0 || minus > 0) {
                                                alert("telefono incorrecto")
                                                return 1;
                                            } else return 0;
                                        } else {
                                            alert("telefono incorrecto")
                                            return 1;
                                        }
                                    }

                                    function validacionesPag() {
                                        vF = 0;
                                        vF = vF + valida_email();
                                        vF = vF + valida_user();
                                        vF = vF + valida_telf();
                                        vF = vF + valida_envia();
                                        vF = vF + valida_pass();
                                        //alert (vF);
                                        if (vF < 1) {
                                            href = "iniciousu.html"
                                        }
                                    }
                                </script>
                            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


                        </body>

                        </html>