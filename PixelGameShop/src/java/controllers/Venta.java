/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.carrito;

/**
 *
 * @author Deathmajorasmask
 */
public class Venta extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String NPuser, String NLuser, String Pnick, String Pemail, String Pdire, String tel, InputStream userImage
        //Obtenemos los pArametros
        String cact=request.getParameter("precio");
       String prod=request.getParameter("car");
        if(!(cact==null)&&cact!=""){
  int cant = Integer.parseInt(cact);
        
  int car = Integer.parseInt(prod);
    
  carrito.PutCarr(car,cant);
        }
        
        
 
        //Redirecciona a la pagina que gustemos
       response.sendRedirect("getPeticion");
      //response.sendRedirect("showUsers.jsp");
  
    
    
    }
}
    