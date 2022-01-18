
<!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>

    <jsp:include page="navbar.jsp">
        <jsp:param name="Uname" value="fer" />
    </jsp:include>
    <style>
        .custom-select {
            position: relative;
            font-family: Arial;
        }
    </style>

    <%!int vari=0;%>

        <script>
            var taco = 0;;
        </script>

        <div class="container" style="padding-top:15px; padding-bottom:15px;">
            <form name="log" method="POST" action="AddPROD" enctype="multipart/form-data">
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Nombre del Producto" name="Fname" id="Fname">
                    </div>
                    <div class="col" style=" padding-top:7 px;">
                        <div class="form-group col-md-4" id="cate" name="cate2">
                            <select class="form-control" id="cate" name="cate">
                                  <option selected value="1"id="cate" name="cate">Consola</option>
                                  <option value="2"id="cate" name="cate">Videojuego</option>
                                  <option value="3"id="cate" name="cate">Joystick</option>
                                  <option value="4"id="cate" name="cate">Otros</option>
                                </select>
                        </div>
                    </div>
                </div>

                <div class="input-group mb-3" style="padding-top:20px;">
                    <input type="text" class="form-control" placeholder="Descripción" name="descripcion" id="descripcion">
                </div>
                
                <div class="input-group mb-3" style="padding-top:20px;">
                    <input type="number" class="form-control" placeholder="Unidades del producto" name="unidades" id="unidades">
                </div>

                <%--
                <div class="form-group">
                    <label for="exampleFormControlFile1">poner imagen</label>
                    <input type="file" class="form-control-file" id="File1">
                </div>
                --%>
                
                    <div class="input-group mb-3" style="padding-top:10px;">
                        <input type="text" id="URLV" class="form-control" placeholder="Url Imagen" aria-label="url video" aria-describedby="basic-addon1" id="img1" name="img1">
                    </div>
                
                    <div class="input-group mb-3" style="padding-top:10px;">
                        <input type="text" id="URLV" class="form-control" placeholder="Url imagen auxiliar" aria-label="url video" aria-describedby="basic-addon1" id="img2" name="img2">
                    </div>
                
                    <div class="input-group mb-3" style="padding-top:10px;">
                        <input type="text" id="URLV" class="form-control" placeholder="Url Video" aria-label="url video" aria-describedby="basic-addon1" id="video" name="video">
                    </div>

                    <div>
                        <input class="form-control" type="submit" value="Subir producto" name="Subir" id="boton">
                    </div>
            </form>
            <span id="buttonAppear"></span>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <%! public void sumVA(){
            vari++; } %>
                <script>
                    function lee() {
                        taco = taco + 1;
                        alert(taco);
                    }
                </script>

                <!-- Optional JavaScript -->
                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>
