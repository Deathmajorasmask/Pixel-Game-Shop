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
import java.util.List;
import javax.servlet.RequestDispatcher;
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
public class liginCL extends HttpServlet {

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
            throws ServletException, IOException  {


       
       String nick= request.getParameter("userName");
       String cont= request.getParameter("BBB");
     
        
       int id=0;
        
        
      List<usuer> users2 = usuer.GetLogedUsers(nick,cont);
        
            for(usuer user : users2){
            
                
            id  =user.getIdUser();
        }
            
 
     

 List<usuer> users = usuer.GetLogUsers(id);
        
        //Agregamos los usuarios obtenidos a nuestro request
        //Mandamos nuestro Request al JSP llamado showUsers
        //response.sendRedirect("showUsers.jsp");
        
        
        
       String name =  "jes"; //request.getParameter("name");
       String pass = "gar"; //request.getParameter("password");
       String name2 =  "jes2"; 
  
     
     
  //      request.setAttribute("name", name);
        
         HttpSession session = (HttpSession)request.getSession(true);
        
           for(usuer user : users){
         
               
               
            session.setAttribute(name, user.getNamePUser());
            session.setAttribute(pass ,user.getNameLUser());
            session.setAttribute(name2 ,user.getIdUser());
    
           }
           
            
        if(id != 0){
        RequestDispatcher rd = request.getRequestDispatcher("sesioniniciada.jsp");  
        rd.forward(request, response);
        }else{
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");  
        rd.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
      
}
