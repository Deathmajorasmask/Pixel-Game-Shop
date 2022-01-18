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
import javax.servlet.http.HttpSession;
import models.carrito;

/**
 *
 * @author Deathmajorasmask
 */
public class modCar extends HttpServlet {

     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String NPuser, String NLuser, String Pnick, String Pemail, String Pdire, String tel, InputStream userImage
        //Obtenemos los pArametros
        
        
  


        
        String cact=request.getParameter("c22");
        
     
        
       String prod=request.getParameter("car");

          
        if(!(cact==null)){
  int cant = Integer.parseInt(cact);
        
  int car = Integer.parseInt(prod);
    
  carrito.MoyCarr(car,cant);
        }
        
        
 
        //Redirecciona a la pagina que gustemos
       response.sendRedirect("getCar");
      //response.sendRedirect("showUsers.jsp");
    }
     
     
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String NPuser, String NLuser, String Pnick, String Pemail, String Pdire, String tel, InputStream userImage
        //Obtenemos los pArametros
        
        
  

//  byte[] name3 = (byte[])mySession.getAttribute("img");

    
    
        
        
                
          String prod=request.getParameter("car");
        
      
        
  
        
       int car = Integer.parseInt(prod);
    
                carrito.CanCarr(car);
      
      
      
        
        
 
        //Redirecciona a la pagina que gustemos
       response.sendRedirect("getCar");
      
      }


}
