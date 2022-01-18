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


import models.products;
import Utils.FilesUltis;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
/**
 *
 * @author Deathmajorasmask
 */


@MultipartConfig(maxFileSize = 1000*1000*5, maxRequestSize = 1000*1000*25, fileSizeThreshold = 1000*1000)

public class AddPROD extends HttpServlet {
        
      protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String NPuser, String NLuser, String Pnick, String Pemail, String Pdire, String tel, InputStream userImage
        //Obtenemos los pArametros
        String nameP = request.getParameter("Fname");
        String descp = request.getParameter("descripcion");
        String cantidad = request.getParameter("unidades");
        String categoria = request.getParameter("cate");
        String img1 = request.getParameter("img1");
        String img2 =request.getParameter("img2");
        String video =request.getParameter("video");
       
        
        
        if ((categoria.equals("1")||categoria.equals("2")||categoria.equals("3")||categoria.equals("4"))) {
          
        int result = Integer.parseInt(categoria);
        int cantidadAux = Integer.parseInt(cantidad);
	
        products.AddProd3(nameP,descp,cantidadAux,result,img1,img2,video);
        
//          //Sin imagenes
//         if(img1.equals("")&&img2.equals("")) 
//         {
//          products.AddProd1(nameP,nameL,result,result,pass);
//         }
//         else if(!(img1.equals(""))&&img2.equals(""))
//         {
//             products.AddProd2(nameP,nameL,result,result,pass,img1);
//         }   
//         else if(!(img1.equals(""))&&!(img2.equals("")))
//         {
//            products.AddProd3(nameP,nameL,result,result,pass,img1,img2);
//         }   
      
      
      
      } 
        
        
 
        //Redirecciona a la pagina que gustemos
       response.sendRedirect("productoMN.jsp");
      //response.sendRedirect("showUsers.jsp");
    }

  
     
     
        
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */

}
