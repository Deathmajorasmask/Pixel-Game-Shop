/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import Utils.DBUtils;
import java.sql.Connection;
//import com.mysql.jdbc.Statement;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.logging.Logger;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;



public class products {

    private static void add(products prod) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    private int idprod;
    private String nombre;
    private String descri;
    private int idcat;
    private String catego;
    private int unid;
    private String Pimg;

    public int getIdprod() {
        return idprod;
    }

    public void setIdprod(int idprod) {
        this.idprod = idprod;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescri() {
        return descri;
    }

    public void setDescri(String descri) {
        this.descri = descri;
    }

    public int getIdcat() {
        return idcat;
    }

    public void setIdcat(int idcat) {
        this.idcat = idcat;
    }

    public String getCatego() {
        return catego;
    }

    public void setCatego(String catego) {
        this.catego = catego;
    }

    public int getUnid() {
        return unid;
    }

    public void setUnid(int unid) {
        this.unid = unid;
    }

    public String getPimg() {
        return Pimg;
    }

    public void setPimg(String Pimg) {
        this.Pimg = Pimg;
    }
    
    public products(){}
    
    public products(int Pidp,int Pidc,int un,String Pnom,String Pdesc,String Pcat, String Pimg){
       
   this.idprod =Pidp;
     nombre=Pnom;
     descri=Pdesc;
     idcat=Pidc;
     catego=Pcat;
     unid=un;
     this.Pimg=Pimg;
    }
    
     public products( products other){
       
   this.idprod =other.idprod;
   this.nombre=other.nombre;
   this.descri=other.descri;
   this.idcat=other.idprod;
   this.catego=other.catego;
   this.unid=other.unid;
   this.Pimg=other.Pimg;
    }
     
       static public List<products> GetAllProd(){
        List<products> prods = new ArrayList<products>();
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            //Esto dependera del nombre de su conexion recuerden
            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            //Creamos el llamado
            statement = con.prepareCall(DBUtils.P_GETALL_PROD);
        
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("idarticulo");
                String name = rS.getString("nombre");
                String desc = rS.getString("descipcion");
                int un = rS.getInt("unidades");
                int ic = rS.getInt("cid");
                String ncact = rS.getString("categoria");
                String URL = rS.getString("img");
                
               
              
// byte[] image = rS.getBytes("apellido");
                products prod = new  products(id,ic,un,name,desc,ncact,URL);
                prods.add(prod);
            }
        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            //Si se finalizo bien cerramos todo
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
        return prods;
    }
       
       
       
           static public void AddProd1(String Aname,String Adesc,int Aun ,int Cat,String img ){
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            statement = con.prepareCall(DBUtils.P_ADD_PROD1);
            statement.setString(1, Aname);
            statement.setString(2, Adesc);
          statement.setInt(3, Cat);
           statement.setInt(4, Aun);
          statement.setString(5, img); 
           statement.setInt(6, 0); 
           
         
         rS = statement.executeQuery();

        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
    }
 

           
           static public void AddProd2(String Aname,String Adesc,int Aun ,int Cat,String img,String vid ){
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            statement = con.prepareCall(DBUtils.P_ADD_PROD2);
            statement.setString(1, Aname);
            statement.setString(2, Adesc);
          statement.setInt(3, Cat);
           statement.setInt(4, Aun);
          statement.setString(5, img); 
          
          statement.setString(6, vid); 
           statement.setInt(7, 0); 
           
         
         rS = statement.executeQuery();

        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
    }
 
    static public void AddProd3(String Aname,String Adesc,int Aun ,int Cat, String img, String img2 ,String vid ){
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            statement = con.prepareCall(DBUtils.P_ADD_PROD3);
            statement.setString(1, Aname);
            statement.setString(2, Adesc);
            statement.setInt(3, Aun);
            statement.setInt(4, Cat);
            statement.setString(5, img); 
            statement.setString(6, img2);
            statement.setString(7, vid);
            statement.setInt(8, 0); 
           
         
         rS = statement.executeQuery();

        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
    }
 
      static public List<products> GetOneProd(String ida ){
        List<products> prods = new ArrayList<products>();
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            //Esto dependera del nombre de su conexion recuerden
            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            //Creamos el llamado
            statement = con.prepareCall(DBUtils.P_GETOPRD);
        statement.setString(1, ida);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("id_Art");
                String name = rS.getString("articulo");
                String desc = rS.getString("descipcion");
                int un = rS.getInt("idM");
                int ic = rS.getInt("idCAT");
                String ncact = rS.getString("cate");
                String URL = rS.getString("URL");
                
               
              
// byte[] image = rS.getBytes("apellido");
                products prod = new  products(id,ic,un,name,desc,ncact,URL);
                prods.add(prod);
            }
        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            //Si se finalizo bien cerramos todo
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
        return prods;
    }


       static public List<products> GetOneCate(String ida ){
        List<products> prods = new ArrayList<products>();
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            //Esto dependera del nombre de su conexion recuerden
            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            //Creamos el llamado
            statement = con.prepareCall(DBUtils.P_GET_CP);
        statement.setString(1, ida);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                  int id = rS.getInt("idarticulo");
                String name = rS.getString("nombre");
                String desc = rS.getString("descipcion");
                int un = rS.getInt("unidades");
                int ic = rS.getInt("cid");
                String ncact = rS.getString("categoria");
                String URL = rS.getString("img");
                
               
              
// byte[] image = rS.getBytes("apellido");
                products prod = new  products(id,ic,un,name,desc,ncact,URL);
                prods.add(prod);
            }
        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            //Si se finalizo bien cerramos todo
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
        return prods;
    }

       
            static public List<products> GetSomProd(String sch){
        List<products> prods = new ArrayList<products>();
        InitialContext iC = null;
        Context context = null;
        Connection con = null;
        ResultSet rS = null;
        CallableStatement statement = null;
        try{
            iC = new InitialContext();
            context = (Context) iC.lookup("java:comp/env");

            //Esto dependera del nombre de su conexion recuerden
            DataSource dS = (DataSource) context.lookup("jdbc/myDB");
            con = dS.getConnection();

            //Creamos el llamado
            statement = con.prepareCall(DBUtils.P_GET_BS);
         statement.setString(1, sch);
            rS = statement.executeQuery();
            
            //Conseguimos los datos y los agregamos a una lista
            while(rS.next()){
                int id = rS.getInt("idarticulo");
                String name = rS.getString("nombre");
                String desc = rS.getString("descipcion");
                int un = rS.getInt("unidades");
                int ic = rS.getInt("cid");
                String ncact = rS.getString("categoria");
                String URL = rS.getString("img");
                
               
              
// byte[] image = rS.getBytes("apellido");
                products prod = new  products(id,ic,un,name,desc,ncact,URL);
                prods.add(prod);
            }
        }catch(SQLException ex){
            Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
        }catch(NamingException ex){
            Logger.getLogger("ERROR al intentar obtener el DataSource: " + ex.getMessage());
        } finally{
            //Si se finalizo bien cerramos todo
            try{
                if(rS != null)
                {
                    rS.close();
                }
                if(statement != null)
                {
                    statement.close();
                }
                if(con != null)
                {
                    con.close();
                }
            }catch(SQLException ex){
                Logger.getLogger("ERROR (" + ex.getErrorCode() + "): " + ex.getMessage());
            }
        }
        return prods;
    }

}
