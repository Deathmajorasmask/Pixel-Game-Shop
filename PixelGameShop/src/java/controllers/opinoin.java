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
import models.coment;
import models.products;

/**
 *
 * @author Deathmajorasmask
 */
public class opinoin extends HttpServlet {

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
        
         HttpSession mySession = request.getSession();





  
  Integer name3 = (Integer)mySession.getAttribute("jes2");
        
        
        
        String nameP = request.getParameter("prod");
        String nameL = request.getParameter("val");
        
        String nicks = request.getParameter("opc");
       
        int result = Integer.parseInt(nameL);	
        
        
        int result2 = Integer.parseInt(nameP);	
   
          //   products.AddProd3(nameP,nameL,result,result,pass,img1,img2);
      //tex varchar(250),val int,usu int,art int
          
          
      coment.AddComnt(nicks,result,name3,result2);
      
    String lleva= "GETONEPROD?IDP="+nameP;
        
        
 
        //Redirecciona a la pagina que gustemos
       response.sendRedirect( lleva);
      //response.sendRedirect("showUsers.jsp");
    }
        
        
        
        
        
        
    

   

}
