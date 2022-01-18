<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>chat</title>
</head>
<body>

 
 
 <jsp:include page="navbar.jsp" >  
<jsp:param name="Uname" value="fer" />  
</jsp:include>  
                
    
  



    <div class="row">
        <div class="col-md-auto">
            <div>
                <img src="http://www.redagricola.com/cl/assets/uploads/2017/08/manazana-792x591-c-default.jpg" alt="..." class="img-thumbnail">
            </div>
        </div>

        <div class="col">
            descripcion
        </div>


    </div>
    <div class="container-fluid">

<p>
precio unitario   =    ||      precio total=      
 </p>


        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="location.href='carrito.html'">acepto</button>
        <button type="button" class="btn btn-danger btn-lg btn-block">cancelar</button>

        <button type="button" class="btn btn-outline-light btn-sm btn-block"></button>

        <div class="row">
        </div>
        <div>
            <center>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width: 50%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">acepto</div>
                    <!--<div class="progress-bar bg-success" role="progressbar" style="width: 50%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>-->
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 50%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">no</div>



                </div>
            </center>
        </div>


    </div>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>