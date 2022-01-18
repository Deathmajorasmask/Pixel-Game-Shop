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


import models.usuer;
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
 *
 * @author Deathmajorasmask
 */
public class ModUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String NPuser, String NLuser, String Pnick, String Pemail, String Pdire, String tel, InputStream userImage
        //Obtenemos los pArametros
        String nameP = request.getParameter("Fname");
        String nameL = request.getParameter("Lname");
        String nicks = request.getParameter("Nick");
        String email = request.getParameter("Email");
         String pass = request.getParameter("pass");
        String direc = request.getParameter("dire");
        String telef = request.getParameter("tele");
        Part file = request.getPart("imageUser");
      
        
        //Creamos un folder para resguardar la imagen si es que no existe
        String path = request.getServletContext().getRealPath("");
        File fileSaveDir = new File(path + FilesUltis.RUTE_USER_IMAGE);
        if(!fileSaveDir.exists()){
            fileSaveDir.mkdir();
        }
        
        //Resguardamos la imagen  general
        String contentType = file.getContentType();//Resguarden esto para saber el tipo
        String nameImage =  file.getName() + System.currentTimeMillis() + FilesUltis.GetExtension(contentType);
        file.write(path + nameImage);
        
        //Agregamos a la base de datos
        usuer.AddUser(nameP,nameL,email,nicks,direc,telef,pass, file.getInputStream());
        
 
        //Redirecciona a la pagina que gustemos
       response.sendRedirect("index.jsp");
      //response.sendRedirect("showUsers.jsp");
    }

}
