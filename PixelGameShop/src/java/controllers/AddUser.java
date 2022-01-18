/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;



import models.usuer;
import Utils.FilesUltis;
import java.io.File;
import java.io.IOException;
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

@MultipartConfig(maxFileSize = 1000*1000*5, maxRequestSize = 1000*1000*25, fileSizeThreshold = 1000*1000)

public class AddUser extends HttpServlet {

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

        
        private static boolean isNumeric(String cadena){
	try {
		Integer.parseInt(cadena);
		return true;
	} catch (NumberFormatException nfe){
		return false;
	}
        }
        
        public static boolean esMinuscula(String s) {
  // Regresa el resultado de comparar la original con sun versión minúscula
  return s.equals(s.toLowerCase());
}
        
        public static boolean esMayuscula(String s) {
  // Regresa el resultado de comparar la original con sun versión mayúscula
  return s.equals(s.toUpperCase());
}
        
        
        
        
        public static int passs(String ps) {
       //1 mayuscula, 1 minuscula, 1 numero minimo
       String password = ps;
       char clave;
       int resp=0;
       byte  contNumero = 0, contLetraMay = 0, contLetraMin=0;
       for (byte i = 0; i < password.length(); i++) {
                clave = password.charAt(i);
               String passValue = String.valueOf(clave);
                if (passValue.matches("[A-Z]")) {
                    contLetraMay++; 
                } else if (passValue.matches("[a-z]")) {
                    contLetraMin++;
                } else if (passValue.matches("[0-9]")) {
                    contNumero++;;
                }
                
        }
       
       if (contNumero > 0)
           resp++;
       
       
       if (contLetraMay > 0)
           resp++;
       
       if (contLetraMin > 0)
           resp++;
       
       
       
       return resp;
        
 
    }
        
        
    
 
	public static int mail(String correo) {
    
    int longitud = correo.length();
    char valor;
   int resp=0;
    for(char i = 0; i < longitud; i++)
    {
    valor = correo.charAt(i);
        if(valor == '@' && i == 0){
      resp++;
        break;
        }
    	if(valor == '@')
    	{
            break;
    	}
    	else if(i == longitud-1){
    	 resp++;
                 break;
    		
    	}
    	
    	
      }
    
    return resp;
		
        }    
        
        
        
}
