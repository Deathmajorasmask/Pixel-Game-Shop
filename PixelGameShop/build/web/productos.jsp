<!DOCTYPE html>
<%@page import="controllers.ShowUser"%>
<%@page import="Utils.RequestUtils"%>
<%@page import="Utils.requestUP"%>
<%//@page import="models.usuer"%>
<%@page import="models.products"%>
<%@page import="java.util.List"%>

<%
//    List<usuer> users = (List<usuer>)request.getAttribute(RequestUtils.KEY_ALL_USERS);
//List<usuer> users = (List<usuer>)request.getAttribute("ShowUsers");
   List<products> prods = (List<products>)request.getAttribute(requestUP.KEY_ALL_Prods);
%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element: */
}

.select-selected {
  background-color: DodgerBlue;
}

/* Style the arrow inside the select element: */
.select-selected:after {
  position: absolute;
  content: "";
  top: 0px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
}

/* Style items (options): */
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}

#cate{
padding-left: 40px;
padding-top: 25px; 

}

#agrega{

margin-left: 40px;

}

.row{

  padding-left: 40px;
  padding-right: 80px;
  padding-top: 10px;
  padding-bottom: 5px;

}

</style>
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>     

<body>
 <jsp:include page="navbar.jsp" >  
<jsp:param name="Uname" value="fer" />  
</jsp:include>  
                
    
  


  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>




<!--surround the select box with a "custom-select" DIV element. Remember to set the width:-->



<div>
            <button type="button" class="btn btn-success" id="agrega"  onclick="location.href='productoMN.jsp'" >agregar producto </button>       
</div>

<% int ida=0;     %>

  <%
              //  for(usuer user : users){
              for(products prod : prods){
   int idp= prod.getIdprod();
         
        if(ida!=idp)
        {
   %>
          

<br>

    <div class="row">
        <div class="col-md-auto">
            <div>
                <img src="<%=prod.getPimg()%>" alt="..." height="300" width="300" class="img-thumbnail">
            </div>
        </div>

        <div class="col">
<br>            
<p>  descripcion  <%=
                         prod.getDescri()                 
                   %> </p>
        </div>
<br>
<div style="border-top-width: 15px; padding-top:20px; ">
        <div class="col col-lg-2" align="center">
           <p>categoria    <%= prod.getCatego()%>      
                    </p>
        </div>
        <div class="col col-lg-2" align="center">
           <p>nombre  <%=  prod.getNombre() %> </p>           
        </div>
        
        </div>           

 <div class="btn-group-vertical">
     <button type="button" value="<%=prod.getIdprod()%>" class="btn btn-success">modificar</button>
                
                <button type="button" class="btn btn-danger">eliminar</button>

            </div>
    </div>

<%  ida=idp;  }

}%>  


<script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>




</body>
</html>
