/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import models.carrito;
import Utils.FilesUltis;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**

/**
 *
 * @author Deathmajorasmask
 */
public class addcarr extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String NPuser, String NLuser, String Pnick, String Pemail, String Pdire, String tel, InputStream userImage
        //Obtenemos los pArametros
        
        
          
    HttpSession mySession = request.getSession();



  String name2 = (String)mySession.getAttribute("jes");
    
  String name1 = (String)mySession.getAttribute("gar");

  
  Integer name3 = (Integer)mySession.getAttribute("jes2");

//  byte[] name3 = (byte[])mySession.getAttribute("img");

    
    
        
        
        String cact=request.getParameter("cat");
        
          String prod=request.getParameter("prod");
        
          String TP=request.getParameter("TPP");
          
        
        if(!"".equals(cact) && name3>0){
        int cant= Integer.parseInt(cact);
         int arty= Integer.parseInt(prod);
int PT= Integer.parseInt(TP);
          
         
          carrito.AddCarr(arty,name3,cant,PT);
          
          
        }
        
      
      
      
      
        
        
 
        //Redirecciona a la pagina que gustemos
       response.sendRedirect("showallPRD?search=");
      //response.sendRedirect("showUsers.jsp");
    }

}
