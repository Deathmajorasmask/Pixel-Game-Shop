/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;



import Utils.RequestUtils;
import Utils.requestUP;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.carrito;
import models.usuer;
/**
 *
 * @author Deathmajorasmask
 */
public class getCar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        
          HttpSession mySession = request.getSession();





  
  Integer name3 = (Integer)mySession.getAttribute("jes2");

//  byte[] name3 = (byte[])mySession.getAttribute("img");
       
if(       name3 == null ||name3 <=0){
    
    request.getRequestDispatcher("index.jsp").forward(request, response);}


else{
    String IDP =    Integer.toString(name3);
       
    
       List<usuer> users = usuer.GetAllUsers(name3);
        
        //Agregamos los usuarios obtenidos a nuestro request
        request.setAttribute(RequestUtils.KEY_ALL_USERS, users);
    
       
  
           List<carrito> carrs= carrito.GetCarr(IDP);
        
        //Agregamos los usuarios obtenidos a nuestro request
        request.setAttribute(RequestUtils.KEY_ALL_CARR, carrs);
        //Mandamos nuestro Request al JSP llamado showUsers
        //response.sendRedirect("showUsers.jsp");
        request.getRequestDispatcher("carrito.jsp").forward(request, response);
    }}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
